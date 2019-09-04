<?php
/**
 * Script common Controller class
 *
 * 
*/

 //-----------------------------------------------------
 
class S_Controller extends Controller
{

    public function run($input, $output, $uri)
    {
        if ( strlen($uri->page) < 1 ) {
            throw new Exception("S_Controller#run: no method define\n");
        }

        if ( $this->conf->script['debug'] == true ) {
            _G(SR_FLUSH_MODE, true);
        }

        $cache_ttl = $input->getInt('cache_ttl', 600);
        if ( _G(SR_FLUSH_MODE, true) == true && $cache_ttl > 0 ) {
            if ( isset( $_SERVER['HTTP_IF_MODIFIED_SINCE'] )
                && strtotime($_SERVER['HTTP_IF_MODIFIED_SINCE']) + $cache_ttl > time() ) {
                header('HTTP/1.1 304');
                exit();
            }

            //send the last modified time
            header('Last-Modified: ' . gmdate('D, d M Y H:i:s', time() + $cache_ttl) . ' GMT');
            header("Cache-Control: max-age={$cache_ttl}");
        }

        $output->setHeader('Content-Type', 'application/javascript');
        if ( $this->conf->script['compress'] > 0 ) {
            $output->compress($this->conf->script['compress']);
        }

        /*
         * build the cache object
         * then check and return the cache if it is available
         * @Note: directly ignore the cache if it is flush mode
        */
        $cache   = build_cache('ScriptMerge');
        $baseKey = $uri->package==null ? $uri->module : "{$uri->package}/{$uri->module}";
        $cache->baseKey($baseKey)->fname($uri->page[0]);
        if ( _G(SR_FLUSH_MODE) == false ) {
            if ( ($CC = $cache->get(-1)) != false ) {
                return $CC;
            }
        }

        $scripts = parent::run($input, $output, $uri);
        if ( ! is_array($scripts) ) {
            return null;
        }

        import('html.ScriptMerge');
        import('html.JsMinifier');

        $MG = new ScriptMerge(SR_STATICPATH.'js/', true);
        $CC = $MG->appendArray($scripts)->merge()->getContent();

        //minify the whole script
        $CC = JsMinifier::minify($CC, array('flaggedComments' => false));
        $cache->set($CC);

        return $CC;
    }

}
?>
