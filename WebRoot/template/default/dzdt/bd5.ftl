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
            <h4 class="bold">第五标段电子地图数据查看</h4>
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
                <div class="mt10">已交房: <button type="button" class="btn btn-sm btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button></div>
            </div>
        </div>
        <!--        <svg version="1.1" id="svgElement" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">-->
        <svg viewBox="0 0 600 400" id="svgElement" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" stroke-linecap="round" stroke-linejoin="round" fill-rule="evenodd" xml:space="preserve" viewbox="50 200 500 300" style="left: -212.79px; top: 90.4px; position: relative; touch-action: none;">
        <g stroke-width="0.1" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" />
        <g stroke-width="0.9" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="255.264,132.025 342.938,160.997 " />
        <polyline points="342.938,160.997 524.656,223.309 " />
        <polyline points="524.656,223.309 545.956,354.614 " />
        <polyline points="545.956,354.614 441.128,386.177 " />
        <polyline points="441.128,386.177 446.748,409.507 " />
        <polyline points="446.748,409.507 427.826,414.67 " />
        <polyline points="427.826,414.67 444.341,467.989 " />
        <polyline points="444.341,467.989 388.21,415.525 " />
        <polyline points="388.21,415.525 321.37,450.399 " />
        <polyline points="321.37,450.399 254.145,169.984 " />
        <polyline points="254.145,169.984 255.264,132.025 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="458.774,261.941 475.27,259.86 478.65,282.567 462.455,286.616 458.774,261.941 " />
        <polyline points="475.297,259.871 474.788,255.806 464.221,257.128 464.074,244.335 431.121,244.335 435.205,268.509 452.779,268.227 455.944,280.831 456.728,288.022 461.087,287.532 458.774,261.941 " />
        <polyline points="425.856,202.817 441.803,202.978 441.287,242.83 425.137,242.531 425.856,202.817 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 426.58 215.49)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-013</text>
        <text transform="matrix(3.02692 0 -0 3.78365 428.226 220.336)" font-family="Arial,'sans-serif'" font-size="1.39636" >172&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 427.525 225.182)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#32654;&#29618;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 439.043 252.063)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-014</text>
        <text transform="matrix(3.02692 0 -0 3.78365 440.689 256.907)" font-family="Arial,'sans-serif'" font-size="1.39636" >154&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 439.545 261.743)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#32993;&#24198;&#21326;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 461.481 268.681)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-017</text>
        <text transform="matrix(3.02692 0 -0 3.78365 461.249 273.536)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21335;&#36335;5&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 464.54 278.362)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#28216;&#27891;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="362.683,230.53 363.802,247.354 387.986,246.394 387.187,229.57 362.683,230.53 " />
        <polyline points="363.802,247.354 364.441,262.576 388.465,261.296 387.986,246.394 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 368.355 235.507)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-015</text>
        <text transform="matrix(3.02692 0 -0 3.78365 370 240.351)" font-family="Arial,'sans-serif'" font-size="1.39636" >188&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 368.857 245.187)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23391;&#31077;&#28023;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 369.199 251.116)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-016</text>
        <text transform="matrix(3.02692 0 -0 3.78365 370.844 255.961)" font-family="Arial,'sans-serif'" font-size="1.39636" >190&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 369.701 260.797)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23391;&#31077;&#39034;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="484.077,288.22 489.36,308.728 504.575,304.724 498.972,284.375 484.075,288.213 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 485.697 292.254)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-016</text>
        <text transform="matrix(3.02692 0 -0 3.78365 487.342 297.099)" font-family="Arial,'sans-serif'" font-size="1.39636" >140&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 488.756 301.924)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37101;&#36827;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="375.498,208.58 374.534,230.05 393.113,229.411 393.113,208.581 375.498,208.581 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 376.527 215.404)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-018</text>
        <text transform="matrix(3.02692 0 -0 3.78365 378.172 220.249)" font-family="Arial,'sans-serif'" font-size="1.39636" >180&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 377.029 225.085)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26417;&#24503;&#20840;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="405.278,297.827 410.703,320.392 424.247,316.327 418.892,294.304 405.278,297.829 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 406.654 302.197)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-016</text>
        <text transform="matrix(3.02692 0 -0 3.78365 408.3 307.043)" font-family="Arial,'sans-serif'" font-size="1.39636" >212&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 407.957 312.04)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#26690;&#33521;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="338.818,247.192 355.154,243.828 358.676,261.133 342.121,264.88 338.818,247.192 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 341.658 250.383)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-023</text>
        <text transform="matrix(3.02692 0 -0 3.78365 343.304 255.229)" font-family="Arial,'sans-serif'" font-size="1.39636" >246&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 342.16 260.065)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23391;&#31077;&#21644;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="405.278,297.829 391.664,301.193 398.228,326.829 409.6,323.946 409.886,324.996 412.258,324.44 411.159,320.255 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 393.918 308.481)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-014</text>
        <text transform="matrix(3.02692 0 -0 3.78365 395.563 313.327)" font-family="Arial,'sans-serif'" font-size="1.39636" >218&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 397.406 320.407)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24314;&#21195;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="391.664,301.193 370.924,306.601 377.06,331.725 398.228,326.829 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 377.102 308.961)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-004</text>
        <text transform="matrix(3.02692 0 -0 3.78365 378.748 313.807)" font-family="Arial,'sans-serif'" font-size="1.39636" >198&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 377.715 319.061)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33891;&#37329;&#23665;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 374.171 325.267)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#65288;&#23435;&#26149;&#20848;&#65289;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="367.48,306.479 350.983,310.163 355.625,331.474 372.603,327.629 367.48,306.479 " />
        <polyline points="350.983,310.163 333.846,314.008 338.358,335.101 355.625,331.474 " />
        <polyline points="313.505,318.494 330.963,314.969 335.285,335.8 317.827,339.484 313.505,318.494 " />
        <polyline points="313.505,318.494 297.008,322.018 301.13,342.998 317.827,339.484 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 354.217 314.843)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-001</text>
        <text transform="matrix(3.02692 0 -0 3.78365 355.718 319.063)" font-family="Arial,'sans-serif'" font-size="1.39636" >274&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 355.519 324.145)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33539;&#26690;&#20848;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 337.808 317.05)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-003</text>
        <text transform="matrix(3.02692 0 -0 3.78365 339.454 321.896)" font-family="Arial,'sans-serif'" font-size="1.39636" >272&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 339.11 326.873)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#24314;&#26149;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 317.448 322.273)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-002</text>
        <text transform="matrix(3.02692 0 -0 3.78365 319.094 326.011)" font-family="Arial,'sans-serif'" font-size="1.39636" >294&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 318.75 330.923)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#28113;&#20113;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 299.918 325.984)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-009</text>
        <text transform="matrix(3.02692 0 -0 3.78365 298.273 330.85)" font-family="Arial,'sans-serif'" font-size="1.39636" >270&#21495;&#20869;1</text>
        <text transform="matrix(3.02692 0 -0 3.78365 301.22 335.847)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#21512;&#20316;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 353.405 328.963)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#65288;&#29579;&#25391;&#65289;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 333.842 331.452)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#65288;&#21016;&#28113;&#33521;&#65289;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 316.636 335.877)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#65288;&#21016;&#24433;&#65289;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="377.06,331.725 382.21,351.504 403.511,346.057 398.228,326.829 " />
        <polyline points="409.886,324.996 414.496,342.013 414.796,343.199 416.164,342.853 416.757,344.834 428.227,341.945 428.029,337.127 424.163,321.575 412.258,324.44 " />
        <polyline points="416.757,344.834 423.056,365.462 434.783,361.728 430.738,347.34 428.227,341.945 " />
        <polyline points="382.21,351.504 388.452,375.456 409.7,369.599 403.511,346.057 " />
        <polyline points="409.7,369.599 423.056,365.462 " />
        <polyline points="398.383,375.699 424.452,368.024 429.991,389.068 424.168,390.6 418.938,392.239 403.761,396.356 398.383,375.699 " />
        <polyline points="398.383,375.699 381.726,380.505 378.459,384.888 380.923,401.495 385.491,416.943 388.21,415.525 394.98,421.311 388.998,400.419 403.761,396.356 " />
        <polyline points="416.846,393.314 423.062,415.644 396.661,423.425 394.98,421.311 " />
        <polyline points="423.062,415.644 427.826,414.67 444.341,467.989 396.661,423.425 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 382.964 335.992)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-005</text>
        <text transform="matrix(3.02692 0 -0 3.78365 384.61 340.838)" font-family="Arial,'sans-serif'" font-size="1.39636" >200&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 384.266 345.866)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33891;&#37329;&#28023;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 412.926 326.997)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-008</text>
        <text transform="matrix(3.02692 0 -0 3.78365 414.571 330.873)" font-family="Arial,'sans-serif'" font-size="1.39636" >214&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 416.342 335.88)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23500;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 419.141 351.194)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-007</text>
        <text transform="matrix(3.02692 0 -0 3.78365 420.787 356.04)" font-family="Arial,'sans-serif'" font-size="1.39636" >216&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 420.443 361.047)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24314;&#38534;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 403.561 347.916)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-012</text>
        <text transform="matrix(3.02692 0 -0 3.78365 406.108 352.762)" font-family="Arial,'sans-serif'" font-size="1.39636" >220&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 407.109 357.759)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21476;&#24503;&#36149;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 388.357 357.036)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-013</text>
        <text transform="matrix(3.02692 0 -0 3.78365 386.713 361.903)" font-family="Arial,'sans-serif'" font-size="1.39636" >202&#21495;&#20869;1</text>
        <text transform="matrix(3.02692 0 -0 3.78365 389.659 366.91)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33891;&#37329;&#31119;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 380.695 386.99)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-006</text>
        <text transform="matrix(3.02692 0 -0 3.78365 382.341 391.836)" font-family="Arial,'sans-serif'" font-size="1.39636" >276&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 381.997 396.843)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#30333;&#28113;&#28165;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 401.853 380.429)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-017</text>
        <text transform="matrix(3.02692 0 -0 3.78365 403.499 385.275)" font-family="Arial,'sans-serif'" font-size="1.39636" >278&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 397.947 404.077)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-011</text>
        <text transform="matrix(3.02692 0 -0 3.78365 399.592 408.923)" font-family="Arial,'sans-serif'" font-size="1.39636" >280&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 399.249 413.951)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23453;&#38470;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 414.068 427.528)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-010</text>
        <text transform="matrix(3.02692 0 -0 3.78365 415.714 432.374)" font-family="Arial,'sans-serif'" font-size="1.39636" >282&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 415.37 437.381)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23500;&#24378;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 409.999 340.693)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#65288;&#26446;&#20964;&#33521;&#65289;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="329.303,289.147 346.22,285.783 350.183,304.876 333.366,308.56 329.303,289.147 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 332.723 294.871)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-024</text>
        <text transform="matrix(3.02692 0 -0 3.78365 334.368 299.715)" font-family="Arial,'sans-serif'" font-size="1.39636" >264&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 334.025 304.712)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#26690;&#33521;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="487.962,287.189 483.911,274.021 510.184,266.111 512.426,273.321 519.514,271.525 521.554,278.128 498.972,284.375 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 493.884 273.83)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-021</text>
        <text transform="matrix(3.02692 0 -0 3.78365 494.821 277.446)" font-family="Arial,'sans-serif'" font-size="1.39636" >138&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 493.635 282.199)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23500;&#22530;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="499.433,327.709 504.092,343.978 518.987,339.652 514.683,323.623 499.433,327.709 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 501.91 330.032)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-020</text>
        <text transform="matrix(3.02692 0 -0 3.78365 503.555 334.877)" font-family="Arial,'sans-serif'" font-size="1.39636" >144&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 502.854 339.722)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23500;&#39034;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 465.757 296.019)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-018</text>
        <text transform="matrix(3.02692 0 -0 3.78365 467.402 300.864)" font-family="Arial,'sans-serif'" font-size="1.39636" >162&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 468.816 305.699)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#20853;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="424.452,368.024 442.404,362.888 448.513,384.192 429.991,389.068 " />
        <polyline points="446.273,360.959 452.196,383.231 466.605,379.429 460.687,357.275 446.273,360.959 " />
        <polyline points="460.687,357.275 473.5,353.59 479.186,375.362 466.605,379.429 " />
        <polyline points="472.221,329.556 482.662,368.029 508.35,360.582 506.143,353.1 504.394,353.578 499.085,333.661 496.565,330.359 494.804,323.629 472.221,329.556 " />
        <polyline points="504.092,343.978 508.747,360.46 524.047,356.623 518.987,339.652 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 506.39 347.139)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-006</text>
        <text transform="matrix(3.02692 0 -0 3.78365 508.036 351.984)" font-family="Arial,'sans-serif'" font-size="1.39636" >146&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 507.335 356.84)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#31168;&#29645;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 481.226 341.445)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-010</text>
        <text transform="matrix(3.02692 0 -0 3.78365 482.872 346.29)" font-family="Arial,'sans-serif'" font-size="1.39636" >148&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 478.502 350.817)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#31177;&#25104;(&#24050;&#25925;) </text>
        <text transform="matrix(3.02692 0 -0 3.78365 482.731 357.162)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24535;&#22269;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 463.158 362.462)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-012</text>
        <text transform="matrix(3.02692 0 -0 3.78365 464.803 367.307)" font-family="Arial,'sans-serif'" font-size="1.39636" >288&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 464.102 372.174)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#38271;&#36830;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 448.973 366.743)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-009</text>
        <text transform="matrix(3.02692 0 -0 3.78365 450.618 371.588)" font-family="Arial,'sans-serif'" font-size="1.39636" >286&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 449.917 376.444)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23453;&#39034;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 428.438 371.573)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-008</text>
        <text transform="matrix(3.02692 0 -0 3.78365 430.084 376.418)" font-family="Arial,'sans-serif'" font-size="1.39636" >264&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 429.383 381.253)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#27665;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 439.817 346.272)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-011</text>
        <text transform="matrix(3.02692 0 -0 3.78365 441.463 351.116)" font-family="Arial,'sans-serif'" font-size="1.39636" >206&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 440.762 355.931)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24576;&#33464;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 456.916 342.088)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-015</text>
        <text transform="matrix(3.02692 0 -0 3.78365 458.562 346.933)" font-family="Arial,'sans-serif'" font-size="1.39636" >168&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 457.861 351.768)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24576;&#26519;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 523.2 335.923)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-005</text>
        <text transform="matrix(3.02692 0 -0 3.78365 524.846 340.768)" font-family="Arial,'sans-serif'" font-size="1.39636" >136&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 524.145 345.624)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21608;&#24191;&#23398;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="519.788,330.52 535.644,325.714 542.689,350.228 526.513,354.874 519.788,330.52 " />
        <polyline points="519.788,330.52 512.103,303.442 527.318,298.957 530.521,308.73 535.644,325.714 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 515.642 308.688)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-003</text>
        <text transform="matrix(3.02692 0 -0 3.78365 517.288 313.534)" font-family="Arial,'sans-serif'" font-size="1.39636" >134&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 518.422 323.043)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#24314;&#22269;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 497.869 313.075)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-007</text>
        <text transform="matrix(3.02692 0 -0 3.78365 499.515 317.92)" font-family="Arial,'sans-serif'" font-size="1.39636" >142&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 497.638 322.745)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20110;&#24576;&#25935;?</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="493.826,323.886 489.896,309.514 512.103,303.442 517.608,322.84 499.433,327.709 498.708,324.893 495.395,325.887 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 505 288.241)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-002</text>
        <text transform="matrix(3.02692 0 -0 3.78365 506.646 293.086)" font-family="Arial,'sans-serif'" font-size="1.39636" >132&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 505.945 297.932)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23500;&#22686;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="521.554,278.128 527.318,298.957 " />
        <polyline points="504.575,304.724 504.773,305.446 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 503.08 260.252)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-001</text>
        <text transform="matrix(3.02692 0 -0 3.78365 504.281 263.275)" font-family="Arial,'sans-serif'" font-size="1.39636" >130&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 496.394 267.101)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20167;&#26690;&#33521;(&#24050;&#25925;)</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="487.299,273.001 484.337,262.634 515.253,254.703 519.514,271.525 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 489.298 244.108)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-004</text>
        <text transform="matrix(3.02692 0 -0 3.78365 490.235 247.724)" font-family="Arial,'sans-serif'" font-size="1.39636" >128&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 482.35 251.925)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#24076;&#20803;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 489.049 257.362)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#29645;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="487.351,261.78 482.563,242.01 505.406,236.117 510.358,255.942 " />
        <polyline points="262.914,155.532 287.258,152.009 " />
        <polyline points="287.258,152.009 289.464,169.478 " />
        <polyline points="289.464,169.478 264.53,172.184 " />
        <polyline points="264.53,172.184 262.914,155.532 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 269.575 159.676)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-001</text>
        <text transform="matrix(3.02692 0 -0 3.78365 271.145 164.521)" font-family="Arial,'sans-serif'" font-size="1.39636" >236&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 269.873 169.377)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#25991;&#36745;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="264.53,172.184 266.753,194.309 " />
        <polyline points="266.753,194.309 292.218,191.587 " />
        <polyline points="292.218,191.587 289.464,169.478 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 270.94 178.025)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-018</text>
        <text transform="matrix(3.02692 0 -0 3.78365 272.51 182.87)" font-family="Arial,'sans-serif'" font-size="1.39636" >238&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 271.237 187.705)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24464;&#28113;&#33635;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="267.547,195.73 292.484,193.223 " />
        <polyline points="292.484,193.223 293.959,213.902 " />
        <polyline points="293.959,213.902 269.709,216.125 " />
        <polyline points="269.709,216.125 267.547,195.73 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 273.021 200.805)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-022</text>
        <text transform="matrix(3.02692 0 -0 3.78365 274.591 205.649)" font-family="Arial,'sans-serif'" font-size="1.39636" >240&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 275.432 210.475)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#25165;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="293.959,213.902 297.531,231.431 " />
        <polyline points="297.531,231.431 272.727,235.234 " />
        <polyline points="293.959,213.902 270.076,216.937 " />
        <polyline points="270.076,216.937 272.727,235.234 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 275.74 220.732)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-021</text>
        <text transform="matrix(3.02692 0 -0 3.78365 277.31 225.577)" font-family="Arial,'sans-serif'" font-size="1.39636" >242&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 276.037 230.433)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#24535;&#21018;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="275.558,238.572 287.25,235.529 " />
        <polyline points="287.25,235.529 291.755,255.932 " />
        <polyline points="291.755,255.932 279.804,258.413 " />
        <polyline points="279.804,258.413 275.558,238.572 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 275.362 244.269)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-013</text>
        <text transform="matrix(3.02692 0 -0 3.78365 278.369 249.115)" font-family="Arial,'sans-serif'" font-size="1.39636" >244&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 277.663 253.971)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#31168;&#20848;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="287.355,235.37 298.007,232.711 " />
        <polyline points="298.007,232.711 302.347,252.692 " />
        <polyline points="302.347,252.692 292.168,255.201 " />
        <polyline points="292.168,255.201 287.355,235.37 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 286.565 240.718)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-012</text>
        <text transform="matrix(3.02692 0 -0 3.78365 289.572 245.562)" font-family="Arial,'sans-serif'" font-size="1.39636" >234&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 288.865 250.398)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#32993;&#24198;&#22269;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="278.775,259.512 298.15,255.731 " />
        <polyline points="298.15,255.731 301.979,273.467 " />
        <polyline points="301.979,273.467 284.531,277.172 " />
        <polyline points="284.531,277.172 278.775,259.512 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 282.485 262.894)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-019</text>
        <text transform="matrix(3.02692 0 -0 3.78365 285.492 267.739)" font-family="Arial,'sans-serif'" font-size="1.39636" >252&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 276.329 272.574)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#36763;&#27665;&#65288;&#24050;&#25925;&#65289;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="298.15,255.731 315.195,252.294 " />
        <polyline points="315.195,252.294 319.917,269.783 " />
        <polyline points="319.917,269.783 301.979,273.467 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 300.612 259.287)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-017</text>
        <text transform="matrix(3.02692 0 -0 3.78365 303.619 264.132)" font-family="Arial,'sans-serif'" font-size="1.39636" >250&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 305.027 268.978)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#21521;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="285.802,276.831 290.445,297.181 " />
        <polyline points="290.445,297.181 306.941,293.657 " />
        <polyline points="306.941,293.657 302.94,273.307 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 287.781 281.504)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-010</text>
        <text transform="matrix(3.02692 0 -0 3.78365 290.788 286.349)" font-family="Arial,'sans-serif'" font-size="1.39636" >254&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 292.196 291.195)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#30922;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="306.941,293.657 324.079,289.973 " />
        <polyline points="324.079,289.973 319.917,269.783 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 305.142 278.13)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-014</text>
        <text transform="matrix(3.02692 0 -0 3.78365 308.149 282.975)" font-family="Arial,'sans-serif'" font-size="1.39636" >256&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 307.442 287.821)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#32654;&#29577;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="290.445,297.181 295.222,317.179 " />
        <polyline points="295.222,317.179 312.224,313.206 " />
        <polyline points="312.224,313.206 308.383,293.337 " />
        <polyline points="324.079,289.973 325.04,289.813 " />
        <polyline points="325.04,289.813 329.041,309.521 " />
        <polyline points="329.041,309.521 312.224,313.206 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 293.45 301.215)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-011</text>
        <text transform="matrix(3.02692 0 -0 3.78365 296.457 306.059)" font-family="Arial,'sans-serif'" font-size="1.39636" >268&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 295.75 310.895)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#23665;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 309.704 296.978)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-009</text>
        <text transform="matrix(3.02692 0 -0 3.78365 312.711 301.823)" font-family="Arial,'sans-serif'" font-size="1.39636" >266&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 312.005 306.658)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#33643;&#27743;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="346.22,285.783 363.114,282.423 " />
        <polyline points="363.114,282.423 367,301.352 " />
        <polyline points="367,301.352 350.183,304.876 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 349.078 288.848)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-008</text>
        <text transform="matrix(3.02692 0 -0 3.78365 350.724 293.693)" font-family="Arial,'sans-serif'" font-size="1.39636" >262&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 350.38 298.71)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#39321;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="324.882,268.662 342.121,264.88 " />
        <polyline points="342.121,264.88 346.22,285.783 " />
        <polyline points="329.303,289.147 324.882,268.662 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 327.513 273.279)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-015</text>
        <text transform="matrix(3.02692 0 -0 3.78365 330.519 278.124)" font-family="Arial,'sans-serif'" font-size="1.39636" >258&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 329.813 282.98)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33891;&#20426;&#21551;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="358.676,261.133 363.114,282.423 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 343.911 270.29)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-020</text>
        <text transform="matrix(3.02692 0 -0 3.78365 346.918 275.135)" font-family="Arial,'sans-serif'" font-size="1.39636" >260&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 346.212 279.971)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26417;&#28113;&#33635;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="324.882,268.662 322.001,250.556 " />
        <polyline points="322.001,250.556 338.818,247.192 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 325.454 253.611)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-016</text>
        <text transform="matrix(3.02692 0 -0 3.78365 327.1 258.456)" font-family="Arial,'sans-serif'" font-size="1.39636" >248&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 325.956 263.312)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#25991;&#25919;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="298.519,228.62 322.801,224.862 " />
        <polyline points="322.801,224.862 326.523,246.9 " />
        <polyline points="326.523,246.9 301.683,249.284 " />
        <polyline points="301.683,249.284 298.519,228.62 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 304.397 234.975)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-004</text>
        <text transform="matrix(3.02692 0 -0 3.78365 307.404 239.82)" font-family="Arial,'sans-serif'" font-size="1.39636" >232&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 306.698 244.666)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24314;&#22269;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="323.308,219.784 355.473,217.432 " />
        <polyline points="355.473,217.432 357.999,242.074 " />
        <polyline points="357.999,242.074 326.381,245.983 " />
        <polyline points="326.381,245.983 323.308,219.784 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 332.197 227.585)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-005</text>
        <text transform="matrix(3.02692 0 -0 3.78365 335.204 232.43)" font-family="Arial,'sans-serif'" font-size="1.39636" >226&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 334.497 237.266)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24314;&#21326;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="317.984,197.046 352.634,193.636 " />
        <polyline points="352.634,193.636 355.473,217.432 " />
        <polyline points="323.308,219.784 317.984,197.046 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 329.791 203.434)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-006</text>
        <text transform="matrix(3.02692 0 -0 3.78365 332.798 208.279)" font-family="Arial,'sans-serif'" font-size="1.39636" >224&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 332.091 213.114)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#22269;&#21326;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="299.34,208.419 317.698,204.836 " />
        <polyline points="317.698,204.836 321.423,224.384 " />
        <polyline points="321.423,224.384 302.607,227.425 " />
        <polyline points="302.607,227.425 299.34,208.419 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 302.672 213.625)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-003</text>
        <text transform="matrix(3.02692 0 -0 3.78365 305.678 218.471)" font-family="Arial,'sans-serif'" font-size="1.39636" >230&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 304.972 223.306)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24314;&#26032;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="299.353,208.263 292.704,172.877 " />
        <polyline points="292.704,172.877 312.573,170.734 " />
        <polyline points="312.573,170.734 317.698,204.836 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 297.567 186.763)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-002</text>
        <text transform="matrix(3.02692 0 -0 3.78365 300.574 191.608)" font-family="Arial,'sans-serif'" font-size="1.39636" >228&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 299.867 196.454)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24314;&#27665;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="317.984,197.046 316.725,166.113 " />
        <polyline points="316.725,166.113 345.552,170.923 " />
        <polyline points="345.552,170.923 351.353,176.366 " />
        <polyline points="351.353,176.366 352.634,193.636 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 325.115 180.11)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-1-007</text>
        <text transform="matrix(3.02692 0 -0 3.78365 328.122 184.955)" font-family="Arial,'sans-serif'" font-size="1.39636" >222&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 327.415 189.79)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#25391;&#21326;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="365.562,268.825 417.444,263.117 " />
        <polyline points="417.444,263.117 420.776,288.379 " />
        <polyline points="420.776,288.379 403.153,290.698 " />
        <polyline points="403.153,290.698 404.707,297.967 " />
        <polyline points="404.707,297.967 369.418,304.339 " />
        <polyline points="369.418,304.339 365.562,268.825 " />
        <polyline points="382.378,266.903 387.205,301.14 " />
        <polyline points="403.153,290.698 399.865,265.051 " />
        <polyline points="367.508,286.75 384.909,284.852 " />
        <polyline points="390.396,266.093 389.107,246.074 " />
        <polyline points="389.107,246.074 414.732,244.153 " />
        <polyline points="414.732,244.153 415.73,263.306 " />
        <polyline points="389.107,246.074 387.973,246.131 " />
        <polyline points="393.113,229.411 410.89,228.931 " />
        <polyline points="410.89,228.931 411.227,244.416 " />
        <polyline points="431.121,244.335 414.82,245.836 " />
        <polyline points="415.693,245.756 417.444,263.117 " />
        <polyline points="424.6,295.874 417.444,263.117 " />
        <polyline points="424.6,295.874 439.654,292.377 " />
        <polyline points="439.654,292.377 435.205,268.509 " />
        <polyline points="397.652,197.193 397.441,229.294 " />
        <polyline points="397.652,197.193 422.095,197.193 " />
        <polyline points="422.095,197.193 423.275,245.058 " />
        <polyline points="442.285,207.159 448.831,207.135 " />
        <polyline points="448.831,207.135 448.84,209.868 " />
        <polyline points="448.84,209.868 474.154,209.87 " />
        <polyline points="474.154,209.87 474.354,226.134 " />
        <polyline points="474.354,226.134 442.342,225.523 " />
        <polyline points="442.342,225.523 442.285,207.159 " />
        <polyline points="393.115,208.581 393.757,188.392 " />
        <polyline points="393.757,188.392 373.738,187.261 " />
        <polyline points="357.563,183.262 373.738,183.263 " />
        <polyline points="373.738,183.263 373.736,206.977 " />
        <polyline points="373.736,206.977 359.322,207.296 " />
        <polyline points="359.322,207.296 357.4,205.694 " />
        <polyline points="357.4,205.694 357.563,183.262 " />
        <polyline points="375.498,208.581 373.736,206.977 " />
        <polyline points="359.572,208.332 372.842,207.879 " />
        <polyline points="372.842,207.879 373.592,229.87 " />
        <polyline points="373.592,229.87 360.321,230.321 " />
        <polyline points="360.321,230.321 359.572,208.332 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 419.497 260.694)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-001</text>
        <text transform="matrix(3.02692 0 -0 3.78365 421.143 265.538)" font-family="Arial,'sans-serif'" font-size="1.39636" >160&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 414.363 270.086)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24535;&#36132;(&#24050;&#25925;)</text>
        <text transform="matrix(3.02692 0 -0 3.78365 386.481 278.171)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-002</text>
        <text transform="matrix(3.02692 0 -0 3.78365 388.127 283.016)" font-family="Arial,'sans-serif'" font-size="1.39636" >208&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 386.984 287.862)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#31243;&#29233;&#22269;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 401.336 274.381)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-003</text>
        <text transform="matrix(3.02692 0 -0 3.78365 402.981 279.227)" font-family="Arial,'sans-serif'" font-size="1.39636" >208&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 401.838 284.073)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#31243;&#29233;&#38255;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 369.989 290.794)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-004</text>
        <text transform="matrix(3.02692 0 -0 3.78365 371.634 295.639)" font-family="Arial,'sans-serif'" font-size="1.39636" >196&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 370.491 300.464)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#31243;&#29233;&#20891;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 395.119 251.689)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-005</text>
        <text transform="matrix(3.02692 0 -0 3.78365 396.764 256.534)" font-family="Arial,'sans-serif'" font-size="1.39636" >192&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 395.621 261.38)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#31168;&#20848;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 367.927 275.07)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-006</text>
        <text transform="matrix(3.02692 0 -0 3.78365 369.573 279.915)" font-family="Arial,'sans-serif'" font-size="1.39636" >194&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 368.429 284.761)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#31243;&#29233;&#29577;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 359.704 215.257)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-007</text>
        <text transform="matrix(3.02692 0 -0 3.78365 361.349 220.102)" font-family="Arial,'sans-serif'" font-size="1.39636" >186&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 360.206 224.938)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#31243;&#23439;&#33521;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 358.453 191.614)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-008</text>
        <text transform="matrix(3.02692 0 -0 3.78365 360.098 196.458)" font-family="Arial,'sans-serif'" font-size="1.39636" >184&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 358.955 201.294)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#21344;&#21326;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 392.357 234.952)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-009</text>
        <text transform="matrix(3.02692 0 -0 3.78365 394.003 239.796)" font-family="Arial,'sans-serif'" font-size="1.39636" >182&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 392.859 244.632)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26417;&#24503;&#28023;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 402.489 210.624)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-010</text>
        <text transform="matrix(3.02692 0 -0 3.78365 404.135 215.469)" font-family="Arial,'sans-serif'" font-size="1.39636" >176&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 402.991 220.325)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#25991;&#23665;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 376.676 194.474)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-011</text>
        <text transform="matrix(3.02692 0 -0 3.78365 378.322 199.319)" font-family="Arial,'sans-serif'" font-size="1.39636" >178&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 377.179 204.165)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#24314;&#26757;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 451.617 214.997)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-012</text>
        <text transform="matrix(3.02692 0 -0 3.78365 453.263 219.842)" font-family="Arial,'sans-serif'" font-size="1.39636" >150&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 452.12 224.677)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33931;&#31435;&#26609;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="438.266,342.854 451.56,339.81 " />
        <polyline points="451.56,339.81 455.402,354.551 " />
        <polyline points="455.402,354.551 442.109,358.235 " />
        <polyline points="442.109,358.235 438.266,342.854 " />
        <polyline points="455.724,338.689 468.377,335.645 " />
        <polyline points="468.377,335.645 472.54,350.065 " />
        <polyline points="472.54,350.065 459.727,353.589 " />
        <polyline points="459.727,353.589 455.724,338.689 " />
        <polyline points="433.386,326.369 451.859,322.105 " />
        <polyline points="431.862,321.223 438.266,342.854 " />
        <polyline points="451.859,322.105 467.839,318.231 " />
        <polyline points="467.423,316.476 470.1,327.77 " />
        <polyline points="470.1,327.77 466.776,328.435 " />
        <polyline points="466.776,328.435 468.377,335.645 " />
        <polyline points="426.899,298.791 458.997,291.102 " />
        <polyline points="426.899,298.791 431.862,321.223 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 438.767 302.199)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-014</text>
        <text transform="matrix(3.02692 0 -0 3.78365 440.412 307.043)" font-family="Arial,'sans-serif'" font-size="1.39636" >164&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 431.612 312.04)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#38271;&#26149;&#12289;&#21016;&#38271;&#38738;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 455.004 325.011)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-013</text>
        <text transform="matrix(3.02692 0 -0 3.78365 456.65 328.352)" font-family="Arial,'sans-serif'" font-size="1.39636" >166&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 456.306 333.349)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20110;&#26690;&#33521;</text>
        <text transform="matrix(2.52243 0 -0 3.15304 433.542 332.696)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-017</text>
        <text transform="matrix(3.02692 0 -0 3.78365 435.218 336.648)" font-family="Arial,'sans-serif'" font-size="1.39636" >170&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 434.875 341.665)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#38271;&#29983;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="446.831,340.893 442.968,324.158 " />
        <polyline points="458.977,337.906 454.963,321.353 " />
        <polyline points="458.997,291.102 480.393,285.976 " />
        <polyline points="480.393,285.976 486.637,310.971 " />
        <polyline points="486.637,310.971 486.637,315.758 " />
        <polyline points="486.637,315.758 478.305,317.532 " />
        <polyline points="478.305,317.532 467.423,316.476 " />
        <polyline points="465.782,318.729 458.997,291.102 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.52243 0 -0 3.15304 444.163 328.783)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-4-019</text>
        <text transform="matrix(3.02692 0 -0 3.78365 445.979 332.871)" font-family="Arial,'sans-serif'" font-size="1.39636" >204&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 445.636 337.868)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24576;&#21033;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="455.402,354.551 459.727,353.589 " />
        <polyline points="441.496,226.709 474.152,226.98 " />
        <polyline points="474.152,226.98 474.287,243.44 " />
        <polyline points="474.287,243.44 441.29,242.83 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 450.24 230.997)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-019</text>
        <text transform="matrix(3.02692 0 -0 3.78365 451.886 235.841)" font-family="Arial,'sans-serif'" font-size="1.39636" >152&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 450.743 240.677)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33931;&#31435;&#25991;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 439.375 276.436)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-2-020</text>
        <text transform="matrix(3.02692 0 -0 3.78365 441.021 281.281)" font-family="Arial,'sans-serif'" font-size="1.39636" >158&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 439.878 286.137)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26131;&#23447;&#29790;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="436.423,271.489 452.779,268.227 " />
        <polyline points="436.423,271.489 440.193,291.902 " />
        <polyline points="440.193,291.902 456.723,287.974 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 403.006 390.168)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#28113;&#38686;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="422.287,389.3 417.139,370.177 " />
        <polyline points="422.287,389.3 418.443,390.263 " />
        <polyline points="418.443,390.263 418.938,392.239 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(3.02692 0 -0 3.78365 416.94 377.025)" font-family="Arial,'sans-serif'" font-size="1.39636" >5-3-018</text>
        <text transform="matrix(3.02692 0 -0 3.78365 418.586 381.871)" font-family="Arial,'sans-serif'" font-size="1.39636" >279&#21495;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 418.093 386.764)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#28113;&#38686;</text>
        <text transform="matrix(3.02692 0 -0 3.78365 514.003 317.504)" font-family="Arial,'sans-serif'" font-size="1.39636" >134&#21495;(&#20869;1)</text>
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
