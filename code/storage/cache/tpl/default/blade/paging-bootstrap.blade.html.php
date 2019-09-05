<?php if(isset($this->_symbol["page"])){
$html = array();
$html[] = '<nav class="pagination-nav"><ul class="pagination">';

if ( $this->_symbol["page"]["style"] == PAGE_STD_STYLE ) {
    $html[] = '<li><a>总记录：'.$this->_symbol["page"]['total'].'</a></li>';
    $html[] = '<li><a>'.$this->_symbol["page"]['pageno'].'/'.$this->_symbol["page"]['pages'].'</a></li>';

    if ( $this->_symbol["page"]['pageno'] > 1 ) {
        $html[] = '<li><a href="'.$this->_symbol["page"]['link'].'1">首页</a></li>';
    } else {
        $html[] = '<li class="disabled"><a>首页</a></li>';
    }
}

if ( $this->_symbol["page"]['pageno'] > 1 ) {
    $html[] = '<li><a href="'.$this->_symbol["page"]['link'].($this->_symbol["page"]['pageno']-1).'">&lt;&lt;上一页</a></li>';
} else {
    $html[] = '<li class="disabled"><a>&lt;&lt;上一页</a></li>';
}

if ( $this->_symbol["page"]["style"] == PAGE_SHOP_STYLE ) {
    //start quick two handle
    $_start = $this->_symbol["page"]['pageno'] - $this->_symbol["page"]['offset'];
    if ( $_start <= 0 ) $_start = 1;

    if ( $_start > 1 ) {
        $_limit = ($_start == $this->_symbol["page"]['left'] ) ? 1 : $this->_symbol["page"]['left'];
        for ( $i = 1; $i <= $_limit; $i++ ) {
            $html[] = '<li><a href="'.$this->_symbol["page"]['link'].$i.'">'.$i.'</a></li>';
        }
        if ( $_limit != 1 ) $html[] = '<li><a>...</a></li>';
    }

    //prev pages
    for ( $i = $_start; $i < $this->_symbol["page"]['pageno']; $i++ ) { 
        $html[] = '<li><a href="'.$this->_symbol["page"]['link'].$i.'">'.$i.'</a></li>';
    }
    $html[] = '<li class="active"><a href="#">'.$this->_symbol["page"]['pageno'].'</a></li>';

    $_end = $this->_symbol["page"]['pageno'] + $this->_symbol["page"]['offset'];
    if ( $_end > $this->_symbol["page"]['pages'] ) $_end = $this->_symbol["page"]['pages'];

    for ( $i = $this->_symbol["page"]['pageno'] + 1; $i <= $_end; $i++ ) { 
        $html[] = '<li><a href="'.$this->_symbol["page"]['link'].$i.'">'.$i.'</a></li>';
    }
}

if ( $this->_symbol["page"]['pageno'] < $this->_symbol["page"]['pages'] ) {
    $html[] = '<li><a href="'.$this->_symbol["page"]['link'].($this->_symbol["page"]['pageno']+1).'">下一页&gt;&gt;</a></li>';
} else {
    $html[] = '<li class="disabled"><a>下一页&gt;&gt;</a></li>';
}

if ( $this->_symbol["page"]["style"] == PAGE_STD_STYLE ) {
    if ( $this->_symbol["page"]['pageno'] < $this->_symbol["page"]['pages'] ) {
        $html[] = '<li><a href="'.$this->_symbol["page"]['link'].$this->_symbol["page"]['pages'].'">尾页</a></li>';
    } else { 
        $html[] = '<li class="disabled"><a>尾页</a></li>';
    }
}

if ( $this->_symbol["page"]["style"] == PAGE_SHOP_STYLE ) {
    $html[] = '<li><a>共'.$this->_symbol["page"]['pages'].'页</a></li>';
}

$html[] = '<li><a style="width: 180px; padding: 0; height: 31px;">';
$html[] = '<div class="input-group input-group-sm syrian-page-form">';
$html[] = '<span class="input-group-addon page-msg-start">到第</span>';
$html[] = '<input type="text" class="form-control page-msg-input" id="input-pageno" value="'.$this->_symbol["page"]['pageno'].'">';
$html[] = '<span class="input-group-addon page-msg-end">页</span>';
$html[] = '<span class="input-group-btn">';
$html[] = '<button class="btn btn-default page-submit-btn" type="button" onclick="var ele=document.getElementById(\'input-pageno\');if(ele.value.match(/([0-9]{1,})/)!=null) document.location.href=\''.$this->_symbol["page"]["link"].'\'+ele.value;">确定</button>';
$html[] = '</span>';
$html[] = '</div>';
$html[] = '</a></li>';
$html[] = '</ul></nav>';
echo implode("\n", $html);
}?>
