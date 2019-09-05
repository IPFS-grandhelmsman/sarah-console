<?php if(isset($this->_symbol["page"])){
$html = array();
$html[] = '<nav class="sarah-paging"><ul>';

if ( $this->_symbol["page"]["style"] == PAGE_STD_STYLE ) {
    $html[] = '<li><a>总记录：'.$this->_symbol["page"]['total'].'</a></li>';
    $html[] = '<li><a>'.$this->_symbol["page"]['pageno'].'/'.$this->_symbol["page"]['pages'].'</a></li>';

    if ( $this->_symbol["page"]['pageno'] > 1 ) {
        $html[] = '<li><a class="link" href="'.$this->_symbol["page"]['link'].'1">首页</a></li>';
    } else {
        $html[] = '<li class="disabled"><a class="link">首页</a></li>';
    }
}

if ( $this->_symbol["page"]['pageno'] > 1 ) {
    $html[] = '<li class="preview-page"><a class="link" href="'.$this->_symbol["page"]['link'].($this->_symbol["page"]['pageno']-1).'">&lt;&lt;上一页</a></li>';
} else {
    $html[] = '<li class="preview-page disabled"><a class="link">&lt;&lt;上一页</a></li>';
}

if ( $this->_symbol["page"]["style"] == PAGE_SHOP_STYLE ) {
    //start quick two handle
    $_start = $this->_symbol["page"]['pageno'] - $this->_symbol["page"]['offset'];
    if ( $_start <= 0 ) $_start = 1;

    $_end = 4;
    if($this->_symbol["page"]['pages'] <= $_end) {
        for ( $i = 1; $i <= $this->_symbol["page"]['pages']; $i++ ) {
            if($this->_symbol["page"]['pageno'] == $i){
                $html[] = '<li class="number active"><a class="link" href="'.$this->_symbol["page"]['link'].$i.'">'.$i.'</a></li>';
            }else{
                $html[] = '<li class="number"><a class="link" href="'.$this->_symbol["page"]['link'].$i.'">'.$i.'</a></li>';
            }
        }
    }else if(($this->_symbol["page"]['pageno'] <= $this->_symbol["page"]['pages'] - $_end) == 1){
        $pageno_v2 = $this->_symbol["page"]['pageno'] + 1;
        $html[] = '<li class="number active"><a class="link" href="'.$this->_symbol["page"]['link'].$this->_symbol["page"]['pageno'].'">'.$this->_symbol["page"]['pageno'].'</a></li>';
        $html[] = '<li class="number"><a class="link" href="'.$this->_symbol["page"]['link'].$pageno_v2.'">'.$pageno_v2.'</a></li>';
        $html[] = '<li class="number"><a class="link">...</a></li>';
        $html[] = '<li class="number"><a class="link" href="'.$this->_symbol["page"]['link'].$this->_symbol["page"]['pages'].'">'.$this->_symbol["page"]['pages'].'</a></li>';
    }else{
        for ( $i = $this->_symbol["page"]['pages'] - $_end+1; $i <= $this->_symbol["page"]['pages']; $i++ ) {
            if($i == $this->_symbol["page"]['pageno']){
                $html[] = '<li class="number active"><a class="link" href="'.$this->_symbol["page"]['link'].$i.'">'.$i.'</a></li>';
            }else{
                $html[] = '<li class="number"><a class="link" href="'.$this->_symbol["page"]['link'].$i.'">'.$i.'</a></li>';
            }

        }
    }
}

if ( $this->_symbol["page"]['pageno'] < $this->_symbol["page"]['pages'] ) {
    $html[] = '<li class="next-page"><a class="link" href="'.$this->_symbol["page"]['link'].($this->_symbol["page"]['pageno']+1).'">下一页&gt;&gt;</a></li>';
} else {
    $html[] = '<li class="next-page disabled"><a class="link">下一页&gt;&gt;</a></li>';
}

if ( $this->_symbol["page"]["style"] == PAGE_STD_STYLE ) {
    if ( $this->_symbol["page"]['pageno'] < $this->_symbol["page"]['pages'] ) {
        $html[] = '<li><a href="'.$this->_symbol["page"]['link'].$this->_symbol["page"]['pages'].'">尾页</a></li>';
    } else {
        $html[] = '<li class="disabled"><a>尾页</a></li>';
    }
}

if ( $this->_symbol["page"]["style"] == PAGE_SHOP_STYLE ) {
    $html[] = '<li class="total-number"><a class="link">共'.$this->_symbol["page"]['pages'].'页</a></li>';
}
$html[] = '<li class="link-page"><a>';
$html[] = '<div>';
$html[] = '<span class="">到第</span>';
$html[] = '<input class="appoint-page" id="input-pageno" type="text" value="'.$this->_symbol["page"]['pageno'].'"
                  oninput="pagingLimit(this,'.$this->_symbol["page"]['pages'].','.$this->_symbol["page"]['pageno'].')">';
$html[] = '<span>页</span>';
$html[] = '<span>';
$html[] = '<button class="btn btn-cancel page-btn" type="button" data-link="'.$this->_symbol["page"]["link"].'" onclick="pagingLink(this)">确定</button>';
$html[] = '</span>';
$html[] = '</div>';
$html[] = '</a></li>';
$html[] = '</ul></nav>';
echo implode("\n", $html);
}?>
