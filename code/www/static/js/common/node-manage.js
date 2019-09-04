/**
 * Node manage js class
 *
 *
*/
(function(window){
    var ps_container = null, ps_list_tpl = null;
    var refresh_interval = 7200, last_created_at = 0;

    function load_fresh_data(v_qstr)
    {
        $.get('/api/node/post/manage?last_created_at=' + last_created_at + '&' + v_qstr,
        null, function(json){
            // set the timeout invocation
            setTimeout(function(){
                load_fresh_data(v_qstr);
            }, refresh_interval);

            if ( json.errno != 0 ) {
                return;
            }

            // Update the system and the kernel information

            last_created_at = parseInt(json.data.node.created_at);
            var html = JTE.clear().assign('process', json.data.process)
                .execute(ps_list_tpl, 'ps_list');
            ps_container.innerHTML = html;

            // Bind the kill event
            bind_kill_event();
        });
    }

    function bind_kill_event()
    {
        $('li.control a').bind('click', function(){
            kill(this.getAttribute('data-pid'));
        });
    }

    function kill(pid) {
        console.log('kill process: ' + pid);
    }

    function shutdown() {
        console.log('node shutdown');
    }

    window.manage = {
        init: function(config){
            if ( config.ps_container ) {
                ps_container = config.ps_container;
            }

            if ( config.ps_list_tpl ) {
                ps_list_tpl = config.ps_list_tpl;
            }

            last_created_at = config.last_created_at || 0;
            if ( config.v_qstr ) {
                setTimeout(function(){
                    load_fresh_data(config.v_qstr);
                }, refresh_interval);
            }
            // basic event binding
            if ( config._event.shutdown ) {
                $(config._event.shutdown).bind('click', shutdown);
            }
            bind_kill_event();
        },
    };
}(window));
