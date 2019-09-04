/**
 * flexible UI common script
 * @Note put this in the head script
 *
 * 
*/
(function(win){
    var doc = win.document;
    var docEle = doc.documentElement;
    var hid = null, dpr = 0;

    if ( dpr == 0 ) {
        var isIPhone = win.navigator.appVersion.match(/iphone/gi);
        var devicePixelRatio = win.devicePixelRatio;
        if ( isIPhone ) {
            if (devicePixelRatio >= 3 && (!dpr || dpr >= 3)) {                
                dpr = 3;
            } else if (devicePixelRatio >= 2 && (!dpr || dpr >= 2)){
                dpr = 2;
            } else {
                dpr = 1;
            }
        } else {
            dpr = devicePixelRatio;
        }
    }

    function refreshRem()
    {
        var deviceWidth = docEle.getBoundingClientRect().width;
        docEle.style.fontSize = deviceWidth / 16 + 'px';
    }

    win.addEventListener('resize', function(){
        clearTimeout(hid);
        hid = setTimeout(refreshRem, 30);
    }, false);

    win.addEventListener('pageshow', function(e) {
        if (e.persisted) {
            clearTimeout(hid);
            hid = setTimeout(refreshRem, 30);
        }
    }, false);

    docEle.setAttribute('data-dpr', dpr);
    refreshRem();
}(window));
