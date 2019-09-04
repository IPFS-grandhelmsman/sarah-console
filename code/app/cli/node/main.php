<?php
/**
 * Node Controller manager class
 *
 *
*/

class NodeController extends Cli_Controller
{

    public function actionFixName($input)
    {
        $sharding = $input->getInt('sharding');
        if ( $sharding == false ) {
            return "[Error]: sharding arguments needed.\n";
        }

        if ( $sharding < 1 || $sharding > 7 ) {
            return "[Error]: Invalid sharding = {$sharding}\n";
        }

        $nodeModel = model("node.Node0{$sharding}");
        $nodes = $nodeModel->openFragment()->getList(array('Id', 'name', 'stat_json'));
        if ( $nodes == false ) {
            return "Empty sets\n";
        }

        echo "+-Try to fix the name of ", count($nodes), " nodes ... ";
        foreach ( $nodes as $val ) {
            if ( strlen($val['name']) < 1 || $val['name'] == '0' ) {
                $jobj = json_decode($val['stat_json']);
                if ( isset($jobj->system->node_name) ) {
                    $nodeModel->setById('name', $jobj->system->node_name, $val['Id']);
                }
            }
        }

        echo " --[Done]\n";
    }

}
?>
