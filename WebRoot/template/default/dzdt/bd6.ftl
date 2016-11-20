<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<link rel="stylesheet" href="${BASE_ASSETS_PATH}libs/font-awesome/css/font-awesome.css">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/draggabilly/draggabilly.pkgd.js"></script>

<div class="container-fluid rhjc">
    <ul class="nav nav-pills menu mb5 clearfix">
        <div class="page-title">
            <h4 class="bold">第六标段电子地图数据查看</h4>
        </div>

        <div style="position: absolute;right:10px;top: 50px;">
            <button class="btn moveCls" style="position: absolute;top:10px;left:40px;float: left;" title="上移" id="up"><i class="fa-big  fa-arrow-up"></i></button>
            <button class="btn moveCls" style="position: absolute;top:70px;left:40px;" title="下移" id="down"><i class="fa-big  fa-arrow-down"></i></button>
            <button class="btn moveCls" style="position: absolute;top:40px;left:0px;" title="左移" id="left"><i class="fa-big  fa-arrow-left"></i></button>
            <button class="btn moveCls" style="position: absolute;top:40px;left:80px;" title="右移" id="right"><i class="fa-big  fa-arrow-right"></i></button>

            <button class="btn" style="position: absolute;top:120px;left:40px;" title="放大" onclick="zoom('zoomIn');"><i class="fa-big  fa-plus"></i></button>
            <button class="btn" style="position: absolute;top:160px;left:40px;" title="缩小" onclick="zoom('zoomOut');"><i class="fa-big  fa-minus"></i></button>

            <div style="margin-top: 230px; width: 150px">
                <div>未签约: <button type="button" class="btn btn-sm btn-default">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></div>
                <div class="mt10">已签约: <button type="button" class="btn btn-sm btn-success ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></div>
                <div class="mt10">已交房: <button type="button" class="btn btn-sm btn-danger">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></div>
                <div class="mt10">已拆除: <button type="button" class="btn btn-sm btn-warning">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></div>
            </div>
        </div>
        <!--        <svg version="1.1" id="svgElement" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">-->
        <svg viewBox="0 0 600 400" id="svgElement" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" stroke-linecap="round" stroke-linejoin="round" fill-rule="evenodd" xml:space="preserve" viewbox="50 200 500 300" style="left: -212.79px; top: 90.4px; position: relative; touch-action: none;">
        <g stroke-width="0.1" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" />
        <g stroke-width="0.9" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="33.4146,418.738 197.634,234.585 " />
        <polyline points="197.634,234.585 215.856,252.052 " />
        <polyline points="215.856,252.052 251.922,226.865 " />
        <polyline points="251.922,226.865 283.939,226.865 " />
        <polyline points="283.939,226.865 333.734,132.052 " />
        <polyline points="28.3893,418.142 73.336,468.07 " />
        <polyline points="73.336,468.07 98.4424,419.511 " />
        <polyline points="98.4424,419.511 739.7,423.104 " />
        <polyline points="771.644,355.967 333.734,132.052 " />
        <polyline points="771.644,355.967 739.7,423.104 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.36845 0 -0 4.21057 357.69 347.285)" font-family="Arial,'sans-serif'" font-size="1.39636" >210&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="97.58,351.566 112.065,364.082 " />
        <polyline points="112.065,364.082 83.6838,396.412 " />
        <polyline points="83.6838,396.412 67.6946,383.708 " />
        <polyline points="67.6946,383.708 97.58,351.566 " />
        <polyline points="97.58,351.566 111.306,336.771 " />
        <polyline points="111.306,336.771 137.152,360.122 " />
        <polyline points="137.152,360.122 124.685,374.035 " />
        <polyline points="124.685,374.035 112.065,364.082 " />
        <polyline points="127.882,376.7 124.685,374.035 " />
        <polyline points="127.882,376.7 104.887,404.686 " />
        <polyline points="104.887,404.686 87.5785,391.976 " />
        <polyline points="104.887,404.686 128.227,424.459 " />
        <polyline points="128.227,424.459 163.424,383.542 " />
        <polyline points="163.424,383.542 138.951,363.315 " />
        <polyline points="138.951,363.315 127.882,376.7 " />
        <polyline points="125.03,380.443 148.692,400.668 " />
        <polyline points="139.172,411.734 115.081,392.279 " />
        <polyline points="113.623,333.384 131.806,313.42 " />
        <polyline points="131.806,313.42 149.631,329.997 " />
        <polyline points="149.631,329.997 131.804,349.784 " />
        <polyline points="131.804,349.784 113.623,333.384 " />
        <polyline points="149.631,329.997 168.881,347.645 " />
        <polyline points="168.881,347.645 151.59,366.896 " />
        <polyline points="151.59,366.896 131.804,349.784 " />
        <polyline points="136.619,308.964 155.335,325.363 " />
        <polyline points="155.335,325.363 166.892,314.078 " />
        <polyline points="166.892,314.078 147.671,296.308 " />
        <polyline points="147.671,296.308 136.619,308.964 " />
        <polyline points="147.671,296.308 163.537,278.304 " />
        <polyline points="163.537,278.304 183.08,295.326 " />
        <polyline points="183.08,295.326 166.892,314.078 " />
        <polyline points="156.927,328.581 169.952,314.846 " />
        <polyline points="169.952,314.846 185.814,328.375 " />
        <polyline points="173.459,342.133 156.927,328.581 " />
        <polyline points="169.952,314.846 185.639,297.555 " />
        <polyline points="185.639,297.555 201.325,311.103 " />
        <polyline points="201.325,311.103 173.459,342.133 " />
        <polyline points="175.833,344.079 188.133,330.354 " />
        <polyline points="188.133,330.354 207.383,347.645 " />
        <polyline points="207.383,347.645 195.44,360.479 " />
        <polyline points="195.44,360.479 175.833,344.079 " />
        <polyline points="207.383,347.645 223.962,330.176 " />
        <polyline points="223.962,330.176 203.464,312.529 " />
        <polyline points="203.464,312.529 188.133,330.354 " />
        <polyline points="207.561,351.923 225.388,331.067 " />
        <polyline points="225.388,331.067 241.409,344.455 " />
        <polyline points="225.087,367.187 207.561,351.923 " />
        <polyline points="225.029,367.252 241.073,349.249 " />
        <polyline points="241.073,349.249 263.84,370.383 " />
        <polyline points="263.84,370.383 248.416,387.705 " />
        <polyline points="248.416,387.705 225.029,367.252 " />
        <polyline points="167.637,272.778 184.394,255.488 " />
        <polyline points="184.394,255.488 213.091,284.543 " />
        <polyline points="213.091,284.543 197.047,300.942 " />
        <polyline points="197.047,300.942 167.637,272.778 " />
        <polyline points="213.091,284.543 239.828,310.211 " />
        <polyline points="239.828,310.211 226.018,326.222 " />
        <polyline points="226.018,326.222 197.047,300.942 " />
        <polyline points="184.394,255.488 199.546,239.801 " />
        <polyline points="199.546,239.801 216.636,256.636 " />
        <polyline points="216.636,256.636 201.299,272.604 " />
        <polyline points="216.636,256.636 228.779,267.609 " />
        <polyline points="228.779,267.609 213.091,284.543 " />
        <polyline points="228.779,267.609 239.783,277.649 " />
        <polyline points="239.783,277.649 223.685,294.714 " />
        <polyline points="239.783,277.649 256.05,292.564 " />
        <polyline points="256.05,292.564 239.828,310.211 " />
        <polyline points="241.788,313.063 258.1,294.102 " />
        <polyline points="258.1,294.102 296.606,326.071 " />
        <polyline points="296.606,326.071 280.619,345.982 " />
        <polyline points="280.619,345.982 241.788,313.063 " />
        <polyline points="261.261,329.572 278.17,310.765 " />
        <polyline points="382.072,337.484 364.069,326.432 " />
        <polyline points="364.069,326.432 347.133,351.388 " />
        <polyline points="347.133,351.388 366.739,363.687 " />
        <polyline points="366.739,363.687 382.072,337.484 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.36845 0 -0 4.21057 355.858 342.98)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-031</text>
        <text transform="matrix(3.36845 0 -0 4.21057 356.909 352.23)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#36319;&#26469;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 272.415 329.406)" font-family="Arial,'sans-serif'" font-size="1.39636" >218&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 270.584 325.103)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-014</text>
        <text transform="matrix(3.36845 0 -0 4.21057 271.635 334.328)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#22763;&#33452;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 252.571 313.113)" font-family="Arial,'sans-serif'" font-size="1.39636" >224&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 250.74 308.81)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-019</text>
        <text transform="matrix(3.36845 0 -0 4.21057 251.791 318.047)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#31435;&#21326;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 234.713 295.662)" font-family="Arial,'sans-serif'" font-size="1.39636" >228&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 232.882 291.358)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-015</text>
        <text transform="matrix(3.36845 0 -0 4.21057 233.933 300.607)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#24535;&#33521;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 220.669 284.657)" font-family="Arial,'sans-serif'" font-size="1.39636" >230&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 218.838 280.715)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-018</text>
        <text transform="matrix(3.36845 0 -0 4.21057 219.889 289.372)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#25991;&#27743;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 208.963 271.503)" font-family="Arial,'sans-serif'" font-size="1.39636" >232&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 207.131 267.675)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-008</text>
        <text transform="matrix(3.36845 0 -0 4.21057 208.183 276.46)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#24800;&#25996;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 195.203 257.642)" font-family="Arial,'sans-serif'" font-size="1.39636" >234&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 193.372 253.339)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-024</text>
        <text transform="matrix(3.36845 0 -0 4.21057 194.423 262.598)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#25991;&#29577;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 184.523 280.6)" font-family="Arial,'sans-serif'" font-size="1.39636" >236&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 182.692 276.297)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-002</text>
        <text transform="matrix(3.36845 0 -0 4.21057 183.743 285.557)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#25991;&#35821;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 212.093 307.842)" font-family="Arial,'sans-serif'" font-size="1.39636" >274&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 210.262 303.538)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-016</text>
        <text transform="matrix(3.36845 0 -0 4.21057 211.313 312.775)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24503;&#33521;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 237.686 370.409)" font-family="Arial,'sans-serif'" font-size="1.39636" >220&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 235.854 366.106)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-012</text>
        <text transform="matrix(3.36845 0 -0 4.21057 236.906 375.331)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37073;&#29577;&#21326;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 218.578 349.946)" font-family="Arial,'sans-serif'" font-size="1.39636" >222&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 216.747 345.641)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-013</text>
        <text transform="matrix(3.36845 0 -0 4.21057 217.798 354.879)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#38271;&#38145;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="241.409,344.455 264.125,362.204 " />
        <polyline points="264.125,362.204 260.183,366.988 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.36845 0 -0 4.21057 198.552 330.522)" font-family="Arial,'sans-serif'" font-size="1.39636" >314&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 196.721 326.218)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-023</text>
        <text transform="matrix(3.36845 0 -0 4.21057 200.125 335.467)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#23500;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 183.948 346.448)" font-family="Arial,'sans-serif'" font-size="1.39636" >324&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 182.116 342.144)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-006</text>
        <text transform="matrix(3.36845 0 -0 4.21057 183.168 351.393)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#24800;&#26469;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 165.328 328.993)" font-family="Arial,'sans-serif'" font-size="1.39636" >322&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 163.497 324.69)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-022</text>
        <text transform="matrix(3.36845 0 -0 4.21057 164.548 333.927)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#29233;&#33452;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 179.685 314.563)" font-family="Arial,'sans-serif'" font-size="1.39636" >312&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 177.853 310.26)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-017</text>
        <text transform="matrix(3.36845 0 -0 4.21057 181.257 319.52)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#21069;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 159.749 299.276)" font-family="Arial,'sans-serif'" font-size="1.39636" >310&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 157.918 294.971)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-003</text>
        <text transform="matrix(3.36845 0 -0 4.21057 158.969 304.175)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#28113;&#33521;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 144.589 312.797)" font-family="Arial,'sans-serif'" font-size="1.39636" >320&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 142.758 308.494)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-001</text>
        <text transform="matrix(3.36845 0 -0 4.21057 146.162 317.754)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#38050;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 124.723 332.856)" font-family="Arial,'sans-serif'" font-size="1.39636" >330&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 122.892 328.553)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-021</text>
        <text transform="matrix(3.36845 0 -0 4.21057 123.943 337.79)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#24314;&#21326;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 143.891 350.052)" font-family="Arial,'sans-serif'" font-size="1.39636" >332&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 142.059 345.748)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-004</text>
        <text transform="matrix(3.36845 0 -0 4.21057 145.463 354.997)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#26377;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 138.058 379.902)" font-family="Arial,'sans-serif'" font-size="1.39636" >342&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 136.227 375.599)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-020</text>
        <text transform="matrix(3.36845 0 -0 4.21057 137.278 384.835)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#28385;&#22530;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 114.311 356.883)" font-family="Arial,'sans-serif'" font-size="1.39636" >338&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 112.48 352.58)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-011</text>
        <text transform="matrix(3.36845 0 -0 4.21057 115.884 361.862)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#23453;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 83.3327 376.278)" font-family="Arial,'sans-serif'" font-size="1.39636" >348&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 81.5014 371.975)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-009</text>
        <text transform="matrix(3.36845 0 -0 4.21057 84.9055 381.223)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#26469;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 101.448 386.031)" font-family="Arial,'sans-serif'" font-size="1.39636" >340&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 99.617 381.727)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-005</text>
        <text transform="matrix(3.36845 0 -0 4.21057 103.021 390.953)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#24576;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 124.772 396.841)" font-family="Arial,'sans-serif'" font-size="1.39636" >344&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 122.94 392.538)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-007</text>
        <text transform="matrix(3.36845 0 -0 4.21057 123.991 401.797)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#32418;&#27835;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 114.874 410.985)" font-family="Arial,'sans-serif'" font-size="1.39636" >346&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 113.042 406.682)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-010</text>
        <text transform="matrix(3.36845 0 -0 4.21057 114.094 415.942)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#32418;&#32426;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="151.59,366.896 171.553,384.186 " />
        <polyline points="171.553,384.186 189.201,366.718 " />
        <polyline points="189.201,366.718 168.881,347.645 " />
        <polyline points="171.553,384.186 159.2,396.688 " />
        <polyline points="159.2,396.688 182.427,419.107 " />
        <polyline points="182.427,419.107 238.096,396.891 " />
        <polyline points="238.096,396.891 248.416,387.705 " />
        <polyline points="195.44,360.479 189.201,366.718 " />
        <polyline points="227.94,400.944 190.493,365.426 " />
        <polyline points="289.996,343.881 245.064,401.18 " />
        <polyline points="245.064,401.18 256.389,410.057 " />
        <polyline points="256.389,410.057 301.303,352.737 " />
        <polyline points="301.303,352.737 289.996,343.881 " />
        <polyline points="293.514,362.682 282.207,353.826 " />
        <polyline points="301.303,352.737 289.996,343.881 " />
        <polyline points="285.725,372.626 274.418,363.77 " />
        <polyline points="277.936,382.571 266.629,373.714 " />
        <polyline points="270.147,392.515 258.84,383.659 " />
        <polyline points="262.358,402.459 251.051,393.603 " />
        <polyline points="302.934,354.189 314.496,363.244 " />
        <polyline points="314.496,363.244 277.289,410.739 " />
        <polyline points="277.289,410.739 265.742,401.692 " />
        <polyline points="265.742,401.692 302.934,354.189 " />
        <polyline points="295.145,364.133 306.708,373.189 " />
        <polyline points="302.934,354.189 314.496,363.244 " />
        <polyline points="287.357,374.078 298.919,383.134 " />
        <polyline points="279.568,384.023 291.13,393.078 " />
        <polyline points="271.779,393.967 283.342,403.023 " />
        <polyline points="286.475,402.679 316.52,364.404 " />
        <polyline points="316.52,364.404 328.307,373.656 " />
        <polyline points="328.307,373.656 298.262,411.931 " />
        <polyline points="298.262,411.931 286.475,402.679 " />
        <polyline points="308.721,374.34 320.508,383.592 " />
        <polyline points="300.921,384.276 312.708,393.528 " />
        <polyline points="293.122,394.212 304.909,403.464 " />
        <polyline points="329.841,374.562 341.709,383.931 " />
        <polyline points="341.709,383.931 318.916,412.807 " />
        <polyline points="318.916,412.807 307.048,403.438 " />
        <polyline points="307.048,403.438 329.841,374.562 " />
        <polyline points="322.014,384.477 333.883,393.846 " />
        <polyline points="314.188,394.392 326.056,403.76 " />
        <polyline points="340.961,311.925 361.746,325.24 " />
        <polyline points="361.746,325.24 344.454,349.39 " />
        <polyline points="344.454,349.39 325.793,336.157 " />
        <polyline points="325.793,336.157 340.961,311.925 " />
        <polyline points="304.357,298.09 336.453,318.963 " />
        <polyline points="304.357,298.09 294.017,314.668 " />
        <polyline points="294.017,314.668 325.793,336.157 " />
        <polyline points="319.082,307.666 308.247,324.291 " />
        <polyline points="306.496,294.525 337.34,316.218 " />
        <polyline points="337.34,316.218 348.385,299.694 " />
        <polyline points="348.385,299.694 317.014,279.017 " />
        <polyline points="317.014,279.017 306.496,294.525 " />
        <polyline points="332.12,288.973 321.13,304.817 " />
        <polyline points="317.014,279.017 328.959,261.192 " />
        <polyline points="328.959,261.192 364.786,281.691 " />
        <polyline points="364.786,281.691 357.833,292.921 " />
        <polyline points="357.833,292.921 354.268,290.603 " />
        <polyline points="354.268,290.603 348.385,299.694 " />
        <polyline points="326.642,255.309 316.016,273.27 " />
        <polyline points="316.016,273.27 301.92,265.276 " />
        <polyline points="306.856,247.644 313.63,248.179 " />
        <polyline points="326.642,255.309 313.63,248.179 " />
        <polyline points="316.016,273.27 302.574,293.634 " />
        <polyline points="301.92,265.276 288.773,283.069 " />
        <polyline points="302.574,293.634 288.773,283.069 " />
        <polyline points="291.747,311.071 278.528,301.702 " />
        <polyline points="278.528,301.702 288.029,289.048 " />
        <polyline points="288.029,289.048 300.082,296.939 " />
        <polyline points="300.082,296.939 291.747,311.071 " />
        <polyline points="278.528,301.702 259.753,286.973 " />
        <polyline points="259.753,286.973 275.303,271.887 " />
        <polyline points="275.303,271.887 288.773,283.069 " />
        <polyline points="288.773,283.069 288.029,289.048 " />
        <polyline points="259.753,286.973 258.896,287.914 " />
        <polyline points="258.896,287.914 240.497,271.156 " />
        <polyline points="240.497,271.156 254.807,255.448 " />
        <polyline points="254.807,255.448 274.118,273.037 " />
        <polyline points="241.176,270.411 222.362,253.527 " />
        <polyline points="222.362,253.527 238.05,236.593 " />
        <polyline points="238.05,236.593 256.231,252.814 " />
        <polyline points="256.231,252.814 254.807,255.448 " />
        <polyline points="306.856,247.644 282.079,246.04 " />
        <polyline points="282.079,246.04 275.949,254.043 " />
        <polyline points="275.949,254.043 273.853,252.445 " />
        <polyline points="273.853,252.445 256.231,252.814 " />
        <polyline points="275.949,254.043 299.011,269.213 " />
        <polyline points="364.786,281.691 372.773,270.602 " />
        <polyline points="372.773,270.602 411.14,294.987 " />
        <polyline points="411.14,294.987 396.504,319.36 " />
        <polyline points="396.504,319.36 357.833,292.921 " />
        <polyline points="392.938,283.418 377.18,306.148 " />
        <polyline points="427.714,244.792 411.93,236.49 " />
        <polyline points="411.93,236.49 424.397,211.984 " />
        <polyline points="429.749,214.704 424.397,211.984 " />
        <polyline points="440.551,220.193 427.714,244.792 " />
        <polyline points="440.551,220.193 452.319,195.594 " />
        <polyline points="452.319,195.594 441.802,190.603 " />
        <polyline points="441.802,190.603 429.749,214.704 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.24564 0 -0 2.80704 319.031 395.137)" font-family="Arial,'sans-serif'" font-size="1.39636" >4&#25490;2&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 318.507 391.949)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-001</text>
        <text transform="matrix(2.24564 0 -0 2.80704 319.207 398.377)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#26149;&#33395;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 311.638 404.947)" font-family="Arial,'sans-serif'" font-size="1.39636" >4&#25490;3&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 311.113 402.365)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-002</text>
        <text transform="matrix(2.24564 0 -0 2.80704 311.814 408.145)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#38634;&#32418;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 329.765 387.845)" font-family="Arial,'sans-serif'" font-size="1.39636" >4&#25490;1&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 331.646 385.113)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-003</text>
        <text transform="matrix(2.24564 0 -0 2.80704 329.941 391.199)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21556;&#32032;&#32418;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 313.703 375.306)" font-family="Arial,'sans-serif'" font-size="1.39636" >3&#25490;1&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 313.178 372.575)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-005</text>
        <text transform="matrix(2.24564 0 -0 2.80704 313.879 378.668)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37085;&#32418;&#23071;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="335.599,379.107 328.118,389.295 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.24564 0 -0 2.80704 322.91 382.397)" font-family="Arial,'sans-serif'" font-size="1.39636" >4&#25490;1&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 324.79 379.666)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-004</text>
        <text transform="matrix(2.24564 0 -0 2.80704 323.086 385.759)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#39033;&#31119;&#28165;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 305.568 384.906)" font-family="Arial,'sans-serif'" font-size="1.39636" >3&#25490;2&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 305.043 382.175)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-006</text>
        <text transform="matrix(2.24564 0 -0 2.80704 305.744 388.267)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#39759;&#23439;&#20964;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 297.306 394.569)" font-family="Arial,'sans-serif'" font-size="1.39636" >3&#25490;3&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 296.781 391.838)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-007</text>
        <text transform="matrix(2.24564 0 -0 2.80704 297.482 397.939)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24191;&#32418;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 289.93 403.998)" font-family="Arial,'sans-serif'" font-size="1.39636" >3&#25490;4&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 289.405 401.267)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-008</text>
        <text transform="matrix(2.24564 0 -0 2.80704 290.106 407.352)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21340;&#24800;&#20113;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 299.647 364.406)" font-family="Arial,'sans-serif'" font-size="1.39636" >2&#25490;1&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 299.122 361.675)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-010</text>
        <text transform="matrix(2.24564 0 -0 2.80704 299.823 367.76)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#28113;&#36149;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 291.72 374.494)" font-family="Arial,'sans-serif'" font-size="1.39636" >2&#25490;2&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 291.195 371.763)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-009</text>
        <text transform="matrix(2.24564 0 -0 2.80704 293.465 377.863)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#26480;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 284.049 383.823)" font-family="Arial,'sans-serif'" font-size="1.39636" >2&#25490;3&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 283.525 381.092)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-011</text>
        <text transform="matrix(2.24564 0 -0 2.80704 284.226 387.185)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#32418;&#33395;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 276.202 394.006)" font-family="Arial,'sans-serif'" font-size="1.39636" >2&#25490;4&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 275.677 391.275)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-012</text>
        <text transform="matrix(2.24564 0 -0 2.80704 276.378 397.368)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#38634;&#26757;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 268.879 403.405)" font-family="Arial,'sans-serif'" font-size="1.39636" >2&#25490;5&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 268.354 400.673)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-013</text>
        <text transform="matrix(2.24564 0 -0 2.80704 270.624 406.767)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36335;&#26757;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 286.402 354.15)" font-family="Arial,'sans-serif'" font-size="1.39636" >1&#25490;1&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 285.878 351.418)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-014</text>
        <text transform="matrix(2.24564 0 -0 2.80704 286.578 357.496)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#38271;&#39034;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 278.931 364.523)" font-family="Arial,'sans-serif'" font-size="1.39636" >1&#25490;2&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 278.406 361.792)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-015</text>
        <text transform="matrix(2.24564 0 -0 2.80704 279.107 367.877)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20040;&#26149;&#33714;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 270.638 374.236)" font-family="Arial,'sans-serif'" font-size="1.39636" >1&#25490;3&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 270.113 371.505)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-016</text>
        <text transform="matrix(2.24564 0 -0 2.80704 270.814 377.59)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#27946;&#38745;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 263.298 383.821)" font-family="Arial,'sans-serif'" font-size="1.39636" >1&#25490;4&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 262.773 381.09)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-017</text>
        <text transform="matrix(2.24564 0 -0 2.80704 263.474 387.175)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#27946;&#36798;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 254.983 393.64)" font-family="Arial,'sans-serif'" font-size="1.39636" >1&#25490;5&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 254.458 390.909)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-018</text>
        <text transform="matrix(2.24564 0 -0 2.80704 255.159 397.01)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#28023;&#26539;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 248.181 403.013)" font-family="Arial,'sans-serif'" font-size="1.39636" >1&#25490;6&#21495;</text>
        <text transform="matrix(2.24564 0 -0 2.80704 247.657 400.281)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-019</text>
        <text transform="matrix(2.24564 0 -0 2.80704 248.357 406.359)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#29577;&#33805;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 214.518 377.746)" font-family="Arial,'sans-serif'" font-size="1.39636" >336&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 212.687 373.442)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-027</text>
        <text transform="matrix(3.36845 0 -0 4.21057 207.465 382.359)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#26690;&#33465;(&#24050;&#25925;)</text>
        <text transform="matrix(3.36845 0 -0 4.21057 213.738 388.853)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#20964;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 184.887 395.763)" font-family="Arial,'sans-serif'" font-size="1.39636" >336&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 183.056 391.46)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-026</text>
        <text transform="matrix(3.36845 0 -0 4.21057 184.107 400.708)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#31168;&#21326;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 162.374 363.824)" font-family="Arial,'sans-serif'" font-size="1.39636" >334&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 160.542 359.521)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-1-025</text>
        <text transform="matrix(3.36845 0 -0 4.21057 161.594 368.781)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#26149;&#20445;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 336.826 332.383)" font-family="Arial,'sans-serif'" font-size="1.39636" >208&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 334.995 328.078)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-033</text>
        <text transform="matrix(3.36845 0 -0 4.21057 336.046 337.317)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#20250;&#26469;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 316.222 322.992)" font-family="Arial,'sans-serif'" font-size="1.39636" >206&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 314.39 318.689)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-027</text>
        <text transform="matrix(3.36845 0 -0 4.21057 315.442 327.914)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#26223;&#26149;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 300.195 312.753)" font-family="Arial,'sans-serif'" font-size="1.39636" >126&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 298.363 308.45)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-028</text>
        <text transform="matrix(3.36845 0 -0 4.21057 299.415 317.698)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#31435;&#28023;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 312.741 293.497)" font-family="Arial,'sans-serif'" font-size="1.39636" >128&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 310.909 289.194)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-020</text>
        <text transform="matrix(3.36845 0 -0 4.21057 311.961 298.454)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#24800;&#27849;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 329.269 304.363)" font-family="Arial,'sans-serif'" font-size="1.39636" >216&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 327.437 300.06)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-025</text>
        <text transform="matrix(3.36845 0 -0 4.21057 328.489 309.285)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#22763;&#31456;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 332.432 281.658)" font-family="Arial,'sans-serif'" font-size="1.39636" >130&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 330.601 277.353)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-023</text>
        <text transform="matrix(3.36845 0 -0 4.21057 331.652 286.592)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#31168;&#33593;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 303.97 259.546)" font-family="Arial,'sans-serif'" font-size="1.39636" >118&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 302.138 255.242)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-030</text>
        <text transform="matrix(3.36845 0 -0 4.21057 305.542 264.468)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#36335;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 296.786 280.839)" font-family="Arial,'sans-serif'" font-size="1.39636" >120&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 294.955 276.536)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-021</text>
        <text transform="matrix(3.36845 0 -0 4.21057 296.006 285.784)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#29748;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 283.426 301.915)" font-family="Arial,'sans-serif'" font-size="1.39636" >124&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 281.595 297.612)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-022</text>
        <text transform="matrix(3.36845 0 -0 4.21057 282.646 306.837)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#26149;&#38686;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 270.69 288.198)" font-family="Arial,'sans-serif'" font-size="1.39636" >122&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 268.858 283.895)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-026</text>
        <text transform="matrix(3.36845 0 -0 4.21057 269.91 293.109)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#28113;&#25935;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 251.274 273.334)" font-family="Arial,'sans-serif'" font-size="1.39636" >150&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 249.442 269.031)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-029</text>
        <text transform="matrix(3.36845 0 -0 4.21057 250.494 278.267)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#26690;&#20848;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 232.718 253.873)" font-family="Arial,'sans-serif'" font-size="1.39636" >148&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 230.886 249.568)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-031</text>
        <text transform="matrix(3.36845 0 -0 4.21057 231.938 258.818)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#27704;&#21018;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 271.498 266.655)" font-family="Arial,'sans-serif'" font-size="1.39636" >146&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 269.667 262.352)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-024</text>
        <text transform="matrix(3.36845 0 -0 4.21057 261.307 271.623)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#24935;&#20848;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 389.784 301.633)" font-family="Arial,'sans-serif'" font-size="1.39636" >96&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 386.644 297.328)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-012</text>
        <text transform="matrix(3.36845 0 -0 4.21057 381.423 306.235)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#25991;&#20803;(&#24050;&#25925;)</text>
        <text transform="matrix(3.36845 0 -0 4.21057 370.347 288.307)" font-family="Arial,'sans-serif'" font-size="1.39636" >100&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 368.515 284.003)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-014</text>
        <text transform="matrix(3.36845 0 -0 4.21057 369.567 293.252)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#31119;&#26469;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 422.004 229.447)" font-family="Arial,'sans-serif'" font-size="1.39636" >90&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 418.864 225.142)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-009</text>
        <text transform="matrix(3.36845 0 -0 4.21057 419.915 234.403)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#24535;&#21018;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="261.561,229.981 281.367,228.393 " />
        <polyline points="281.367,228.393 282.583,245.094 " />
        <polyline points="282.583,245.094 262.934,246.127 " />
        <polyline points="262.934,246.127 261.561,229.981 " />
        <polyline points="321.118,228.393 317.622,247.035 " />
        <polyline points="317.622,247.035 284.753,243.188 " />
        <polyline points="284.753,243.188 287.071,221.619 " />
        <polyline points="287.071,221.619 321.118,228.393 " />
        <polyline points="309.949,225.337 291.066,214.93 " />
        <polyline points="291.066,214.93 305.435,187.395 " />
        <polyline points="305.435,187.395 324.151,196.664 " />
        <polyline points="324.151,196.664 309.949,225.337 " />
        <polyline points="350.175,213.776 337.097,237.238 " />
        <polyline points="337.097,237.238 311.145,222.921 " />
        <polyline points="350.175,213.776 322.912,199.165 " />
        <polyline points="324.985,230.556 337.796,207.141 " />
        <polyline points="342.645,169.221 360.756,180.516 " />
        <polyline points="360.756,180.516 344.232,210.591 " />
        <polyline points="342.645,169.221 325.36,200.477 " />
        <polyline points="324.151,196.664 341.088,168.322 " />
        <polyline points="341.088,168.322 321.302,158.161 " />
        <polyline points="321.302,158.161 305.435,187.395 " />
        <polyline points="344.654,166.202 353.459,150.778 " />
        <polyline points="353.459,150.778 374.902,162.806 " />
        <polyline points="374.902,162.806 365.829,178.388 " />
        <polyline points="365.829,178.388 344.654,166.202 " />
        <polyline points="341.292,166.174 353.212,145.505 " />
        <polyline points="353.212,145.505 336.1,134.81 " />
        <polyline points="336.1,134.81 323.441,154.953 " />
        <polyline points="323.441,154.953 341.292,166.174 " />
        <polyline points="360.756,180.516 386.542,193.99 " />
        <polyline points="386.542,193.99 371.916,227.153 " />
        <polyline points="374.117,228.325 349.399,215.169 " />
        <polyline points="402.618,170.069 419.62,178.023 " />
        <polyline points="419.62,178.023 408.386,202.165 " />
        <polyline points="408.386,202.165 392.594,194.659 " />
        <polyline points="392.594,194.659 402.618,170.069 " />
        <polyline points="409.353,202.092 430.613,210.926 " />
        <polyline points="430.613,210.926 442.52,185.619 " />
        <polyline points="442.52,185.619 420.889,176.235 " />
        <polyline points="420.889,176.235 409.353,202.092 " />
        <polyline points="391.711,195.594 424.397,211.984 " />
        <polyline points="391.711,195.594 374.117,228.325 " />
        <polyline points="379.107,219.041 411.891,236.568 " />
        <polyline points="396.877,228.571 409.379,204.453 " />
        <polyline points="395.745,227.727 378.977,258.165 " />
        <polyline points="378.977,258.165 358.483,248.404 " />
        <polyline points="358.483,248.404 369.546,225.892 " />
        <polyline points="375.659,257.098 365.207,279.406 " />
        <polyline points="365.207,279.406 349.106,268.685 " />
        <polyline points="349.106,268.685 358.907,249.249 " />
        <polyline points="358.907,249.249 375.659,257.098 " />
        <polyline points="347.495,266.25 330.075,257.702 " />
        <polyline points="330.075,257.702 340.191,239.445 " />
        <polyline points="340.191,239.445 357.302,248.001 " />
        <polyline points="357.302,248.001 347.495,266.25 " />
        <polyline points="340.191,239.445 351.584,219.298 " />
        <polyline points="351.584,219.298 367.371,228.469 " />
        <polyline points="367.371,228.469 357.302,248.001 " />
        <polyline points="427.714,244.792 419.386,260.711 " />
        <polyline points="419.386,260.711 388.521,244.501 " />
        <polyline points="388.521,244.501 396.877,228.571 " />
        <polyline points="418.934,262.171 404.094,288.035 " />
        <polyline points="404.094,288.035 373.608,271.132 " />
        <polyline points="373.608,271.132 378.977,258.165 " />
        <polyline points="418.934,262.171 386.025,245.372 " />
        <polyline points="389.371,279.872 402.297,253.679 " />
        <polyline points="410.378,301.663 432.457,313.753 " />
        <polyline points="432.457,313.753 443.217,292.564 " />
        <polyline points="443.217,292.564 421.828,281.334 " />
        <polyline points="421.828,281.334 410.378,301.663 " />
        <polyline points="421.828,281.334 419.154,279.73 " />
        <polyline points="419.154,279.73 427.355,265.648 " />
        <polyline points="427.355,265.648 450.527,276.878 " />
        <polyline points="450.527,276.878 443.217,292.564 " />
        <polyline points="456.276,328.179 469.063,303.794 " />
        <polyline points="469.063,303.794 444.287,291.495 " />
        <polyline points="444.287,291.495 432.676,314.309 " />
        <polyline points="432.676,314.309 456.276,328.179 " />
        <polyline points="479.582,281.156 469.063,303.794 " />
        <polyline points="479.582,281.156 454.628,268.322 " />
        <polyline points="454.628,268.322 450.527,276.878 " />
        <polyline points="479.582,281.156 486.179,270.104 " />
        <polyline points="486.179,270.104 462.651,257.27 " />
        <polyline points="462.651,257.27 456.232,269.213 " />
        <polyline points="486.179,270.104 492.42,257.448 " />
        <polyline points="492.42,257.448 469.783,242.653 " />
        <polyline points="469.783,242.653 462.651,257.27 " />
        <polyline points="492.42,257.448 505.833,228.933 " />
        <polyline points="505.833,228.933 483.333,217.163 " />
        <polyline points="483.333,217.163 469.783,242.653 " />
        <polyline points="376.755,306.98 395.635,319.569 " />
        <polyline points="395.635,319.569 383.853,337.234 " />
        <polyline points="383.853,337.234 365.803,323.407 " />
        <polyline points="365.803,323.407 376.755,306.98 " />
        <polyline points="341.131,310.546 361.039,323.759 " />
        <polyline points="361.039,323.759 374.771,304.501 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.36845 0 -0 4.21057 373.362 320.693)" font-family="Arial,'sans-serif'" font-size="1.39636" >212&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 371.531 316.388)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-032</text>
        <text transform="matrix(3.36845 0 -0 4.21057 370.229 325.649)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#31168;&#29645;&#12289;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 366.309 329.771)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#25991;&#23453;(&#24050;&#25925;)</text>
        <text transform="matrix(3.36845 0 -0 4.21057 351.617 307.586)" font-family="Arial,'sans-serif'" font-size="1.39636" >214&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 349.786 303.282)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-033</text>
        <text transform="matrix(3.36845 0 -0 4.21057 344.565 312.2)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#25991;&#21033;(&#24050;&#25925;)</text>
        <text transform="matrix(3.36845 0 -0 4.21057 350.837 318.324)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#30000;&#32032;&#29645;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 265.699 239.033)" font-family="Arial,'sans-serif'" font-size="1.39636" >144&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 263.868 234.729)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-030</text>
        <text transform="matrix(3.36845 0 -0 4.21057 258.646 243.635)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#31435;&#26124;(&#24050;&#25925;)</text>
        <text transform="matrix(3.36845 0 -0 4.21057 295.747 236.114)" font-family="Arial,'sans-serif'" font-size="1.39636" >142&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 293.915 231.809)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-029</text>
        <text transform="matrix(3.36845 0 -0 4.21057 297.32 241.025)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#26032;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 422.428 299.229)" font-family="Arial,'sans-serif'" font-size="1.39636" >86&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 419.288 294.924)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-007</text>
        <text transform="matrix(3.36845 0 -0 4.21057 420.339 304.162)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26460;&#27704;&#21033;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 445.745 309.656)" font-family="Arial,'sans-serif'" font-size="1.39636" >82&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 442.605 305.351)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-005</text>
        <text transform="matrix(3.36845 0 -0 4.21057 443.656 314.589)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24314;&#21326;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 457.566 288.158)" font-family="Arial,'sans-serif'" font-size="1.39636" >80&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 454.426 283.854)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-004</text>
        <text transform="matrix(3.36845 0 -0 4.21057 457.83 293.103)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#20142;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 466.195 270.757)" font-family="Arial,'sans-serif'" font-size="1.39636" >78&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 463.055 266.452)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-003</text>
        <text transform="matrix(3.36845 0 -0 4.21057 464.106 275.702)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23500;&#26149;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 482.962 237.941)" font-family="Arial,'sans-serif'" font-size="1.39636" >74&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 479.822 233.637)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-001</text>
        <text transform="matrix(3.36845 0 -0 4.21057 480.873 242.886)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37085;&#25991;&#36215;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 471.635 257.075)" font-family="Arial,'sans-serif'" font-size="1.39636" >76&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 468.495 252.77)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-002</text>
        <text transform="matrix(3.36845 0 -0 4.21057 469.546 262.008)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24186;&#26149;&#39321;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 430.068 281.245)" font-family="Arial,'sans-serif'" font-size="1.39636" >84&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 426.928 276.94)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-006</text>
        <text transform="matrix(3.36845 0 -0 4.21057 427.979 286.19)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#32654;&#33521;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 398.875 272.859)" font-family="Arial,'sans-serif'" font-size="1.39636" >94&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 395.735 268.554)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-011</text>
        <text transform="matrix(3.36845 0 -0 4.21057 396.786 277.816)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#28113;&#29645;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 383.803 264.306)" font-family="Arial,'sans-serif'" font-size="1.39636" >98&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 380.663 260.002)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-013</text>
        <text transform="matrix(3.36845 0 -0 4.21057 381.714 269.251)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#39759;&#26234;&#40857;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 403.044 246.066)" font-family="Arial,'sans-serif'" font-size="1.39636" >92&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 399.904 241.761)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-010</text>
        <text transform="matrix(3.36845 0 -0 4.21057 394.682 250.679)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#37329;&#33391;(&#24050;&#25925;)</text>
        <text transform="matrix(3.36845 0 -0 4.21057 405.762 222.143)" font-family="Arial,'sans-serif'" font-size="1.39636" >88&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 402.622 217.838)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-008</text>
        <text transform="matrix(3.36845 0 -0 4.21057 403.673 227.076)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#26216;&#21018;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 388.942 212.202)" font-family="Arial,'sans-serif'" font-size="1.39636" >106&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 387.111 207.897)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-017</text>
        <text transform="matrix(3.36845 0 -0 4.21057 388.162 217.135)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#26223;&#36149;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 420.162 194.934)" font-family="Arial,'sans-serif'" font-size="1.39636" >99&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 417.022 190.629)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-035</text>
        <text transform="matrix(3.36845 0 -0 4.21057 404.742 199.536)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23385;&#29577;&#33437;&#12289;&#23435;&#30000;(&#24050;&#25925;)</text>
        <text transform="matrix(3.36845 0 -0 4.21057 400.97 186.942)" font-family="Arial,'sans-serif'" font-size="1.39636" >104&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 399.138 182.638)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-016</text>
        <text transform="matrix(3.36845 0 -0 4.21057 400.19 191.864)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#26223;&#31119;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 357.109 264.749)" font-family="Arial,'sans-serif'" font-size="1.39636" >406&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 355.277 260.444)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-034</text>
        <text transform="matrix(3.36845 0 -0 4.21057 356.329 269.705)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#24535;&#29983;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 338.277 254.037)" font-family="Arial,'sans-serif'" font-size="1.39636" >132&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 336.446 249.732)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-024</text>
        <text transform="matrix(3.36845 0 -0 4.21057 337.497 258.97)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20219;&#20809;&#20250;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 347.811 235.292)" font-family="Arial,'sans-serif'" font-size="1.39636" >134&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 345.979 230.988)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-025</text>
        <text transform="matrix(3.36845 0 -0 4.21057 347.031 240.237)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#30333;&#29577;&#33635;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 370.876 241.71)" font-family="Arial,'sans-serif'" font-size="1.39636" >108&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 369.045 237.405)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-018</text>
        <text transform="matrix(3.36845 0 -0 4.21057 370.096 246.643)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23578;&#32032;&#33521;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 359.947 204.965)" font-family="Arial,'sans-serif'" font-size="1.39636" >110&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 358.116 200.66)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-019</text>
        <text transform="matrix(3.36845 0 -0 4.21057 359.167 209.899)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#32032;&#29645;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 353.479 165.999)" font-family="Arial,'sans-serif'" font-size="1.39636" >112&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 351.647 161.694)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-020</text>
        <text transform="matrix(3.36845 0 -0 4.21057 352.699 170.898)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#26195;&#29141;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 332.374 152.724)" font-family="Arial,'sans-serif'" font-size="1.39636" >136&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 330.542 148.419)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-026</text>
        <text transform="matrix(3.36845 0 -0 4.21057 331.593 157.646)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#30000;&#25391;&#24544;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 316.99 179.391)" font-family="Arial,'sans-serif'" font-size="1.39636" >138&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 315.159 175.086)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-027</text>
        <text transform="matrix(3.36845 0 -0 4.21057 316.21 184.313)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24800;&#33521;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 337.697 191.167)" font-family="Arial,'sans-serif'" font-size="1.39636" >112&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 335.866 186.862)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-021</text>
        <text transform="matrix(3.36845 0 -0 4.21057 336.917 196.1)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#38271;&#27700;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 301.861 207.285)" font-family="Arial,'sans-serif'" font-size="1.39636" >140&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 300.03 202.98)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-028</text>
        <text transform="matrix(3.36845 0 -0 4.21057 301.081 212.253)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33891;&#28113;&#21697;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 318.426 216.462)" font-family="Arial,'sans-serif'" font-size="1.39636" >114&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 316.594 212.157)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-022</text>
        <text transform="matrix(3.36845 0 -0 4.21057 317.646 221.395)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#23453;&#36149;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 332.633 223.869)" font-family="Arial,'sans-serif'" font-size="1.39636" >116&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 330.802 219.564)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-3-023</text>
        <text transform="matrix(3.36845 0 -0 4.21057 331.853 228.803)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#32426;&#33521;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="509.868,231.978 530.451,242.739 " />
        <polyline points="530.451,242.739 518.266,264.044 " />
        <polyline points="518.266,264.044 497.411,254.062 " />
        <polyline points="497.411,254.062 509.868,231.978 " />
        <polyline points="518.266,264.044 510.777,280.087 " />
        <polyline points="510.777,280.087 490.814,269.213 " />
        <polyline points="490.814,269.213 498.93,254.788 " />
        <polyline points="510.777,280.087 503.11,293.634 " />
        <polyline points="503.11,293.634 484.038,283.295 " />
        <polyline points="484.038,283.295 490.814,269.213 " />
        <polyline points="503.11,293.634 495.444,308.964 " />
        <polyline points="495.444,308.964 475.997,298.301 " />
        <polyline points="475.997,298.301 484.038,283.295 " />
        <polyline points="495.444,308.964 482.072,333.563 " />
        <polyline points="482.072,333.563 463,323.402 " />
        <polyline points="463,323.402 475.997,298.301 " />
        <polyline points="518.446,328.321 530.556,335.167 " />
        <polyline points="530.556,335.167 524.859,344.975 " />
        <polyline points="513.273,275.452 525.928,282.404 " />
        <polyline points="525.928,282.404 505.502,319.305 " />
        <polyline points="505.744,318.866 494.651,313.158 " />
        <polyline points="494.651,313.158 496.347,309.449 " />
        <polyline points="496.347,309.449 495.444,308.964 " />
        <polyline points="505.502,319.305 519.069,327.207 " />
        <polyline points="518.446,328.321 539.475,290.782 " />
        <polyline points="539.475,290.782 525.928,282.404 " />
        <polyline points="544.115,251.031 526.4,282.695 " />
        <polyline points="544.115,251.031 529.863,243.767 " />
        <polyline points="543.75,251.682 557.839,259.409 " />
        <polyline points="557.839,259.409 539.475,290.782 " />
        <polyline points="572.989,269.57 557.839,259.409 " />
        <polyline points="572.989,269.57 529.446,347.321 " />
        <polyline points="529.446,347.321 524.859,344.975 " />
        <polyline points="572.989,269.57 586.714,277.056 " />
        <polyline points="586.714,277.056 578.334,292.743 " />
        <polyline points="578.334,292.743 564.118,285.411 " />
        <polyline points="578.334,292.743 565.853,316.272 " />
        <polyline points="565.853,316.272 551.633,307.703 " />
        <polyline points="565.853,316.272 550.847,344.103 " />
        <polyline points="550.847,344.103 535.727,336.105 " />
        <polyline points="553.476,339.227 564.958,345.327 " />
        <polyline points="564.958,345.327 550.694,371.352 " />
        <polyline points="550.694,371.352 537.148,364.757 " />
        <polyline points="537.148,364.757 548.541,342.884 " />
        <polyline points="553.339,370.739 566.74,377.997 " />
        <polyline points="566.74,377.997 593.837,331.423 " />
        <polyline points="593.837,331.423 579.399,323.58 " />
        <polyline points="579.399,323.58 553.339,370.739 " />
        <polyline points="593.837,331.423 614.334,342.475 " />
        <polyline points="614.334,342.475 610.411,349.962 " />
        <polyline points="610.411,349.962 611.481,350.497 " />
        <polyline points="611.481,350.497 595.446,381.873 " />
        <polyline points="595.446,381.873 571.634,369.584 " />
        <polyline points="602.392,333.919 579.934,322.154 " />
        <polyline points="579.934,322.154 591.138,300.662 " />
        <polyline points="591.138,300.662 614.16,312.885 " />
        <polyline points="614.16,312.885 602.392,333.919 " />
        <polyline points="614.16,312.885 623.903,296.551 " />
        <polyline points="623.903,296.551 600.439,283.473 " />
        <polyline points="600.439,283.473 591.138,300.662 " />
        <polyline points="627.734,298.898 641.84,306.294 " />
        <polyline points="641.84,306.294 622.177,340.871 " />
        <polyline points="622.177,340.871 607.918,333.384 " />
        <polyline points="607.918,333.384 627.734,298.898 " />
        <polyline points="641.84,306.294 656.762,314.489 " />
        <polyline points="656.762,314.489 629.839,360.835 " />
        <polyline points="629.839,360.835 615.937,353.349 " />
        <polyline points="615.937,353.349 622.177,340.871 " />
        <polyline points="629.839,360.835 618.454,379.887 " />
        <polyline points="618.454,379.887 605.895,372.253 " />
        <polyline points="605.895,372.253 615.937,353.349 " />
        <polyline points="618.454,379.887 632.892,387.206 " />
        <polyline points="632.892,387.206 652.121,356.022 " />
        <polyline points="652.121,356.022 637.459,347.719 " />
        <polyline points="652.121,356.022 669.941,322.072 " />
        <polyline points="669.941,322.072 656.762,314.489 " />
        <polyline points="671.978,321.899 684.435,328.747 " />
        <polyline points="684.435,328.747 669.815,355.016 " />
        <polyline points="669.815,355.016 656.044,348.714 " />
        <polyline points="669.815,355.016 656.574,380.265 " />
        <polyline points="656.574,380.265 641.877,372.636 " />
        <polyline points="656.574,380.265 648.015,395.06 " />
        <polyline points="648.015,395.06 632.892,387.206 " />
        <polyline points="648.015,395.06 662.229,402.266 " />
        <polyline points="662.229,402.266 698.069,338.89 " />
        <polyline points="698.069,338.89 683.725,330.023 " />
        <polyline points="700.065,337.499 717.127,347.114 " />
        <polyline points="717.127,347.114 705.219,369.072 " />
        <polyline points="705.219,369.072 687.733,360.308 " />
        <polyline points="687.733,360.308 700.065,337.499 " />
        <polyline points="737.292,357.96 758.902,368.286 " />
        <polyline points="737.292,357.96 721.536,390.692 " />
        <polyline points="721.536,390.692 742.74,401.169 " />
        <polyline points="742.74,401.169 758.902,368.286 " />
        <polyline points="719.621,391.47 741.566,403.428 " />
        <polyline points="741.566,403.428 721.255,441.581 " />
        <polyline points="721.255,441.581 698.875,428.685 " />
        <polyline points="698.875,428.685 719.621,391.47 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.36845 0 -0 4.21057 717.654 416.563)" font-family="Arial,'sans-serif'" font-size="1.39636" >8&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 713.205 412.259)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-027</text>
        <text transform="matrix(3.36845 0 -0 4.21057 714.256 421.508)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#34203;&#29577;&#24378;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 736.725 380.372)" font-family="Arial,'sans-serif'" font-size="1.39636" >6&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 732.276 376.069)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-026</text>
        <text transform="matrix(3.36845 0 -0 4.21057 733.327 385.317)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#34203;&#29577;&#28165;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 698.115 355.108)" font-family="Arial,'sans-serif'" font-size="1.39636" >14&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 694.975 350.805)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-019</text>
        <text transform="matrix(3.36845 0 -0 4.21057 696.027 360.053)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21335;&#31168;&#33521;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 670.455 365.921)" font-family="Arial,'sans-serif'" font-size="1.39636" >16&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 667.315 361.616)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-023</text>
        <text transform="matrix(3.36845 0 -0 4.21057 667.399 370.866)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#28113;&#32442;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 665.672 340.428)" font-family="Arial,'sans-serif'" font-size="1.39636" >18&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 663.606 336.125)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-024</text>
        <text transform="matrix(3.36845 0 -0 4.21057 665.156 345.373)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#27589;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 651.304 366.563)" font-family="Arial,'sans-serif'" font-size="1.39636" >20&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 649.337 362.259)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-015</text>
        <text transform="matrix(3.36845 0 -0 4.21057 647.887 371.496)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#31168;&#21531;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 639.771 385.623)" font-family="Arial,'sans-serif'" font-size="1.39636" >22&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 636.631 381.663)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-020</text>
        <text transform="matrix(3.36845 0 -0 4.21057 637.682 390.568)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37085;&#31168;&#33521;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 631.273 369.145)" font-family="Arial,'sans-serif'" font-size="1.39636" >26&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 628.134 364.841)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-018</text>
        <text transform="matrix(3.36845 0 -0 4.21057 627.688 374.124)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#29577;&#23665;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 648.029 339.198)" font-family="Arial,'sans-serif'" font-size="1.39636" >24&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 644.889 334.894)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-025</text>
        <text transform="matrix(3.36845 0 -0 4.21057 640.581 344.143)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#21326; &#24352;&#29577;&#29645;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 632.54 333.486)" font-family="Arial,'sans-serif'" font-size="1.39636" >28&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 629.4 329.183)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-017</text>
        <text transform="matrix(3.36845 0 -0 4.21057 630.451 338.431)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37085;&#24314;&#22269;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 613.403 367.705)" font-family="Arial,'sans-serif'" font-size="1.39636" >32&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 610.263 363.402)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-022</text>
        <text transform="matrix(3.36845 0 -0 4.21057 611.314 372.627)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37101;&#28113;&#25935;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="604.841,363.489 581.616,352.428 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.36845 0 -0 4.21057 592.637 348.945)" font-family="Arial,'sans-serif'" font-size="1.39636" >34&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 589.497 344.641)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-034</text>
        <text transform="matrix(3.36845 0 -0 4.21057 590.548 353.89)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#22763;&#28165;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 585.419 368.147)" font-family="Arial,'sans-serif'" font-size="1.39636" >36&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 582.279 363.842)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-036</text>
        <text transform="matrix(3.36845 0 -0 4.21057 583.331 373.092)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#22763;&#20142;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 620.9 319.563)" font-family="Arial,'sans-serif'" font-size="1.39636" >30&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 618.578 315.26)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-016</text>
        <text transform="matrix(3.36845 0 -0 4.21057 618.812 324.566)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#38271;&#23453;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 601.618 299.791)" font-family="Arial,'sans-serif'" font-size="1.39636" >38&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 598.478 295.487)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-033</text>
        <text transform="matrix(3.36845 0 -0 4.21057 599.529 304.736)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#20113;&#23792;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 592.383 318.696)" font-family="Arial,'sans-serif'" font-size="1.39636" >40&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 589.243 314.392)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-028</text>
        <text transform="matrix(3.36845 0 -0 4.21057 590.295 323.641)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37085;&#24314;&#21326;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 577.371 338.368)" font-family="Arial,'sans-serif'" font-size="1.39636" >72&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 574.231 334.063)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-030</text>
        <text transform="matrix(3.36845 0 -0 4.21057 577.635 343.324)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#36745;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 547.564 356.34)" font-family="Arial,'sans-serif'" font-size="1.39636" >70&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 544.424 352.037)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-010</text>
        <text transform="matrix(3.36845 0 -0 4.21057 547.829 361.273)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25140;&#20852;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 548.191 324.956)" font-family="Arial,'sans-serif'" font-size="1.39636" >68&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 545.052 320.653)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-009</text>
        <text transform="matrix(3.36845 0 -0 4.21057 546.103 329.89)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24464;&#31435;&#26032;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 560.102 300.282)" font-family="Arial,'sans-serif'" font-size="1.39636" >44&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 556.962 295.978)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-008</text>
        <text transform="matrix(3.36845 0 -0 4.21057 548.602 305.238)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23004;&#20029;&#21326;&#12289;&#39532;&#26149;&#21551;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 571.614 282.554)" font-family="Arial,'sans-serif'" font-size="1.39636" >44&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 568.475 278.25)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-007</text>
        <text transform="matrix(3.36845 0 -0 4.21057 571.879 287.51)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#26539;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 536.09 309.166)" font-family="Arial,'sans-serif'" font-size="1.39636" >46&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 532.95 304.863)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-011</text>
        <text transform="matrix(3.36845 0 -0 4.21057 534.002 314.111)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37085;&#28113;&#23195;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 519.193 305.802)" font-family="Arial,'sans-serif'" font-size="1.39636" >64&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 516.053 301.499)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-001</text>
        <text transform="matrix(3.36845 0 -0 4.21057 517.104 310.724)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26460;&#27704;&#24503;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 506.163 297.843)" font-family="Arial,'sans-serif'" font-size="1.39636" >62&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 503.024 293.539)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-003</text>
        <text transform="matrix(3.36845 0 -0 4.21057 504.075 302.765)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24186;&#25391;&#23665;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 476.185 316.369)" font-family="Arial,'sans-serif'" font-size="1.39636" >60&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 473.046 312.066)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-012</text>
        <text transform="matrix(3.36845 0 -0 4.21057 476.45 321.314)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#23500;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 485.041 298.543)" font-family="Arial,'sans-serif'" font-size="1.39636" >58&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 481.901 294.24)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-014</text>
        <text transform="matrix(3.36845 0 -0 4.21057 482.952 303.477)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#20848;&#28113;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 492.821 283.054)" font-family="Arial,'sans-serif'" font-size="1.39636" >56&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 489.681 278.751)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-021</text>
        <text transform="matrix(3.36845 0 -0 4.21057 490.733 287.999)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#20426;&#38686;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 501.195 268.726)" font-family="Arial,'sans-serif'" font-size="1.39636" >54&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 498.056 264.422)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-004</text>
        <text transform="matrix(3.36845 0 -0 4.21057 501.46 273.659)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#31077;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 510.529 250.369)" font-family="Arial,'sans-serif'" font-size="1.39636" >52&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 507.389 246.066)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-005</text>
        <text transform="matrix(3.36845 0 -0 4.21057 508.44 255.314)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#28113;&#20426;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 524.991 265.158)" font-family="Arial,'sans-serif'" font-size="1.39636" >50&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 521.851 260.853)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-035</text>
        <text transform="matrix(3.36845 0 -0 4.21057 522.902 270.114)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26041;&#27704;&#29645;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 535.262 278.423)" font-family="Arial,'sans-serif'" font-size="1.39636" >48&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 532.123 274.12)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-006</text>
        <text transform="matrix(3.36845 0 -0 4.21057 533.174 283.356)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24464;&#28113;&#26480;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="567.59,344.95 581.825,352.068 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.36845 0 -0 4.21057 565.056 361.502)" font-family="Arial,'sans-serif'" font-size="1.39636" >72&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 561.916 357.198)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-4-029</text>
        <text transform="matrix(3.36845 0 -0 4.21057 562.968 366.447)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#20426;&#33452;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="255.962,230.442 250.055,234.679 " />
        <polyline points="250.055,234.679 246.664,238.143 " />
        <polyline points="246.664,238.143 253.199,244.53 " />
        <polyline points="253.199,244.53 257.245,246.586 " />
        <polyline points="257.245,246.586 255.918,230.445 " />
        <polyline points="282.775,246.089 301.748,256.164 " />
        <polyline points="301.748,256.164 295.369,266.564 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.36845 0 -0 4.21057 283.146 256.86)" font-family="Arial,'sans-serif'" font-size="1.39636" >120&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 276.337 252.91)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-032</text>
        <text transform="matrix(3.36845 0 -0 4.21057 285.312 261.44)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#27704;&#21018;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 246.929 239.745)" font-family="Arial,'sans-serif'" font-size="1.39636" >120&#21495;</text>
        <text transform="matrix(3.36845 0 -0 4.21057 244.563 235.795)" font-family="Arial,'sans-serif'" font-size="1.39636" >6-2-032</text>
        <text transform="matrix(3.36845 0 -0 4.21057 246.178 244.325)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#27704;&#21018;</text>
        </g>
        </svg>


        <script>
            /*  Constants: */
            var svgViewBoxWidth = 500;	// The original width value of the viewBox attribute for the svg element.
            var svgViewBoxHeight = 300;	// The original height value of the viewBox attribute for the svg element.
            var leftArrow = 37;	// The numeric code for the left arrow key.
            var upArrow = 38;
            var rightArrow = 39;
            var downArrow = 40;
            var panRate = 10;	// Number of pixels to pan per key press.
            var zoomRate = 1.2;	// Must be greater than 1. Increase this value for faster zooming (i.e., less granularity).
            var upBtn = "up";
            var downBtn = "down";
            var leftBtn = "left";
            var rightBtn = "right";

            /* Globals: */
            var theSvgElement;

            function processKeyPress(evt) {
                var viewBox = theSvgElement.getAttribute('viewBox');	// Grab the object representing the SVG element's viewBox attribute.
                var viewBoxValues = viewBox.split(' ');				// Create an array and insert each individual view box attribute value (assume they're seperated by a single whitespace character).

                viewBoxValues[0] = parseFloat(viewBoxValues[0]);		// Convert string "numeric" values to actual numeric values.
                viewBoxValues[1] = parseFloat(viewBoxValues[1]);

                switch (evt.keyCode) {
                    case leftArrow:
                        viewBoxValues[0] -= panRate;	// Increase the x-coordinate value of the viewBox attribute to pan right.
                        break;
                    case rightArrow:
                        viewBoxValues[0] += panRate;	// Decrease the x-coordinate value of the viewBox attribute to pan left.
                        break;
                    case upArrow:
                        viewBoxValues[1] -= panRate;	// Increase the y-coordinate value of the viewBox attribute to pan down.
                        break;
                    case downArrow:
                        viewBoxValues[1] += panRate;	// Decrease the y-coordinate value of the viewBox attribute to pan up.
                        break;
                } // switch

                theSvgElement.setAttribute('viewBox', viewBoxValues.join(' '));	// Convert the viewBoxValues array into a string with a white space character between the given values.
            }
            var timeTask;
            function moveBtn(obj) {

                var viewBox = theSvgElement.getAttribute('viewBox');	// Grab the object representing the SVG element's viewBox attribute.
                var viewBoxValues = viewBox.split(' ');				// Create an array and insert each individual view box attribute value (assume they're seperated by a single whitespace character).

                viewBoxValues[0] = parseFloat(viewBoxValues[0]);		// Convert string "numeric" values to actual numeric values.
                viewBoxValues[1] = parseFloat(viewBoxValues[1]);

                var idBtn = obj.attr("id");
                if (idBtn == leftBtn) {
                    viewBoxValues[0] -= panRate;
                } else if (idBtn == rightBtn) {
                    viewBoxValues[0] += panRate;
                } else if (idBtn == upBtn) {
                    viewBoxValues[1] -= panRate;
                } else if (idBtn == downBtn) {
                    viewBoxValues[1] += panRate;
                }

                theSvgElement.setAttribute('viewBox', viewBoxValues.join(' '));
            }

            function zoom(zoomType) {
                var viewBox = theSvgElement.getAttribute('viewBox');	// Grab the object representing the SVG element's viewBox attribute.
                var viewBoxValues = viewBox.split(' ');				// Create an array and insert each individual view box attribute value (assume they're seperated by a single whitespace character).

                viewBoxValues[2] = parseFloat(viewBoxValues[2]);		// Convert string "numeric" values to actual numeric values.
                viewBoxValues[3] = parseFloat(viewBoxValues[3]);

                if (zoomType == 'zoomIn') {
                    viewBoxValues[2] /= zoomRate;	// Decrease the width and height attributes of the viewBox attribute to zoom in.
                    viewBoxValues[3] /= zoomRate;
                }
                else if (zoomType == 'zoomOut') {
                    viewBoxValues[2] *= zoomRate;	// Increase the width and height attributes of the viewBox attribute to zoom out.
                    viewBoxValues[3] *= zoomRate;
                }
                else
                    alert("function zoom(zoomType) given invalid zoomType parameter.");

                theSvgElement.setAttribute('viewBox', viewBoxValues.join(' '));	// Convert the viewBoxValues array into a string with a white space character between the given values.

                var currentZoomFactor = svgViewBoxWidth / viewBoxValues[2];										// Calculates the current zoom factor, could have just as easily used svgViewBoxHeight.
                var newText = document.createTextNode("Current zoom factor = " + currentZoomFactor.toFixed(3));	// Create a generic new text node object.
                var parentNode = document.getElementById('currentZoomFactorText');  								// Get the parent node of the text node we want to replace.

                parentNode.replaceChild(newText, parentNode.firstChild);  // Replace the first child text node with the new text object.
            }

            function zoomViaMouseWheel(mouseWheelEvent) {
                if (mouseWheelEvent.wheelDelta > 0)
                    zoom('zoomIn');
                else
                    zoom('zoomOut');

                /* When the mouse is over the webpage, don't let the mouse wheel scroll the entire webpage: */
                mouseWheelEvent.cancelBubble = true;
                return false;
            }

            function initialize() {
                /* Add event listeners: */
                window.addEventListener('keydown', processKeyPress, true);		// OK to let the keydown event bubble.
                window.addEventListener('mousewheel', zoomViaMouseWheel, false);	// Don't let the mousewheel event bubble up to stop native browser window scrolling.

                /* Set a global variable and detect if the browser supports SVG: */
                theSvgElement = document.getElementById('svgElement');			// Best to only access the SVG element after the page has fully loaded.

                if (theSvgElement.namespaceURI != "http://www.w3.org/2000/svg")	// Alert the user if their browser does not support SVG.
                    alert("Inline SVG in HTML5 is not supported. This document requires a browser that supports HTML5 inline SVG.");

                /* For the svg element, specifically set the viewBox attribute's width and height values in that one of them will be used to calculate the current scaling factor. */
                theSvgElement.setAttribute('viewBox', "50 200 " + svgViewBoxWidth + " " + svgViewBoxHeight);

                $(".moveCls").bind("mousedown", function () {
                    timeTask = timeTask = setInterval("moveBtn($(\"#" + $(this).attr("id") + "\"))", 70);
                }).bind("mouseup", function () {
                    clearInterval(timeTask);
                });
            }
            $(function () {
                // if(SVG.supported){
                //alert("支持SVG");
                //}else{
                //alert("不支持SVG，解决方式：\n\n1、切换浏览器为极速模式\n2、下载最新IE、360、QQ浏览器等\n3、联系系统管理员");
                //}
                initialize();
            });
        </script>

        <script>
            var pointsId;
            $(function (e) {
                $("polyline").dblclick(function (e) {
                    $("polyline").attr("stroke-width", "0.1242");
                    var fyId = $(this).attr("fyId");
                    pointsId = $(this).attr("id");
                    if (fyId == "") {
                    } else {
                        viewPoints();
                    }
                });
            });
            function viewPoints() {
                $("#myModalSearch").modal("show");
            }
        </script>

        <div class="modal inmodal" id="myModalSearch" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated bounceInRight">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">征收家庭基本信息查看</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <td class="fieldName">姓名：</td>
                                    <td class="fieldValue">张素兰</td>
                                </tr>
                                <tr>
                                    <td class="fieldName">坐落：</td>
                                    <td class="fieldValue">北辛安20号</td>
                                </tr>
                                <tr>
                                    <td class="fieldName">状态：</td>
                                    <td class="fieldValue">已签约</td>
                                </tr>
                                <tr>
                                    <td class="fieldName">备注：</td>
                                    <td class="fieldValue"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">关 闭</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var draggable = $('#svgElement').draggabilly({});
            $(function () {
                $("polyline").click(function () {
                    $("#myModal").modal();
                });
            });
        </script>
        <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">入户基本信息查看</h4>
                    </div>
                    <div class="modal-body" id="myModalBoday">
                        <table class="table table-bordered">
                            <tr>
                                <td class="fieldName">承租人或产权人</td>
                                <td class="fieldValue">李秀琴</td>
                            </tr>
                            <tr>
                                <td class="fieldName">身份证号</td>
                                <td class="fieldValue">110103195709090406</td>
                            </tr>
                            <tr>
                                <td class="fieldName">门牌号</td>
                                <td class="fieldValue">崇文区桃杨路27号</td>
                            </tr>
                            <tr>
                                <td class="fieldName">补偿协议类型</td>
                                <td class="fieldValue">外迁</td>
                            </tr>
                            <tr>
                                <td class="fieldName">补偿金额（元）</td>
                                <td class="fieldValue">1200000</td>
                            </tr>
                            <tr>
                                <td class="fieldName">签约状态</td>
                                <td class="fieldValue"><font color="green">已签约</font></td>
                            </tr>
                            <tr>
                                <td class="fieldName">交房情况</td>
                                <td class="fieldValue"><font color="green">已交房</font></td>
                            </tr>
                            <tr>
                                <td class="fieldName">签约顺序号</td>
                                <td class="fieldValue"><font color="green">0001</font></td>
                            </tr>
                            <tr>
                                <td class="fieldName">选房情况</td>
                                <td class="fieldValue"><font color="green">已选房</font></td>
                            </tr>
                            <tr>
                                <td class="fieldName">财务结算</td>
                                <td class="fieldValue"><font color="green">已结算</font></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </ul>
</div>
<script type="text/javascript">

</script>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">
    $(".modal-dialog").attr("style", "width:95%;");
    function toExcel(inTblId, inWindow) {
        var fileName = '${CommenData.time_jc}' + ".xls";
        name.split(" ").join("");
        fileName = fileName.replace(" ", "-");
        fileName = fileName.split(":").join("-");
        fileName = fileName.split("-").join("");
        $("#yu-print-show").tableExport({type: 'excel', separator: ';', escape: 'false'}, fileName);
        e.preventDefault();
    }

    function doFileExport(inName, inStr) {
        var xlsWin = null;
        if (!!document.all("glbHideFrm")) {
            xlsWin = glbHideFrm;
        } else {
            var width = 1;
            var height = 1;
            var openPara = "left=" + (window.screen.width / 2 + width / 2) + ",top=" + (window.screen.height + height / 2) + ",scrollbars=no,width=" + width + ",height=" + height;
            xlsWin = window.open("", "_blank", openPara);
        }
        xlsWin.document.write(inStr);
        xlsWin.document.close();
        xlsWin.document.execCommand('Saveas', true, inName);
        xlsWin.close();
    }

    function yu_print1() {
        alert(1231);
        toExcel("yu-print-show", null);
    }

    function delBtnClick(btn) {
        if (yu_confirm("确认删除该数据？")) {
            var curDataId = $(btn).attr("pname");
            var p = $(btn).attr("data-url");
            var par = $(btn).parent().parent();
            //var par = $("#"+pname);
            $.ajax({
                cache: true,
                type: "POST",
                url: p,
                dataType: "json",
                data: {housebasicid: curDataId},
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    location.href = "${BASE_PATH}" + "/index.action";
                },
                success: function (response) {
                    location.href = "${BASE_PATH}" + "/index.action";
                }
            })
        }
    }


</script>
