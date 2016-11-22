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
            <h4 class="bold">第三标段电子地图数据查看</h4>
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
             <svg viewBox="50 200 600 360" id="svgElement" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round" xml:space="preserve"  style="left: -146.7px; top: 134.61px; position: relative; touch-action: none;">

        <g stroke-width="0.1" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" />
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="164.422,141.271 153.163,161.455 170.333,171.356 138.642,210.204 108.063,266.292 230.12,331.653 493.236,451.664 583.385,477.32 599.241,364.16 654.124,361.441 653.188,336.724 475.059,231.702 386.205,161.166 355.729,248.157 314.038,261.659 270.224,245.977 164.431,141.246 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.97106 0 -0 2.46382 276.911 319.761)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-1-007</text>
        <text transform="matrix(1.97106 0 -0 2.46382 278.388 327.342)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24800;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 277.933 323.394)" font-family="Arial,'sans-serif'" font-size="1.39636" >47&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="257.168,327.5 268.062,298.948 " />
        <polyline points="268.062,298.948 280.479,303.831 " />
        <polyline points="280.479,303.831 273.432,323.739 " />
        <polyline points="274.827,324.275 273.432,323.739 " />
        <polyline points="274.827,324.275 271.459,333.009 " />
        <polyline points="271.459,333.009 257.168,327.5 " />
        <polyline points="257.168,327.5 243.014,321.986 " />
        <polyline points="243.014,321.986 255.318,293.938 " />
        <polyline points="255.318,293.938 268.062,298.948 " />
        <polyline points="280.479,303.831 292.51,308.206 " />
        <polyline points="271.471,333.014 283.527,336.663 " />
        <polyline points="283.527,336.663 292.51,308.206 " />
        <polyline points="174.918,261.629 192.798,270.719 " />
        <polyline points="192.798,270.719 181.152,292.614 " />
        <polyline points="181.152,292.614 163.152,283.388 " />
        <polyline points="163.152,283.388 174.918,261.629 " />
        <polyline points="174.918,261.629 162.999,255.37 " />
        <polyline points="162.999,255.37 150.934,277.128 " />
        <polyline points="150.934,277.128 162.124,282.861 " />
        <polyline points="162.124,282.861 163.14,283.41 " />
        <polyline points="150.934,277.128 150.648,277.73 " />
        <polyline points="150.648,277.73 139.015,271.913 " />
        <polyline points="139.015,271.913 151.526,248.961 " />
        <polyline points="151.526,248.961 162.989,255.388 " />
        <polyline points="151.526,248.961 156.144,240.367 " />
        <polyline points="156.144,240.367 137.55,230.524 " />
        <polyline points="137.55,230.524 123.46,257.047 " />
        <polyline points="123.46,257.047 120.797,263.802 " />
        <polyline points="120.797,263.802 137.505,271.502 " />
        <polyline points="137.505,271.502 139.015,271.913 " />
        <polyline points="132.032,228.924 137.136,231.303 " />
        <polyline points="132.032,228.924 139.546,214.07 " />
        <polyline points="153.603,195.161 143.542,215.925 " />
        <polyline points="153.603,195.161 161.5,199.333 " />
        <polyline points="161.5,199.333 151.9,219.806 " />
        <polyline points="139.546,214.07 143.542,215.925 " />
        <polyline points="151.9,219.806 164.153,225.495 " />
        <polyline points="165.079,223.775 156.144,240.367 " />
        <polyline points="165.079,223.775 176.254,229.289 " />
        <polyline points="176.254,229.289 165.68,250.898 " />
        <polyline points="165.68,250.898 153.895,244.552 " />
        <polyline points="165.68,250.898 165.051,252.224 " />
        <polyline points="165.051,252.224 176.895,257.965 " />
        <polyline points="176.895,257.965 188.323,235.548 " />
        <polyline points="188.323,235.548 176.254,229.289 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.97106 0 -0 2.46382 264.946 312.955)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-1-001</text>
        <text transform="matrix(1.97106 0 -0 2.46382 265.046 320.543)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#28113;&#33714;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 265.968 316.588)" font-family="Arial,'sans-serif'" font-size="1.39636" >49&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 252.652 308.08)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-1-002</text>
        <text transform="matrix(1.97106 0 -0 2.46382 252.752 315.655)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#35060;&#24314;&#26126;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 253.674 311.713)" font-family="Arial,'sans-serif'" font-size="1.39636" >51&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 173.227 273.92)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-1-009</text>
        <text transform="matrix(1.97106 0 -0 2.46382 173.327 281.454)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#19975;&#39034;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 174.249 277.552)" font-family="Arial,'sans-serif'" font-size="1.39636" >65&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 159.546 265.773)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-1-005</text>
        <text transform="matrix(1.97106 0 -0 2.46382 159.646 273.341)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#25991;&#38761;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 160.568 269.406)" font-family="Arial,'sans-serif'" font-size="1.39636" >67&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 147.798 259.611)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-1-010</text>
        <text transform="matrix(1.97106 0 -0 2.46382 147.898 267.199)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#35060;&#37329;&#27874;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 148.82 263.244)" font-family="Arial,'sans-serif'" font-size="1.39636" >69&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 133.638 247.78)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-1-003</text>
        <text transform="matrix(1.97106 0 -0 2.46382 133.737 255.374)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#38271;&#20445;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 134.66 251.412)" font-family="Arial,'sans-serif'" font-size="1.39636" >71&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 173.487 241.294)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-1-008</text>
        <text transform="matrix(1.97106 0 -0 2.46382 173.587 248.875)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#19975;&#31077;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 174.509 244.927)" font-family="Arial,'sans-serif'" font-size="1.39636" >61&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 159.681 237.995)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-1-006</text>
        <text transform="matrix(1.97106 0 -0 2.46382 159.78 245.576)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#20806;&#26519;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 160.703 241.628)" font-family="Arial,'sans-serif'" font-size="1.39636" >63&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 141.608 222.902)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-1-004</text>
        <text transform="matrix(1.97106 0 -0 2.46382 141.708 230.477)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23828;&#24503;&#36132;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 142.63 226.535)" font-family="Arial,'sans-serif'" font-size="1.39636" >79&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="514.456,282.636 535.326,281.597 " />
        <polyline points="535.326,281.597 536.361,299.354 " />
        <polyline points="536.361,299.354 514.069,300.486 " />
        <polyline points="514.069,300.486 513.303,300.323 " />
        <polyline points="513.303,300.323 514.456,282.636 " />
        <polyline points="535.326,281.597 553.074,280.457 " />
        <polyline points="553.074,280.457 565.28,287.134 " />
        <polyline points="536.361,299.354 565.819,297.334 " />
        <polyline points="565.819,297.334 565.28,287.134 " />
        <polyline points="532.934,302.607 513.119,303.651 " />
        <polyline points="532.934,302.607 533.547,319.809 " />
        <polyline points="533.547,319.809 523.999,320.279 " />
        <polyline points="523.999,320.279 523.777,318.245 " />
        <polyline points="523.777,318.245 517.976,318.878 " />
        <polyline points="517.976,318.878 518.001,323.964 " />
        <polyline points="518.001,323.964 511.324,324.162 " />
        <polyline points="511.324,324.162 513.119,303.651 " />
        <polyline points="532.934,302.607 548.875,301.415 " />
        <polyline points="548.875,301.415 549.771,318.703 " />
        <polyline points="549.771,318.703 533.547,319.809 " />
        <polyline points="518.039,324.367 534.427,323.78 " />
        <polyline points="534.427,323.78 535.77,341.06 " />
        <polyline points="535.77,341.06 518.638,342.55 " />
        <polyline points="518.638,342.55 517.976,324.37 " />
        <polyline points="549.921,322.578 566.16,321.986 " />
        <polyline points="566.16,321.986 566.91,339.317 " />
        <polyline points="566.91,339.317 550.967,340.314 " />
        <polyline points="550.967,340.314 549.921,322.578 " />
        <polyline points="567.802,342.699 588.416,341.241 " />
        <polyline points="588.416,341.241 589.3,356.559 " />
        <polyline points="589.3,356.559 584.778,356.825 " />
        <polyline points="584.778,356.825 585.013,359.534 " />
        <polyline points="585.013,359.534 568.401,360.584 " />
        <polyline points="568.401,360.584 567.802,342.699 " />
        <polyline points="567.802,342.699 551.563,343.742 " />
        <polyline points="551.563,343.742 552.379,360.942 " />
        <polyline points="552.379,360.942 568.401,360.584 " />
        <polyline points="551.563,343.742 535.92,344.487 " />
        <polyline points="535.92,344.487 536.519,361.903 " />
        <polyline points="536.519,361.903 552.379,360.942 " />
        <polyline points="536.519,361.903 520.09,362.986 " />
        <polyline points="520.09,362.986 519.249,344.57 " />
        <polyline points="519.249,344.57 535.92,344.487 " />
        <polyline points="519.249,344.57 518.638,342.55 " />
        <polyline points="502.099,337.185 518.403,336.108 " />
        <polyline points="502.099,337.185 503.975,359.683 " />
        <polyline points="503.975,359.683 506.87,359.492 " />
        <polyline points="506.87,359.492 507.17,364.042 " />
        <polyline points="507.17,364.042 520.121,363.469 " />
        <polyline points="520.121,363.469 520.09,362.986 " />
        <polyline points="507.586,366.943 525.793,366.992 " />
        <polyline points="525.793,366.992 526.134,384.866 " />
        <polyline points="526.134,384.866 515.038,384.964 " />
        <polyline points="515.038,384.964 515.078,389.196 " />
        <polyline points="515.078,389.196 507.983,389.256 " />
        <polyline points="507.983,389.256 507.586,366.943 " />
        <polyline points="525.793,366.992 542.33,366.098 " />
        <polyline points="542.33,366.098 542.629,374.593 " />
        <polyline points="542.629,374.593 544.417,374.444 " />
        <polyline points="544.417,374.444 544.833,388.884 " />
        <polyline points="544.771,386.76 526.095,387.169 " />
        <polyline points="526.095,387.169 526.134,384.866 " />
        <polyline points="542.33,366.098 566.912,365.353 " />
        <polyline points="566.912,365.353 567.51,376.978 " />
        <polyline points="567.51,376.978 552.693,377.29 " />
        <polyline points="552.693,377.29 552.895,388.437 " />
        <polyline points="552.895,388.437 544.833,388.884 " />
        <polyline points="552.895,388.437 567.959,388.27 " />
        <polyline points="567.959,388.27 567.51,376.978 " />
        <polyline points="566.912,365.353 587.022,364.253 " />
        <polyline points="587.022,364.253 587.773,386.516 " />
        <polyline points="587.773,386.516 567.895,386.666 " />
        <polyline points="540.696,431.283 551.273,431.284 " />
        <polyline points="551.273,431.284 551.949,457.205 " />
        <polyline points="551.949,457.205 541.256,457.1 " />
        <polyline points="541.256,457.1 540.696,431.283 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.97106 0 -0 2.46382 541.601 443.33)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-014</text>
        <text transform="matrix(1.97106 0 -0 2.46382 543.078 450.918)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#28009;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 539.715 446.976)" font-family="Arial,'sans-serif'" font-size="1.39636" >127&#21495;&#20869;1</text>
        <text transform="matrix(1.97106 0 -0 2.46382 573.025 373.986)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-011</text>
        <text transform="matrix(1.97106 0 -0 2.46382 573.124 381.574)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#25991;&#21551;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 573.281 377.619)" font-family="Arial,'sans-serif'" font-size="1.39636" >115&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 556.175 380)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-017</text>
        <text transform="matrix(1.97106 0 -0 2.46382 556.275 387.594)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#25991;&#25919;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 556.432 383.632)" font-family="Arial,'sans-serif'" font-size="1.39636" >248&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 547.149 368.407)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-016(015)</text>
        <text transform="matrix(1.97106 0 -0 2.46382 546.553 376.313)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#25991;&#33521;  &#29976;&#27704;&#20449;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 546.794 372.163)" font-family="Arial,'sans-serif'" font-size="1.39636" >47&#21495;(125&#21495;)</text>
        <text transform="matrix(1.97106 0 -0 2.46382 530.111 374.651)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-013</text>
        <text transform="matrix(1.97106 0 -0 2.46382 530.21 382.233)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#23398;&#26126;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 530.367 378.284)" font-family="Arial,'sans-serif'" font-size="1.39636" >127&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 512.573 373.684)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-021</text>
        <text transform="matrix(1.97106 0 -0 2.46382 512.672 381.272)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#31168;&#29645;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 512.829 377.316)" font-family="Arial,'sans-serif'" font-size="1.39636" >129&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 506.675 346.663)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-010</text>
        <text transform="matrix(1.97106 0 -0 2.46382 508.151 354.258)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24222;&#31119;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 506.931 350.295)" font-family="Arial,'sans-serif'" font-size="1.39636" >113&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 523.345 350.362)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-008</text>
        <text transform="matrix(1.97106 0 -0 2.46382 523.445 357.957)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#25991;&#24800;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 523.601 353.995)" font-family="Arial,'sans-serif'" font-size="1.39636" >111&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 540.029 350.533)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-009</text>
        <text transform="matrix(1.97106 0 -0 2.46382 540.129 358.128)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#39321;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 540.286 354.166)" font-family="Arial,'sans-serif'" font-size="1.39636" >109&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 556.359 349.027)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-003</text>
        <text transform="matrix(1.97106 0 -0 2.46382 556.458 356.609)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#31243;&#29233;&#33593;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 556.615 352.66)" font-family="Arial,'sans-serif'" font-size="1.39636" >107&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 572.996 349.027)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-007</text>
        <text transform="matrix(1.97106 0 -0 2.46382 573.096 356.622)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#24535;&#24681;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 573.252 352.66)" font-family="Arial,'sans-serif'" font-size="1.39636" >105&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 553.974 328.51)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-006</text>
        <text transform="matrix(1.97106 0 -0 2.46382 554.073 336.098)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#26149;&#29983;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 554.996 332.142)" font-family="Arial,'sans-serif'" font-size="1.39636" >99&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 521.702 329.562)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-018</text>
        <text transform="matrix(1.97106 0 -0 2.46382 521.801 337.137)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#32654;&#20964;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 521.958 333.195)" font-family="Arial,'sans-serif'" font-size="1.39636" >103&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 518.464 307.93)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-005</text>
        <text transform="matrix(1.97106 0 -0 2.46382 513.056 315.525)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#23500;&#20426;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 519.486 311.563)" font-family="Arial,'sans-serif'" font-size="1.39636" >95&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 536.727 306.356)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-004</text>
        <text transform="matrix(1.97106 0 -0 2.46382 536.826 313.937)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#28113;&#33521;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 537.749 309.989)" font-family="Arial,'sans-serif'" font-size="1.39636" >93&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 520.512 288.35)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-002</text>
        <text transform="matrix(1.97106 0 -0 2.46382 520.612 295.898)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#29577;&#25991;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 521.534 291.983)" font-family="Arial,'sans-serif'" font-size="1.39636" >85&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 543.509 286.743)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-001</text>
        <text transform="matrix(1.97106 0 -0 2.46382 543.609 294.311)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20399;&#24314;&#24378;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 542.389 290.389)" font-family="Arial,'sans-serif'" font-size="1.39636" >85&#21495;&#20869;1</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="567.959,388.27 586.923,387.751 " />
        <polyline points="586.923,387.751 587.105,414.875 " />
        <polyline points="587.105,414.875 581.73,415.009 " />
        <polyline points="581.73,415.009 581.668,405.147 " />
        <polyline points="581.668,405.147 559.468,405.41 " />
        <polyline points="554.015,405.475 553.826,388.427 " />
        <polyline points="581.73,415.009 581.965,426.813 " />
        <polyline points="581.965,426.813 566.917,427.113 " />
        <polyline points="566.917,427.113 566.37,405.328 " />
        <polyline points="567.066,430.094 554.7,430.092 " />
        <polyline points="554.7,430.092 554.015,405.475 " />
        <polyline points="567.066,430.094 580.783,429.869 " />
        <polyline points="580.777,426.837 580.835,454.992 " />
        <polyline points="580.835,454.992 555.592,455.746 " />
        <polyline points="555.645,455.744 554.7,430.092 " />
        <polyline points="567.566,455.388 566.991,430.094 " />
        <polyline points="579.578,455.029 579.577,466.017 " />
        <polyline points="579.577,466.017 567.659,466.017 " />
        <polyline points="567.659,466.017 567.658,464.376 " />
        <polyline points="567.658,464.376 563.636,464.375 " />
        <polyline points="563.636,464.375 563.636,462.885 " />
        <polyline points="563.636,462.885 555.59,462.885 " />
        <polyline points="555.59,462.885 555.592,455.746 " />
        <polyline points="538.935,389.917 550.109,389.515 " />
        <polyline points="550.109,389.515 550.787,413.894 " />
        <polyline points="550.787,413.894 539.275,414.231 " />
        <polyline points="539.275,414.231 538.935,389.917 " />
        <polyline points="508.663,389.796 535.937,389.646 " />
        <polyline points="535.937,389.646 536.406,405.449 " />
        <polyline points="536.406,405.449 509.238,406.046 " />
        <polyline points="509.238,406.046 508.663,389.796 " />
        <polyline points="511.454,427.742 522.834,427.466 " />
        <polyline points="522.827,427.278 523.68,448.249 " />
        <polyline points="523.68,448.249 512.487,448.502 " />
        <polyline points="512.487,448.502 511.454,427.742 " />
        <polyline points="522.827,427.278 537.567,426.505 " />
        <polyline points="537.567,426.505 538.708,452.768 " />
        <polyline points="538.708,452.768 523.883,453.233 " />
        <polyline points="523.883,453.233 523.68,448.249 " />
        <polyline points="479.857,435.703 506.465,433.108 " />
        <polyline points="506.465,433.108 506.465,443.02 " />
        <polyline points="506.465,443.02 509.126,442.9 " />
        <polyline points="509.126,442.9 507.128,411.286 " />
        <polyline points="477.23,388.48 474.556,361.879 " />
        <polyline points="474.556,361.879 503.975,359.683 " />
        <polyline points="507.17,364.042 507.586,366.943 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.97106 0 -0 2.46382 487.464 374.537)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-015</text>
        <text transform="matrix(1.97106 0 -0 2.46382 487.563 382.132)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#37329;&#39321;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 487.72 378.17)" font-family="Arial,'sans-serif'" font-size="1.39636" >139&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 488.057 396.565)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-006</text>
        <text transform="matrix(1.97106 0 -0 2.46382 488.157 404.153)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#20122;&#24179;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 488.313 400.198)" font-family="Arial,'sans-serif'" font-size="1.39636" >141&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="477.228,388.454 503.083,385.683 " />
        <polyline points="505.138,411.522 502.757,381.579 " />
        <polyline points="502.757,381.579 507.842,381.304 " />
        <polyline points="477.228,388.454 480.036,414.498 " />
        <polyline points="480.036,414.498 507.128,411.286 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.97106 0 -0 2.46382 490.563 420.608)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-004</text>
        <text transform="matrix(1.97106 0 -0 2.46382 490.662 428.182)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#28113;&#33410;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 490.819 424.241)" font-family="Arial,'sans-serif'" font-size="1.39636" >143&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="480.036,414.498 480.555,420.63 " />
        <polyline points="480.555,420.63 479.857,435.703 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.97106 0 -0 2.46382 517.855 394.124)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-007</text>
        <text transform="matrix(1.97106 0 -0 2.46382 513.824 401.705)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#28113;&#25935;&#12289;&#38889;&#31481;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 511.837 397.757)" font-family="Arial,'sans-serif'" font-size="1.39636" >133&#21495;&#12289;133-1&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 513.661 433.838)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-010</text>
        <text transform="matrix(1.97106 0 -0 2.46382 513.761 441.426)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#24314;&#29983;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 513.917 437.471)" font-family="Arial,'sans-serif'" font-size="1.39636" >137&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 527.057 436.181)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-002</text>
        <text transform="matrix(1.97106 0 -0 2.46382 527.156 443.77)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#24314;&#22269;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 527.313 439.814)" font-family="Arial,'sans-serif'" font-size="1.39636" >153&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 540.114 397.822)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-001</text>
        <text transform="matrix(1.97106 0 -0 2.46382 540.214 405.396)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#24422;&#24179;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 540.37 401.454)" font-family="Arial,'sans-serif'" font-size="1.39636" >131&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 565.796 392.396)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-009</text>
        <text transform="matrix(1.97106 0 -0 2.46382 565.895 399.984)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#29577;&#20848;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 566.052 396.029)" font-family="Arial,'sans-serif'" font-size="1.39636" >117&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 569.887 414.729)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-008</text>
        <text transform="matrix(1.97106 0 -0 2.46382 569.987 422.317)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#24314;&#22269;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 570.143 418.362)" font-family="Arial,'sans-serif'" font-size="1.39636" >119&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 552.269 400.661)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-011</text>
        <text transform="matrix(1.97106 0 -0 2.46382 554.712 408.718)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#38634;&#28304;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 550.53 404.273)" font-family="Arial,'sans-serif'" font-size="1.39636" >137&#21495;&#20869;1</text>
        <text transform="matrix(1.97106 0 -0 2.46382 569.887 439.732)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-012</text>
        <text transform="matrix(1.97106 0 -0 2.46382 569.987 447.32)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#24314;&#27665;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 570.143 443.364)" font-family="Arial,'sans-serif'" font-size="1.39636" >119&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 556.746 439.732)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-014</text>
        <text transform="matrix(1.97106 0 -0 2.46382 556.846 447.32)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#22269;&#24198;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 557.002 443.364)" font-family="Arial,'sans-serif'" font-size="1.39636" >123&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 568.403 457.894)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-013</text>
        <text transform="matrix(1.97106 0 -0 2.46382 568.503 464.82)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#30003;&#29577;&#33805;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 568.659 461.035)" font-family="Arial,'sans-serif'" font-size="1.39636" >119&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="559.009,388.369 559.468,405.41 " />
        <polyline points="554.21,412.485 566.543,412.198 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.97106 0 -0 2.46382 556.227 419.046)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-010</text>
        <text transform="matrix(1.97106 0 -0 2.46382 556.478 427.102)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#24314;&#29983;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 556.631 422.644)" font-family="Arial,'sans-serif'" font-size="1.39636" >137&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="510.368,407.328 536.44,406.164 " />
        <polyline points="536.44,406.164 537.311,425.667 " />
        <polyline points="537.311,425.667 511.239,426.83 " />
        <polyline points="511.239,426.83 510.368,407.328 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.97106 0 -0 2.46382 517.25 415.481)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-4-005</text>
        <text transform="matrix(1.97106 0 -0 2.46382 517.35 423.055)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#20122;&#20891;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 517.506 419.113)" font-family="Arial,'sans-serif'" font-size="1.39636" >133&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="263.863,268.035 279.656,274.593 " />
        <polyline points="279.656,274.593 270.453,297.842 " />
        <polyline points="270.453,297.842 254.331,288.453 " />
        <polyline points="254.331,288.453 263.863,268.035 " />
        <polyline points="279.656,274.593 296.493,282.491 " />
        <polyline points="296.493,282.491 289.196,302.313 " />
        <polyline points="289.196,302.313 271.462,295.293 " />
        <polyline points="296.499,293.58 305.088,296.151 " />
        <polyline points="305.088,296.151 312.737,314.682 " />
        <polyline points="312.737,314.682 312.563,315.361 " />
        <polyline points="312.563,315.361 308.676,314.144 " />
        <polyline points="308.676,314.144 309.367,312.064 " />
        <polyline points="309.367,312.064 292.449,306.589 " />
        <polyline points="292.003,308.022 296.499,293.58 " />
        <polyline points="312.563,315.361 308.27,332.12 " />
        <polyline points="308.27,332.12 287.181,325.088 " />
        <polyline points="308.27,332.12 304.101,345.98 " />
        <polyline points="304.101,345.98 282.646,339.572 " />
        <polyline points="282.646,339.572 283.527,336.663 " />
        <polyline points="320.927,286.664 302.273,273.467 " />
        <polyline points="302.273,273.467 295.897,284.279 " />
        <polyline points="295.897,284.279 312.734,296.649 " />
        <polyline points="312.734,296.649 320.927,286.664 " />
        <polyline points="316.607,292.923 331.953,294.86 " />
        <polyline points="331.953,294.86 331.374,312.447 " />
        <polyline points="331.374,312.447 315.129,311.338 " />
        <polyline points="315.129,311.338 316.607,292.923 " />
        <polyline points="308.97,266.915 344.335,282.102 " />
        <polyline points="344.335,282.102 338.678,295.286 " />
        <polyline points="338.678,295.286 323.429,288.743 " />
        <polyline points="323.429,288.743 324.25,286.724 " />
        <polyline points="324.25,286.724 304.587,273.155 " />
        <polyline points="304.587,273.155 308.97,266.915 " />
        <polyline points="321.033,261.74 338.459,256.361 " />
        <polyline points="338.459,256.361 353.689,262.396 " />
        <polyline points="353.689,262.396 342.801,280.574 " />
        <polyline points="342.801,280.574 317.542,269.658 " />
        <polyline points="317.542,269.658 321.033,261.74 " />
        <polyline points="354.892,267.288 366.235,272.011 " />
        <polyline points="366.235,272.011 360.855,286.812 " />
        <polyline points="360.855,286.812 359.949,288.625 " />
        <polyline points="359.949,288.625 347.594,283.533 " />
        <polyline points="347.594,283.533 354.892,267.288 " />
        <polyline points="366.235,272.011 378.731,277.273 " />
        <polyline points="378.731,277.273 372.029,293.817 " />
        <polyline points="372.029,293.817 359.949,288.625 " />
        <polyline points="372.029,293.817 365.402,310.398 " />
        <polyline points="365.402,310.398 337.635,297.936 " />
        <polyline points="340.744,299.331 347.594,283.533 " />
        <polyline points="365.402,310.398 366.129,310.702 " />
        <polyline points="366.129,310.702 358.626,328.095 " />
        <polyline points="358.626,328.095 345.506,322.554 " />
        <polyline points="345.506,322.554 353.639,305.119 " />
        <polyline points="345.506,322.554 330.345,315.277 " />
        <polyline points="330.345,315.277 337.635,297.936 " />
        <polyline points="382.623,278.702 399.339,286.038 " />
        <polyline points="399.339,286.038 398.692,287.575 " />
        <polyline points="398.692,287.575 403.74,289.272 " />
        <polyline points="403.74,289.272 399.985,300.235 " />
        <polyline points="399.985,300.235 394.318,298.202 " />
        <polyline points="394.318,298.202 392.839,301.964 " />
        <polyline points="392.839,301.964 375.903,295.158 " />
        <polyline points="375.903,295.158 382.623,278.702 " />
        <polyline points="375.903,295.158 368.755,312.148 " />
        <polyline points="368.755,312.148 381.442,317.285 " />
        <polyline points="381.442,317.285 388.817,300.347 " />
        <polyline points="381.442,317.285 400.044,325.859 " />
        <polyline points="400.044,325.859 406.298,307.528 " />
        <polyline points="406.298,307.528 392.839,301.964 " />
        <polyline points="371.297,313.177 363.756,330.897 " />
        <polyline points="363.756,330.897 382.466,339.123 " />
        <polyline points="382.466,339.123 389.982,321.221 " />
        <polyline points="382.466,339.123 404.816,349.116 " />
        <polyline points="400.044,325.859 412.41,331.224 " />
        <polyline points="412.41,331.224 404.816,349.116 " />
        <polyline points="293.374,342.776 298.061,328.716 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.97106 0 -0 2.46382 296.104 300.108)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-014</text>
        <text transform="matrix(1.97106 0 -0 2.46382 296.204 307.696)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#32993;&#20426;&#29983;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 297.126 303.741)" font-family="Arial,'sans-serif'" font-size="1.39636" >45&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 295.854 316.854)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-019</text>
        <text transform="matrix(1.97106 0 -0 2.46382 295.953 324.442)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#32993;&#20426;&#29983;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 296.876 320.487)" font-family="Arial,'sans-serif'" font-size="1.39636" >27&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 285.972 331.963)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-014</text>
        <text transform="matrix(1.97106 0 -0 2.46382 286.072 339.551)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#32993;&#20426;&#29983;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 286.994 335.596)" font-family="Arial,'sans-serif'" font-size="1.39636" >45&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 297.042 334.374)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-015</text>
        <text transform="matrix(1.97106 0 -0 2.46382 297.141 341.962)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#32993;&#20426;&#29983;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 298.064 338.007)" font-family="Arial,'sans-serif'" font-size="1.39636" >25&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 279.159 285.387)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-013</text>
        <text transform="matrix(1.97106 0 -0 2.46382 273.751 292.968)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#24191;&#35265;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 280.181 289.02)" font-family="Arial,'sans-serif'" font-size="1.39636" >31&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 262.264 278.047)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-012</text>
        <text transform="matrix(1.97106 0 -0 2.46382 262.363 285.635)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38047;&#31168;&#33521;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 263.286 281.679)" font-family="Arial,'sans-serif'" font-size="1.39636" >33&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 303.078 281.95)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-017</text>
        <text transform="matrix(1.97106 0 -0 2.46382 303.177 289.525)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#26195;&#20025;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 304.1 285.583)" font-family="Arial,'sans-serif'" font-size="1.39636" >29&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 319.388 300.034)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-016</text>
        <text transform="matrix(1.97106 0 -0 2.46382 319.488 307.622)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#34081;&#21451;&#24535;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 320.41 303.667)" font-family="Arial,'sans-serif'" font-size="1.39636" >39&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 328.693 281.367)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-007</text>
        <text transform="matrix(1.97106 0 -0 2.46382 328.792 288.942)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#28113;&#21220;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 329.715 285)" font-family="Arial,'sans-serif'" font-size="1.39636" >43&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 331.39 264.615)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-005</text>
        <text transform="matrix(1.97106 0 -0 2.46382 331.996 272.143)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#26195;&#26041;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 332.918 268.201)" font-family="Arial,'sans-serif'" font-size="1.39636" >41&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 353.404 275.193)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-004</text>
        <text transform="matrix(1.97106 0 -0 2.46382 353.503 282.754)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#29577;&#24405;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 354.426 278.826)" font-family="Arial,'sans-serif'" font-size="1.39636" >35&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 365.452 279.993)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-006</text>
        <text transform="matrix(1.97106 0 -0 2.46382 365.552 287.575)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#32032;&#29645;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 366.474 283.626)" font-family="Arial,'sans-serif'" font-size="1.39636" >15&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 353.453 294.171)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-011</text>
        <text transform="matrix(1.97106 0 -0 2.46382 353.553 301.759)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#32500;&#19968;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 354.475 297.804)" font-family="Arial,'sans-serif'" font-size="1.39636" >17&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 337.623 307.411)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-018</text>
        <text transform="matrix(1.97106 0 -0 2.46382 337.723 314.999)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#34081;&#24503;&#31119;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 338.645 311.044)" font-family="Arial,'sans-serif'" font-size="1.39636" >37&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 352.332 313.557)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-009</text>
        <text transform="matrix(1.97106 0 -0 2.46382 346.924 321.152)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24503;&#23665;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 353.354 317.19)" font-family="Arial,'sans-serif'" font-size="1.39636" >19&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 373.317 322.074)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-010</text>
        <text transform="matrix(1.97106 0 -0 2.46382 373.417 329.648)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#28113;&#33521;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 374.339 325.706)" font-family="Arial,'sans-serif'" font-size="1.39636" >11&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 393.579 331.872)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-001</text>
        <text transform="matrix(1.97106 0 -0 2.46382 393.679 339.453)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#26690;&#31435;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 395.367 335.504)" font-family="Arial,'sans-serif'" font-size="1.39636" >5&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 391.765 310.032)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-002</text>
        <text transform="matrix(1.97106 0 -0 2.46382 391.864 317.62)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25391;&#29983;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 393.552 313.665)" font-family="Arial,'sans-serif'" font-size="1.39636" >3&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 374.732 303.251)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-008</text>
        <text transform="matrix(1.97106 0 -0 2.46382 369.324 310.826)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38472;&#26690;&#33452;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 376.519 306.884)" font-family="Arial,'sans-serif'" font-size="1.39636" >7&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 385.606 287.206)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-3-003</text>
        <text transform="matrix(1.97106 0 -0 2.46382 385.706 294.781)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36335;&#24503;&#31119;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 387.394 290.839)" font-family="Arial,'sans-serif'" font-size="1.39636" >1&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="188.323,235.548 198.599,240.626 " />
        <polyline points="198.599,240.626 187.108,262.769 " />
        <polyline points="177.153,257.459 187.108,262.769 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.97106 0 -0 2.46382 184.327 247.035)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-1-011</text>
        <text transform="matrix(1.97106 0 -0 2.46382 184.586 254.603)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#38451;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 184.131 250.668)" font-family="Arial,'sans-serif'" font-size="1.39636" >59&#21495;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 632.208 342.721)" font-family="Arial,'sans-serif'" font-size="1.39636" >3-2-020</text>
        <text transform="matrix(1.97106 0 -0 2.46382 632.308 353.248)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#25991;&#39034;</text>
        <text transform="matrix(1.97106 0 -0 2.46382 629.328 347.554)" font-family="Arial,'sans-serif'" font-size="1.39636" >81&#21495;/&#20869;1&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="616.484,316.167 617.134,327.822 618.905,347.468 603.974,348.251 603.359,363.958 654.124,361.441 653.188,336.724 616.484,316.167 " />
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
