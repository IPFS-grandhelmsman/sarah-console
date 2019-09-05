<style>
    .load-bg{display: none;position: absolute;left: 0;top: 0;right: 0;bottom: 0;background-color: rgba(0,0,0,0.5);z-index:99999999998}
    .load-animate{display: none;position: absolute;left: 50%;top: 50%;width: 40px;z-index:99999999999;
        -webkit-transform: translate(-50%,-50%);
           -moz-transform: translate(-50%,-50%);
            -ms-transform: translate(-50%,-50%);
             -o-transform: translate(-50%,-50%);
                transform: translate(-50%,-50%);
        -webkit-animation: load-animate1 2s linear infinite;
             -o-animation: load-animate1 2s linear infinite;
                animation: load-animate1 2s linear infinite;
    }
    @keyframes load-animate1
    {
        from {
            -webkit-transform: rotate(0);
               -moz-transform: rotate(0);
                -ms-transform: rotate(0);
                 -o-transform: rotate(0);
                    transform: rotate(0);}
        to { -webkit-transform: rotate(360deg);
            -moz-transform: rotate(360deg);
            -ms-transform: rotate(360deg);
            -o-transform: rotate(360deg);
            transform: rotate(360deg);}
    }

    @-moz-keyframes load-animate1 /* Firefox */
    {
        from {
            -webkit-transform: rotate(0);
            -moz-transform: rotate(0);
            -ms-transform: rotate(0);
            -o-transform: rotate(0);
            transform: rotate(0);}
        to { -webkit-transform: rotate(360deg);
            -moz-transform: rotate(360deg);
            -ms-transform: rotate(360deg);
            -o-transform: rotate(360deg);
            transform: rotate(360deg);}
    }

    @-webkit-keyframes load-animate1 /* Safari 和 Chrome */
    {
        from {
            -webkit-transform: rotate(0);
            -moz-transform: rotate(0);
            -ms-transform: rotate(0);
            -o-transform: rotate(0);
            transform: rotate(0);}
        to { -webkit-transform: rotate(360deg);
            -moz-transform: rotate(360deg);
            -ms-transform: rotate(360deg);
            -o-transform: rotate(360deg);
            transform: rotate(360deg);}
    }

    @-o-keyframes load-animate1 /* Opera */
    {
        from {
            -webkit-transform: rotate(0);
            -moz-transform: rotate(0);
            -ms-transform: rotate(0);
            -o-transform: rotate(0);
            transform: rotate(0);}
        to { -webkit-transform: rotate(360deg);
            -moz-transform: rotate(360deg);
            -ms-transform: rotate(360deg);
            -o-transform: rotate(360deg);
            transform: rotate(360deg);}
    }
</style>
<div class="load-bg"></div>
<img class="load-animate" src="/static/image/load.png" alt="加载logo">
