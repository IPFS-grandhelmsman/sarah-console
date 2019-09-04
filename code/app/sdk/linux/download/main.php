<?php
/**
 * Download controller for linux SDK
 *
 *
*/

class DownloadController extends C_Controller
{

    /* 
     * current version number 
     * @Note we should take this version number from the sarah Linux SDK
     * and it should be exactly the same with the one in client.
    */
    protected $version  = 1.56;
    protected $md5_sign = '4027dadb31592b7a796c21f72b373b62';


    private $app_key = NULL;
    private $user_id;
    private $user;

    public function __before($input, $output, $uri)
    {
        $this->app_key = $input->get('app_key');
        assert_app_key($this->app_key, $this->user_id);

        if ( $uri->page == 'version' ) {
            // ignore database query
        } else {
            $this->user = model('User')->getById(array('username'), $this->user_id);
            if ( $this->user == false ) {
                return json_view(STATUS_INVALID_ARGS, 'Invalid Arguments');
                exit();
            }
        }
    }

    public function actionVersion($input)
    {
        return json_view(STATUS_OK, array(
            'version'  => $this->version,
            'md5_sign' => $this->md5_sign
        ));
    }

    public function actionIndex($input)
    {
        $format = $input->get('format', array('/^(tar|zip)$/'), 'tar');
        if ( $format == 'tar' ) {
            return $this->actionTar($input);
        } else if ( $format == 'zip' ) {
            return $this->actionZip($input);
        } else if ( $format == 'bin' ) {
            return $this->actionBin($input);
        }
    }


    private function _tarEnsure()
    {
        $sdkFile = SR_DATPATH . "sdk/SarahOS_Linux_64bit_SDK-{$this->version}.tar.gz";
        header('Content-Length: ' . filesize($sdkFile));
        ob_clean();
        readfile($sdkFile);
        return null;
    }

    public function actionTar($input)
    {
        $gz = $input->getBoolean('gz', true);
        $tmpFile = SR_CACHEPATH . implode('', array(
            $this->user_id,
            '-',
            str_replace('.', '-', microtime(true)),
            mt_rand(0, 0x7FFF),
            '.tar'
        ));

        // set the response header
        $fileName = "SarahOS_Linux_64bit_SDK_{$this->user['username']}-{$this->version}.tar";
        header("Content-Type: application/x-gzip");
        header("Content-disposition: attachment; filename={$fileName}" . ($gz ? '.gz' : '')); 
        header("Content-Transfer-Encoding: binary");


        $tarer = new PharData($tmpFile);

        /* Try to pack all the file to the zip archive */
        $baseDir = SR_DATPATH . 'sdk/SarahOS_Linux_64bit_SDK';
        if ( ($handler = opendir($baseDir)) == false ) {
            return $this->_tarEnsure();
        }

        while ( ($file = readdir($handler)) !== false ) {
            if ( $file == '.' 
                || $file == '..' || is_dir($file) ) {
                continue;
            }

            if ( $file == 'config.json' ) {
                $c = file_get_contents("{$baseDir}/{$file}");
                $c = str_replace('{sarahos_app_key}', $this->app_key, $c);
                $tarer->addFromString($file, $c);
            } else {
                $tarer->addFile("{$baseDir}/{$file}", $file);
            }
        }

        closedir($handler);
        if ( $gz == false ) {
            header('Content-Length: ' . filesize($tmpFile));
            ob_clean();
            readfile($tmpFile);
            unlink($tmpFile);
        } else {
            $tarer->compress(Phar::GZ);
            $gzFile = "{$tmpFile}.gz";
            header('Content-Length: ' . filesize($gzFile));
            ob_clean();
            readfile($gzFile);
            unlink($tmpFile);
            unlink($gzFile);
        }

        return null;
    }




    private function _zipEnsure()
    {
        $sdkFile = SR_DATPATH . "sdk/SarahOS_Linux_64bit_SDK-{$this->version}.zip";
        header('Content-Length: ' . filesize($sdkFile));
        ob_clean();
        readfile($sdkFile);
        return null;
    }

    public function actionZip($user)
    {
        $tmpFile = SR_CACHEPATH . implode('', array(
            $this->user_id,
            '-',
            str_replace('.', '-', microtime(true)),
            mt_rand(0, 0x7FFF),
            '.zip'
        ));

        // set the response header
        $fileName = "SarahOS_Linux_64bit_SDK_{$this->user['username']}-{$this->version}.zip"; 
        header("Content-Type: application/zip");
        header("Content-disposition: attachment; filename={$fileName}"); 
        header("Content-Transfer-Encoding: binary");


        $ziper = new ZipArchive();
        if ( $ziper->open($tmpFile, 
            ZipArchive::CREATE | ZipArchive::OVERWRITE) == false ) {
            return $this->_zipEnsure();
        }

        /* Try to pack all the file to the zip archive */
        $baseDir = SR_DATPATH . 'sdk/SarahOS_Linux_64bit_SDK';
        if ( ($handler = opendir($baseDir)) == false ) {
            return $this->_zipEnsure();
        }

        $r = true;
        while ( ($file = readdir($handler)) !== false ) {
            if ( $file == '.' 
                || $file == '..' || is_dir($file) ) {
                continue;
            }

            if ( $file == 'config.json' ) {
                $c = file_get_contents("{$baseDir}/{$file}");
                $c = str_replace('{sarahos_app_key}', $this->app_key, $c);
                $r = $ziper->addFromString($file, $c);
            } else {
                $r = $ziper->addFile("{$baseDir}/{$file}", $file);
            }

            if ( $r == false ) {
                break;
            }
        }

        closedir($handler);
        $ziper->close();
        if ( $r == false ) {
            return $this->_zipEnsure();
        }


        header('Content-Length: ' . filesize($tmpFile));
        ob_clean();
        readfile($tmpFile);
        unlink($tmpFile);

        return null;
    }

    public function actionBin($input)
    {
        $booterFile = SR_DATPATH . 'sdk/SarahOS_Linux_64bit_SDK/sarah-booter';
        header("Content-type: application/octet-stream");
        header("Accept-Ranges: bytes");
        header("Content-disposition: attachment; filename=sarah-booter.bin"); 
        header("Content-Transfer-Encoding: binary");

        ob_clean();
        readfile($booterFile);
        return null;
    }

}
