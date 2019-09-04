<?php
/**
 * Session Controller supper class for common application module
 *
 *
 */

class Session_Controller extends Controller
{

    protected $user_id   = 0;
    protected $user_name = null;

    public function run($input, $output, $uri)
    {

        $__skin = $input->get('__skin');
        $uri_parts = $uri->parts == null ? 0 : count($uri->parts);

        if ( session('uid') == null
            || session('uname') == null
            || strcmp(session('uAgent'), $input->server('HTTP_USER_AGENT')) != 0 ) {
            if ( $uri_parts > 0 && $uri->parts[0] == 'api' ) {
                return json_view(STATUS_NO_SESSION, 'No Session');
            }

            /* Define the back url */
            $back_url = urlencode(implode('', array(
                $input->server('REQUEST_SCHEME'),
                '://',
                $input->server('HTTP_HOST'),
                $input->server('REQUEST_URI')
            )));

            if ( $__skin == 'embed' ) {
                return "<script>window.top.location.href='/admin/login?back_url={$back_url}';</script>";
            }

            redirect('admin/login', "back_url={$back_url}");
            return null;
        }

        $this->user_id = session('uid');
        $this->user_name = session('uname');
        $this->app_key = session('app_key');
        $this->skin = 'embed';
        /// $__skin = $input->get('__skin');
        /// if ( $__skin != false
        ///     && in_array($__skin, array('embed', 'default', 'dark')) ) {
        ///     $this->skin = $__skin;
        /// } else {
        ///     $this->skin = session('skin');
        /// }

        # register the session information
        view_assign('css_version', '20190404v01');
        view_assign('js_version',  '20190404v01');
        view_assign('session', array(
            'user_id'   => $this->user_id,
            'user_name' => $this->user_name,
            'app_key'   => session('app_key')
        ));

        view_assign('module_type', $uri_parts > 0 ? $uri->parts[0] : 'node');
        return parent::run($input, $output, $uri);
    }

}
