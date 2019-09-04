;(function(window){
    var useRateChart = null, bandwidthChart = null,userate_line_dom = null,bandwidth_line_dom = null, timer;

    var g_xaxis = [], loadavg_data = [], ram_data = [],
        incoming_bd_data = [], outgoing_bd_data = [],
        basic_stat, last_created_at = 0, refresh_interval = 7200,skin;

    var axis_tick_config = {
        show: true,
        interval: 0
    }, axis_label_config = {
        show: true,
        color: '#222',
        interval: 0,
        rotate: 30,
        showMinLabel: true,
        padding: [10, 0, 0, 0]
    }, grid_config = {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    };

    function draw_userate_line(x_axis, loadavg_data, ram_data)
    {
        useRateChart.setOption({
            backgroundColor: '#FFF',
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['系统负载', '内存使用率'],
                top: '3%'
            },
            grid: grid_config,
            xAxis: {
                type: 'category',
                data: x_axis,
                boundaryGap: false,
                axisTick: axis_tick_config,
                axisLabel: axis_label_config
            },
            yAxis: {
                name: "系统负载/内存使用率",
                type: 'value',
                nameTextStyle: {
                    padding: [0, 0, 15, 40]
                }
            },
            series: [{
                name: '系统负载',
                data: loadavg_data,
                type: 'line',
                smooth: true,
                symbol: 'rect',
                symbolSize: 6,
                itemStyle : {
                    normal : {
                        color:'#36D1A3',
                        lineStyle:{
                            color:'#36D1A3'
                        }
                    }
                },
            }, {
                name: '内存使用率',
                data: ram_data,
                type: 'line',
                smooth: true,
                symbol: 'rect',
                symbolSize: 6,
                itemStyle : {
                    normal : {
                        color:'#FF6262',
                        lineStyle:{
                            color:'#FF6262'
                        }
                    }
                },
            }]
        });
    }

    function draw_bandwidth_line(x_axis, incoming_bd_data, outgoing_bd_data)
    {
        bandwidthChart.setOption({
            backgroundColor: '#FFF',
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['上传带宽', '下载带宽'],
                top: '3%'
            },
            grid: grid_config,
            xAxis: {
                type: 'category',
                data: x_axis,
                boundaryGap: false,
                axisTick: axis_tick_config,
                axisLabel: axis_label_config
            },
            yAxis: {
                name: "带宽统计(KB/sec)",
                nameTextStyle: {
                    padding: [0, 0, 10, 20]
                },
                type: 'value'
            },
            series: [{
                name: '上传带宽',
                data: incoming_bd_data,
                type: 'line',
                smooth: true,
                symbol: 'rect',
                symbolSize: 6,
                itemStyle : {
                    normal : {
                        color:'#FF6262',
                        lineStyle:{
                            color:'#FF6262'
                        }
                    }
                },
            }, {
                name: '下载带宽',
                data: outgoing_bd_data,
                type: 'line',
                smooth: true,
                symbol: 'rect',
                symbolSize: 6,
                itemStyle : {
                    normal : {
                        color:'#36D1A3',
                        lineStyle:{
                            color:'#36D1A3'
                        }
                    }
                },
            }]
        });
    }

    function load_remote_data(v_qstr)
    {
        $.get('/api/node/post/list?' + v_qstr, null, function(json){
            if ( json.errno != 0 ) {
                return null;
            }

            // set the global xaxis
            var i = 0, data = json.data;
            g_xaxis = json.data.x_axis;
            last_created_at = data._list[data._list.length - 1].created_at;

            loadavg_data = [];          // load average
            ram_data = [];              // ram
            incoming_bd_data = [];      // incoming bandwidth
            outgoing_bd_data = [];      // outgoing bandwidth
            for ( i = 0; i < data._list.length; i++ ) {
                loadavg_data.push({
                    value: parseFloat(data._list[i].load_avg),
                    label: {show: true}
                });

                ram_data.push({
                    value: parseFloat(data._list[i].ram_utilization),
                    label: {show: true}
                });

                incoming_bd_data.push(
                    Math.ceil(parseFloat(data._list[i].incoming_bd)/1024)
                );

                outgoing_bd_data.push(
                    Math.ceil(parseFloat(data._list[i].outgoing_bd)/1024)
                );
            }

            draw_userate_line(g_xaxis, loadavg_data, ram_data);
            draw_bandwidth_line(g_xaxis, incoming_bd_data, outgoing_bd_data);

            // bind the window resize auto draw callback
            $(window).bind('resize', function(){
                draw_userate_line(g_xaxis, loadavg_data, ram_data);
                draw_bandwidth_line(g_xaxis, incoming_bd_data, outgoing_bd_data);
            });
        });
    }

    function set_state(node, state)
    {
        node.className = 'state-' + state;
    }

    function load_fresh_data(v_qstr)
    {
        $.get('/api/node/post/fresh?last_created_at=' + last_created_at + '&' + v_qstr,
            null, function(json) {
            // set the timeout invocation
            setTimeout(function(){
                load_fresh_data(v_qstr);
            }, refresh_interval);

            if ( json.errno != 0 ) {
                return null;
            }

            var i, data = json.data, _stat = json.data._stat;
            last_created_at = data._list[data._list.length - 1].created_at;

            // update the basic stat
            if ( _stat.load_avg ) {
                basic_stat.loadavg.innerHTML = [
                    _stat.load_avg.t_1m, _stat.load_avg.t_5m, _stat.load_avg.t_15m
                ].join(', ');
                set_state(basic_stat.loadavg, _stat.load_state);

                basic_stat.ram.innerHTML = _stat.ram_used_str + ', ' + _stat.ram_percent + '%';
                set_state(basic_stat.ram, _stat.ram_state);

                basic_stat.disk.innerHTML = _stat.disk_used_str + ', ' + _stat.disk_percent + '%';
                set_state(basic_stat.disk, _stat.disk_state);

                basic_stat.incoming_bd.innerHTML = _stat.incoming_bd_str + "/s";
                basic_stat.outgoing_bd.innerHTML = _stat.outgoing_bd_str + "/s";
                basic_stat.updated_time.innerHTML = _stat.created_time;
            }

            // refresh the x axis
            g_xaxis.splice(0, data.x_axis.length);
            for ( i = 0; i < data.x_axis.length; i++ ) {
                g_xaxis.push(data.x_axis[i]);
            }

            // refresh the data
            loadavg_data.splice(0, data._list.length);
            ram_data.splice(0, data._list.length);
            incoming_bd_data.splice(0, data._list.length);
            outgoing_bd_data.splice(0, data._list.length);
            for ( i = 0; i < data._list.length; i++ ) {
                loadavg_data.push({
                    value: parseFloat(data._list[i].load_avg),
                    label: {show: true}
                });

                ram_data.push({
                    value: parseFloat(data._list[i].ram_utilization),
                    label: {show: true}
                });

                incoming_bd_data.push(Math.ceil(data._list[i].incoming_bd)/1024);
                outgoing_bd_data.push(Math.ceil(data._list[i].outgoing_bd)/1024);
            }

            draw_userate_line(g_xaxis, loadavg_data, ram_data);
            draw_bandwidth_line(g_xaxis, incoming_bd_data, outgoing_bd_data);
        });
    }

    function _init(config)
    {
        skin = config.skin || 'default';
        basic_stat = config.stat || {};
        if ( config.userate_line_dom ) {
            userate_line_dom = config.userate_line_dom;
            useRateChart = echarts.init(userate_line_dom, skin);
        }

        if ( config.bandwidth_line_dom ) {
            bandwidth_line_dom = config.bandwidth_line_dom;
            bandwidthChart = echarts.init(bandwidth_line_dom, skin);
        }

        if ( config.v_qstr ) {
            load_remote_data(config.v_qstr);
            setTimeout(function(){
                load_fresh_data(config.v_qstr);
            }, refresh_interval);
        }
    }

    $(window).resize(function () {
        if (timer) {
            return false;
        } else {
            timer = setTimeout(function () {
                useRateChart = echarts.init(userate_line_dom, skin);
                bandwidthChart = echarts.init(bandwidth_line_dom, skin);
                useRateChart.resize();
                bandwidthChart.resize();
                clearTimeout(timer);
                timer = null;
            }, 300);
        }


    });

    // export object
    window.NodeLine = {
        init: _init
    };
}(window));
