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
            <h4 class="bold">第一标段电子地图数据查看</h4>
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
        <polyline points="362.2,355.191 371.502,355.784 " />
        <polyline points="171.139,288.751 174.24,310.882 " />
        <polyline points="174.24,310.882 184.763,310.329 " />
        <polyline points="184.763,310.329 186.646,318.075 " />
        <polyline points="186.646,318.075 195.508,318.517 " />
        <polyline points="195.508,318.517 200.049,317.743 " />
        <polyline points="200.049,317.743 201.821,324.271 " />
        <polyline points="201.821,324.271 204.037,324.161 " />
        <polyline points="204.037,324.161 206.03,326.374 " />
        <polyline points="206.03,326.374 214.781,325.378 " />
        <polyline points="214.781,325.378 215.667,329.14 " />
        <polyline points="215.667,329.14 219.766,329.14 " />
        <polyline points="219.766,329.14 223.006,333.522 " />
        <polyline points="223.006,333.522 232.422,332.747 " />
        <polyline points="232.422,332.747 233.64,337.174 " />
        <polyline points="233.64,337.174 239.178,338.502 " />
        <polyline points="239.178,338.502 242.723,337.506 " />
        <polyline points="242.723,337.506 244.495,339.719 " />
        <polyline points="244.495,339.719 253.135,339.055 " />
        <polyline points="253.135,339.055 254.021,345.694 " />
        <polyline points="254.021,345.694 256.791,346.911 " />
        <polyline points="256.791,346.911 262.883,346.248 " />
        <polyline points="262.883,346.248 274.644,345.38 " />
        <polyline points="274.644,345.38 277.857,355.229 " />
        <polyline points="277.857,355.229 286.054,353.679 " />
        <polyline points="286.054,353.679 286.607,358.438 " />
        <polyline points="286.607,358.438 294.25,356.888 " />
        <polyline points="294.25,356.888 294.804,358.548 " />
        <polyline points="294.804,358.548 303.887,357.442 " />
        <polyline points="303.887,357.442 304.552,362.975 " />
        <polyline points="304.552,362.975 315.075,361.979 " />
        <polyline points="315.075,361.979 322.081,363.08 " />
        <polyline points="322.081,363.08 363.176,354.781 " />
        <polyline points="363.176,354.781 375.25,357.547 " />
        <polyline points="375.25,357.547 391.09,363.08 " />
        <polyline points="391.09,363.08 460.384,387.234 " />
        <polyline points="460.384,387.234 476.113,365.767 " />
        <polyline points="476.113,365.767 478.328,362.89 " />
        <polyline points="478.328,362.89 480.433,363.333 " />
        <polyline points="480.433,363.333 481.677,362.236 " />
        <polyline points="481.677,362.236 485.187,356.038 " />
        <polyline points="485.187,356.038 486.842,356.895 " />
        <polyline points="486.842,356.895 497.941,343.663 " />
        <polyline points="497.941,343.663 510.696,340.467 " />
        <polyline points="510.696,340.467 512.167,319.5 " />
        <polyline points="512.167,319.5 508.734,284.57 " />
        <polyline points="508.734,284.57 425.885,284.483 " />
        <polyline points="425.885,284.483 425.091,255.816 " />
        <polyline points="425.091,255.816 437.314,253.324 " />
        <polyline points="437.314,253.324 435.069,228.653 " />
        <polyline points="435.069,228.653 408.495,209.667 " />
        <polyline points="408.495,209.667 385.201,213.691 " />
        <polyline points="385.877,212.966 380.758,177.167 " />
        <polyline points="380.758,177.167 168.185,267.199 " />
        <polyline points="168.185,267.199 170.958,288.024 " />
        <polyline points="508.734,284.57 512.167,319.5 510.696,340.467 497.941,343.663 486.842,356.895 485.187,356.038 481.677,362.236 480.433,363.333 478.328,362.89 460.384,387.234 375.25,357.547 363.176,354.781 322.081,363.08 315.075,361.979 304.552,362.975 303.878,357.443 294.804,358.548 294.25,356.888 286.607,358.438 286.054,353.679 277.857,355.229 274.644,345.38 256.791,346.911 254.021,345.694 253.135,339.055 244.495,339.719 242.723,337.506 239.178,338.502 233.64,337.174 232.422,332.747 222.961,333.46 219.766,329.14 215.667,329.14 214.781,325.378 206.03,326.374 204.037,324.161 201.821,324.271 200.049,317.743 195.508,318.517 186.631,318.049 184.763,310.329 174.24,310.882 168.185,267.199 380.758,177.167 385.201,213.691 408.495,209.667 435.069,228.653 437.314,253.324 425.091,255.816 426.046,284.304 508.734,284.57 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 384.137 342.64)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-019</text>
        <text transform="matrix(0.810279 0 -0 1.01285 384.186 344.382)" font-family="Arial,'sans-serif'" font-size="1.39636" >423&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 383.998 346.31)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#26223;&#23500;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="243.039,329.947 250.687,328.732 " />
        <polyline points="250.687,328.732 252.116,337.593 " />
        <polyline points="252.116,337.593 244.775,338.812 " />
        <polyline points="244.775,338.812 243.039,329.947 " />
        <polyline points="253.903,338.022 261.264,337.022 " />
        <polyline points="261.264,337.022 262.551,344.811 " />
        <polyline points="262.551,344.811 256.69,345.597 " />
        <polyline points="256.69,345.597 254.832,344.811 " />
        <polyline points="254.832,344.811 253.903,338.022 " />
        <polyline points="276.487,345.597 283.706,343.882 " />
        <polyline points="283.706,343.882 285.879,352.49 " />
        <polyline points="285.879,352.49 278.56,354.173 " />
        <polyline points="278.56,354.173 276.487,345.597 " />
        <polyline points="285.165,349.663 293.64,348.17 " />
        <polyline points="293.64,348.17 294.917,355.56 " />
        <polyline points="294.917,355.56 286.779,357.103 " />
        <polyline points="286.779,357.103 285.879,352.49 " />
        <polyline points="302.359,346.669 312.151,345.097 " />
        <polyline points="312.151,345.097 313.365,353.173 " />
        <polyline points="313.365,353.173 303.702,355.04 " />
        <polyline points="303.702,355.04 302.359,346.669 " />
        <polyline points="313.365,353.173 314.723,360.962 " />
        <polyline points="314.723,360.962 305.361,362.32 " />
        <polyline points="305.361,362.32 304.076,354.968 " />
        <polyline points="314.821,337.432 326.73,334.735 " />
        <polyline points="326.73,334.735 328.477,343.234 " />
        <polyline points="328.477,343.234 316.866,345.621 " />
        <polyline points="316.866,345.621 314.821,337.432 " />
        <polyline points="326.73,334.735 337.665,332.162 " />
        <polyline points="337.665,332.162 339.595,340.452 " />
        <polyline points="339.595,340.452 328.407,342.891 " />
        <polyline points="313.08,328.232 320.367,326.506 " />
        <polyline points="320.367,326.506 322.305,334.488 " />
        <polyline points="322.305,334.488 314.866,336.017 " />
        <polyline points="314.866,336.017 313.08,328.232 " />
        <polyline points="320.367,326.506 327.803,324.73 " />
        <polyline points="327.803,324.73 329.446,332.948 " />
        <polyline points="329.446,332.948 322.305,334.488 " />
        <polyline points="334.942,321.96 335.198,323.13 " />
        <polyline points="336.987,331.297 329.446,332.948 " />
        <polyline points="318.269,326.098 315.805,313.994 " />
        <polyline points="315.805,313.994 321.532,312.717 " />
        <polyline points="321.532,312.717 323.872,325.016 " />
        <polyline points="323.872,325.016 318.269,326.098 " />
        <polyline points="329.062,323.328 327.66,315.011 " />
        <polyline points="327.66,315.011 322.201,316.231 " />
        <polyline points="334.918,321.966 323.784,324.555 " />
        <polyline points="334.918,321.966 332.344,310.451 " />
        <polyline points="333.092,313.796 327.66,315.011 " />
        <polyline points="345.851,323.99 335.757,325.68 " />
        <polyline points="345.95,324.517 343.026,309.008 " />
        <polyline points="343.026,309.008 332.344,310.451 " />
        <polyline points="344.161,315.028 351.316,313.324 " />
        <polyline points="351.316,313.324 353.731,322.5 " />
        <polyline points="353.731,322.5 345.95,324.517 " />
        <polyline points="353.731,322.5 356.941,333.508 " />
        <polyline points="356.941,333.508 348.963,335.835 " />
        <polyline points="348.963,335.835 345.951,324.519 " />
        <polyline points="348.693,334.819 340.667,336.879 " />
        <polyline points="340.667,336.879 338.094,326.731 " />
        <polyline points="338.094,326.731 346.032,324.826 " />
        <polyline points="379.118,330.59 387.766,329.161 " />
        <polyline points="387.766,329.161 389.123,336.379 " />
        <polyline points="389.123,336.379 380.475,337.951 " />
        <polyline points="380.475,337.951 379.118,330.59 " />
        <polyline points="389.123,336.379 390.124,340.523 " />
        <polyline points="390.124,340.523 390.822,348.759 " />
        <polyline points="390.822,348.759 381.475,350.529 " />
        <polyline points="381.475,350.529 380.369,341.38 " />
        <polyline points="335.198,323.13 336.987,331.297 " />
        <polyline points="380.369,341.38 381.047,341.238 " />
        <polyline points="381.047,341.238 380.475,337.951 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 382.227 332.602)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-020</text>
        <text transform="matrix(0.810279 0 -0 1.01285 382.277 334.344)" font-family="Arial,'sans-serif'" font-size="1.39636" >421&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 382.089 336.277)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#28113;&#29645;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 349.69 327.83)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-011</text>
        <text transform="matrix(0.810279 0 -0 1.01285 349.74 329.571)" font-family="Arial,'sans-serif'" font-size="1.39636" >449&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 349.552 331.502)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#28165;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 347.31 317.23)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-010</text>
        <text transform="matrix(0.810279 0 -0 1.01285 347.36 318.971)" font-family="Arial,'sans-serif'" font-size="1.39636" >457&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 347.738 320.907)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#29983;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 341.584 329.784)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-004</text>
        <text transform="matrix(0.810279 0 -0 1.01285 341.633 331.525)" font-family="Arial,'sans-serif'" font-size="1.39636" >447&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 342.012 333.45)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#21326;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 336.707 311.766)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-012</text>
        <text transform="matrix(0.810279 0 -0 1.01285 336.756 313.507)" font-family="Arial,'sans-serif'" font-size="1.39636" >459&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 336.569 315.432)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#19975;&#22914;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 338.487 318.74)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-013</text>
        <text transform="matrix(0.810279 0 -0 1.01285 338.536 320.481)" font-family="Arial,'sans-serif'" font-size="1.39636" >459&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 338.349 322.406)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#19975;&#22914;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="333.98,317.768 344.355,316.053 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 329.189 317.251)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-005</text>
        <text transform="matrix(0.810279 0 -0 1.01285 329.569 318.993)" font-family="Arial,'sans-serif'" font-size="1.39636" >461&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 329.381 320.926)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#31119;&#29983;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 323.627 318.063)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-008</text>
        <text transform="matrix(0.810279 0 -0 1.01285 324.007 319.804)" font-family="Arial,'sans-serif'" font-size="1.39636" >463&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 324.385 321.732)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#20255;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 317.744 318.063)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-009</text>
        <text transform="matrix(0.810279 0 -0 1.01285 318.124 319.804)" font-family="Arial,'sans-serif'" font-size="1.39636" >465&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 317.937 321.735)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#29577;&#21326;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 315.484 329.528)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-006</text>
        <text transform="matrix(0.810279 0 -0 1.01285 315.864 331.27)" font-family="Arial,'sans-serif'" font-size="1.39636" >451&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 315.676 333.231)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#36830;&#29983;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 323.12 327.826)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-007</text>
        <text transform="matrix(0.810279 0 -0 1.01285 323.5 329.567)" font-family="Arial,'sans-serif'" font-size="1.39636" >453&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 323.313 331.492)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#26681;&#29748;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="327.803,324.73 335.235,323.301 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 330.216 326.366)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-016</text>
        <text transform="matrix(0.810279 0 -0 1.01285 330.596 328.108)" font-family="Arial,'sans-serif'" font-size="1.39636" >455&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 330.975 330.035)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#36149;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 331.198 336.228)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-020</text>
        <text transform="matrix(0.810279 0 -0 1.01285 331.579 337.969)" font-family="Arial,'sans-serif'" font-size="1.39636" >445&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 331.957 339.894)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#24544;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 316.333 339.364)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-002</text>
        <text transform="matrix(0.810279 0 -0 1.01285 317.4 341.105)" font-family="Arial,'sans-serif'" font-size="1.39636" >443&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 317.212 343.036)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#29577;&#24658;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="320.776,336.083 322.672,344.427 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 322.146 337.995)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-003</text>
        <text transform="matrix(0.810279 0 -0 1.01285 323.212 339.737)" font-family="Arial,'sans-serif'" font-size="1.39636" >443&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 323.025 341.659)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#29577;&#25104;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 305.821 349.009)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-017</text>
        <text transform="matrix(0.810279 0 -0 1.01285 306.201 350.751)" font-family="Arial,'sans-serif'" font-size="1.39636" >513&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 306.013 352.681)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#30707;&#25991;&#20848;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 307.347 356.621)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-001</text>
        <text transform="matrix(0.810279 0 -0 1.01285 307.727 358.362)" font-family="Arial,'sans-serif'" font-size="1.39636" >511&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 308.106 360.296)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#26106;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 287.933 351.097)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-018</text>
        <text transform="matrix(0.810279 0 -0 1.01285 288.314 352.839)" font-family="Arial,'sans-serif'" font-size="1.39636" >517&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 288.126 354.767)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#25991;&#26480;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 279.229 347.236)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-019</text>
        <text transform="matrix(0.810279 0 -0 1.01285 279.61 348.978)" font-family="Arial,'sans-serif'" font-size="1.39636" >519&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 279.422 350.905)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#24535;&#23389;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 255.917 339.775)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-015</text>
        <text transform="matrix(0.810279 0 -0 1.01285 256.298 341.517)" font-family="Arial,'sans-serif'" font-size="1.39636" >523&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 256.676 343.444)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#31108;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 245.571 332.013)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-014</text>
        <text transform="matrix(0.810279 0 -0 1.01285 245.952 333.754)" font-family="Arial,'sans-serif'" font-size="1.39636" >525&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 245.764 335.721)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#29577;&#24535;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="481.393,313.796 489.755,314.653 " />
        <polyline points="489.755,314.653 489.465,317.261 " />
        <polyline points="495.167,317.894 489.465,317.261 " />
        <polyline points="495.167,317.894 494.694,322.834 " />
        <polyline points="494.694,322.834 480.606,321.442 " />
        <polyline points="480.606,321.442 481.393,313.796 " />
        <polyline points="407.669,269.788 415.143,268.988 " />
        <polyline points="415.143,268.988 414.572,260.626 " />
        <polyline points="414.572,260.626 406.996,261.412 " />
        <polyline points="406.996,261.412 407.669,269.788 " />
        <polyline points="399.094,270.707 398.289,262.308 " />
        <polyline points="398.289,262.308 406.138,261.555 " />
        <polyline points="406.138,261.555 406.924,269.845 " />
        <polyline points="406.924,269.845 399.094,270.707 " />
        <polyline points="374.831,304.505 385.477,302.909 " />
        <polyline points="385.477,302.909 386.766,310.794 " />
        <polyline points="386.766,310.794 376.117,312.366 " />
        <polyline points="376.117,312.366 374.831,304.505 " />
        <polyline points="386.206,310.877 387.123,321.657 " />
        <polyline points="387.123,321.657 378.046,322.729 " />
        <polyline points="378.046,322.729 376.117,312.366 " />
        <polyline points="387.123,321.657 387.766,329.161 " />
        <polyline points="379.118,330.59 378.046,322.729 " />
        <polyline points="373.616,304.72 366.397,305.792 " />
        <polyline points="366.397,305.792 367.54,313.778 " />
        <polyline points="367.503,313.515 374.753,312.538 " />
        <polyline points="374.753,312.538 373.592,304.723 " />
        <polyline points="366.397,305.792 359.679,306.578 " />
        <polyline points="359.679,306.578 360.965,314.367 " />
        <polyline points="360.965,314.367 367.54,313.778 " />
        <polyline points="357.892,307.007 350.674,307.793 " />
        <polyline points="350.674,307.793 351.316,313.324 " />
        <polyline points="357.892,307.007 359.151,314.686 " />
        <polyline points="359.151,314.686 351.942,315.702 " />
        <polyline points="359.151,314.686 359.262,314.671 " />
        <polyline points="359.262,314.671 360.605,323.58 " />
        <polyline points="360.605,323.58 354.346,324.609 " />
        <polyline points="360.965,314.367 362.251,323.158 " />
        <polyline points="362.251,323.158 368.731,322.128 " />
        <polyline points="367.54,313.778 368.731,322.128 " />
        <polyline points="368.731,322.128 373.363,321.266 " />
        <polyline points="377.542,320.488 377.626,320.472 " />
        <polyline points="373.363,321.266 373.719,324.084 " />
        <polyline points="373.719,324.084 378.106,323.17 " />
        <polyline points="373.719,324.084 375.95,334.704 " />
        <polyline points="375.95,334.704 379.732,333.919 " />
        <polyline points="375.95,334.704 370.816,335.781 " />
        <polyline points="370.816,335.781 370.113,333.734 " />
        <polyline points="370.113,333.734 367.35,334.465 " />
        <polyline points="367.35,334.465 363.828,322.907 " />
        <polyline points="362.251,323.158 354.622,325.555 " />
        <polyline points="356.941,333.508 366.255,330.872 " />
        <polyline points="367.35,334.465 364.395,335.307 " />
        <polyline points="370.816,335.781 373.707,345.031 " />
        <polyline points="373.707,345.031 379.915,343.701 " />
        <polyline points="373.707,345.031 377.187,357.032 " />
        <polyline points="377.187,357.032 382.619,355.531 " />
        <polyline points="382.619,355.531 379.915,343.701 " />
        <polyline points="364.395,335.307 370.826,355.46 " />
        <polyline points="370.826,355.46 376.578,357.269 " />
        <polyline points="376.578,357.269 377.187,357.032 " />
        <polyline points="357.391,333.377 363.995,355.153 " />
        <polyline points="363.995,355.153 370.152,353.346 " />
        <polyline points="348.963,335.835 342.668,338.058 " />
        <polyline points="342.668,338.058 343.311,341.381 " />
        <polyline points="343.311,341.381 342.596,341.667 " />
        <polyline points="342.596,341.667 346.455,356.817 " />
        <polyline points="346.455,356.817 346.634,357.403 " />
        <polyline points="346.634,357.403 363.355,353.043 " />
        <polyline points="342.596,341.667 336.021,343.382 " />
        <polyline points="336.021,343.382 337.736,350.6 " />
        <polyline points="337.736,350.6 344.537,349.284 " />
        <polyline points="337.736,350.6 340.023,358.39 " />
        <polyline points="340.023,358.39 346.455,356.817 " />
        <polyline points="336.021,343.382 329.518,345.097 " />
        <polyline points="329.518,345.097 331.63,352.944 " />
        <polyline points="331.63,352.944 333.734,359.89 " />
        <polyline points="333.734,359.89 340.023,358.39 " />
        <polyline points="329.732,345.883 317.655,349.104 " />
        <polyline points="317.655,349.104 319.583,356.532 " />
        <polyline points="319.583,356.532 331.706,353.196 " />
        <polyline points="319.583,356.532 321.155,362.177 " />
        <polyline points="321.155,362.177 326.301,360.891 " />
        <polyline points="326.301,360.891 324.555,355.163 " />
        <polyline points="326.301,360.891 326.587,361.891 " />
        <polyline points="326.587,361.891 331.949,360.093 " />
        <polyline points="331.949,360.093 330.141,353.626 " />
        <polyline points="185.862,308.15 193.51,307.007 " />
        <polyline points="193.51,307.007 195.183,316.687 " />
        <polyline points="195.183,316.687 187.639,317.853 " />
        <polyline points="187.639,317.853 185.862,308.15 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 320.855 357.433)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-001</text>
        <text transform="matrix(0.810279 0 -0 1.01285 321.236 359.175)" font-family="Arial,'sans-serif'" font-size="1.39636" >439&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 321.048 361.1)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#36215;&#33437;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 322.696 349.647)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-012</text>
        <text transform="matrix(0.810279 0 -0 1.01285 323.077 351.389)" font-family="Arial,'sans-serif'" font-size="1.39636" >441&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 323.455 353.316)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#20142;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 326.204 355.742)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-007</text>
        <text transform="matrix(0.810279 0 -0 1.01285 326.584 357.217)" font-family="Arial,'sans-serif'" font-size="1.39636" >437&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 326.396 358.955)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#29577;&#25935;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 326.631 360.689)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#38081;&#29615;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 332.627 349.764)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-009</text>
        <text transform="matrix(0.810279 0 -0 1.01285 333.008 351.55)" font-family="Arial,'sans-serif'" font-size="1.39636" >435&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 333.229 353.478)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472; &#33538;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 333.562 355.555)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#23453;&#24198;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 334.137 357.729)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#31435;&#26032;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 338.342 344.999)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-002</text>
        <text transform="matrix(0.810279 0 -0 1.01285 338.723 346.786)" font-family="Arial,'sans-serif'" font-size="1.39636" >433&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 338.535 348.714)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23395;&#28113;&#20848;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 340.461 352.978)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-011</text>
        <text transform="matrix(0.810279 0 -0 1.01285 340.842 354.764)" font-family="Arial,'sans-serif'" font-size="1.39636" >433&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 340.654 356.695)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#36215;&#20113;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 352.353 346.074)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-017</text>
        <text transform="matrix(0.810279 0 -0 1.01285 352.733 347.861)" font-family="Arial,'sans-serif'" font-size="1.39636" >431&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 352.954 349.795)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016; &#24433;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 361.279 340.52)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-016</text>
        <text transform="matrix(0.810279 0 -0 1.01285 361.66 342.306)" font-family="Arial,'sans-serif'" font-size="1.39636" >429&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 361.472 344.24)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#23453;&#24535;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 352.797 309.734)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-015</text>
        <text transform="matrix(0.810279 0 -0 1.01285 353.177 311.52)" font-family="Arial,'sans-serif'" font-size="1.39636" >493&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 352.989 313.449)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36158;&#28113;&#20848;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 378.897 306.162)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-014</text>
        <text transform="matrix(0.810279 0 -0 1.01285 379.277 307.948)" font-family="Arial,'sans-serif'" font-size="1.39636" >415&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 379.09 309.882)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#32993;&#23447;&#21326;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 380.136 315.721)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-013</text>
        <text transform="matrix(0.810279 0 -0 1.01285 380.516 317.507)" font-family="Arial,'sans-serif'" font-size="1.39636" >417&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 378.82 319.367)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#34945;&#31036;&#21326;(&#24050;&#25925;)</text>
        <text transform="matrix(0.810279 0 -0 1.01285 370.882 315.778)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-010</text>
        <text transform="matrix(0.810279 0 -0 1.01285 371.262 317.564)" font-family="Arial,'sans-serif'" font-size="1.39636" >509&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 371.074 319.498)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#20250;&#22269;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 368.274 327.105)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-018</text>
        <text transform="matrix(0.810279 0 -0 1.01285 368.654 328.891)" font-family="Arial,'sans-serif'" font-size="1.39636" >427&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 368.466 330.825)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#21344;&#26519;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 363.012 316.464)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-008</text>
        <text transform="matrix(0.810279 0 -0 1.01285 363.393 318.25)" font-family="Arial,'sans-serif'" font-size="1.39636" >501&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 363.205 320.184)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#23453;&#31108;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 375.047 328.214)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-006</text>
        <text transform="matrix(0.810279 0 -0 1.01285 375.427 330)" font-family="Arial,'sans-serif'" font-size="1.39636" >425&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 375.805 331.939)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#30922;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 373.617 338.755)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-005</text>
        <text transform="matrix(0.810279 0 -0 1.01285 373.997 340.541)" font-family="Arial,'sans-serif'" font-size="1.39636" >425&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 373.81 342.475)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37329;&#26690;&#20848;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 375.942 347.296)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-004</text>
        <text transform="matrix(0.810279 0 -0 1.01285 376.548 349.082)" font-family="Arial,'sans-serif'" font-size="1.39636" >425&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 374.852 350.939)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37329;&#28113;&#20848;(&#24050;&#25925;)</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="379.861,342.298 377.841,334.312 " />
        <polyline points="379.861,342.298 379.055,342.488 " />
        <polyline points="379.055,342.488 379.403,343.811 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 376.361 353.126)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#32418;&#38632;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 368.724 344.008)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-003</text>
        <text transform="matrix(0.810279 0 -0 1.01285 369.33 345.794)" font-family="Arial,'sans-serif'" font-size="1.39636" >427&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 369.143 347.728)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#21344;&#26126;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 358.39 326.843)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-022</text>
        <text transform="matrix(0.810279 0 -0 1.01285 358.77 328.629)" font-family="Arial,'sans-serif'" font-size="1.39636" >497&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 358.992 330.563)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352; &#31077;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 354.57 317.885)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-021</text>
        <text transform="matrix(0.810279 0 -0 1.01285 354.95 319.671)" font-family="Arial,'sans-serif'" font-size="1.39636" >495&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 354.762 321.605)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24247;&#24535;&#29983;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 368.78 307.94)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-023</text>
        <text transform="matrix(0.810279 0 -0 1.01285 369.16 309.726)" font-family="Arial,'sans-serif'" font-size="1.39636" >561&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 368.972 311.668)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33891;&#28113;&#21697;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 361.761 308.878)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-024</text>
        <text transform="matrix(0.810279 0 -0 1.01285 362.142 310.664)" font-family="Arial,'sans-serif'" font-size="1.39636" >499&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 361.954 312.601)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#40644;&#36830;&#26126;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 381.474 325.027)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-3-025</text>
        <text transform="matrix(0.810279 0 -0 1.01285 381.523 326.768)" font-family="Arial,'sans-serif'" font-size="1.39636" >419&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 381.335 328.699)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#40644;&#21073;&#21018;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 400.944 264.421)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-025</text>
        <text transform="matrix(0.810279 0 -0 1.01285 400.994 266.162)" font-family="Arial,'sans-serif'" font-size="1.39636" >371&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 400.806 268.095)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#27946;&#23665;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 409.389 264.421)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-024</text>
        <text transform="matrix(0.810279 0 -0 1.01285 409.439 266.162)" font-family="Arial,'sans-serif'" font-size="1.39636" >373&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 409.251 268.087)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#20108;&#39034;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 483.707 317.19)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-033</text>
        <text transform="matrix(0.810279 0 -0 1.01285 483.757 318.932)" font-family="Arial,'sans-serif'" font-size="1.39636" >385&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 483.569 320.857)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#24800;&#29748;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="445.972,300.394 454.368,300.86 " />
        <polyline points="454.368,300.86 453.975,308.802 " />
        <polyline points="453.975,308.802 448.338,308.523 " />
        <polyline points="448.338,308.523 448.309,309.053 " />
        <polyline points="448.309,309.053 445.502,308.898 " />
        <polyline points="445.502,308.898 445.974,300.394 " />
        <polyline points="402.705,298.931 414.14,298.002 " />
        <polyline points="414.14,298.002 414.828,306.183 " />
        <polyline points="414.828,306.183 403.164,307.042 " />
        <polyline points="403.164,307.042 402.705,298.931 " />
        <polyline points="416.213,297.645 424.432,297.645 " />
        <polyline points="424.432,297.645 424.947,305.772 " />
        <polyline points="424.947,305.772 416.57,305.935 " />
        <polyline points="416.57,305.935 416.213,297.645 " />
        <polyline points="420.472,306.824 429.056,306.656 " />
        <polyline points="429.056,306.656 429.147,314.523 " />
        <polyline points="429.147,314.523 420.63,314.496 " />
        <polyline points="420.63,314.496 420.472,306.824 " />
        <polyline points="436.175,299.868 444.588,300.267 " />
        <polyline points="444.588,300.267 443.934,312.405 " />
        <polyline points="443.934,312.405 435.694,311.801 " />
        <polyline points="435.694,311.801 436.175,299.868 " />
        <polyline points="453.496,316.49 460.597,316.743 " />
        <polyline points="460.597,316.743 460.489,320.019 " />
        <polyline points="460.489,320.019 461.666,320.156 " />
        <polyline points="453.496,316.49 452.518,326.016 " />
        <polyline points="452.518,326.016 461.665,327.167 " />
        <polyline points="460.971,327.08 461.666,320.156 " />
        <polyline points="453.733,326.231 452.95,335.018 " />
        <polyline points="461.236,335.807 452.95,335.018 " />
        <polyline points="461.236,335.807 461.665,327.167 " />
        <polyline points="464.312,304.577 472.174,305.22 " />
        <polyline points="472.174,305.22 471.494,313.156 " />
        <polyline points="471.494,313.156 463.811,312.509 " />
        <polyline points="463.811,312.509 464.312,304.577 " />
        <polyline points="473.246,305.22 480.75,305.942 " />
        <polyline points="480.75,305.942 479.987,313.791 " />
        <polyline points="479.987,313.791 472.458,313.332 " />
        <polyline points="472.458,313.332 473.246,305.22 " />
        <polyline points="482.18,305.577 490.328,306.435 " />
        <polyline points="490.328,306.435 489.755,314.653 " />
        <polyline points="481.393,313.796 482.18,305.577 " />
        <polyline points="491.681,306.434 503.001,306.636 " />
        <polyline points="503.001,306.636 503.123,315.827 " />
        <polyline points="503.123,315.827 491.521,315.403 " />
        <polyline points="491.521,315.403 491.681,306.434 " />
        <polyline points="503.123,315.827 504.405,315.952 " />
        <polyline points="504.405,315.952 503.733,322.869 " />
        <polyline points="503.733,322.869 496.401,322.157 " />
        <polyline points="496.401,322.157 497.086,315.606 " />
        <polyline points="496.615,323.015 503.833,323.658 " />
        <polyline points="503.833,323.658 503.261,331.09 " />
        <polyline points="510.643,331.828 496.114,330.376 " />
        <polyline points="496.114,330.376 496.615,323.015 " />
        <polyline points="496.114,330.376 495.517,338.731 " />
        <polyline points="495.517,338.731 509.959,339.763 " />
        <polyline points="509.959,339.763 510.643,331.828 " />
        <polyline points="486.896,337.509 493.862,338.172 " />
        <polyline points="493.862,338.172 494.327,330.09 " />
        <polyline points="494.327,330.09 487.433,329.587 " />
        <polyline points="487.466,329.589 486.896,337.509 " />
        <polyline points="494.694,322.834 494.971,322.872 " />
        <polyline points="494.971,322.872 494.327,330.09 " />
        <polyline points="488.031,322.176 487.433,329.587 " />
        <polyline points="480.606,321.442 479.962,328.875 " />
        <polyline points="479.962,328.875 487.433,329.586 " />
        <polyline points="479.962,328.875 479.246,336.236 " />
        <polyline points="479.246,336.236 486.936,336.96 " />
        <polyline points="471.414,328.365 478.43,328.904 " />
        <polyline points="478.43,328.904 477.906,335.802 " />
        <polyline points="477.906,335.802 470.741,335.292 " />
        <polyline points="470.741,335.292 471.414,328.365 " />
        <polyline points="471.744,321.014 479.105,321.585 " />
        <polyline points="479.105,321.585 478.542,328.546 " />
        <polyline points="478.542,328.546 471.042,328.032 " />
        <polyline points="471.042,328.032 471.744,321.014 " />
        <polyline points="471.765,320.791 479.249,321.273 " />
        <polyline points="479.249,321.273 479.892,314.225 " />
        <polyline points="479.892,314.225 472.458,313.449 " />
        <polyline points="472.458,313.449 471.744,321.014 " />
        <polyline points="463.811,312.724 472.441,313.611 " />
        <polyline points="463.811,312.724 463.024,320.013 " />
        <polyline points="463.024,320.013 471.744,321.014 " />
        <polyline points="463.024,320.013 462.395,327.446 " />
        <polyline points="461.654,327.396 471.042,328.032 " />
        <polyline points="471.093,328.036 470.56,335.434 " />
        <polyline points="470.56,335.434 461.293,334.653 " />
        <polyline points="461.951,336.379 469.526,337.736 " />
        <polyline points="469.526,337.736 467.569,346.22 " />
        <polyline points="467.569,346.22 466.939,350.47 " />
        <polyline points="466.939,350.47 459.541,349.594 " />
        <polyline points="459.541,349.594 461.951,336.379 " />
        <polyline points="466.939,350.47 469.077,350.787 " />
        <polyline points="469.077,350.787 467.558,357.737 " />
        <polyline points="467.558,357.737 458.53,356.446 " />
        <polyline points="458.53,356.446 459.541,349.594 " />
        <polyline points="459.233,357.746 470.453,359.819 " />
        <polyline points="470.453,359.819 469.152,367.26 " />
        <polyline points="469.152,367.26 457.66,365.25 " />
        <polyline points="457.66,365.25 459.233,357.746 " />
        <polyline points="469.526,337.736 475.387,338.737 " />
        <polyline points="475.387,338.737 473.511,347.268 " />
        <polyline points="473.511,347.268 467.564,346.219 " />
        <polyline points="475.387,338.737 486.178,340.666 " />
        <polyline points="473.511,347.268 478.62,348.168 " />
        <polyline points="478.62,348.168 480.684,339.684 " />
        <polyline points="478.62,348.168 477.667,351.924 " />
        <polyline points="477.667,351.924 482.771,353.944 " />
        <polyline points="482.771,353.944 485.32,345.026 " />
        <polyline points="485.32,345.026 486.178,340.666 " />
        <polyline points="486.178,340.666 495.827,342.453 " />
        <polyline points="495.827,342.453 496.613,342.81 " />
        <polyline points="496.613,342.81 496.756,343.454 " />
        <polyline points="496.756,343.454 495.898,345.097 " />
        <polyline points="495.898,345.097 494.182,347.17 " />
        <polyline points="494.182,347.17 486.949,356.294 " />
        <polyline points="486.949,356.294 482.771,353.944 " />
        <polyline points="477.667,351.924 473.742,350.529 " />
        <polyline points="473.742,350.529 470.631,358.921 " />
        <polyline points="470.631,358.921 480.959,362.749 " />
        <polyline points="480.959,362.749 484.439,354.883 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 406.832 300.931)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-006</text>
        <text transform="matrix(0.810279 0 -0 1.01285 406.882 302.673)" font-family="Arial,'sans-serif'" font-size="1.39636" >399&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 405.185 304.521)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#26223;&#33635;(&#24050;&#25925;)</text>
        <text transform="matrix(0.810279 0 -0 1.01285 418.704 300.043)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-005</text>
        <text transform="matrix(0.810279 0 -0 1.01285 418.754 301.785)" font-family="Arial,'sans-serif'" font-size="1.39636" >397&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 418.566 303.704)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#36827;&#26126;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 423.444 309.378)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-004</text>
        <text transform="matrix(0.810279 0 -0 1.01285 423.494 311.119)" font-family="Arial,'sans-serif'" font-size="1.39636" >391&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 423.306 313.047)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24503;&#29748;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 438.837 304.392)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-003</text>
        <text transform="matrix(0.810279 0 -0 1.01285 438.887 306.134)" font-family="Arial,'sans-serif'" font-size="1.39636" >393&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 438.699 308.061)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#29577;&#26149;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 448.168 302.496)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-028</text>
        <text transform="matrix(0.810279 0 -0 1.01285 448.218 304.237)" font-family="Arial,'sans-serif'" font-size="1.39636" >299&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 448.03 306.165)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#26223;&#36149;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 466.786 307.517)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-029</text>
        <text transform="matrix(0.810279 0 -0 1.01285 466.835 309.258)" font-family="Arial,'sans-serif'" font-size="1.39636" >303&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 466.648 311.186)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#26149;&#20964;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 475.224 308.217)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-022</text>
        <text transform="matrix(0.810279 0 -0 1.01285 475.274 309.958)" font-family="Arial,'sans-serif'" font-size="1.39636" >309&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 475.086 311.889)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#24198;&#26377;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 484.176 308.292)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-025</text>
        <text transform="matrix(0.810279 0 -0 1.01285 484.225 310.033)" font-family="Arial,'sans-serif'" font-size="1.39636" >243&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 484.038 311.967)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#29577;&#24179;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 498.876 318.023)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-026</text>
        <text transform="matrix(0.810279 0 -0 1.01285 498.925 319.764)" font-family="Arial,'sans-serif'" font-size="1.39636" >247&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 498.738 321.692)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#32500;&#26376;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 489.525 324.505)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-027</text>
        <text transform="matrix(0.810279 0 -0 1.01285 489.575 326.246)" font-family="Arial,'sans-serif'" font-size="1.39636" >255&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 489.387 328.174)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#20250;&#25165;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 482.549 324.085)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-031</text>
        <text transform="matrix(0.810279 0 -0 1.01285 482.599 325.827)" font-family="Arial,'sans-serif'" font-size="1.39636" >241&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 482.411 327.757)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#23453;&#36149;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 497.501 333.847)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-032</text>
        <text transform="matrix(0.810279 0 -0 1.01285 497.55 335.589)" font-family="Arial,'sans-serif'" font-size="1.39636" >251&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 497.362 337.519)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#38271;&#21033;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="503.261,331.09 502.336,339.218 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 455.439 344.9)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-030</text>
        <text transform="matrix(0.810279 0 -0 1.01285 455.488 346.642)" font-family="Arial,'sans-serif'" font-size="1.39636" >323&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 455.301 348.57)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21556;&#20250;&#20891;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="453.672,336.08 461.868,336.834 " />
        <polyline points="453.672,336.08 453.349,353.05 " />
        <polyline points="453.349,353.05 453.194,353.063 " />
        <polyline points="453.194,353.063 452.704,357.078 " />
        <polyline points="452.704,357.078 458.375,357.532 " />
        <polyline points="458.375,357.532 458.53,356.446 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 472.739 330.679)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-024</text>
        <text transform="matrix(0.810279 0 -0 1.01285 472.788 332.42)" font-family="Arial,'sans-serif'" font-size="1.39636" >233&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 472.6 334.345)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#33521;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 464.607 329.681)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-023</text>
        <text transform="matrix(0.810279 0 -0 1.01285 464.656 331.423)" font-family="Arial,'sans-serif'" font-size="1.39636" >235&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 464.469 333.351)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#38271;&#28023;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 462.63 360.705)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-018</text>
        <text transform="matrix(0.810279 0 -0 1.01285 462.68 362.447)" font-family="Arial,'sans-serif'" font-size="1.39636" >333&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 462.492 364.377)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#26149;&#33635;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 475.614 355.004)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-001</text>
        <text transform="matrix(0.810279 0 -0 1.01285 475.663 356.745)" font-family="Arial,'sans-serif'" font-size="1.39636" >317&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 475.475 358.67)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36213;&#28949;&#28165;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 487.506 345.686)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-017</text>
        <text transform="matrix(0.810279 0 -0 1.01285 487.555 347.427)" font-family="Arial,'sans-serif'" font-size="1.39636" >315&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 487.368 349.35)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#26223;&#20029;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 480.741 344.065)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-021</text>
        <text transform="matrix(0.810279 0 -0 1.01285 480.79 345.807)" font-family="Arial,'sans-serif'" font-size="1.39636" >325&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 480.603 347.734)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#21355;&#19996;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 475.583 341.663)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-020</text>
        <text transform="matrix(0.810279 0 -0 1.01285 475.632 343.405)" font-family="Arial,'sans-serif'" font-size="1.39636" >327&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 475.445 345.332)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#19977;&#21916;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 470.141 340.928)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-019</text>
        <text transform="matrix(0.810279 0 -0 1.01285 470.191 342.669)" font-family="Arial,'sans-serif'" font-size="1.39636" >329&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 470.003 344.6)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#23567;&#26377;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 462.292 352.225)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-002</text>
        <text transform="matrix(0.810279 0 -0 1.01285 460.894 353.972)" font-family="Arial,'sans-serif'" font-size="1.39636" >331&#21495;&#20869;1&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 462.153 355.897)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#31168;&#28165;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 455.489 330.151)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-007</text>
        <text transform="matrix(0.810279 0 -0 1.01285 455.539 331.892)" font-family="Arial,'sans-serif'" font-size="1.39636" >237&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 455.351 333.823)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#40644;&#24314;&#32418;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 455.17 321.23)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-009</text>
        <text transform="matrix(0.810279 0 -0 1.01285 455.22 322.972)" font-family="Arial,'sans-serif'" font-size="1.39636" >301&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 455.032 324.91)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#23453;&#20848;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 465.236 322.563)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-008</text>
        <text transform="matrix(0.810279 0 -0 1.01285 465.285 324.305)" font-family="Arial,'sans-serif'" font-size="1.39636" >307&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 465.664 326.21)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#20891;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 465.825 315.434)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-006</text>
        <text transform="matrix(0.810279 0 -0 1.01285 465.874 317.175)" font-family="Arial,'sans-serif'" font-size="1.39636" >305&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 463.423 319.106)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#30000;&#24314;&#20013;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 473.907 315.895)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-014</text>
        <text transform="matrix(0.810279 0 -0 1.01285 473.957 317.636)" font-family="Arial,'sans-serif'" font-size="1.39636" >311&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 473.769 319.567)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#26469;&#39034;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 492.843 308.806)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-010</text>
        <text transform="matrix(0.810279 0 -0 1.01285 492.893 310.548)" font-family="Arial,'sans-serif'" font-size="1.39636" >245&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 492.705 312.473)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#25991;&#27700;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="497.341,306.535 497.322,315.615 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 498.521 309.994)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-015</text>
        <text transform="matrix(0.810279 0 -0 1.01285 498.55 311.741)" font-family="Arial,'sans-serif'" font-size="1.39636" >245&#21495;&#20869;1&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 498.382 313.666)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#29577;&#29618;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 498.35 325.804)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-016</text>
        <text transform="matrix(0.810279 0 -0 1.01285 498.4 327.546)" font-family="Arial,'sans-serif'" font-size="1.39636" >249&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 498.778 329.473)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24247;&#21326;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 505.324 334.506)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-004</text>
        <text transform="matrix(0.810279 0 -0 1.01285 505.374 336.247)" font-family="Arial,'sans-serif'" font-size="1.39636" >253&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 505.186 338.175)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#38271;&#21326;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 489.105 332.202)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-005</text>
        <text transform="matrix(0.810279 0 -0 1.01285 489.154 333.943)" font-family="Arial,'sans-serif'" font-size="1.39636" >389&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 488.966 335.871)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24464;&#32493;&#26149;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 481.942 331.004)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-011</text>
        <text transform="matrix(0.810279 0 -0 1.01285 481.992 332.745)" font-family="Arial,'sans-serif'" font-size="1.39636" >239&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 482.37 334.668)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#26126;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 473.034 324.026)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-013</text>
        <text transform="matrix(0.810279 0 -0 1.01285 473.083 325.768)" font-family="Arial,'sans-serif'" font-size="1.39636" >313&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 472.895 327.696)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#32988;&#24378;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 462.873 340.112)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-6-003</text>
        <text transform="matrix(0.810279 0 -0 1.01285 462.923 341.853)" font-family="Arial,'sans-serif'" font-size="1.39636" >331&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 461.226 343.704)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#21551;&#20852;(&#24050;&#25925;)</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="304.033,288.05 314.429,287.005 " />
        <polyline points="314.429,287.005 315.653,295.787 " />
        <polyline points="315.653,295.787 305.147,297.216 " />
        <polyline points="305.147,297.216 304.033,288.05 " />
        <polyline points="308.863,304.077 316.797,303.076 " />
        <polyline points="316.797,303.076 317.89,311.18 " />
        <polyline points="317.89,311.18 310.002,312.073 " />
        <polyline points="310.002,312.073 308.863,304.077 " />
        <polyline points="318.226,303.005 325.302,302.004 " />
        <polyline points="325.302,302.004 326.445,309.508 " />
        <polyline points="326.445,309.508 319.288,310.615 " />
        <polyline points="319.288,310.615 318.226,303.005 " />
        <polyline points="317.873,302.374 325.281,301.417 " />
        <polyline points="325.281,301.417 324.362,294.307 " />
        <polyline points="324.362,294.307 316.954,295.265 " />
        <polyline points="316.954,295.265 317.872,302.374 " />
        <polyline points="326.017,294.143 333.337,293.282 " />
        <polyline points="333.337,293.282 334.164,300.646 " />
        <polyline points="334.164,300.646 326.874,301.575 " />
        <polyline points="326.874,301.575 326.017,294.143 " />
        <polyline points="326.874,301.575 327.946,309.008 " />
        <polyline points="327.946,309.008 335.022,307.936 " />
        <polyline points="335.022,307.936 334.164,300.646 " />
        <polyline points="334.164,300.646 341.598,299.542 " />
        <polyline points="341.383,299.574 342.312,306.935 " />
        <polyline points="342.312,306.935 335.022,307.936 " />
        <polyline points="342.959,299.367 349.744,298.458 " />
        <polyline points="349.744,298.458 350.723,305.771 " />
        <polyline points="350.723,305.771 343.939,306.679 " />
        <polyline points="343.939,306.679 342.959,299.367 " />
        <polyline points="350.723,305.771 358.034,304.947 " />
        <polyline points="358.034,304.947 357.327,300.279 " />
        <polyline points="357.327,300.279 358.643,300.063 " />
        <polyline points="358.643,300.063 358.179,297.241 " />
        <polyline points="358.179,297.241 349.75,298.507 " />
        <polyline points="358.643,300.063 359.395,304.628 " />
        <polyline points="359.395,304.628 366.011,303.54 " />
        <polyline points="366.011,303.54 364.788,296.106 " />
        <polyline points="364.788,296.106 358.179,297.241 " />
        <polyline points="366.171,303.493 374,302.348 " />
        <polyline points="374,302.348 372.973,295.144 " />
        <polyline points="372.973,295.144 365.111,296.073 " />
        <polyline points="365.111,296.073 366.171,303.493 " />
        <polyline points="373.195,295.119 384.766,293.428 " />
        <polyline points="384.766,293.428 385.623,300.575 " />
        <polyline points="385.623,300.575 374.457,302.346 " />
        <polyline points="374.457,302.346 373.195,295.119 " />
        <polyline points="360.752,289.712 361.602,296.653 " />
        <polyline points="360.752,289.712 348.816,291.356 " />
        <polyline points="348.816,291.356 349.503,298.491 " />
        <polyline points="416.072,270.631 425.006,269.631 " />
        <polyline points="425.006,269.631 425.866,279.476 " />
        <polyline points="425.866,279.476 417.31,280.732 " />
        <polyline points="417.31,280.732 416.055,270.495 " />
        <polyline points="391.771,303.887 392.909,303.798 " />
        <polyline points="392.909,303.798 392.515,299.084 " />
        <polyline points="392.515,299.084 402.424,298.455 " />
        <polyline points="402.424,298.455 402.917,306.938 " />
        <polyline points="402.917,306.938 392.076,307.786 " />
        <polyline points="392.076,307.786 391.771,303.887 " />
        <polyline points="426.236,299.197 434.096,299.031 " />
        <polyline points="434.096,299.031 434.961,306.538 " />
        <polyline points="434.961,306.538 426.224,306.492 " />
        <polyline points="426.224,306.492 426.236,299.197 " />
        <polyline points="415.708,357.675 423.856,357.461 " />
        <polyline points="423.856,357.461 424.26,367.112 " />
        <polyline points="424.26,367.112 416.565,367.394 " />
        <polyline points="416.565,367.394 415.708,357.675 " />
        <polyline points="426.072,367.07 434.502,367.479 " />
        <polyline points="434.502,367.479 434.084,376.371 " />
        <polyline points="434.084,376.371 425.713,375.112 " />
        <polyline points="425.713,375.112 426.072,367.07 " />
        <polyline points="454.786,368.557 463.106,372.915 " />
        <polyline points="463.106,372.915 456.8,385.475 " />
        <polyline points="456.8,385.475 448.296,381.044 " />
        <polyline points="448.296,381.044 454.786,368.557 " />
        <polyline points="463.106,372.915 465.878,368.823 " />
        <polyline points="465.878,368.823 470.528,371.96 " />
        <polyline points="470.528,371.96 460.231,386.404 " />
        <polyline points="460.231,386.404 457.073,384.93 " />
        <polyline points="413.424,321.442 421.614,320.667 " />
        <polyline points="421.614,320.667 421.779,323.743 " />
        <polyline points="421.779,323.743 422.527,323.776 " />
        <polyline points="422.527,323.776 422.819,326.513 " />
        <polyline points="422.819,326.513 423.083,331.197 " />
        <polyline points="423.083,331.197 423.083,331.197 " />
        <polyline points="423.083,331.197 421.458,331.338 " />
        <polyline points="421.458,331.338 422.41,342.537 " />
        <polyline points="422.41,342.537 415.043,342.719 " />
        <polyline points="415.043,342.719 414.83,331.968 " />
        <polyline points="414.83,331.968 414.076,332.018 " />
        <polyline points="414.076,332.018 413.424,321.442 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 454.201 374.987)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-023</text>
        <text transform="matrix(0.810279 0 -0 1.01285 454.251 376.729)" font-family="Arial,'sans-serif'" font-size="1.39636" >337&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 454.063 378.659)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36154;&#38081;&#26609;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 462.826 375.935)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-002</text>
        <text transform="matrix(0.810279 0 -0 1.01285 462.875 377.677)" font-family="Arial,'sans-serif'" font-size="1.39636" >335&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 462.688 379.604)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#33452;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 428.321 370.081)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-017</text>
        <text transform="matrix(0.810279 0 -0 1.01285 428.37 371.822)" font-family="Arial,'sans-serif'" font-size="1.39636" >339&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 428.183 373.744)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21494;&#28113;&#29748;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 418.29 360.647)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-001</text>
        <text transform="matrix(0.810279 0 -0 1.01285 418.339 362.389)" font-family="Arial,'sans-serif'" font-size="1.39636" >343&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 418.152 364.319)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24198;&#20113;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 416.395 330.964)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-022</text>
        <text transform="matrix(0.810279 0 -0 1.01285 416.445 332.705)" font-family="Arial,'sans-serif'" font-size="1.39636" >347&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 416.257 334.63)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#31435;&#27700;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 416.257 336.887)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#31435;&#27743;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 428.248 301.097)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-016</text>
        <text transform="matrix(0.810279 0 -0 1.01285 428.298 302.838)" font-family="Arial,'sans-serif'" font-size="1.39636" >395&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 428.11 304.763)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#29577;&#25935;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 395.946 301.639)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-020</text>
        <text transform="matrix(0.810279 0 -0 1.01285 395.996 303.381)" font-family="Arial,'sans-serif'" font-size="1.39636" >401&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 395.808 305.311)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#24800;&#21326;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 335.981 294.552)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-015</text>
        <text transform="matrix(0.810279 0 -0 1.01285 336.03 296.294)" font-family="Arial,'sans-serif'" font-size="1.39636" >483&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 335.842 298.227)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#29577;&#24196;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 378.016 296.745)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-021</text>
        <text transform="matrix(0.810279 0 -0 1.01285 378.066 298.486)" font-family="Arial,'sans-serif'" font-size="1.39636" >413&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 377.878 300.411)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#30003;&#20271;&#25165;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 368.037 297.672)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-012</text>
        <text transform="matrix(0.810279 0 -0 1.01285 368.087 299.413)" font-family="Arial,'sans-serif'" font-size="1.39636" >505&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 367.899 301.344)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#40644;&#36830;&#29983;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 360.496 298.992)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-013</text>
        <text transform="matrix(0.810279 0 -0 1.01285 360.546 300.734)" font-family="Arial,'sans-serif'" font-size="1.39636" >503&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 360.358 302.665)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24198;&#26149;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 352.193 300.348)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-007</text>
        <text transform="matrix(0.810279 0 -0 1.01285 352.242 302.09)" font-family="Arial,'sans-serif'" font-size="1.39636" >489&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 352.055 304.015)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21494;&#28113;&#21326;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 353.474 292.712)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-024</text>
        <text transform="matrix(0.810279 0 -0 1.01285 353.523 294.454)" font-family="Arial,'sans-serif'" font-size="1.39636" >491&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 353.902 296.381)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#40527;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 344.858 301.355)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-019</text>
        <text transform="matrix(0.810279 0 -0 1.01285 344.908 303.097)" font-family="Arial,'sans-serif'" font-size="1.39636" >485&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 344.72 305.03)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#38081;&#25104;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 336.194 302.298)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-018</text>
        <text transform="matrix(0.810279 0 -0 1.01285 336.244 304.039)" font-family="Arial,'sans-serif'" font-size="1.39636" >481&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 336.056 305.972)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#25991;&#23665;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 328.937 303.608)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-008</text>
        <text transform="matrix(0.810279 0 -0 1.01285 328.987 305.349)" font-family="Arial,'sans-serif'" font-size="1.39636" >477&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 327.29 307.203)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#31077;(&#38472;&#20445;&#21326;)</text>
        <text transform="matrix(0.810279 0 -0 1.01285 328.433 296.124)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-009</text>
        <text transform="matrix(0.810279 0 -0 1.01285 328.483 297.866)" font-family="Arial,'sans-serif'" font-size="1.39636" >479&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 328.295 299.796)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#20122;&#20848;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 320.11 305.151)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-010</text>
        <text transform="matrix(0.810279 0 -0 1.01285 320.159 306.892)" font-family="Arial,'sans-serif'" font-size="1.39636" >473&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 319.972 308.82)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#20250;&#37329;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 311.14 305.945)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-011</text>
        <text transform="matrix(0.810279 0 -0 1.01285 311.19 307.687)" font-family="Arial,'sans-serif'" font-size="1.39636" >467&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 311.568 309.62)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36213;&#36229;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 307.79 290.252)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-014</text>
        <text transform="matrix(0.810279 0 -0 1.01285 307.839 291.993)" font-family="Arial,'sans-serif'" font-size="1.39636" >471&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 308.218 293.93)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#29983;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 319.355 296.68)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-4-025</text>
        <text transform="matrix(0.810279 0 -0 1.01285 319.404 298.421)" font-family="Arial,'sans-serif'" font-size="1.39636" >475&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 319.217 300.349)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#26149;&#31435;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="228.602,310.866 237.536,309.651 " />
        <polyline points="237.536,309.651 239.274,320.081 " />
        <polyline points="239.274,320.081 230.655,321.517 " />
        <polyline points="230.655,321.517 228.602,310.866 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 231.937 313.559)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-001</text>
        <text transform="matrix(0.810279 0 -0 1.01285 232.317 315.301)" font-family="Arial,'sans-serif'" font-size="1.39636" >531&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 232.129 317.234)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#28113;&#29645;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 223.299 315.306)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-002</text>
        <text transform="matrix(0.810279 0 -0 1.01285 223.679 317.047)" font-family="Arial,'sans-serif'" font-size="1.39636" >567&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 221.228 318.978)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#33521;&#65288;&#24050;&#25925;&#65289;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="228.602,310.866 219.525,312.295 " />
        <polyline points="219.525,312.295 221.43,322.761 " />
        <polyline points="221.43,322.761 230.655,321.517 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 215.481 316.097)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-003</text>
        <text transform="matrix(0.810279 0 -0 1.01285 216.442 317.838)" font-family="Arial,'sans-serif'" font-size="1.39636" >573&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 216.255 319.78)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23385;&#23453;&#24544;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="221.42,322.705 210.449,324.515 " />
        <polyline points="210.449,324.515 208.662,313.867 " />
        <polyline points="215.821,323.629 214.254,313.058 " />
        <polyline points="208.662,313.867 219.525,312.295 " />
        <polyline points="215.881,325.302 219.598,324.877 " />
        <polyline points="219.598,324.877 219.923,327.297 " />
        <polyline points="219.923,327.297 216.167,327.803 " />
        <polyline points="216.167,327.803 215.881,325.302 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 215.775 325.532)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-004</text>
        <text transform="matrix(0.810279 0 -0 1.01285 216.175 326.858)" font-family="Arial,'sans-serif'" font-size="1.39636" >569&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 216.553 328.451)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23385;&#25165;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="208.662,313.867 201.3,315.011 " />
        <polyline points="201.3,315.011 202.516,323.658 " />
        <polyline points="202.516,323.658 205.232,323.229 " />
        <polyline points="205.232,323.229 205.421,324.194 " />
        <polyline points="205.421,324.194 210.293,323.584 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 203.557 318.008)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-006</text>
        <text transform="matrix(0.810279 0 -0 1.01285 204.357 319.749)" font-family="Arial,'sans-serif'" font-size="1.39636" >571&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 204.169 321.677)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#28113;&#21326;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 196.385 295.839)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-007</text>
        <text transform="matrix(0.810279 0 -0 1.01285 197.185 297.581)" font-family="Arial,'sans-serif'" font-size="1.39636" >549&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 196.997 299.517)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23385;&#23453;&#29738;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="193.152,293.214 202.586,291.499 " />
        <polyline points="202.586,291.499 204.212,301.267 " />
        <polyline points="204.212,301.267 194.285,302.98 " />
        <polyline points="194.285,302.98 193.152,293.214 " />
        <polyline points="222.599,324.587 231.461,322.8 " />
        <polyline points="231.461,322.8 233.113,331.16 " />
        <polyline points="233.113,331.16 224.1,333.091 " />
        <polyline points="224.1,333.091 222.599,324.587 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 225.877 326.891)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-008</text>
        <text transform="matrix(0.810279 0 -0 1.01285 226.257 328.632)" font-family="Arial,'sans-serif'" font-size="1.39636" >565&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 226.069 330.565)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#29577;&#31168;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 205.027 293.988)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-010</text>
        <text transform="matrix(0.810279 0 -0 1.01285 205.408 295.729)" font-family="Arial,'sans-serif'" font-size="1.39636" >547&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 205.22 297.654)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#26223;&#26149;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="202.586,291.499 210.019,290.427 " />
        <polyline points="210.019,290.427 211.548,299.784 " />
        <polyline points="211.548,299.784 204.168,300.99 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 187.188 300.971)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-011</text>
        <text transform="matrix(0.810279 0 -0 1.01285 187.568 302.712)" font-family="Arial,'sans-serif'" font-size="1.39636" >577&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 187.38 304.64)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#24503;&#26149;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="184.147,299.646 192.081,298.512 " />
        <polyline points="192.081,298.512 193.51,307.007 " />
        <polyline points="185.862,308.15 184.147,299.646 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 221.929 299.471)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-012</text>
        <text transform="matrix(0.810279 0 -0 1.01285 221.202 300.911)" font-family="Arial,'sans-serif'" font-size="1.39636" >537&#21495;&#20869;1&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 222.376 302.331)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#37329;&#33635;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="218.332,300.618 225.671,299.574 " />
        <polyline points="225.671,299.574 227.231,309.744 " />
        <polyline points="227.231,309.744 219.524,310.805 " />
        <polyline points="219.524,310.805 218.332,300.618 " />
        <polyline points="221.945,300.103 222.372,302.869 " />
        <polyline points="222.372,302.869 226.089,302.299 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 220.748 305.112)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-013</text>
        <text transform="matrix(0.810279 0 -0 1.01285 221.467 306.547)" font-family="Arial,'sans-serif'" font-size="1.39636" >537&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 221.195 308.384)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20219;&#21271;&#24179;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 208.783 284.163)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-014</text>
        <text transform="matrix(0.810279 0 -0 1.01285 209.502 285.597)" font-family="Arial,'sans-serif'" font-size="1.39636" >545&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 209.229 287.434)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#32487;&#25991;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="210.117,291.028 219.457,288.738 " />
        <polyline points="219.457,288.738 221.711,297.928 " />
        <polyline points="221.711,297.928 212.337,300.227 " />
        <polyline points="212.337,300.227 210.117,291.028 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 176.162 297.383)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-016</text>
        <text transform="matrix(0.810279 0 -0 1.01285 176.881 299.127)" font-family="Arial,'sans-serif'" font-size="1.39636" >585&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 176.609 300.969)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36213;&#28113;&#20848;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="173.211,295.715 181.502,294.786 " />
        <polyline points="181.502,294.786 182.465,301.345 " />
        <polyline points="182.465,301.345 174.232,302.733 " />
        <polyline points="174.232,302.733 173.211,295.715 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 176.841 305.378)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-015</text>
        <text transform="matrix(0.810279 0 -0 1.01285 177.56 307.122)" font-family="Arial,'sans-serif'" font-size="1.39636" >583&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 177.288 308.962)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25991;&#24800;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="174.232,302.733 175.33,310.288 " />
        <polyline points="175.33,310.288 183.65,309.098 " />
        <polyline points="183.65,309.098 182.313,301.373 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 235.622 331.28)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-017</text>
        <text transform="matrix(0.810279 0 -0 1.01285 236.341 333.024)" font-family="Arial,'sans-serif'" font-size="1.39636" >527&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 236.069 334.859)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#28113;&#25935;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="232.926,330.212 241.365,328.747 " />
        <polyline points="241.365,328.747 242.709,335.673 " />
        <polyline points="242.709,335.673 236.107,336.95 " />
        <polyline points="236.107,336.95 235.249,336.807 " />
        <polyline points="235.249,336.807 234.463,336.093 " />
        <polyline points="234.463,336.093 234.107,336.167 " />
        <polyline points="234.107,336.167 233.113,331.16 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 234.456 323.937)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-018</text>
        <text transform="matrix(0.810279 0 -0 1.01285 235.176 325.681)" font-family="Arial,'sans-serif'" font-size="1.39636" >528&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 234.903 327.515)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#28113;&#25935;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="231.461,322.8 239.895,321.228 " />
        <polyline points="239.895,321.228 241.365,328.747 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 202.473 306.812)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-019</text>
        <text transform="matrix(0.810279 0 -0 1.01285 203.193 308.556)" font-family="Arial,'sans-serif'" font-size="1.39636" >539&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 202.92 310.393)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#23567;&#24179;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="206.589,302.576 208.175,312.369 " />
        <polyline points="208.175,312.369 202.736,313.118 " />
        <polyline points="202.736,313.118 201.075,303.531 " />
        <polyline points="201.075,303.531 206.587,302.567 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 197.054 307.191)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-020</text>
        <text transform="matrix(0.810279 0 -0 1.01285 197.774 308.935)" font-family="Arial,'sans-serif'" font-size="1.39636" >541&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 197.501 310.773)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#23567;&#21326;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="201.075,303.531 195.868,304.434 " />
        <polyline points="195.868,304.434 197.298,313.867 " />
        <polyline points="197.298,313.867 202.736,313.118 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 224.408 288.676)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-021</text>
        <text transform="matrix(0.810279 0 -0 1.01285 225.127 290.42)" font-family="Arial,'sans-serif'" font-size="1.39636" >543&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 224.855 292.258)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#24314;&#21326;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="220.025,286.139 230.762,283.854 " />
        <polyline points="230.762,283.854 233.524,295.915 " />
        <polyline points="233.524,295.915 222.955,298.288 " />
        <polyline points="222.955,298.288 220.025,286.139 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 229.227 302.714)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-009</text>
        <text transform="matrix(0.810279 0 -0 1.01285 229.946 304.458)" font-family="Arial,'sans-serif'" font-size="1.39636" >535&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 229.674 306.295)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#36149;&#29983;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="225.671,299.574 235.034,297.931 " />
        <polyline points="235.034,297.931 237.214,308.468 " />
        <polyline points="237.214,308.468 227.29,310.103 " />
        <polyline points="227.29,310.103 227.231,309.744 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 192.572 284.994)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-022</text>
        <text transform="matrix(0.810279 0 -0 1.01285 193.292 286.738)" font-family="Arial,'sans-serif'" font-size="1.39636" >551&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 193.019 288.575)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21340;&#24800;&#26519;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="191.151,280.986 196.912,280.243 " />
        <polyline points="196.912,280.243 198.44,291.142 " />
        <polyline points="198.44,291.142 192.664,292.141 " />
        <polyline points="192.664,292.141 191.151,280.986 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 184.097 285.592)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-023</text>
        <text transform="matrix(0.810279 0 -0 1.01285 184.816 287.336)" font-family="Arial,'sans-serif'" font-size="1.39636" >581&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 182.28 289.173)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#31179;&#31435;&#65288;&#24050;&#25925;&#65289;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="181.358,283.495 189.149,282.208 " />
        <polyline points="189.149,282.208 190.721,290.498 " />
        <polyline points="190.721,290.498 182.717,291.427 " />
        <polyline points="182.717,291.427 181.358,283.495 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 213.939 305.032)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-025</text>
        <text transform="matrix(0.810279 0 -0 1.01285 214.658 306.776)" font-family="Arial,'sans-serif'" font-size="1.39636" >533&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 214.386 308.613)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21340;&#24800;&#38134;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="206.587,302.567 218.359,300.804 " />
        <polyline points="208.175,312.369 219.524,310.805 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 214.187 292.251)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-026</text>
        <text transform="matrix(0.810279 0 -0 1.01285 214.907 293.995)" font-family="Arial,'sans-serif'" font-size="1.39636" >545&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 214.634 295.837)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#32487;&#27494;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="205.516,282.566 206.159,282.494 " />
        <polyline points="206.159,282.494 205.753,280.137 " />
        <polyline points="205.753,280.137 214.403,278.833 " />
        <polyline points="214.403,278.833 214.771,281.247 " />
        <polyline points="214.771,281.247 215.736,281.139 " />
        <polyline points="215.736,281.139 216.822,289.228 " />
        <polyline points="216.822,289.228 210.019,290.427 " />
        <polyline points="205.516,282.566 206.384,290.951 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 200.091 284.109)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-027</text>
        <text transform="matrix(0.810279 0 -0 1.01285 200.81 285.854)" font-family="Arial,'sans-serif'" font-size="1.39636" >553&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 200.538 287.688)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21340;&#24800;&#33593;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="198.44,291.142 206.276,289.901 " />
        <polyline points="196.912,280.243 196.902,280.157 " />
        <polyline points="196.902,280.157 198.068,280.017 " />
        <polyline points="198.068,280.017 197.949,279.024 " />
        <polyline points="197.949,279.024 204.966,278.182 " />
        <polyline points="204.966,278.182 205.39,281.71 " />
        <polyline points="205.39,281.71 205.516,282.566 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 185.253 293.252)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-028</text>
        <text transform="matrix(0.810279 0 -0 1.01285 185.972 294.996)" font-family="Arial,'sans-serif'" font-size="1.39636" >579&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 186.266 296.839)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23433;&#27665;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="190.721,290.498 192.08,298.502 " />
        <polyline points="184.147,299.646 182.717,291.427 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 188.386 310.99)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-029</text>
        <text transform="matrix(0.810279 0 -0 1.01285 189.105 312.734)" font-family="Arial,'sans-serif'" font-size="1.39636" >575&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 188.833 314.577)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#20964;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="293.64,348.17 302.359,346.669 " />
        <polyline points="294.917,355.56 295.284,357.611 " />
        <polyline points="295.284,357.611 303.894,356.173 " />
        <polyline points="303.894,356.173 303.702,355.04 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 297.147 350.231)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-021</text>
        <text transform="matrix(0.810279 0 -0 1.01285 296.081 351.978)" font-family="Arial,'sans-serif'" font-size="1.39636" >515&#21495;&#21450;&#20869;1</text>
        <text transform="matrix(0.810279 0 -0 1.01285 297.34 353.905)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21608;&#29577;&#29645;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="315.805,313.994 310.364,315.262 " />
        <polyline points="310.364,315.262 312.865,327.16 " />
        <polyline points="312.865,327.16 318.269,326.098 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 312.332 319.761)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-2-022</text>
        <text transform="matrix(0.810279 0 -0 1.01285 310.322 321.551)" font-family="Arial,'sans-serif'" font-size="1.39636" >465&#21495;&#20869;1&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 312.524 323.43)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#29577;&#24029;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="490.81,284.93 499.715,284.804 " />
        <polyline points="499.715,284.804 499.793,292.748 " />
        <polyline points="499.793,292.748 490.772,292.849 " />
        <polyline points="490.772,292.849 490.81,284.93 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 493.303 287.524)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-001</text>
        <text transform="matrix(0.810279 0 -0 1.01285 493.353 289.266)" font-family="Arial,'sans-serif'" font-size="1.39636" >289&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 493.165 291.191)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26460;&#28113;&#21531;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 476.189 288.113)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-002</text>
        <text transform="matrix(0.810279 0 -0 1.01285 476.238 289.854)" font-family="Arial,'sans-serif'" font-size="1.39636" >285&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 476.051 291.779)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#31119;&#25935;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="473.82,284.71 481.753,284.781 " />
        <polyline points="481.753,284.781 481.692,292.753 " />
        <polyline points="481.692,292.753 473.576,292.77 " />
        <polyline points="473.576,292.77 473.82,284.71 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 494.009 296.924)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-003</text>
        <text transform="matrix(0.810279 0 -0 1.01285 494.058 298.665)" font-family="Arial,'sans-serif'" font-size="1.39636" >267&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 493.871 300.593)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#33452;&#20250;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="491.401,294.214 499.477,294.214 " />
        <polyline points="499.477,294.214 499.476,301.575 " />
        <polyline points="499.476,301.575 491.257,301.575 " />
        <polyline points="491.257,301.575 491.401,294.214 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 467.289 296.655)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-004</text>
        <text transform="matrix(0.810279 0 -0 1.01285 467.339 298.396)" font-family="Arial,'sans-serif'" font-size="1.39636" >273&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 467.151 300.33)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#35060;&#37329;&#31119;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="464.874,294.468 473.15,294.427 " />
        <polyline points="473.15,294.427 473.188,302.117 " />
        <polyline points="473.188,302.117 464.913,302.158 " />
        <polyline points="464.913,302.158 464.874,294.468 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 419.716 283.196)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-005</text>
        <text transform="matrix(0.810279 0 -0 1.01285 419.765 284.937)" font-family="Arial,'sans-serif'" font-size="1.39636" >409&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 420.144 286.865)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#31077;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="333.337,293.282 340.675,292.254 " />
        <polyline points="340.675,292.254 341.598,299.542 " />
        <polyline points="416.815,280.77 424.934,280.136 " />
        <polyline points="424.934,280.136 425.858,288.61 " />
        <polyline points="425.858,288.61 417.57,289.539 " />
        <polyline points="417.57,289.539 416.815,280.77 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 440.87 289.563)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-006</text>
        <text transform="matrix(0.810279 0 -0 1.01285 440.92 291.304)" font-family="Arial,'sans-serif'" font-size="1.39636" >275&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 440.732 293.232)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20040;&#26149;&#21326;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="438.942,284.71 447.304,284.924 " />
        <polyline points="447.304,284.924 447.018,296.099 " />
        <polyline points="447.018,296.099 438.696,295.958 " />
        <polyline points="438.696,295.958 438.942,284.71 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 403.032 285.764)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-007</text>
        <text transform="matrix(0.810279 0 -0 1.01285 403.082 287.505)" font-family="Arial,'sans-serif'" font-size="1.39636" >405&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 402.894 289.43)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#38271;&#31119;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="400.583,282.488 408.474,281.795 " />
        <polyline points="408.474,281.795 409.253,290.674 " />
        <polyline points="409.253,290.674 401.363,291.367 " />
        <polyline points="401.363,291.367 400.583,282.488 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 394.995 285.322)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-008</text>
        <text transform="matrix(0.810279 0 -0 1.01285 395.044 287.064)" font-family="Arial,'sans-serif'" font-size="1.39636" >403&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 394.857 288.991)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21556;&#20250;&#27946;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="392.414,283.137 400.276,282.566 " />
        <polyline points="400.276,282.566 401.133,291.07 " />
        <polyline points="401.133,291.07 393.414,291.785 " />
        <polyline points="393.414,291.785 392.414,283.137 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 394.041 275.87)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-009</text>
        <text transform="matrix(0.810279 0 -0 1.01285 394.09 277.611)" font-family="Arial,'sans-serif'" font-size="1.39636" >377&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 393.903 279.539)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#37329;&#33805;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="391.557,272.99 399.419,272.203 " />
        <polyline points="399.419,272.203 400.412,281.138 " />
        <polyline points="400.412,281.138 392.346,281.869 " />
        <polyline points="392.346,281.869 391.557,272.99 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 410.118 273.638)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-010</text>
        <text transform="matrix(0.810279 0 -0 1.01285 410.168 275.38)" font-family="Arial,'sans-serif'" font-size="1.39636" >381&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 409.98 277.307)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#26149;&#33635;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="407.495,271.489 416.055,270.495 " />
        <polyline points="417.113,279.118 408.495,279.922 " />
        <polyline points="408.495,279.922 407.495,271.489 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 419.435 273.344)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-011</text>
        <text transform="matrix(0.810279 0 -0 1.01285 419.484 275.085)" font-family="Arial,'sans-serif'" font-size="1.39636" >383&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 419.296 277.013)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24247;&#33395;&#33805;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 411.404 284.336)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-012</text>
        <text transform="matrix(0.810279 0 -0 1.01285 411.454 286.078)" font-family="Arial,'sans-serif'" font-size="1.39636" >407&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 411.266 288.008)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#39532;&#31168;&#26757;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="408.474,281.795 416.815,280.77 " />
        <polyline points="417.57,289.539 409.253,290.674 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 417.97 262.969)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-013</text>
        <text transform="matrix(0.810279 0 -0 1.01285 418.019 264.71)" font-family="Arial,'sans-serif'" font-size="1.39636" >375&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 418.397 266.635)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#38686;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="415.156,260.419 423.258,259.755 " />
        <polyline points="423.258,259.755 423.961,268.329 " />
        <polyline points="423.961,268.329 415.85,268.887 " />
        <polyline points="415.85,268.887 415.156,260.419 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 401.808 274.56)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-014</text>
        <text transform="matrix(0.810279 0 -0 1.01285 401.858 276.302)" font-family="Arial,'sans-serif'" font-size="1.39636" >379&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 401.67 278.23)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#23453;&#31108;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="399.419,272.203 407.495,271.489 " />
        <polyline points="408.495,279.922 400.412,281.138 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 484.999 296.312)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-015</text>
        <text transform="matrix(0.810279 0 -0 1.01285 485.049 298.053)" font-family="Arial,'sans-serif'" font-size="1.39636" >269&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 484.861 299.981)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#31168;&#33805;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="490.686,294.214 482.253,294.214 " />
        <polyline points="482.253,294.214 481.966,301.575 " />
        <polyline points="481.966,301.575 490.614,301.718 " />
        <polyline points="490.614,301.718 490.686,294.214 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 484.999 287.417)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-017</text>
        <text transform="matrix(0.810279 0 -0 1.01285 485.049 289.159)" font-family="Arial,'sans-serif'" font-size="1.39636" >287&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 484.861 291.092)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#29577;&#30707;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="490.81,284.93 482.377,284.889 " />
        <polyline points="482.377,284.889 482.339,292.808 " />
        <polyline points="482.339,292.808 490.772,292.849 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 467.816 288.517)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-018</text>
        <text transform="matrix(0.810279 0 -0 1.01285 467.866 290.258)" font-family="Arial,'sans-serif'" font-size="1.39636" >283&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 467.678 292.183)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#29577;&#33805;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="473.82,284.71 464.958,284.71 " />
        <polyline points="464.958,284.71 464.752,292.881 " />
        <polyline points="464.752,292.881 473.576,292.77 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 390.682 225.829)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-019</text>
        <text transform="matrix(0.810279 0 -0 1.01285 390.732 227.57)" font-family="Arial,'sans-serif'" font-size="1.39636" >363&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 390.544 229.487)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#24576;&#20891;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="388.058,224.179 395.777,223.107 " />
        <polyline points="395.777,223.107 396.992,230.468 " />
        <polyline points="396.992,230.468 389.201,231.612 " />
        <polyline points="389.201,231.612 388.058,224.179 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 399.099 214.499)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-020</text>
        <text transform="matrix(0.810279 0 -0 1.01285 399.148 216.241)" font-family="Arial,'sans-serif'" font-size="1.39636" >361&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 399.527 218.171)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#28966;&#39034;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="395.563,212.531 403.643,211.339 " />
        <polyline points="403.643,211.339 404.783,219.034 " />
        <polyline points="404.783,219.034 396.635,220.177 " />
        <polyline points="396.635,220.177 395.563,212.531 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 389.824 216.005)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-021</text>
        <text transform="matrix(0.810279 0 -0 1.01285 389.873 217.746)" font-family="Arial,'sans-serif'" font-size="1.39636" >359&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 390.252 219.677)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#28023;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="386.128,213.96 394.777,212.602 " />
        <polyline points="394.777,212.602 395.92,220.392 " />
        <polyline points="395.92,220.392 387.344,221.821 " />
        <polyline points="387.344,221.821 386.129,213.96 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 393.199 265.194)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-022</text>
        <text transform="matrix(0.810279 0 -0 1.01285 393.248 266.936)" font-family="Arial,'sans-serif'" font-size="1.39636" >369&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 393.061 268.863)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#27946;&#21916;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="398.289,262.308 390.486,263.056 " />
        <polyline points="390.486,263.056 390.755,271.619 " />
        <polyline points="390.755,271.619 399.094,270.707 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 476.133 296.375)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-023</text>
        <text transform="matrix(0.810279 0 -0 1.01285 476.182 298.117)" font-family="Arial,'sans-serif'" font-size="1.39636" >271&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 475.995 300.039)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20040;&#25391;&#27700;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="473.748,294.286 481.824,294.286 " />
        <polyline points="481.824,294.286 481.762,302.275 " />
        <polyline points="481.762,302.275 473.635,302.099 " />
        <polyline points="473.635,302.099 473.748,294.286 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 400.384 224.808)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-5-016</text>
        <text transform="matrix(0.810279 0 -0 1.01285 400.433 226.55)" font-family="Arial,'sans-serif'" font-size="1.39636" >365&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 400.246 228.477)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#32418;&#33805;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="396.992,222.607 406.355,221.249 " />
        <polyline points="406.355,221.249 407.758,231.747 " />
        <polyline points="407.758,231.747 398.503,233.097 " />
        <polyline points="398.503,233.097 396.992,222.607 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 210.189 317.577)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-005</text>
        <text transform="matrix(0.810279 0 -0 1.01285 211.15 319.318)" font-family="Arial,'sans-serif'" font-size="1.39636" >574&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 210.963 321.249)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23385;&#23453;&#31077;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="212.306,301.718 213.849,311.587 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(0.810279 0 -0 1.01285 208.05 304.258)" font-family="Arial,'sans-serif'" font-size="1.39636" >1-1-024</text>
        <text transform="matrix(0.810279 0 -0 1.01285 208.77 306.002)" font-family="Arial,'sans-serif'" font-size="1.39636" >557&#21495;</text>
        <text transform="matrix(0.810279 0 -0 1.01285 208.497 307.842)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21340;&#24800;&#20840;</text>
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
                    $("polyline").attr("stroke-width", "0.3242");
                    var fyId = $(this).attr("fyId");
                    pointsId = $(this).attr("id");
                    //if (fyId == "") {
                   // } else {
                        viewPoints();
                    //}
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
    
	


</script>
