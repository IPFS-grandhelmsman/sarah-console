<?php
/**
 * IPFS storage api Controller
 * 
 *
*/

import('core.Session_Controller', false);

class IpfsController extends Session_Controller
{

    public function actionIndex($input)
    {
        return $this->actionList($input);
    }

    public function actionList($input)
    {
        $pid = $input->getInt('id', 0);
        if ( $pid > 0 ) {
            assert_std_tias($input, 'storage.ipfs.list', $pid);
        }

        $pageno   = $input->getInt('pageno', 1);
        $pagesize = 10;

        # invoke the service to scroll the data sets
        # @see service.node.content#list
        $data = service('storage.ipfs.content.paging', array(
            'user_id'   => $this->user_id,
            'pid'       => $pid,
            'pagesize'  => $pagesize,
            'pageno'    => $pageno,
            'order_by'  => 'created_at',
            'sort_by'   => 'desc'
        ));

        if ( $data == false ) {
            return json_view(STATUS_EMPTY_SETS, 'Empty sets');
        }

        return json_view(STATUS_OK, $data);
    }
    

    /**
     * internal function to check a list of file rows
     *
     * @param   $list
     * @param   $depth
    */
    private function assert_list_argv($list, $depth)
    {
        /* Max depth checking */
        if ( $depth >= 6 ) {
            return json_view(
                STATUS_INVALID_ARGS, 
                "too deep for the structure level should be less than 7"
            );
            exit();
        }

        $_mustFields = array(
            'file'     => array(1, 255),
            'size'     => array(1, 20),
            'hash'     => array(46, 46),
            'mimeType' => array(1, 48)
        );

        foreach ( $list as $idx => $arg ) {
            // must field checking
            foreach ( $_mustFields as $f => $s ) {
                if ( ! isset($arg[$f]) ) {
                    return json_view(
                        STATUS_INVALID_ARGS, "Missing field {$f}"
                    );
                    exit();
                }

                $len = strlen("{$arg[$f]}");
                if ( $len < $s[0] ) {
                    return json_view(
                        STATUS_INVALID_ARGS,
                        "Too short for field value '{$f}'"
                    );
                    exit();
                }

                if ( $len > $s[1] ) {
                    return json_view(
                        STATUS_INVALID_ARGS,
                        "Too long for field vlaue '{$f}' should be less than {$s[1]}"
                    );
                    exit();
                }
            }

            // dir and arg.files checking
            if ( $arg['mimeType'] == 'file/dir' 
                && isset($arg['files']) && ! empty($arg['files']) ) {
                $this->assert_list_argv($arg['files'], $depth + 1);
            }
        }
    }

    /**
     * internal function to make the final data sets 
     *  for the batch add operation of data model.
     *
     * @param   $list
     * @param   $pid
     * @param   $model
    */
    private function make_data_sets($list, $pid, $model)
    {
        $data = array();
        $pkey = $model->getPrimaryKey();
        $router = $model->getRouter();
        $c_time = time();
        foreach ( $list as $val ) {
            $row = array(
                'user_id'    => $this->user_id,
                'pid'        => $pid,
                'file'       => $val['file'],
                'size'       => $val['size'],
                'hash'       => $val['hash'],
                'mimeType'   => $val['mimeType'],
                'created_at' => $c_time
            );

            $rid = $model->genUUID($row, $router);
            $row[$pkey] = $rid;
            $data[] = $row;

            /* Check and */
            if ( $val['mimeType'] == 'file/dir' 
                && isset($val['files']) && ! empty($val['files']) ) {
                $d = $this->make_data_sets($val['files'], $rid, $model);
                foreach ( $d as $v ) {
                    $data[] = $v;
                }
            }
        }

        return $data;
    }

    public function actionAdd($input)
    {
        $pid = $input->getInt('id', 0);
        if ( $pid > 0 ) {
            assert_std_tias($input, 'storage.ipfs.list', $pid);
        }

        $argv = get_post_raw_data_json(true);
        // $argv = json_decode('[{"file":"234","size":0,"hash":"QmToAa4ASACa569zaw2t5NUciUf8NSnzp2jLhyZ9tirD75","mimeType":"file/dir","files":[{"file":"rrrr","size":0,"hash":"QmPV8wiWKgQ5TxeLmEbGmkzcD15mvFXoRdcGqbGTrE82cQ","mimeType":"file/dir","files":[{"file":"rewrwrwer","size":0,"hash":"QmTPSawp5wKjfoBK5LhUNoMJtd1dm8VksPiJ6LVvy6MPC6","mimeType":"file/dir","files":[{"file":"2314324.txt","size":0,"hash":"QmbFMke1KXqnYyBBWxB74N4c5SBnJMVAiMNRcGu6x1AwQH","mimeType":"text/plain"}]}]}]}]', true);
        if ( $argv == null || is_array($argv) == false || empty($argv) ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        /* checking the input data sets */
        $this->assert_list_argv($argv, $pid);

        /* make the data sets for batch insertion */
        $pmodel = model('IpfsFilesSharding');
        $smodel = $pmodel->getShardingModelFromValue($this->user_id);
        $data   = $this->make_data_sets($argv, $pid, $pmodel);

        /* Do the batch insertion */
        if ( $smodel->batchAdd($data) === false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, 'Ok');
    }

    public function actionEdit($input)
    {
        assert_std_tias($input, 'storage.ipfs.list', $id);
        $file = $input->post('file', array('/^[^\/,`\\\]{1,255}$/'));
        if ( $file == false ) {
            return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
        }

        $model = model('IpfsFilesSharding')
            ->getShardingModelFromValue($this->user_id);
        $data = array(
            'file'       => $file,
            'updated_at' => time()
        );

        if ( $model->update($data, array(
            'Id'      => "={$id}",
            'user_id' => "={$this->user_id}"
            )) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, 'Ok');
    }

    public function actionDelete($input)
    {
        assert_std_tias($input, 'storage.ipfs.list', $id);

        $model = model('IpfsFilesSharding')
            ->getShardingModelFromValue($this->user_id);
        if ( $model->delete(array(
            'Id'      => "={$id}",
            'user_id' => "={$this->user_id}"
            )) == false ) {
            return json_view(STATUS_FAILED, 'Failed');
        }

        return json_view(STATUS_OK, 'Ok');
    }

}
