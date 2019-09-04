;(function(window){
    "use strict";
    var worldChart = null,map_dom = null,timer,iframeId;
    function load_node_stastics(params,skin){
        var series = [];
        [
            ["China", params]
        ].forEach(function(item, i) {
            series.push( {
                    type: "effectScatter",
                    coordinateSystem: "geo",
                    zlevel: 3,
                    rippleEffect: {
                        //涟漪特效
                        period: 4, //动画时间，值越小速度越快
                        brushType: "stroke", //波纹绘制方式 stroke, fill
                        scale: 4 //波纹圆环最大限制，值越大波纹越大
                    },
                    label: {
                        normal: {
                            show: true,
                            position: "right", //显示位置
                            offset: [5, 0], //偏移设置
                            formatter: "{b}" //圆环显示文字
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    symbol: "circle",
                    symbolSize: function(val) {
                        return 20 + val[2] / 1000; //圆环大小
                    },
                    itemStyle: {
                        normal: {
                            show: false,
                        }
                    },
                    data: item[1].map(function(dataItem) {
                        return {
                            name: dataItem.name,
                            value: dataItem.coordinate.concat([dataItem.value])
                        };
                    })
                }
            );
        });
       var option = {
            backgroundColor: skin.bgColor || '#000',
            textStyle: {
                color: skin.textColor || '0cdaff'
            },
            tooltip: {
                trigger: "item",
                backgroundColor: skin.tooltipBgColor || "rgba(0,0,0,0.8)",
                borderColor: skin.tooltipBdColor || "#FFFFCC",
                showDelay: 0,
                hideDelay: 0,
                enterable: true,
                transitionDuration: 0,
                extraCssText: "z-index:100",
                formatter: function(params, ticket, callback) {
                    var res = "";
                    var name = params.name;
                    res =
                        "<span style='color:#fff;padding:5px 10px'>" +
                        name +
                        "</span><br/><span style='padding:5px 10px'>节点数：" +
                        params.value[2]+"</span>";
                    return res;
                }
            },
            visualMap: {
                //图例值控制
                min: 0,
                max: 10000,
                show: false,
                calculable: true,
                color: skin.legendColor || ["#0bc7f3"],
                textStyle: {
                    color: "#fff"
                },
            },
            geo: {
                map: "world",
                left: "1%", top: "1%", right: "1%",
                label: {
                    emphasis: {
                        show: false
                    }
                },
                layoutSize: "100%",
                itemStyle: {
                    normal: {
                        color: skin.geoBgColor || "#04284e", //地图背景色
                        borderColor: skin.geoBdColor || "#009688", //省市边界线
                    },
                    emphasis: {
                        color: skin.geoHoverBgColor || "rgba(37, 43, 61, .5)" //悬浮背景
                    }
                }
            },
            series: series
        };
        $("#widget_map").css("height",$("#widget_map").width()/1.8+"px");
        $("#widget_map>div").css("height",$("#widget_map").width()/1.8+"px");
        worldChart.setOption(option);
        worldChart.on('click', function (params) {
            if(params.value){
                if(iframeId){
                    window.location.href="/node/list?__skin=embed&__sara_iframe_id=" + iframeId + "&__app=node";
                }else{
                    window.location.href="/node/list";
                }
            }
        });
    }
    function _init(config) {
        map_dom = config.map_dom;
        worldChart = echarts.init(map_dom);
        load_node_stastics(config.data,config.skin);
        iframeId = config.iframe_id || null;
    }
    window.NodeMap = {
        init: _init
    };
    $(window).resize(function(){
        if(timer){
            return false;
        }else{
            timer = setTimeout(function(){
                worldChart = echarts.init(map_dom);
                worldChart.resize();
                clearTimeout(timer);
                timer = null;
                $("#widget_map").css("height",$("#widget_map").width()/1.8+"px");
                $("#widget_map>div").css("height",$("#widget_map").width()/1.8+"px");
            },300);
        }
    });
})(window);
