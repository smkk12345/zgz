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
        <svg xmlns="http://www.w3.org/2000/svg" class="" id="svgElement" style="left: -319.22px; top: 20.48px; position: relative; touch-action: none;" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round" viewBox="-50 140 720 432" xmlns:xml="http://www.w3.org/XML/1998/namespace" xml:space="preserve" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">

        <g stroke-width="0.1" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" />
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="205.124,315.594 251.953,254.885 " />
        <polyline points="251.953,254.885 256.958,254.17 " />
        <polyline points="256.958,254.17 268.397,237.743 " />
        <polyline points="268.397,237.743 274.474,237.029 " />
        <polyline points="274.474,237.029 285.556,224.173 " />
        <polyline points="285.556,224.173 299.14,205.603 " />
        <polyline points="299.14,205.603 335.245,195.96 " />
        <polyline points="335.245,195.96 338.854,149.052 " />
        <polyline points="338.854,149.052 376.77,157.821 " />
        <polyline points="376.77,157.821 423.277,178.939 " />
        <polyline points="423.277,178.939 432.014,180.91 " />
        <polyline points="432.014,180.91 451.744,131.916 " />
        <polyline points="451.744,131.916 520.619,174.545 " />
        <polyline points="520.619,174.545 595,234.44 " />
        <polyline points="595,234.44 514.743,342.336 " />
        <polyline points="514.743,342.336 535.028,355.396 " />
        <polyline points="535.028,355.396 501.219,403.132 " />
        <polyline points="501.219,403.132 484.54,425.198 " />
        <polyline points="484.54,425.198 488.146,431.053 " />
        <polyline points="488.146,431.053 469.213,467.981 " />
        <polyline points="469.213,467.981 365.981,414.841 " />
        <polyline points="365.981,414.841 249.225,340.985 " />
        <polyline points="249.225,340.985 226.685,335.13 " />
        <polyline points="226.685,335.13 205.949,315.766 " />
        <polyline points="451.744,131.916 520.556,174.172 595,234.44 514.743,342.336 535.028,355.396 484.54,425.198 488.146,431.053 469.153,467.95 365.981,414.841 249.225,340.985 226.685,335.13 205.124,315.594 251.953,254.885 256.958,254.17 268.397,237.743 274.474,237.029 285.556,224.173 299.14,205.603 335.245,195.96 338.854,149.052 376.77,157.821 423.637,178.939 432.014,180.91 451.744,131.916 520.619,174.545 595,234.44 514.743,342.336 535.028,355.396 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 304.649 353.954)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-001</text>
        <text transform="matrix(2.43188 0 -0 3.03985 304.771 363.324)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#39759;&#20445;&#22269;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 304.965 358.435)" font-family="Arial,'sans-serif'" font-size="1.39636" >195&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="322.433,351.387 335.266,358.457 " />
        <polyline points="335.266,358.457 319.733,381.442 " />
        <polyline points="319.733,381.442 308.335,374.272 " />
        <polyline points="308.335,374.272 322.433,351.387 " />
        <polyline points="315.878,334.746 328.195,343.202 " />
        <polyline points="328.195,343.202 322.433,351.387 " />
        <polyline points="315.878,334.746 295.099,365.448 " />
        <polyline points="295.099,365.448 308.335,374.272 " />
        <polyline points="323.449,349.944 335.541,357.759 " />
        <polyline points="335.541,357.759 353.017,328.679 " />
        <polyline points="353.017,328.679 341.619,321.509 " />
        <polyline points="341.619,321.509 328.195,343.202 " />
        <polyline points="330.102,340.12 317.264,331.984 " />
        <polyline points="317.264,331.984 332.093,310.761 " />
        <polyline points="348.425,293.932 335.116,312.714 " />
        <polyline points="332.093,310.761 335.116,312.714 " />
        <polyline points="335.116,312.714 343.641,318.383 " />
        <polyline points="343.641,318.383 341.619,321.509 " />
        <polyline points="348.425,293.932 355.41,300.551 " />
        <polyline points="355.41,300.551 344.255,318.027 " />
        <polyline points="459.651,325.737 471.049,333.459 " />
        <polyline points="471.049,333.459 453.986,359.169 " />
        <polyline points="456.193,355.843 443.036,347.528 " />
        <polyline points="443.036,347.528 459.651,325.737 " />
        <polyline points="502.013,315.021 520.947,326.972 " />
        <polyline points="520.947,326.972 512.678,341.498 " />
        <polyline points="512.678,341.498 506.645,338.129 " />
        <polyline points="506.645,338.129 499.812,349.037 " />
        <polyline points="499.812,349.037 473.912,329.876 " />
        <polyline points="486.392,339.109 502.013,315.021 " />
        <polyline points="505.694,339.661 535.29,357.311 " />
        <polyline points="535.29,357.311 506.414,401.834 " />
        <polyline points="499.813,349.038 490.717,363.198 " />
        <polyline points="490.717,363.198 519.486,381.678 " />
        <polyline points="490.717,363.198 481.662,376.322 " />
        <polyline points="448.626,355.846 511.119,394.58 " />
        <polyline points="484.232,342.5 498.238,351.49 " />
        <polyline points="484.232,342.5 467.572,367.589 " />
        <polyline points="448.626,355.846 436.528,377.989 " />
        <polyline points="436.528,377.989 470.328,396.935 " />
        <polyline points="470.328,396.935 461.807,413.904 " />
        <polyline points="461.807,413.904 484.551,424.905 " />
        <polyline points="484.551,424.905 498.349,397.58 " />
        <polyline points="506.414,401.834 468.103,381.628 " />
        <polyline points="468.103,381.628 462.828,392.73 " />
        <polyline points="460.004,418.027 484.752,431.413 " />
        <polyline points="484.752,431.413 468.135,465.345 " />
        <polyline points="468.135,465.345 441.169,453.209 " />
        <polyline points="441.169,453.209 460.004,418.027 " />
        <polyline points="436.528,377.989 420.631,404.034 " />
        <polyline points="420.631,404.034 441.511,415.327 " />
        <polyline points="420.631,404.034 403.377,433.286 " />
        <polyline points="403.377,433.286 441.177,453.195 " />
        <polyline points="440.229,417.664 456.004,388.906 " />
        <polyline points="440.229,417.664 455.75,425.973 " />
        <polyline points="414.063,438.914 431.113,409.703 " />
        <polyline points="425.491,444.934 441.252,418.211 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 318.246 361.666)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-003</text>
        <text transform="matrix(2.43188 0 -0 3.03985 311.574 371.011)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23385;&#26157;&#33452;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 318.562 366.148)" font-family="Arial,'sans-serif'" font-size="1.39636" >191&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 323.889 321.095)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-002-1</text>
        <text transform="matrix(2.43188 0 -0 3.03985 325.523 330.456)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#39759;&#29577;&#29618;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 324.206 325.576)" font-family="Arial,'sans-serif'" font-size="1.39636" >197&#21495;-1</text>
        <text transform="matrix(2.43188 0 -0 3.03985 337.187 304.37)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-002-2</text>
        <text transform="matrix(2.43188 0 -0 3.03985 340.519 313.706)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23385;&#28156;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 337.503 308.851)" font-family="Arial,'sans-serif'" font-size="1.39636" >197&#21495;-2</text>
        <text transform="matrix(2.43188 0 -0 3.03985 334.249 337.569)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-015</text>
        <text transform="matrix(2.43188 0 -0 3.03985 334.372 346.938)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#29577;&#30707;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 334.565 342.05)" font-family="Arial,'sans-serif'" font-size="1.39636" >193&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 452.495 337.569)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-007</text>
        <text transform="matrix(2.43188 0 -0 3.03985 452.618 346.913)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#28113;&#29748;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 453.756 342.05)" font-family="Arial,'sans-serif'" font-size="1.39636" >89&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 449.534 369.548)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-008</text>
        <text transform="matrix(2.43188 0 -0 3.03985 449.657 378.917)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#20113;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 450.795 374.029)" font-family="Arial,'sans-serif'" font-size="1.39636" >77&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 472.576 402.599)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-009~013</text>
        <text transform="matrix(2.43188 0 -0 3.03985 476.525 411.952)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#24503;&#31077;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 477.663 407.081)" font-family="Arial,'sans-serif'" font-size="1.39636" >77&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 460.046 438.176)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-006</text>
        <text transform="matrix(2.43188 0 -0 3.03985 460.169 447.521)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#24503;&#26106;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 461.307 442.657)" font-family="Arial,'sans-serif'" font-size="1.39636" >73&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 437.396 430.683)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-005</text>
        <text transform="matrix(2.43188 0 -0 3.03985 437.519 440.028)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#24800;&#32676;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 438.657 435.164)" font-family="Arial,'sans-serif'" font-size="1.39636" >83&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 411.234 418.245)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-004</text>
        <text transform="matrix(2.43188 0 -0 3.03985 411.357 427.598)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#39118;&#27495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 412.495 422.726)" font-family="Arial,'sans-serif'" font-size="1.39636" >87&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 423.18 425.122)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-014</text>
        <text transform="matrix(2.43188 0 -0 3.03985 423.303 434.45)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#20122;&#20891;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 424.441 429.603)" font-family="Arial,'sans-serif'" font-size="1.39636" >85&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 479.274 355.289)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-016</text>
        <text transform="matrix(2.43188 0 -0 3.03985 479.397 364.642)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#28113;&#28165;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 480.535 359.77)" font-family="Arial,'sans-serif'" font-size="1.39636" >81&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 493.678 375.246)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-017</text>
        <text transform="matrix(2.43188 0 -0 3.03985 495.499 384.598)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#40784;&#40527;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 494.939 379.727)" font-family="Arial,'sans-serif'" font-size="1.39636" >81&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 507.582 355.981)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-018</text>
        <text transform="matrix(2.43188 0 -0 3.03985 507.705 365.326)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#28113;&#21531;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 508.843 360.462)" font-family="Arial,'sans-serif'" font-size="1.39636" >81&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 500.521 326.759)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-023</text>
        <text transform="matrix(2.43188 0 -0 3.03985 500.644 336.129)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#37329;&#33635;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 500.837 331.241)" font-family="Arial,'sans-serif'" font-size="1.39636" >157&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 450.55 405.12)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-025</text>
        <text transform="matrix(2.43188 0 -0 3.03985 450.673 414.473)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#20250;&#29983;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 451.811 409.601)" font-family="Arial,'sans-serif'" font-size="1.39636" >83&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 435.896 392.69)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-026</text>
        <text transform="matrix(2.43188 0 -0 3.03985 436.019 402.051)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36213;&#26149;&#26757;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 437.157 397.171)" font-family="Arial,'sans-serif'" font-size="1.39636" >83&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="220.267,298.155 242.953,317.037 " />
        <polyline points="242.953,317.037 257.417,298.161 " />
        <polyline points="257.417,298.161 233.732,279.504 " />
        <polyline points="233.732,279.504 220.267,298.155 " />
        <polyline points="257.417,298.161 271.834,278.697 " />
        <polyline points="271.834,278.697 248.78,260.289 " />
        <polyline points="248.78,260.289 233.732,279.504 " />
        <polyline points="252.056,262.904 271.029,239.146 " />
        <polyline points="271.029,239.146 294.377,254.038 " />
        <polyline points="294.377,254.038 273.668,280.055 " />
        <polyline points="273.668,280.055 271.834,278.697 " />
        <polyline points="295.948,256.561 311.752,268.354 " />
        <polyline points="311.752,268.354 299.271,287.868 " />
        <polyline points="299.271,287.868 287.587,280.006 " />
        <polyline points="287.587,280.006 282.888,286.728 " />
        <polyline points="282.888,286.728 274.688,280.996 " />
        <polyline points="274.688,280.996 295.948,256.561 " />
        <polyline points="277.116,294.426 288.004,302.645 " />
        <polyline points="288.004,302.645 258.614,342.944 " />
        <polyline points="258.614,342.944 247.584,334.978 " />
        <polyline points="247.584,334.978 277.116,294.426 " />
        <polyline points="277.018,324.736 293.251,336.21 " />
        <polyline points="293.251,336.21 280.677,354.847 " />
        <polyline points="280.677,354.847 263.973,343.829 " />
        <polyline points="263.973,343.829 277.018,324.736 " />
        <polyline points="295.838,331.804 292.986,336.023 " />
        <polyline points="295.838,331.804 308.884,340.272 " />
        <polyline points="308.884,340.272 293.077,363.425 " />
        <polyline points="293.077,363.425 280.677,354.847 " />
        <polyline points="308.891,340.261 324.153,317.464 " />
        <polyline points="326.268,319.098 312.02,308.088 " />
        <polyline points="312.02,308.088 295.838,331.804 " />
        <polyline points="297.597,329.226 281.722,317.093 " />
        <polyline points="281.722,317.093 295.04,299.19 " />
        <polyline points="295.04,299.19 310.604,310.164 " />
        <polyline points="295.04,299.19 302.462,288.784 " />
        <polyline points="302.462,288.784 318.549,300.084 " />
        <polyline points="317.904,299.631 312.02,308.088 " />
        <polyline points="302.462,288.784 318.726,267.482 " />
        <polyline points="318.726,267.482 333.721,278.328 " />
        <polyline points="333.721,278.328 318.549,300.084 " />
        <polyline points="333.721,278.328 347.845,288.179 " />
        <polyline points="347.845,288.179 332.093,310.761 " />
        <polyline points="326.369,242.088 351.742,230.506 " />
        <polyline points="351.742,230.506 363.144,256.213 " />
        <polyline points="363.144,256.213 337.949,266.907 " />
        <polyline points="337.949,266.907 326.369,242.088 " />
        <polyline points="351.742,230.506 385.574,214.144 " />
        <polyline points="385.574,214.144 398.028,242.003 " />
        <polyline points="398.028,242.003 363.144,256.213 " />
        <polyline points="392.241,248.633 429.911,234.285 " />
        <polyline points="429.911,234.285 432.031,239.85 " />
        <polyline points="432.031,239.85 394.364,254.204 " />
        <polyline points="394.364,254.204 392.241,248.633 " />
        <polyline points="339.823,268.03 358.173,261.208 " />
        <polyline points="358.173,261.208 367.363,287.13 " />
        <polyline points="367.363,287.13 355.412,291.174 " />
        <polyline points="355.412,291.174 342.46,275.524 " />
        <polyline points="342.46,275.524 339.692,268.079 " />
        <polyline points="358.173,261.208 378.398,254.222 " />
        <polyline points="378.398,254.222 385.983,277.738 " />
        <polyline points="385.983,277.738 369.194,283.425 " />
        <polyline points="369.194,283.425 366.517,282.352 " />
        <polyline points="366.517,282.352 358.173,261.208 " />
        <polyline points="369.194,283.425 369.569,283.637 " />
        <polyline points="369.569,283.637 376.921,301.47 " />
        <polyline points="376.921,301.47 403.177,293.325 " />
        <polyline points="403.177,293.325 397.332,274.077 " />
        <polyline points="397.332,274.077 385.933,277.754 " />
        <polyline points="397.332,274.077 440.756,259.604 " />
        <polyline points="403.177,293.325 446.271,277.365 " />
        <polyline points="446.271,277.365 440.756,259.604 " />
        <polyline points="446.271,277.365 452.217,298.893 " />
        <polyline points="452.217,298.893 434.329,304.047 " />
        <polyline points="434.33,304.047 428.466,283.959 " />
        <polyline points="434.33,304.047 417.184,309.559 " />
        <polyline points="417.184,309.559 410.924,290.456 " />
        <polyline points="417.184,309.559 392.492,316.238 " />
        <polyline points="392.492,316.238 376.921,301.47 " />
        <polyline points="398.881,319.285 424.32,311.608 " />
        <polyline points="424.32,311.608 431.347,334.84 " />
        <polyline points="431.347,334.84 415.616,339.25 " />
        <polyline points="415.616,339.25 400.961,326.565 " />
        <polyline points="400.961,326.565 398.883,319.284 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 411.356 322.339)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-007</text>
        <text transform="matrix(2.43188 0 -0 3.03985 411.479 331.691)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#40857;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 411.672 326.82)" font-family="Arial,'sans-serif'" font-size="1.39636" >165&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 396.218 300.69)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-010</text>
        <text transform="matrix(2.43188 0 -0 3.03985 396.341 310.043)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#22369;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 396.534 305.171)" font-family="Arial,'sans-serif'" font-size="1.39636" >171&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 435.229 288.46)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-009</text>
        <text transform="matrix(2.43188 0 -0 3.03985 435.352 297.804)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#35199;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 435.545 292.941)" font-family="Arial,'sans-serif'" font-size="1.39636" >167&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 418.243 294.378)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-008</text>
        <text transform="matrix(2.43188 0 -0 3.03985 418.366 303.731)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#22763;&#24544;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 418.56 298.859)" font-family="Arial,'sans-serif'" font-size="1.39636" >169&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 419.781 271.593)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-006</text>
        <text transform="matrix(2.43188 0 -0 3.03985 419.904 280.937)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#24311;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 420.098 276.074)" font-family="Arial,'sans-serif'" font-size="1.39636" >183&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 383.096 285.033)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-005</text>
        <text transform="matrix(2.43188 0 -0 3.03985 384.918 294.394)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#36215;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 383.412 289.514)" font-family="Arial,'sans-serif'" font-size="1.39636" >173&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 367.756 265.925)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-004</text>
        <text transform="matrix(2.43188 0 -0 3.03985 367.878 275.269)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24503;&#31108;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 368.072 270.406)" font-family="Arial,'sans-serif'" font-size="1.39636" >177&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 348.592 272.92)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-003</text>
        <text transform="matrix(2.43188 0 -0 3.03985 348.715 282.282)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#39640;&#28113;&#25935;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 348.909 277.402)" font-family="Arial,'sans-serif'" font-size="1.39636" >175&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 339.87 245.949)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-002</text>
        <text transform="matrix(2.43188 0 -0 3.03985 339.837 254.588)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#29577;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 340.186 250.43)" font-family="Arial,'sans-serif'" font-size="1.39636" >179&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 369.287 234.097)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-020</text>
        <text transform="matrix(2.43188 0 -0 3.03985 369.603 238.578)" font-family="Arial,'sans-serif'" font-size="1.39636" >181&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 406.641 240.628)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-006</text>
        <text transform="matrix(2.43188 0 -0 3.03985 406.764 249.972)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#24311;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 406.957 245.109)" font-family="Arial,'sans-serif'" font-size="1.39636" >183&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 327.86 291.871)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-015</text>
        <text transform="matrix(2.43188 0 -0 3.03985 327.983 301.224)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24464;&#28113;&#24800;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 328.177 296.352)" font-family="Arial,'sans-serif'" font-size="1.39636" >203&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 305.428 321.098)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-014</text>
        <text transform="matrix(2.43188 0 -0 3.03985 305.551 330.451)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24464;&#38271;&#26149;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 305.744 325.579)" font-family="Arial,'sans-serif'" font-size="1.39636" >201&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 291.227 343.548)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-019</text>
        <text transform="matrix(2.43188 0 -0 3.03985 293.049 352.893)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#25165;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 291.544 348.029)" font-family="Arial,'sans-serif'" font-size="1.39636" >145&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 273.176 335.673)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-001</text>
        <text transform="matrix(2.43188 0 -0 3.03985 273.299 345.026)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#26690;&#24179;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 273.492 340.154)" font-family="Arial,'sans-serif'" font-size="1.39636" >205&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 291.26 310.443)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-016</text>
        <text transform="matrix(2.43188 0 -0 3.03985 291.383 319.804)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#40644;&#36830;&#27743;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 291.576 314.924)" font-family="Arial,'sans-serif'" font-size="1.39636" >207&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 300.455 296.683)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-016-1</text>
        <text transform="matrix(2.43188 0 -0 3.03985 303.787 306.044)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#40644;&#29747;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 300.772 301.163)" font-family="Arial,'sans-serif'" font-size="1.39636" >207&#21495;-1</text>
        <text transform="matrix(2.43188 0 -0 3.03985 313.918 279.991)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-011</text>
        <text transform="matrix(2.43188 0 -0 3.03985 314.041 289.344)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24247;&#24535;&#33391;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 314.234 284.472)" font-family="Arial,'sans-serif'" font-size="1.39636" >209&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 290.448 268.111)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-021</text>
        <text transform="matrix(2.43188 0 -0 3.03985 292.269 277.48)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#23077;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 290.764 272.592)" font-family="Arial,'sans-serif'" font-size="1.39636" >213&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 264.299 314.963)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-017</text>
        <text transform="matrix(2.43188 0 -0 3.03985 257.628 324.324)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#23453;&#31108;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 264.616 319.444)" font-family="Arial,'sans-serif'" font-size="1.39636" >217&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 255.998 330.081)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#23567;&#33714;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 233.873 295.902)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-013</text>
        <text transform="matrix(2.43188 0 -0 3.03985 233.996 305.264)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#24314;&#20141;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 234.189 300.384)" font-family="Arial,'sans-serif'" font-size="1.39636" >221&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 245.392 270.58)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-018</text>
        <text transform="matrix(2.43188 0 -0 3.03985 247.373 279.924)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36158;&#20964;&#33635;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 249.021 274.167)" font-family="Arial,'sans-serif'" font-size="1.39636" >223&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 269.622 255.89)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-012</text>
        <text transform="matrix(2.43188 0 -0 3.03985 271.444 265.226)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#30000;&#21644;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 269.939 260.37)" font-family="Arial,'sans-serif'" font-size="1.39636" >225&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="271.15,279.62 282.334,287.621 " />
        <polyline points="282.334,287.621 277.793,294.937 " />
        <polyline points="247.584,334.978 244.896,338.701 " />
        <polyline points="244.896,338.701 234.372,331.101 " />
        <polyline points="234.372,331.101 242.953,317.037 " />
        <polyline points="293.462,217.637 307.617,232.344 " />
        <polyline points="307.617,232.344 291.404,247.456 " />
        <polyline points="291.404,247.456 278.045,232.887 " />
        <polyline points="278.045,232.887 293.462,217.637 " />
        <polyline points="335.35,237.988 329.5,225.356 " />
        <polyline points="329.5,225.356 309.138,234.514 " />
        <polyline points="309.138,234.514 295.069,244.357 " />
        <polyline points="295.069,244.357 302.902,255.029 " />
        <polyline points="302.902,255.029 326.67,242.734 " />
        <polyline points="347.15,197.23 352.463,219.103 " />
        <polyline points="352.463,219.103 332.857,223.456 " />
        <polyline points="332.857,223.456 327.693,201.451 " />
        <polyline points="327.693,201.451 347.15,197.23 " />
        <polyline points="327.693,201.451 298.698,208.383 " />
        <polyline points="298.698,208.383 300.833,217.314 " />
        <polyline points="300.833,217.314 309.455,232.528 " />
        <polyline points="309.455,232.528 332.857,223.456 " />
        <polyline points="335.875,191.361 361.311,193.889 " />
        <polyline points="361.311,193.889 363.29,175.508 " />
        <polyline points="363.29,175.508 337.461,173.517 " />
        <polyline points="337.461,173.517 335.875,191.361 " />
        <polyline points="361.308,193.921 360.983,196.867 " />
        <polyline points="360.983,196.867 382.634,199.252 " />
        <polyline points="382.634,199.252 384.73,178.895 " />
        <polyline points="384.73,178.895 363.143,176.84 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 368.23 183.808)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-004</text>
        <text transform="matrix(2.43188 0 -0 3.03985 368.546 188.29)" font-family="Arial,'sans-serif'" font-size="1.39636" >261&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 367.983 193.227)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#28113;&#33521;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 346.297 179.733)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-018</text>
        <text transform="matrix(2.43188 0 -0 3.03985 346.613 184.215)" font-family="Arial,'sans-serif'" font-size="1.39636" >259&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 346.05 189.16)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#32988;&#26126;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 335.045 207.324)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-017</text>
        <text transform="matrix(2.43188 0 -0 3.03985 335.361 211.806)" font-family="Arial,'sans-serif'" font-size="1.39636" >231&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 334.798 216.776)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#40644;&#36830;&#20809;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 310.874 212.251)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-020</text>
        <text transform="matrix(2.43188 0 -0 3.03985 311.191 216.733)" font-family="Arial,'sans-serif'" font-size="1.39636" >229&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 310.627 221.695)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20219;&#20809;&#26126;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 288.59 229.046)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-003</text>
        <text transform="matrix(2.43188 0 -0 3.03985 288.906 233.528)" font-family="Arial,'sans-serif'" font-size="1.39636" >227&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 290.042 238.465)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#31283;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 310.819 237.118)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-013</text>
        <text transform="matrix(2.43188 0 -0 3.03985 311.135 241.6)" font-family="Arial,'sans-serif'" font-size="1.39636" >211&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 310.572 246.562)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#20041;&#22269;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 251.738 309.138)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-002</text>
        <text transform="matrix(2.43188 0 -0 3.03985 251.162 313.62)" font-family="Arial,'sans-serif'" font-size="1.39636" >227&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 251.312 318.556)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#31283;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="424.185,203.848 427.079,179.694 " />
        <polyline points="424.185,203.848 403.594,201.642 " />
        <polyline points="403.594,201.642 406.907,171.492 " />
        <polyline points="406.907,171.492 427.079,179.694 " />
        <polyline points="431.609,192.415 458.115,194.518 " />
        <polyline points="458.115,194.518 456.124,219.601 " />
        <polyline points="456.124,219.601 429.562,217.493 " />
        <polyline points="429.562,217.493 431.609,192.415 " />
        <polyline points="431.609,192.415 434.36,180.626 " />
        <polyline points="434.36,180.626 449.197,156.233 " />
        <polyline points="449.197,156.233 467.581,167.079 " />
        <polyline points="467.581,167.079 452.186,194.048 " />
        <polyline points="449.197,156.233 459.312,140.054 " />
        <polyline points="459.312,140.054 477.512,151.269 " />
        <polyline points="477.512,151.269 467.581,167.079 " />
        <polyline points="479.535,151.453 497.025,162.589 " />
        <polyline points="497.025,162.589 486.362,179.883 " />
        <polyline points="486.362,179.883 468.5,168.734 " />
        <polyline points="468.5,168.734 479.535,151.453 " />
        <polyline points="517.799,179.872 535.447,190.904 " />
        <polyline points="535.447,190.904 526.259,205.798 " />
        <polyline points="526.259,205.798 507.876,194.95 " />
        <polyline points="507.876,194.95 517.799,179.872 " />
        <polyline points="526.259,205.798 516.389,222.829 " />
        <polyline points="516.389,222.829 498.32,210.764 " />
        <polyline points="487.456,228.743 507.876,194.95 " />
        <polyline points="509.147,193.019 490.698,181.407 " />
        <polyline points="490.698,181.407 480.43,197.702 " />
        <polyline points="480.43,197.702 499.141,209.405 " />
        <polyline points="480.43,197.702 467.995,215.844 " />
        <polyline points="467.995,215.844 487.456,228.743 " />
        <polyline points="472.744,218.992 461.692,237.3 " />
        <polyline points="461.692,237.3 479.243,248.482 " />
        <polyline points="479.243,248.482 490.779,230.818 " />
        <polyline points="490.779,230.818 487.456,228.743 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 410.936 186.661)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-005</text>
        <text transform="matrix(2.43188 0 -0 3.03985 411.252 191.143)" font-family="Arial,'sans-serif'" font-size="1.39636" >265&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 410.689 196.096)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#29577;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 437.849 204.533)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-006</text>
        <text transform="matrix(2.43188 0 -0 3.03985 438.165 209.015)" font-family="Arial,'sans-serif'" font-size="1.39636" >135&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 437.602 213.977)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36213;&#21916;&#29618;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 443.983 173.754)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-015</text>
        <text transform="matrix(2.43188 0 -0 3.03985 444.3 178.236)" font-family="Arial,'sans-serif'" font-size="1.39636" >133&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 443.736 183.197)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20040;&#26149;&#20848;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 458.003 149.956)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-014</text>
        <text transform="matrix(2.43188 0 -0 3.03985 458.32 154.438)" font-family="Arial,'sans-serif'" font-size="1.39636" >131&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 457.756 159.408)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#31168;&#21326;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 478.684 162.345)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-012</text>
        <text transform="matrix(2.43188 0 -0 3.03985 479 166.827)" font-family="Arial,'sans-serif'" font-size="1.39636" >127&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 478.437 171.814)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#36830;&#22686;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 490.147 192.117)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-009</text>
        <text transform="matrix(2.43188 0 -0 3.03985 490.463 196.599)" font-family="Arial,'sans-serif'" font-size="1.39636" >121&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 491.599 201.569)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#23500;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 478.543 209.581)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-007</text>
        <text transform="matrix(2.43188 0 -0 3.03985 478.859 214.063)" font-family="Arial,'sans-serif'" font-size="1.39636" >115&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 478.296 219.024)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#35060;&#37329;&#40857;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 471.1 229.419)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-008</text>
        <text transform="matrix(2.43188 0 -0 3.03985 471.416 233.901)" font-family="Arial,'sans-serif'" font-size="1.39636" >125&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 470.853 238.871)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#32500;&#22269;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 507.615 205.463)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-010</text>
        <text transform="matrix(2.43188 0 -0 3.03985 507.931 209.945)" font-family="Arial,'sans-serif'" font-size="1.39636" >113&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 507.368 214.914)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#29577;&#31481;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 516.724 189.417)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-011</text>
        <text transform="matrix(2.43188 0 -0 3.03985 517.04 193.899)" font-family="Arial,'sans-serif'" font-size="1.39636" >129&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 516.477 198.852)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#28113;&#33521;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="511.485,295.694 531.959,307.534 " />
        <polyline points="531.959,307.534 521.131,323.846 " />
        <polyline points="521.131,323.846 501.277,310.975 " />
        <polyline points="501.277,310.975 511.485,295.694 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 510.434 305.796)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-027</text>
        <text transform="matrix(2.43188 0 -0 3.03985 510.557 315.157)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37085;&#26032;&#21326;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 510.75 310.277)" font-family="Arial,'sans-serif'" font-size="1.39636" >151&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="466.092,340.927 479.703,349.32 " />
        <polyline points="424.32,311.608 444.184,305.522 " />
        <polyline points="444.184,305.522 450.699,328.139 " />
        <polyline points="450.699,328.139 431.347,334.84 " />
        <polyline points="472.158,294.484 488.96,305.276 " />
        <polyline points="488.96,305.276 473.912,329.876 " />
        <polyline points="475.094,327.943 457.814,317.28 " />
        <polyline points="457.814,317.28 472.158,294.484 " />
        <polyline points="392.461,260.061 436.498,245.581 " />
        <polyline points="436.498,245.581 440.756,259.604 " />
        <polyline points="392.316,259.562 396.598,274.314 " />
        <polyline points="392.316,259.562 381.307,263.241 " />
        <polyline points="494.591,283.076 511.67,294.105 " />
        <polyline points="511.67,294.105 501.827,310.152 " />
        <polyline points="501.827,310.152 482.893,299.208 " />
        <polyline points="482.893,299.208 494.591,283.076 " />
        <polyline points="494.591,283.076 478.862,272.845 " />
        <polyline points="478.862,272.845 468.501,289.241 " />
        <polyline points="468.501,289.241 483.326,298.611 " />
        <polyline points="478.518,273.39 450.285,254.773 " />
        <polyline points="450.285,254.773 445.688,261.024 " />
        <polyline points="445.688,261.024 448.995,276.283 " />
        <polyline points="448.995,276.283 468.805,288.76 " />
        <polyline points="468.679,241.751 450.001,230.217 " />
        <polyline points="450.001,230.217 440.253,246.495 " />
        <polyline points="440.253,246.495 459.127,257.701 " />
        <polyline points="459.127,257.701 468.679,241.751 " />
        <polyline points="459.127,257.701 472.993,266.151 " />
        <polyline points="472.993,266.151 482.821,250.762 " />
        <polyline points="482.821,250.762 479.243,248.482 " />
        <polyline points="474.068,267.009 486.684,274.877 " />
        <polyline points="486.684,274.877 496.668,259.585 " />
        <polyline points="496.668,259.585 484.933,252.108 " />
        <polyline points="484.933,252.108 474.068,267.009 " />
        <polyline points="497.715,260.829 487.979,276.241 " />
        <polyline points="487.979,276.241 502.46,285.389 " />
        <polyline points="502.46,285.389 512.196,269.977 " />
        <polyline points="512.196,269.977 497.715,260.829 " />
        <polyline points="502.46,285.389 517.277,294.622 " />
        <polyline points="516.613,295.759 526.604,278.66 " />
        <polyline points="526.604,278.66 512.196,269.977 " />
        <polyline points="526.604,278.66 547.595,292.035 " />
        <polyline points="547.595,292.035 543.185,299.39 " />
        <polyline points="543.185,299.39 539.876,297.367 " />
        <polyline points="539.876,297.367 534.065,306.242 " />
        <polyline points="534.065,306.242 516.613,295.759 " />
        <polyline points="490.779,230.818 508.067,241.838 " />
        <polyline points="508.067,241.838 496.668,259.585 " />
        <polyline points="498.446,261.29 510.824,243.861 " />
        <polyline points="510.824,243.861 524.061,252.87 " />
        <polyline points="524.061,252.87 512.501,270.161 " />
        <polyline points="524.061,252.87 555.68,272.911 " />
        <polyline points="555.68,272.911 543.984,289.734 " />
        <polyline points="550.907,245.062 521.43,226.621 " />
        <polyline points="521.43,226.621 510.824,243.861 " />
        <polyline points="548.69,243.675 537.202,261.2 " />
        <polyline points="535.265,201.385 556.922,214.154 " />
        <polyline points="556.922,214.154 541.857,239.4 " />
        <polyline points="535.265,201.385 521.43,226.621 " />
        <polyline points="556.922,214.154 582.51,230.619 " />
        <polyline points="582.51,230.619 567.441,253.052 " />
        <polyline points="567.441,253.052 551.865,243.457 " />
        <polyline points="551.865,243.457 550.907,245.062 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 559.341 231.985)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-015</text>
        <text transform="matrix(2.43188 0 -0 3.03985 560.602 236.466)" font-family="Arial,'sans-serif'" font-size="1.39636" >95&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 559.094 241.436)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#27583;&#23500;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 533.806 216.459)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-014</text>
        <text transform="matrix(2.43188 0 -0 3.03985 534.122 220.94)" font-family="Arial,'sans-serif'" font-size="1.39636" >103&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 533.559 225.918)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#31168;&#33635;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 526.358 241.165)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-013</text>
        <text transform="matrix(2.43188 0 -0 3.03985 526.674 245.647)" font-family="Arial,'sans-serif'" font-size="1.39636" >105&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 526.111 250.617)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#23500;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 529.425 268.479)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-016</text>
        <text transform="matrix(2.43188 0 -0 3.03985 530.686 272.96)" font-family="Arial,'sans-serif'" font-size="1.39636" >99&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 529.178 277.946)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#32418;&#29983;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 506.452 253.843)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-012</text>
        <text transform="matrix(2.43188 0 -0 3.03985 506.769 258.324)" font-family="Arial,'sans-serif'" font-size="1.39636" >117&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 506.206 263.294)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23380;&#23466;&#27905;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 489.784 241.096)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-019</text>
        <text transform="matrix(2.43188 0 -0 3.03985 490.1 245.577)" font-family="Arial,'sans-serif'" font-size="1.39636" >123&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 489.537 250.555)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21335;&#29983;&#33457;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 449.963 240.977)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-001</text>
        <text transform="matrix(2.43188 0 -0 3.03985 450.28 245.458)" font-family="Arial,'sans-serif'" font-size="1.39636" >137&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 451.415 250.428)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#31206;&#26480;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 466.395 252.305)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-005</text>
        <text transform="matrix(2.43188 0 -0 3.03985 466.711 256.786)" font-family="Arial,'sans-serif'" font-size="1.39636" >139&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 466.148 261.756)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#29618;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 481.027 260.672)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-020</text>
        <text transform="matrix(2.43188 0 -0 3.03985 481.343 265.153)" font-family="Arial,'sans-serif'" font-size="1.39636" >141&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 480.78 270.123)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#32500;&#21326;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 495.664 270.049)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-004</text>
        <text transform="matrix(2.43188 0 -0 3.03985 495.98 274.53)" font-family="Arial,'sans-serif'" font-size="1.39636" >143&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 495.417 279.508)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#21344;&#38134;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 510.166 279.921)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-017</text>
        <text transform="matrix(2.43188 0 -0 3.03985 510.482 284.402)" font-family="Arial,'sans-serif'" font-size="1.39636" >109&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 509.919 289.38)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#23453;&#20041;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 527.281 288.914)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-018</text>
        <text transform="matrix(2.43188 0 -0 3.03985 527.597 293.395)" font-family="Arial,'sans-serif'" font-size="1.39636" >101&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 527.034 298.365)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#23453;&#31077;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 455.057 269.565)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-010</text>
        <text transform="matrix(2.43188 0 -0 3.03985 455.374 274.046)" font-family="Arial,'sans-serif'" font-size="1.39636" >107&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 454.81 278.999)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20195;&#36947;&#20891;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 476.094 283.823)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-006</text>
        <text transform="matrix(2.43188 0 -0 3.03985 476.41 288.304)" font-family="Arial,'sans-serif'" font-size="1.39636" >147&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 475.847 293.282)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20309;&#20426;&#21551;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 492.575 293.023)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-009</text>
        <text transform="matrix(2.43188 0 -0 3.03985 492.891 297.504)" font-family="Arial,'sans-serif'" font-size="1.39636" >147&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 492.328 302.482)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#24191;&#24535;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 468.631 307.079)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-008</text>
        <text transform="matrix(2.43188 0 -0 3.03985 468.947 311.56)" font-family="Arial,'sans-serif'" font-size="1.39636" >153&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 468.384 316.522)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#20250;&#33521;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 462.856 349.831)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-011</text>
        <text transform="matrix(2.43188 0 -0 3.03985 463.172 354.312)" font-family="Arial,'sans-serif'" font-size="1.39636" >159&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 462.609 359.307)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#38271;&#31435;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 432.291 314.627)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-007</text>
        <text transform="matrix(2.43188 0 -0 3.03985 432.607 319.108)" font-family="Arial,'sans-serif'" font-size="1.39636" >163&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 432.044 324.069)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#24503;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 408.474 257.845)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-002</text>
        <text transform="matrix(2.43188 0 -0 3.03985 408.791 262.326)" font-family="Arial,'sans-serif'" font-size="1.39636" >187&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 408.227 267.288)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#31077;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 385.318 265.673)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-003</text>
        <text transform="matrix(2.43188 0 -0 3.03985 385.634 270.155)" font-family="Arial,'sans-serif'" font-size="1.39636" >187&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 385.071 275.117)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#31077;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="339.927,154.752 377.329,157.775 " />
        <polyline points="377.329,157.775 375.862,175.923 " />
        <polyline points="375.862,175.923 338.46,172.9 " />
        <polyline points="338.46,172.9 339.928,154.752 " />
        <polyline points="516.389,222.829 505.87,240.438 " />
        <polyline points="488.188,306.537 502.013,315.021 " />
        <polyline points="449.167,355.152 448.626,355.846 " />
        <polyline points="449.167,355.152 425.82,340.077 " />
        <polyline points="425.82,340.077 413.093,356.192 " />
        <polyline points="413.093,356.192 406.053,369.554 " />
        <polyline points="406.053,369.554 432.522,384.552 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 423.562 360.711)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-022</text>
        <text transform="matrix(2.43188 0 -0 3.03985 423.685 370.064)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23433;&#33258;&#30465;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 423.878 365.192)" font-family="Arial,'sans-serif'" font-size="1.39636" >161&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 483.831 318.636)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-024</text>
        <text transform="matrix(2.43188 0 -0 3.03985 483.954 328.005)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#19975;&#27849;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 484.148 323.117)" font-family="Arial,'sans-serif'" font-size="1.39636" >155&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 498.875 222.665)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-022</text>
        <text transform="matrix(2.43188 0 -0 3.03985 498.998 232.027)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#36827;&#24544;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 499.191 227.147)" font-family="Arial,'sans-serif'" font-size="1.39636" >107&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 353.727 163.261)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-3-021</text>
        <text transform="matrix(2.43188 0 -0 3.03985 353.85 172.615)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#20250;&#24198;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 354.043 167.743)" font-family="Arial,'sans-serif'" font-size="1.39636" >257&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="406.144,369.676 428.782,382.542 " />
        <polyline points="428.782,382.542 413.124,408.835 " />
        <polyline points="413.124,408.835 389.41,395.047 " />
        <polyline points="389.41,395.047 406.144,369.676 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 399.713 386.082)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-019&#12289;20</text>
        <text transform="matrix(2.43188 0 -0 3.03985 403.424 395.433)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#31168;&#20113;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 398.522 390.587)" font-family="Arial,'sans-serif'" font-size="1.39636" >93&#21495;&#65288;&#20869;1&#65289;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="389.41,395.047 375.067,417.66 " />
        <polyline points="375.067,417.66 400.068,432.183 " />
        <polyline points="400.068,432.183 413.124,408.835 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 390.739 409.019)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-1-021</text>
        <text transform="matrix(2.43188 0 -0 3.03985 390.862 418.388)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23433;&#24314;&#24544;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 392 413.5)" font-family="Arial,'sans-serif'" font-size="1.39636" >91&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="241.061,270.146 264.739,288.276 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 242.799 284.73)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-018-1</text>
        <text transform="matrix(2.43188 0 -0 3.03985 251.173 292.768)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#32988;&#20041;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 246.428 288.316)" font-family="Arial,'sans-serif'" font-size="1.39636" >223-1&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="242.255,316.456 231.582,332.184 " />
        <polyline points="231.582,332.184 207.332,315.725 " />
        <polyline points="207.332,315.725 220.267,298.155 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 219.448 312.427)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-001</text>
        <text transform="matrix(2.43188 0 -0 3.03985 219.57 321.796)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#23453;&#21326;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 219.764 316.908)" font-family="Arial,'sans-serif'" font-size="1.39636" >219&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="550.907,245.062 570.383,257.649 " />
        <polyline points="570.383,257.649 558.989,274.75 " />
        <polyline points="558.989,274.75 555.68,272.911 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 549.091 255.839)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-4-021</text>
        <text transform="matrix(2.43188 0 -0 3.03985 550.352 260.32)" font-family="Arial,'sans-serif'" font-size="1.39636" >97&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 548.844 265.29)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#32500;&#24179;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="385.574,214.144 399.713,208.293 407.637,212.857 417.366,233.581 398.028,242.003 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.43188 0 -0 3.03985 362.246 244.292)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#20041;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 395.559 219.852)" font-family="Arial,'sans-serif'" font-size="1.39636" >2-2-022</text>
        <text transform="matrix(2.43188 0 -0 3.03985 395.875 224.333)" font-family="Arial,'sans-serif'" font-size="1.39636" >185&#21495;</text>
        <text transform="matrix(2.43188 0 -0 3.03985 395.312 229.328)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#29577;&#36830;</text>
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
