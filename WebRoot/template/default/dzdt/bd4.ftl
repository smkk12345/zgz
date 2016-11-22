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
            <h4 class="bold">第四标段电子地图数据查看</h4>
        </div>

        <div style="position: absolute;right:10px;top: 50px;">
            <button class="btn moveCls" style="position: absolute;top:10px;left:40px;float: left;" title="上移" id="down"><i class="fa-big  fa-arrow-up"></i></button>
            <button class="btn moveCls" style="position: absolute;top:70px;left:40px;" title="下移" id="up"><i class="fa-big  fa-arrow-down"></i></button>
            <button class="btn moveCls" style="position: absolute;top:40px;left:0px;" title="左移" id="right"><i class="fa-big  fa-arrow-left"></i></button>
            <button class="btn moveCls" style="position: absolute;top:40px;left:80px;" title="left" id="left"><i class="fa-big  fa-arrow-right"></i></button>

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
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="240.025,132.088 303.46,172.9 364.647,166.879 618.99,342.166 640.486,359.193 525.423,391.229 212.205,468.013 159.587,279.401 167.598,275.274 227.854,279.785 248.908,211.373 243.506,201.737 239.383,131.998 " />
        <polyline points="244.129,173.877 266.044,172.231 272.095,176.322 285.027,175.503 285.642,170.437 285.642,166.186 239.749,138.183 241.871,174.092 244.129,173.877 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 249.333 157.854)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-001</text>
        <text transform="matrix(2.50199 0 -0 3.12749 250.248 166.857)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23500;&#21220;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 252.501 162.151)" font-family="Arial,'sans-serif'" font-size="1.39636" >73&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="292.648,381.965 312.429,379.169 316.19,406.997 297.411,409.805 292.648,381.965 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 298.739 392.902)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-011</text>
        <text transform="matrix(2.50199 0 -0 3.12749 299.654 400.654)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#24503;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 301.907 396.483)" font-family="Arial,'sans-serif'" font-size="1.39636" >96&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="292.648,381.965 291.045,368.425 310.416,365.875 312.429,379.169 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 295.965 370.707)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-012</text>
        <text transform="matrix(2.50199 0 -0 3.12749 297.921 379.138)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#23071;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 297.392 374.742)" font-family="Arial,'sans-serif'" font-size="1.39636" >98&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="311.618,360.768 330.237,358.181 336.289,399.246 317.227,401.121 311.618,360.768 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 317.624 374.33)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-013</text>
        <text transform="matrix(2.50199 0 -0 3.12749 318.538 384.217)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#20113;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 320.791 378.914)" font-family="Arial,'sans-serif'" font-size="1.39636" >60&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="308.891,338.764 311.618,360.768 " />
        <polyline points="308.891,338.764 327.425,336.945 330.237,358.181 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 312.856 343.171)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-014</text>
        <text transform="matrix(2.50199 0 -0 3.12749 313.77 353.026)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#28113;&#29748;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 316.023 347.779)" font-family="Arial,'sans-serif'" font-size="1.39636" >58&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="255.274,366.406 259.575,382.132 282.183,376.024 279.806,367.461 272.65,361.441 255.274,366.406 " />
        <polyline points="255.274,366.406 237.733,371.371 242.2,387.263 259.575,382.132 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 262.308 368.561)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-016</text>
        <text transform="matrix(2.50199 0 -0 3.12749 262.516 376.984)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23391;&#26149;&#33459;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 262.763 372.596)" font-family="Arial,'sans-serif'" font-size="1.39636" >108&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 243.076 373.665)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-015</text>
        <text transform="matrix(2.50199 0 -0 3.12749 245.032 382.847)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#24013;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 243.531 377.7)" font-family="Arial,'sans-serif'" font-size="1.39636" >106&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="203.147,380.971 220.523,376.171 224.658,392.063 207.613,396.863 203.147,380.971 " />
        <polyline points="260.899,384.781 265.585,400.899 282.373,396.423 287.49,391.517 289.144,385.037 287.134,377.393 260.899,384.781 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 268.596 386.175)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-018</text>
        <text transform="matrix(2.50199 0 -0 3.12749 268.805 394.597)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#29577;&#21326;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 269.051 390.21)" font-family="Arial,'sans-serif'" font-size="1.39636" >110&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 208.206 383.184)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-017</text>
        <text transform="matrix(2.50199 0 -0 3.12749 208.414 391.632)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36830;&#22763;&#29645;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 208.661 387.219)" font-family="Arial,'sans-serif'" font-size="1.39636" >102&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="509.283,351.524 509.12,370.888 513.756,388.178 528.921,386.136 526.827,370.889 526.828,351.522 509.283,351.524 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 512.518 366.803)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-021</text>
        <text transform="matrix(2.50199 0 -0 3.12749 514.474 375.234)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#38055;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 513.945 370.838)" font-family="Arial,'sans-serif'" font-size="1.39636" >16&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="176.098,320.72 195.03,318.874 " />
        <polyline points="195.03,318.874 196.59,334.878 " />
        <polyline points="177.938,336.91 176.098,320.72 " />
        <polyline points="196.59,334.878 203.742,357.786 " />
        <polyline points="203.742,357.786 186.259,361.688 " />
        <polyline points="186.259,361.688 181.917,339.965 " />
        <polyline points="181.917,339.965 177.938,336.91 " />
        <polyline points="234.822,318.096 260.578,315.932 " />
        <polyline points="260.578,315.932 262.316,333.006 " />
        <polyline points="269.838,332.408 236.134,335.085 " />
        <polyline points="236.134,335.085 234.822,318.096 " />
        <polyline points="236.134,335.085 236.875,344.409 " />
        <polyline points="236.875,344.409 240.971,363.316 " />
        <polyline points="240.971,363.316 269.751,358.672 " />
        <polyline points="269.751,358.672 269.838,332.408 " />
        <polyline points="271.31,300.927 300.786,299.863 " />
        <polyline points="300.786,299.863 301.612,320.39 " />
        <polyline points="301.612,320.39 269.569,321.402 " />
        <polyline points="269.569,321.402 271.31,300.927 " />
        <polyline points="322.804,302.833 341.81,303.097 " />
        <polyline points="341.81,303.097 348.813,306.263 " />
        <polyline points="348.813,306.263 352.031,330.78 " />
        <polyline points="352.031,330.78 327.154,333.701 " />
        <polyline points="327.154,333.701 322.804,302.833 " />
        <polyline points="522.693,290.445 535.494,302.351 " />
        <polyline points="535.494,302.351 534.313,314.004 " />
        <polyline points="534.313,314.004 501.51,309.622 " />
        <polyline points="501.676,309.644 503.994,288.788 " />
        <polyline points="503.994,288.788 505.221,275.429 " />
        <polyline points="505.221,275.429 487.979,262.563 " />
        <polyline points="487.979,262.563 484.587,308.67 " />
        <polyline points="484.587,308.67 501.376,310.719 " />
        <polyline points="501.376,310.719 501.51,309.622 " />
        <polyline points="487.979,262.563 458.418,240.549 " />
        <polyline points="458.418,240.549 455.839,305.834 " />
        <polyline points="455.839,305.834 484.587,308.67 " />
        <polyline points="456.606,286.425 479.338,288.124 " />
        <polyline points="479.338,288.124 477.965,308.017 " />
        <polyline points="428.03,251.651 457.905,253.521 " />
        <polyline points="428.379,249.605 419.482,301.818 " />
        <polyline points="419.482,301.818 455.897,304.354 " />
        <polyline points="401.504,245.401 428.379,249.605 " />
        <polyline points="401.504,245.401 397.573,269.923 " />
        <polyline points="397.323,269.886 424.237,273.913 " />
        <polyline points="373.103,241.105 367.521,276.316 " />
        <polyline points="373.103,241.105 399.037,244.171 " />
        <polyline points="399.037,244.171 396.852,265.683 " />
        <polyline points="396.852,265.683 398.227,265.843 " />
        <polyline points="390.118,278.311 388.022,297.107 " />
        <polyline points="388.022,297.107 393.262,298.018 " />
        <polyline points="393.262,298.018 397.323,269.886 " />
        <polyline points="338.478,248.652 364.498,251.036 " />
        <polyline points="364.498,251.036 362.676,269.907 " />
        <polyline points="362.676,269.907 336.862,267.587 " />
        <polyline points="336.862,267.587 338.478,248.652 " />
        <polyline points="338.478,248.652 340.339,227.032 " />
        <polyline points="339.718,226.979 360.031,228.689 " />
        <polyline points="360.031,228.689 358.533,250.489 " />
        <polyline points="301.953,195.973 326.462,192.97 " />
        <polyline points="324.598,173.156 328.848,218.324 " />
        <polyline points="328.848,218.324 305.223,220.456 " />
        <polyline points="305.223,220.456 301.953,195.973 " />
        <polyline points="298.618,180.162 323.653,177.386 " />
        <polyline points="323.653,177.386 325.509,192.523 " />
        <polyline points="325.509,192.523 304.342,194.932 " />
        <polyline points="298.618,180.162 299.548,188.371 " />
        <polyline points="299.548,188.371 303.524,187.92 " />
        <polyline points="303.524,187.92 304.342,194.932 " />
        <polyline points="284.244,201.533 299.469,197.397 " />
        <polyline points="299.469,197.397 301.953,195.973 " />
        <polyline points="284.244,201.533 290.181,222.89 " />
        <polyline points="290.038,222.373 305.073,219.359 " />
        <polyline points="284.244,201.533 268.545,206.111 " />
        <polyline points="268.545,206.111 274.645,224.376 " />
        <polyline points="274.645,224.376 290.181,222.89 " />
        <polyline points="268.545,206.111 251.249,210.842 " />
        <polyline points="251.249,210.842 254.276,224.099 " />
        <polyline points="254.276,224.099 250.024,225.454 " />
        <polyline points="250.024,225.454 253.795,237.286 " />
        <polyline points="253.795,237.286 270.613,233.931 " />
        <polyline points="270.613,233.931 270.943,235.311 " />
        <polyline points="270.943,235.311 277.112,233.836 " />
        <polyline points="277.112,233.836 274.645,224.376 " />
        <polyline points="244.129,173.877 247.508,203.185 " />
        <polyline points="247.508,203.185 268.456,201.891 " />
        <polyline points="268.456,201.891 266.044,172.231 " />
        <polyline points="245.834,188.664 267.216,186.642 " />
        <polyline points="168.735,282.637 190.744,282.308 " />
        <polyline points="190.744,282.308 190.411,299.358 " />
        <polyline points="190.411,299.358 168.734,299.191 " />
        <polyline points="168.734,299.191 168.735,282.637 " />
        <polyline points="190.411,299.358 190.575,317.733 " />
        <polyline points="190.575,317.733 172.703,320.072 " />
        <polyline points="172.703,320.072 172.705,299.222 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 183.575 335.306)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-005</text>
        <text transform="matrix(2.50199 0 -0 3.12749 183.783 343.738)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#19975;&#21451;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 185.002 339.341)" font-family="Arial,'sans-serif'" font-size="1.39636" >92&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 247.807 344.025)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-012</text>
        <text transform="matrix(2.50199 0 -0 3.12749 242.191 352.21)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#26126;(&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 249.234 348.06)" font-family="Arial,'sans-serif'" font-size="1.39636" >68&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 243.024 321.666)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-013</text>
        <text transform="matrix(2.50199 0 -0 3.12749 236.242 330.099)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#20142;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 244.451 325.702)" font-family="Arial,'sans-serif'" font-size="1.39636" >72&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 280.585 308.18)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-014</text>
        <text transform="matrix(2.50199 0 -0 3.12749 273.802 316.603)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#26124;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 282.011 312.215)" font-family="Arial,'sans-serif'" font-size="1.39636" >62&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 332.548 314.943)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-018</text>
        <text transform="matrix(2.50199 0 -0 3.12749 325.766 323.374)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#38271;&#28023;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 333.975 318.978)" font-family="Arial,'sans-serif'" font-size="1.39636" >52&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 250.675 177.618)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-001</text>
        <text transform="matrix(2.50199 0 -0 3.12749 250.884 186.05)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#25991;&#23425;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 252.102 181.654)" font-family="Arial,'sans-serif'" font-size="1.39636" >71&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 252.193 191.788)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-002</text>
        <text transform="matrix(2.50199 0 -0 3.12749 252.401 200.219)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#21512;&#36215;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 253.62 195.823)" font-family="Arial,'sans-serif'" font-size="1.39636" >59&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 258.534 222.04)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-004</text>
        <text transform="matrix(2.50199 0 -0 3.12749 251.752 230.489)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#23453;&#25104;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 259.961 226.075)" font-family="Arial,'sans-serif'" font-size="1.39636" >51&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 289.69 205.574)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-005</text>
        <text transform="matrix(2.50199 0 -0 3.12749 289.898 213.98)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#24314;&#22269;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 291.116 209.609)" font-family="Arial,'sans-serif'" font-size="1.39636" >63&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 310.324 203.155)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-003</text>
        <text transform="matrix(2.50199 0 -0 3.12749 303.542 211.596)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#37329;&#25104;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 310.779 207.191)" font-family="Arial,'sans-serif'" font-size="1.39636" >125&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 307.546 183.473)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-015</text>
        <text transform="matrix(2.50199 0 -0 3.12749 309.501 191.921)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#21191;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 308.972 187.508)" font-family="Arial,'sans-serif'" font-size="1.39636" >67&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 273.578 210.969)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-019</text>
        <text transform="matrix(2.50199 0 -0 3.12749 273.786 219.375)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#20964;&#33465;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 274.033 215.004)" font-family="Arial,'sans-serif'" font-size="1.39636" >234&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 344.492 234.439)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-007</text>
        <text transform="matrix(2.50199 0 -0 3.12749 344.7 242.879)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#38271;&#21451;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 345.918 238.474)" font-family="Arial,'sans-serif'" font-size="1.39636" >33&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 344.492 257.393)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-006</text>
        <text transform="matrix(2.50199 0 -0 3.12749 346.448 265.841)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23453;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 345.918 261.428)" font-family="Arial,'sans-serif'" font-size="1.39636" >35&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 379.254 255.483)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-008</text>
        <text transform="matrix(2.50199 0 -0 3.12749 381.21 263.897)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36335;&#24503;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 380.68 259.518)" font-family="Arial,'sans-serif'" font-size="1.39636" >23&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 406.617 257.093)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-020</text>
        <text transform="matrix(2.50199 0 -0 3.12749 406.825 265.533)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27575;&#31435;&#23485;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 408.044 261.128)" font-family="Arial,'sans-serif'" font-size="1.39636" >17&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 436.181 276.275)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-017</text>
        <text transform="matrix(2.50199 0 -0 3.12749 436.389 284.698)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#31206;&#23453;&#20891;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 437.607 280.31)" font-family="Arial,'sans-serif'" font-size="1.39636" >13&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 466.183 267.311)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-016</text>
        <text transform="matrix(2.50199 0 -0 3.12749 466.392 275.725)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#21521;&#20891;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 467.61 271.346)" font-family="Arial,'sans-serif'" font-size="1.39636" >11&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 461.946 294.369)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-011</text>
        <text transform="matrix(2.50199 0 -0 3.12749 462.154 302.792)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#27704;&#19996;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 464.344 298.404)" font-family="Arial,'sans-serif'" font-size="1.39636" >9&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 489.415 287.481)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-010</text>
        <text transform="matrix(2.50199 0 -0 3.12749 489.624 295.93)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23453;&#21033;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 491.814 291.516)" font-family="Arial,'sans-serif'" font-size="1.39636" >7&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 508.593 298.425)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-009</text>
        <text transform="matrix(2.50199 0 -0 3.12749 508.802 306.865)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#38271;&#21033;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 510.992 302.46)" font-family="Arial,'sans-serif'" font-size="1.39636" >5&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="197.356,362.596 214.898,357.961 " />
        <polyline points="214.898,357.961 219.199,373.522 " />
        <polyline points="219.199,373.522 201.658,378.984 " />
        <polyline points="201.658,378.984 197.356,362.596 " />
        <polyline points="214.898,357.961 231.942,353.327 " />
        <polyline points="231.942,353.327 236.318,369.09 " />
        <polyline points="236.318,369.09 219.199,373.522 " />
        <polyline points="220.523,376.171 237.733,371.371 " />
        <polyline points="224.658,392.063 242.2,387.263 " />
        <polyline points="260.899,384.781 243.358,389.746 " />
        <polyline points="243.358,389.746 247.659,406.135 " />
        <polyline points="247.659,406.135 265.585,400.899 " />
        <polyline points="247.659,406.135 229.787,410.935 " />
        <polyline points="229.787,410.935 225.372,394.698 " />
        <polyline points="225.372,394.698 243.358,389.746 " />
        <polyline points="225.372,394.698 208.275,399.346 " />
        <polyline points="208.275,399.346 213.073,415.569 " />
        <polyline points="213.073,415.569 229.787,410.935 " />
        <polyline points="282.907,399.184 266.359,403.818 " />
        <polyline points="266.359,403.818 270.495,419.379 " />
        <polyline points="270.495,419.379 289.352,414.667 " />
        <polyline points="289.352,414.667 282.907,399.184 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 270.577 407.181)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-010</text>
        <text transform="matrix(2.50199 0 -0 3.12749 266.832 415.255)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#24503;&#25104;(&#24050;&#25925;)</text>
        <text transform="matrix(2.50199 0 -0 3.12749 272.772 411.076)" font-family="Arial,'sans-serif'" font-size="1.39636" >124&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 248.081 391.793)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-007</text>
        <text transform="matrix(2.50199 0 -0 3.12749 248.995 400.113)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33891;&#31168;&#33805;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 250.276 395.687)" font-family="Arial,'sans-serif'" font-size="1.39636" >112&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 230.32 397.419)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-009</text>
        <text transform="matrix(2.50199 0 -0 3.12749 231.234 405.748)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#27704;&#32418;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 232.516 401.314)" font-family="Arial,'sans-serif'" font-size="1.39636" >114&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 212.494 401.957)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-008</text>
        <text transform="matrix(2.50199 0 -0 3.12749 213.409 410.268)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#21326;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 214.69 405.852)" font-family="Arial,'sans-serif'" font-size="1.39636" >116&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 224.655 378.813)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-006</text>
        <text transform="matrix(2.50199 0 -0 3.12749 225.57 387.133)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#20811;&#25935;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 226.851 382.708)" font-family="Arial,'sans-serif'" font-size="1.39636" >104&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 218.844 360.577)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-002</text>
        <text transform="matrix(2.50199 0 -0 3.12749 219.759 368.846)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#20122;&#20964;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 221.04 364.472)" font-family="Arial,'sans-serif'" font-size="1.39636" >100&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 201.827 364.851)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-003</text>
        <text transform="matrix(2.50199 0 -0 3.12749 204.489 373.155)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#25165;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 204.995 368.746)" font-family="Arial,'sans-serif'" font-size="1.39636" >94&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 175.368 306.79)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-001</text>
        <text transform="matrix(2.50199 0 -0 3.12749 176.283 315.093)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#26690;&#25165;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 178.536 310.685)" font-family="Arial,'sans-serif'" font-size="1.39636" >90&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 173.544 287.344)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-004</text>
        <text transform="matrix(2.50199 0 -0 3.12749 174.458 295.655)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#26690;&#24503;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 176.711 291.239)" font-family="Arial,'sans-serif'" font-size="1.39636" >78&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="197.691,315.251 228.967,313.763 " />
        <polyline points="228.967,313.763 230.052,333.359 " />
        <polyline points="230.052,333.359 199.674,335.943 " />
        <polyline points="199.674,335.943 197.691,315.251 " />
        <polyline points="201.81,337.15 234.922,333.629 " />
        <polyline points="234.922,333.629 236.774,351.561 " />
        <polyline points="236.774,351.561 204.448,355.951 " />
        <polyline points="204.448,355.951 201.81,337.15 " />
        <polyline points="301.612,320.39 301.597,337.786 " />
        <polyline points="301.597,337.786 269.818,338.451 " />
        <polyline points="269.569,321.402 269.838,332.408 " />
        <polyline points="322.804,302.833 306.081,304.333 " />
        <polyline points="306.081,304.333 307.924,325.714 " />
        <polyline points="307.924,325.714 325.777,323.929 " />
        <polyline points="307.924,325.714 309.032,337.754 " />
        <polyline points="309.032,337.754 326.614,336.096 " />
        <polyline points="326.614,336.096 327.154,333.701 " />
        <polyline points="261.903,237.287 245.956,237.782 " />
        <polyline points="245.956,237.782 245.819,252.542 " />
        <polyline points="245.819,252.542 240.633,252.465 " />
        <polyline points="240.633,252.465 240.408,262.88 " />
        <polyline points="240.408,262.88 246.133,263.184 " />
        <polyline points="246.133,263.184 245.472,276.233 " />
        <polyline points="245.472,276.233 261.039,276.948 " />
        <polyline points="261.039,276.948 261.903,237.287 " />
        <polyline points="261.903,237.287 277.113,236.827 " />
        <polyline points="277.113,236.827 276.722,276.374 " />
        <polyline points="276.722,276.374 276.263,281.487 " />
        <polyline points="276.263,281.487 260.941,279.707 " />
        <polyline points="260.941,279.707 261.039,276.948 " />
        <polyline points="276.263,281.487 288.182,282.404 " />
        <polyline points="288.182,282.404 292.846,247.884 " />
        <polyline points="292.846,247.884 296.487,247.719 " />
        <polyline points="296.487,247.719 295.447,232.942 " />
        <polyline points="295.447,232.942 296.943,232.764 " />
        <polyline points="296.943,232.764 296.042,225.2 " />
        <polyline points="296.042,225.2 277.955,227.356 " />
        <polyline points="277.955,227.356 278.45,234.971 " />
        <polyline points="278.45,234.971 278.285,236.792 " />
        <polyline points="278.285,236.792 277.113,236.827 " />
        <polyline points="297.238,249.392 319.302,247.555 " />
        <polyline points="319.302,247.555 316.677,222.725 " />
        <polyline points="316.677,222.725 296.04,225.185 " />
        <polyline points="297.238,249.392 295.717,236.781 " />
        <polyline points="318.166,222.229 338.851,219.748 " />
        <polyline points="338.851,219.748 339.804,227.698 " />
        <polyline points="318.166,222.229 319.158,230.175 " />
        <polyline points="319.158,230.175 321.854,247.355 " />
        <polyline points="321.854,247.355 338.168,246.133 " />
        <polyline points="338.168,246.133 339.804,227.698 " />
        <polyline points="314.681,251.697 338.211,251.781 " />
        <polyline points="314.681,251.697 315.581,286.312 " />
        <polyline points="315.581,286.312 335.354,286.578 " />
        <polyline points="335.354,286.578 336.862,267.587 " />
        <polyline points="362.676,269.907 360.554,291.856 " />
        <polyline points="360.554,291.856 335.219,288.653 " />
        <polyline points="335.219,288.653 335.354,286.578 " />
        <polyline points="269.519,178.688 289.02,177.52 " />
        <polyline points="289.02,177.52 290.904,196.228 " />
        <polyline points="290.904,196.228 270.601,198.013 " />
        <polyline points="270.601,198.013 269.444,178.692 " />
        <polyline points="365.658,219.585 383.771,221.472 " />
        <polyline points="383.771,221.472 381.678,239.953 " />
        <polyline points="381.678,239.953 363.841,237.933 " />
        <polyline points="363.841,237.933 365.658,219.585 " />
        <polyline points="384.642,221.678 402.652,223.591 " />
        <polyline points="402.652,223.591 400.563,243.249 " />
        <polyline points="400.563,243.249 382.583,241.054 " />
        <polyline points="384.642,221.678 382.583,241.054 " />
        <polyline points="393.262,298.018 419.482,301.818 " />
        <polyline points="401.504,245.401 408.31,202.944 " />
        <polyline points="408.31,202.944 458.418,240.549 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 423.072 231.6)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-009</text>
        <text transform="matrix(2.50199 0 -0 3.12749 423.281 240.006)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27575;&#31435;&#20891;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 424.499 235.635)" font-family="Arial,'sans-serif'" font-size="1.39636" >15&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 402.041 282.032)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-016</text>
        <text transform="matrix(2.50199 0 -0 3.12749 402.249 290.455)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27575;&#31435;&#25104;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 403.468 286.067)" font-family="Arial,'sans-serif'" font-size="1.39636" >19&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 387.357 229.691)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-012</text>
        <text transform="matrix(2.50199 0 -0 3.12749 387.566 238.131)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#21344;&#29983;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 388.784 233.726)" font-family="Arial,'sans-serif'" font-size="1.39636" >25&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 369.01 227.203)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-011</text>
        <text transform="matrix(2.50199 0 -0 3.12749 370.966 235.625)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#20853;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 370.437 231.238)" font-family="Arial,'sans-serif'" font-size="1.39636" >27&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 343.135 276.617)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-008</text>
        <text transform="matrix(2.50199 0 -0 3.12749 345.091 285.031)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#25165;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 344.562 280.652)" font-family="Arial,'sans-serif'" font-size="1.39636" >37&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 320.111 262.454)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-019</text>
        <text transform="matrix(2.50199 0 -0 3.12749 313.328 270.894)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#24503;&#25104;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 321.537 266.49)" font-family="Arial,'sans-serif'" font-size="1.39636" >41&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 313.328 275.791)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#24314;&#22269;&#12289;&#24222;&#24314;&#24426;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 324.379 230.41)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-003</text>
        <text transform="matrix(2.50199 0 -0 3.12749 326.395 238.839)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#29577;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 325.806 234.446)" font-family="Arial,'sans-serif'" font-size="1.39636" >83&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 301.11 227.508)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-007</text>
        <text transform="matrix(2.50199 0 -0 3.12749 301.319 235.923)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#31179;&#20113;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 302.537 231.544)" font-family="Arial,'sans-serif'" font-size="1.39636" >39&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 280.428 239.363)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-004</text>
        <text transform="matrix(2.50199 0 -0 3.12749 280.637 247.803)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#20840;&#25104;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 281.855 243.399)" font-family="Arial,'sans-serif'" font-size="1.39636" >49&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 263.56 253.065)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-005</text>
        <text transform="matrix(2.50199 0 -0 3.12749 263.769 261.505)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#38050;&#25104;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 264.987 257.1)" font-family="Arial,'sans-serif'" font-size="1.39636" >53&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 247.189 255.107)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-010</text>
        <text transform="matrix(2.50199 0 -0 3.12749 247.397 263.529)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#28113;&#21326;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 248.616 259.142)" font-family="Arial,'sans-serif'" font-size="1.39636" >55&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 274.849 183.846)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-002</text>
        <text transform="matrix(2.50199 0 -0 3.12749 275.057 192.286)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24314;&#20065;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 276.275 187.881)" font-family="Arial,'sans-serif'" font-size="1.39636" >69&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 310.365 312.335)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-018</text>
        <text transform="matrix(2.50199 0 -0 3.12749 310.683 321.26)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37101;&#28023;&#20848;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 311.792 316.37)" font-family="Arial,'sans-serif'" font-size="1.39636" >56&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 311.98 328.187)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-015</text>
        <text transform="matrix(2.50199 0 -0 3.12749 312.188 336.095)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#27874;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 313.406 331.905)" font-family="Arial,'sans-serif'" font-size="1.39636" >56&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 279.239 327.87)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-017</text>
        <text transform="matrix(2.50199 0 -0 3.12749 279.447 336.293)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#28023;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 280.665 331.905)" font-family="Arial,'sans-serif'" font-size="1.39636" >64&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 207.383 322.715)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-013</text>
        <text transform="matrix(2.50199 0 -0 3.12749 207.591 331.139)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#29577;&#33521;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 208.81 326.752)" font-family="Arial,'sans-serif'" font-size="1.39636" >74&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 213.196 341.856)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-014</text>
        <text transform="matrix(2.50199 0 -0 3.12749 213.404 350.279)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#26494;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 214.623 345.891)" font-family="Arial,'sans-serif'" font-size="1.39636" >76&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="390.118,278.311 367.521,276.316 " />
        <polyline points="367.521,276.316 365.914,294.593 " />
        <polyline points="365.914,294.593 388.022,297.107 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 372.49 282.816)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-1-021</text>
        <text transform="matrix(2.50199 0 -0 3.12749 372.698 291.256)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23447;&#20964;&#33635;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 373.917 286.852)" font-family="Arial,'sans-serif'" font-size="1.39636" >21&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="505.221,275.429 522.693,290.445 " />
        <polyline points="231.776,297.22 258.836,295.018 " />
        <polyline points="258.836,295.018 260.593,315.931 " />
        <polyline points="234.822,318.096 232.568,316.91 " />
        <polyline points="232.568,316.91 231.776,297.22 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 240.765 304.095)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-020</text>
        <text transform="matrix(2.50199 0 -0 3.12749 240.974 312.535)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23004;&#28113;&#26032;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 242.192 308.13)" font-family="Arial,'sans-serif'" font-size="1.39636" >70&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="360.852,346.051 386.501,343.569 " />
        <polyline points="360.852,346.051 361.104,348.377 " />
        <polyline points="361.104,348.377 355.396,348.915 " />
        <polyline points="355.396,348.915 358.176,376.183 " />
        <polyline points="358.176,376.183 391.358,373.244 " />
        <polyline points="386.501,343.569 391.358,373.244 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 366.85 354.448)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-021</text>
        <text transform="matrix(2.50199 0 -0 3.12749 363.439 364.343)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#24535;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 370.017 359.031)" font-family="Arial,'sans-serif'" font-size="1.39636" >48&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 368.285 370.159)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20911;&#28113;&#33465;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="469.738,324.704 446.412,323.915 " />
        <polyline points="446.412,323.915 445.138,349.369 " />
        <polyline points="445.138,349.369 469.099,350.232 " />
        <polyline points="469.099,350.232 469.738,324.704 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 450.072 332.915)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-001</text>
        <text transform="matrix(2.50199 0 -0 3.12749 451.905 342.785)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#38271;&#27827;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 453.24 337.499)" font-family="Arial,'sans-serif'" font-size="1.39636" >20&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="491.415,351.521 509.287,351.524 " />
        <polyline points="491.415,351.521 491.414,370.887 " />
        <polyline points="491.414,370.887 495.736,370.887 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 494.083 357.786)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-002</text>
        <text transform="matrix(2.50199 0 -0 3.12749 495.915 367.656)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#28113;&#29748;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 497.25 362.37)" font-family="Arial,'sans-serif'" font-size="1.39636" >14&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="513.756,388.178 497.698,393.32 " />
        <polyline points="497.698,393.32 495.913,383.322 " />
        <polyline points="495.913,383.322 495.736,374.537 " />
        <polyline points="495.736,374.537 495.736,370.887 " />
        <polyline points="452.031,351.187 469.075,351.188 " />
        <polyline points="469.075,351.188 469.074,370.389 " />
        <polyline points="469.074,370.389 451.864,370.223 " />
        <polyline points="451.864,370.223 452.031,351.187 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 454.367 357.205)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-003</text>
        <text transform="matrix(2.50199 0 -0 3.12749 456.2 367.092)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#27704;&#32418;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 457.535 361.789)" font-family="Arial,'sans-serif'" font-size="1.39636" >24&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="469.075,351.188 487.446,351.188 " />
        <polyline points="487.446,351.188 487.608,370.721 " />
        <polyline points="487.608,370.721 469.074,370.389 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 471.626 357.205)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-004</text>
        <text transform="matrix(2.50199 0 -0 3.12749 473.459 367.092)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#29577;&#20848;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 474.794 361.789)" font-family="Arial,'sans-serif'" font-size="1.39636" >22&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="469.24,373.534 487.442,373.701 " />
        <polyline points="487.442,373.701 487.59,393.729 " />
        <polyline points="469.24,373.534 469.073,393.563 " />
        <polyline points="469.073,393.563 487.59,393.729 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 471.626 380.377)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-005</text>
        <text transform="matrix(2.50199 0 -0 3.12749 473.459 390.23)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#24314;&#24544;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 474.794 384.961)" font-family="Arial,'sans-serif'" font-size="1.39636" >26&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="469.24,373.534 452.195,373.533 " />
        <polyline points="452.195,373.533 451.958,399.309 " />
        <polyline points="451.958,399.309 468.939,399.681 " />
        <polyline points="468.939,399.681 469.073,393.563 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 453.666 381.536)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-006</text>
        <text transform="matrix(2.50199 0 -0 3.12749 455.498 391.406)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#37329;&#31108;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 456.833 386.12)" font-family="Arial,'sans-serif'" font-size="1.39636" >28&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="421.837,401.593 394.709,405.164 " />
        <polyline points="394.709,405.164 391.96,383.462 " />
        <polyline points="391.96,383.462 418.774,380.371 " />
        <polyline points="418.774,380.371 421.837,401.593 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 399.621 389.004)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-007</text>
        <text transform="matrix(2.50199 0 -0 3.12749 401.454 398.849)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#24544;&#25991;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 402.789 393.588)" font-family="Arial,'sans-serif'" font-size="1.39636" >44&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="388.272,354.387 415.294,351.516 " />
        <polyline points="415.294,351.516 418.774,380.371 " />
        <polyline points="391.96,383.462 390.845,373.289 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 396.899 364.332)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-008</text>
        <text transform="matrix(2.50199 0 -0 3.12749 398.731 374.193)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25964;&#20848;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 400.066 368.916)" font-family="Arial,'sans-serif'" font-size="1.39636" >42&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="488.534,326.688 469.692,326.719 " />
        <polyline points="488.534,326.688 488.093,347.721 " />
        <polyline points="488.093,347.721 469.157,347.921 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 472.281 334.136)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-009</text>
        <text transform="matrix(2.50199 0 -0 3.12749 474.114 344.006)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#28113;&#20848;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 475.449 338.72)" font-family="Arial,'sans-serif'" font-size="1.39636" >18&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="434.491,320.233 414.508,318.617 " />
        <polyline points="414.508,318.617 413.345,337.662 " />
        <polyline points="413.345,337.662 414.932,337.759 " />
        <polyline points="414.932,337.759 419.136,349.52 " />
        <polyline points="419.136,349.52 432.86,349.433 " />
        <polyline points="432.86,349.433 434.491,320.233 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 417.371 328.647)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-010</text>
        <text transform="matrix(2.50199 0 -0 3.12749 419.204 338.5)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#24314;&#31119;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 420.539 333.231)" font-family="Arial,'sans-serif'" font-size="1.39636" >32&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="434.491,320.233 446.312,320.428 " />
        <polyline points="446.312,320.428 446.412,323.915 " />
        <polyline points="432.86,349.433 445.138,349.369 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 433.823 329.696)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-011</text>
        <text transform="matrix(2.50199 0 -0 3.12749 434.586 339.558)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#24314;&#28165;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 435.921 334.28)" font-family="Arial,'sans-serif'" font-size="1.39636" >30&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="421.582,370.32 450.707,370.375 " />
        <polyline points="448.415,370.37 448.312,378.822 " />
        <polyline points="448.312,378.822 445.245,378.663 " />
        <polyline points="445.245,378.663 445.245,393.985 " />
        <polyline points="445.245,393.985 440.084,393.94 " />
        <polyline points="424.795,393.804 423.265,370.323 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 427.936 377.881)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-013</text>
        <text transform="matrix(2.50199 0 -0 3.12749 429.768 387.734)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#24314;&#27665;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 431.104 382.465)" font-family="Arial,'sans-serif'" font-size="1.39636" >36&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="428.072,403.724 428.181,393.834 " />
        <polyline points="428.072,403.724 439.98,403.853 " />
        <polyline points="439.98,403.853 440.084,393.94 " />
        <polyline points="428.181,393.834 424.795,393.804 " />
        <polyline points="384.848,315.098 409.67,316.093 " />
        <polyline points="409.67,316.093 409.503,335.46 " />
        <polyline points="409.503,335.46 386.047,335.958 " />
        <polyline points="386.047,335.958 384.848,315.098 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 390.477 321.081)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-014</text>
        <text transform="matrix(2.50199 0 -0 3.12749 392.31 330.943)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26611;&#29577;&#33635;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 393.645 325.665)" font-family="Arial,'sans-serif'" font-size="1.39636" >38&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="386.047,335.958 386.501,343.569 " />
        <polyline points="409.503,335.46 409.409,344.929 " />
        <polyline points="409.409,344.929 413.66,344.564 " />
        <polyline points="413.66,344.564 414.196,350.805 " />
        <polyline points="414.196,350.805 387.906,352.15 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 392.447 339.44)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-013</text>
        <text transform="matrix(2.50199 0 -0 3.12749 394.279 349.301)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#26690;&#25165;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 390.567 344.041)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26449;&#22996;&#20250;&#22330;&#22320;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="359.111,376.1 362.375,406.595 " />
        <polyline points="362.375,406.595 391.124,404.213 " />
        <polyline points="391.124,404.213 388.59,373.489 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 369.762 385.12)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-015</text>
        <text transform="matrix(2.50199 0 -0 3.12749 371.594 394.99)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#32487;&#20803;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 372.929 389.704)" font-family="Arial,'sans-serif'" font-size="1.39636" >50&#21495;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 281.772 345.652)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-016</text>
        <text transform="matrix(2.50199 0 -0 3.12749 283.605 355.522)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#25104;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 284.94 350.236)" font-family="Arial,'sans-serif'" font-size="1.39636" >66&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="269.814,339.687 301.682,338.569 " />
        <polyline points="301.682,338.569 303.068,361.998 " />
        <polyline points="303.068,361.998 277.148,362.373 " />
        <polyline points="277.148,362.373 277.032,358.672 " />
        <polyline points="269.751,358.672 277.032,358.672 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 369.528 324.26)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-017</text>
        <text transform="matrix(2.50199 0 -0 3.12749 371.36 334.13)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#27700;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 372.696 328.844)" font-family="Arial,'sans-serif'" font-size="1.39636" >46&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="384.848,315.098 384.683,312.45 " />
        <polyline points="384.683,312.45 365.983,313.773 " />
        <polyline points="365.983,313.773 367.471,343.072 " />
        <polyline points="367.471,343.072 386.382,341.579 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 235.584 415.404)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-018</text>
        <text transform="matrix(2.50199 0 -0 3.12749 237.416 425.275)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#25913;&#26149;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 237.779 419.988)" font-family="Arial,'sans-serif'" font-size="1.39636" >120&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="231.441,413.749 248.486,408.949 " />
        <polyline points="248.486,408.949 252.953,424.675 " />
        <polyline points="252.953,424.675 235.743,429.641 " />
        <polyline points="235.743,429.641 231.441,413.749 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 252.451 410.704)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-019</text>
        <text transform="matrix(2.50199 0 -0 3.12749 254.283 420.574)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27575;&#31435;&#21326;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 254.646 415.287)" font-family="Arial,'sans-serif'" font-size="1.39636" >122&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="248.486,408.949 266.359,403.818 " />
        <polyline points="270.495,419.379 252.953,424.675 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 234.725 437.939)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-3-020</text>
        <text transform="matrix(2.50199 0 -0 3.12749 236.597 447.809)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#38745;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 235.366 442.523)" font-family="Arial,'sans-serif'" font-size="1.39636" >122&#21495;-1</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="221.025,442.621 223.162,449.606 " />
        <polyline points="221.025,442.621 260.871,431.482 " />
        <polyline points="260.871,431.482 262.973,439.002 " />
        <polyline points="262.973,439.002 223.162,449.606 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 356.852 193.072)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-022</text>
        <text transform="matrix(2.50199 0 -0 3.12749 351.817 202.981)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#25104;&#12289;&#21016;&#27704;&#21033;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 358.279 197.695)" font-family="Arial,'sans-serif'" font-size="1.39636" >29&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="349.966,214.991 371.018,217.775 " />
        <polyline points="371.018,217.775 373.991,189.15 " />
        <polyline points="373.991,189.15 374.954,189.233 " />
        <polyline points="374.954,189.233 375.427,183.72 " />
        <polyline points="375.427,183.72 377.416,184.746 " />
        <polyline points="377.416,184.746 377.217,179.566 " />
        <polyline points="349.965,214.991 355.225,168.886 " />
        <polyline points="354.737,173.167 377.217,179.566 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 334.755 189.297)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-023</text>
        <text transform="matrix(2.50199 0 -0 3.12749 334.964 197.721)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#27704;&#31119;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 336.182 193.333)" font-family="Arial,'sans-serif'" font-size="1.39636" >31&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="328.848,218.324 329.087,220.906 " />
        <polyline points="348.073,227.683 349.966,214.991 " />
        <polyline points="324.598,173.156 355.225,168.886 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 430.472 357.855)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-2-024</text>
        <text transform="matrix(2.50199 0 -0 3.12749 430.68 366.26)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#24314;&#21326;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 431.898 361.89)" font-family="Arial,'sans-serif'" font-size="1.39636" >34&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="420.753,350.92 450.706,350.334 " />
        <polyline points="420.753,350.92 420.97,361.945 " />
        <polyline points="420.97,361.945 421.582,361.945 " />
        <polyline points="421.582,361.945 421.582,370.32 " />
        <polyline points="450.707,350.36 450.707,370.375 " />
        <polyline points="295.997,239.1 318.21,237.221 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.50199 0 -0 3.12749 302.439 240.96)" font-family="Arial,'sans-serif'" font-size="1.39636" >4-4-006</text>
        <text transform="matrix(2.50199 0 -0 3.12749 302.648 247.784)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#20122;&#20891;</text>
        <text transform="matrix(2.50199 0 -0 3.12749 303.866 244.179)" font-family="Arial,'sans-serif'" font-size="1.39636" >43&#21495;</text>
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


    //0 未签约   1签协议的    2交房的  3 已拆除     
	var map = '${map}';
	var jsonObj = JSON.parse(map);
	//for( var key in jsonObj) {
	//	var title = jsonObj[key];
	//}	
	
	$('g').each(function (index,domEle){
		var text = $(domEle).find("text").first();
		var value = $(text).html();
		var nIndex = jsonObj[value];
		if(nIndex == '0'){
			$(text).parent().css("fill",'red');
		}else if(nIndex == '1'){
			$(text).parent().css("fill",'blue');
		}else if(nIndex == '2'){
			$(text).parent().css("fill",'0xff22aa');
		}
	});


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
