(function(window){
    "use strict";
    //显示下拉框
    function showMoreOption(){
        event.stopPropagation();
        $("#transform_bg").show();
        $(this).parents("tr").addClass("row-active");
        var $option = $(this).siblings(".option");
        $(".option").not($option).hide();
        if($option.is(":hidden")){
            $option.show();
        }else{
            $option.hide();
        }
    }

    //隐藏下拉框
    function hideMoreOption(){
        $("#transform_bg").hide();
        $(".option").hide();
        $(".row-active").removeClass("row-active");
    }
    window.table_select = {
        showMoreOption: showMoreOption,
        hideMoreOption: hideMoreOption
    }
})(window);
