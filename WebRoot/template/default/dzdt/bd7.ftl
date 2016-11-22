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
            <h4 class="bold">第七标段电子地图数据查看</h4>
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
        <g stroke-width="0.9" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="449.913,467.978 564.164,339.859 " />
        <polyline points="564.164,339.859 576.841,352.011 " />
        <polyline points="576.841,352.011 601.933,334.488 " />
        <polyline points="601.933,334.488 624.208,334.488 " />
        <polyline points="624.208,334.488 658.851,268.525 " />
        <polyline points="449.879,467.953 343.381,394.21 " />
        <polyline points="343.381,394.21 243.312,291.643 " />
        <polyline points="243.312,291.643 138.592,195.836 " />
        <polyline points="138.592,195.836 138.592,149.731 " />
        <polyline points="138.592,149.731 159.033,131.983 " />
        <polyline points="159.033,131.983 193.994,143.781 " />
        <polyline points="193.994,143.781 279.068,175.377 " />
        <polyline points="279.068,175.377 411.983,231.37 " />
        <polyline points="411.983,231.37 467.566,233.882 " />
        <polyline points="467.566,233.882 526.521,223.563 " />
        <polyline points="526.521,223.563 552.619,223.563 " />
        <polyline points="552.619,223.563 620.726,247.983 " />
        <polyline points="620.726,247.983 661.37,263.863 " />
        <polyline points="661.37,263.863 658.851,268.525 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 370.604 242.38)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24429;&#21187;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 368.589 238.8)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-038</text>
        <text transform="matrix(2.44115 0 -0 2.44115 370.682 236.14)" font-family="Arial,'sans-serif'" font-size="1.39636" >410&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 356.914 237.678)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#40644;&#35759;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 354.899 233.812)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-001</text>
        <text transform="matrix(2.44115 0 -0 2.44115 356.992 231.008)" font-family="Arial,'sans-serif'" font-size="1.39636" >418&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 352.318 254.089)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#27704;&#36335;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 351.403 251.064)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-015</text>
        <text transform="matrix(2.44115 0 -0 2.44115 352.68 248.704)" font-family="Arial,'sans-serif'" font-size="1.39636" >420&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 344.908 265.013)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#27704;&#21326;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 344.352 261.786)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-004</text>
        <text transform="matrix(2.44115 0 -0 2.44115 345.439 259.377)" font-family="Arial,'sans-serif'" font-size="1.39636" >412&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 339.292 230.484)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#26106;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 337.277 227.418)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-024</text>
        <text transform="matrix(2.44115 0 -0 2.44115 339.37 224.609)" font-family="Arial,'sans-serif'" font-size="1.39636" >422&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 326.834 216.51)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#27704;&#36149;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 325.908 213.525)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-002</text>
        <text transform="matrix(2.44115 0 -0 2.44115 327.072 211.213)" font-family="Arial,'sans-serif'" font-size="1.39636" >430&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 322.596 226.608)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#24314;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 320.524 223.855)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-005</text>
        <text transform="matrix(2.44115 0 -0 2.44115 321.406 221.659)" font-family="Arial,'sans-serif'" font-size="1.39636" >432&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 315.693 237.525)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#21452;&#21916;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 315.3 234.592)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-013</text>
        <text transform="matrix(2.44115 0 -0 2.44115 315.946 232.156)" font-family="Arial,'sans-serif'" font-size="1.39636" >438&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 309.198 249.556)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#20250;&#21018;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 307.957 246.379)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-023</text>
        <text transform="matrix(2.44115 0 -0 2.44115 309.988 243.751)" font-family="Arial,'sans-serif'" font-size="1.39636" >434&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 301.496 264.551)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#20250;&#26377;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 300.255 260.698)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-003</text>
        <text transform="matrix(2.44115 0 -0 2.44115 302.286 258.07)" font-family="Arial,'sans-serif'" font-size="1.39636" >436&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 310.177 214.133)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#24503;&#31077;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 309.845 210.572)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-022</text>
        <text transform="matrix(2.44115 0 -0 2.44115 311.352 207.647)" font-family="Arial,'sans-serif'" font-size="1.39636" >450&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 302.735 225.754)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#24503;&#27700;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 301.575 222.593)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-022</text>
        <text transform="matrix(2.44115 0 -0 2.44115 302.854 219.524)" font-family="Arial,'sans-serif'" font-size="1.39636" >450&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 295.347 203.508)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#27704;&#23453;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 294.077 200.675)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-021</text>
        <text transform="matrix(2.44115 0 -0 2.44115 294.835 198.09)" font-family="Arial,'sans-serif'" font-size="1.39636" >452&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 292.563 213.334)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#25165;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 290.33 210.373)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-014</text>
        <text transform="matrix(2.44115 0 -0 2.44115 291.113 207.91)" font-family="Arial,'sans-serif'" font-size="1.39636" >454&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 286.558 221.954)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#28113;&#32654;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 285.477 218.993)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-007</text>
        <text transform="matrix(2.44115 0 -0 2.44115 286.26 216.531)" font-family="Arial,'sans-serif'" font-size="1.39636" >456&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 279.352 233.904)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24535;&#26519;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 278.271 230.943)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-006</text>
        <text transform="matrix(2.44115 0 -0 2.44115 279.053 228.481)" font-family="Arial,'sans-serif'" font-size="1.39636" >458&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 272.447 247.524)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#28113;&#33805;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 271.366 244.563)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-008</text>
        <text transform="matrix(2.44115 0 -0 2.44115 272.149 242.1)" font-family="Arial,'sans-serif'" font-size="1.39636" >460&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 281.078 201.382)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23433;&#33251;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 279.063 198.044)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-025</text>
        <text transform="matrix(2.44115 0 -0 2.44115 280.629 194.793)" font-family="Arial,'sans-serif'" font-size="1.39636" >470&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 273.124 213.597)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23433;&#21531;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 271.109 210.43)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-026</text>
        <text transform="matrix(2.44115 0 -0 2.44115 272.534 207.472)" font-family="Arial,'sans-serif'" font-size="1.39636" >470&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 263.534 225.892)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#29577;&#21326;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 262.696 222.765)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-027</text>
        <text transform="matrix(2.44115 0 -0 2.44115 264.789 219.961)" font-family="Arial,'sans-serif'" font-size="1.39636" >468&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 256.713 239.101)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#20029;&#39321;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 255.627 235.743)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-028</text>
        <text transform="matrix(2.44115 0 -0 2.44115 257.023 232.67)" font-family="Arial,'sans-serif'" font-size="1.39636" >466&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 247.992 255.865)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#24800;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 245.977 252.645)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-029</text>
        <text transform="matrix(2.44115 0 -0 2.44115 248.069 249.708)" font-family="Arial,'sans-serif'" font-size="1.39636" >464&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 260.783 198.017)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#22269;&#24198;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 260.167 195.133)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-011</text>
        <text transform="matrix(2.44115 0 -0 2.44115 261.277 191.872)" font-family="Arial,'sans-serif'" font-size="1.39636" >472&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 252.81 212.16)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#31168;&#33635;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 251.822 208.48)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-009</text>
        <text transform="matrix(2.44115 0 -0 2.44115 253.514 205.984)" font-family="Arial,'sans-serif'" font-size="1.39636" >474&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 245.822 226.666)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#24800;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 244.833 222.987)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-010</text>
        <text transform="matrix(2.44115 0 -0 2.44115 246.418 220.088)" font-family="Arial,'sans-serif'" font-size="1.39636" >476&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 235.546 245.044)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#20250;&#20840;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 234.558 241.364)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-012</text>
        <text transform="matrix(2.44115 0 -0 2.44115 236.651 238.585)" font-family="Arial,'sans-serif'" font-size="1.39636" >440&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 171.527 156.596)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#31077;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 169.512 153.649)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-036</text>
        <text transform="matrix(2.44115 0 -0 2.44115 171.605 150.806)" font-family="Arial,'sans-serif'" font-size="1.39636" >516&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 164.583 168.9)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#32487;&#38761;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 162.568 165.679)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-016</text>
        <text transform="matrix(2.44115 0 -0 2.44115 164.661 162.787)" font-family="Arial,'sans-serif'" font-size="1.39636" >518&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 156.746 182.214)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29275;&#29577;&#29748;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 154.731 179.184)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-017</text>
        <text transform="matrix(2.44115 0 -0 2.44115 156.824 176.848)" font-family="Arial,'sans-serif'" font-size="1.39636" >520&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 245.328 191.968)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#28113;&#20848;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 244.297 188.751)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-030</text>
        <text transform="matrix(2.44115 0 -0 2.44115 246.39 185.866)" font-family="Arial,'sans-serif'" font-size="1.39636" >486&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 237.518 204.786)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23385;&#23453;&#20891;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 236.68 201.832)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-031</text>
        <text transform="matrix(2.44115 0 -0 2.44115 237.975 199.256)" font-family="Arial,'sans-serif'" font-size="1.39636" >484&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 228.119 190.674)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#29790;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 226.104 187.776)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-042</text>
        <text transform="matrix(2.44115 0 -0 2.44115 228.197 185.296)" font-family="Arial,'sans-serif'" font-size="1.39636" >490&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 215.923 177.432)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#27704;&#24040;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 215.031 174.207)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-048</text>
        <text transform="matrix(2.44115 0 -0 2.44115 216.92 170.924)" font-family="Arial,'sans-serif'" font-size="1.39636" >502&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 208.908 189.374)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20169;&#29577;&#20848;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 208.005 186.552)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-047</text>
        <text transform="matrix(2.44115 0 -0 2.44115 209.177 183.688)" font-family="Arial,'sans-serif'" font-size="1.39636" >500&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 201.667 201.427)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#23567;&#20891;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 200.69 198.614)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-046</text>
        <text transform="matrix(2.44115 0 -0 2.44115 201.831 195.785)" font-family="Arial,'sans-serif'" font-size="1.39636" >498&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 193.197 214.597)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#30333;&#37329;&#23665;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 192.381 211.587)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-033</text>
        <text transform="matrix(2.44115 0 -0 2.44115 194.474 208.413)" font-family="Arial,'sans-serif'" font-size="1.39636" >496&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 201.856 167.443)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#32735;&#31168;&#26519;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 201.397 164.632)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-043</text>
        <text transform="matrix(2.44115 0 -0 2.44115 202.601 162.519)" font-family="Arial,'sans-serif'" font-size="1.39636" >504&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 196.347 178.738)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#32735;&#31168;&#22372;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 194.498 175.705)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-019</text>
        <text transform="matrix(2.44115 0 -0 2.44115 196.591 173.023)" font-family="Arial,'sans-serif'" font-size="1.39636" >506&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 189.541 189.565)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#38081;&#23792;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 188.407 186.53)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-020</text>
        <text transform="matrix(2.44115 0 -0 2.44115 190.499 183.252)" font-family="Arial,'sans-serif'" font-size="1.39636" >508&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 182.518 201.749)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#38081;&#28023;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 180.988 198.465)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-032</text>
        <text transform="matrix(2.44115 0 -0 2.44115 182.04 195.186)" font-family="Arial,'sans-serif'" font-size="1.39636" >508-1&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 187.025 161.888)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#38081;&#29983;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 186.566 158.966)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-034</text>
        <text transform="matrix(2.44115 0 -0 2.44115 188.659 155.687)" font-family="Arial,'sans-serif'" font-size="1.39636" >514&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 179.398 175.745)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#25954;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 177.327 172.879)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-018</text>
        <text transform="matrix(2.44115 0 -0 2.44115 179.42 170.266)" font-family="Arial,'sans-serif'" font-size="1.39636" >512&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 444.386 289.988)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#31179;&#33521;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 443.237 286.521)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-012</text>
        <text transform="matrix(2.44115 0 -0 2.44115 445.33 283.759)" font-family="Arial,'sans-serif'" font-size="1.39636" >278&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 477.431 268.615)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#31243;&#20070;&#26126;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 476.425 265.442)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-018</text>
        <text transform="matrix(2.44115 0 -0 2.44115 478.518 262.585)" font-family="Arial,'sans-serif'" font-size="1.39636" >260&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 443.025 320.497)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21490;&#20964;&#33465;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 442.132 316.881)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-001</text>
        <text transform="matrix(2.44115 0 -0 2.44115 444.225 313.986)" font-family="Arial,'sans-serif'" font-size="1.39636" >286&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 527.857 350.374)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#38383;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 524.392 347.017)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-002</text>
        <text transform="matrix(2.44115 0 -0 2.44115 523.454 343.564)" font-family="Arial,'sans-serif'" font-size="1.39636" >242&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 510.212 325.261)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#28966;&#23567;&#40857;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 510.251 322.278)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-028</text>
        <text transform="matrix(2.44115 0 -0 2.44115 512.344 319.512)" font-family="Arial,'sans-serif'" font-size="1.39636" >268&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 478.156 419.159)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#25104;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 476.141 416.084)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-014</text>
        <text transform="matrix(2.44115 0 -0 2.44115 478.234 413.425)" font-family="Arial,'sans-serif'" font-size="1.39636" >366&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 468.315 429.669)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37036;&#36830;&#40857;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 467.305 426.766)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-009</text>
        <text transform="matrix(2.44115 0 -0 2.44115 468.322 423.813)" font-family="Arial,'sans-serif'" font-size="1.39636" >368&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 404.135 326.749)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#20426;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 402.12 323.616)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-013</text>
        <text transform="matrix(2.44115 0 -0 2.44115 404.212 321.056)" font-family="Arial,'sans-serif'" font-size="1.39636" >350&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 420.366 343.849)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#26469;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 418.351 340.375)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-008</text>
        <text transform="matrix(2.44115 0 -0 2.44115 420.444 337.786)" font-family="Arial,'sans-serif'" font-size="1.39636" >352&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 459.001 378.06)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#28113;&#36126;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 457.832 374.462)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-026</text>
        <text transform="matrix(2.44115 0 -0 2.44115 459.925 371.211)" font-family="Arial,'sans-serif'" font-size="1.39636" >356&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 474.033 388.179)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#39034;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 472.018 385.074)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-016</text>
        <text transform="matrix(2.44115 0 -0 2.44115 474.11 382.387)" font-family="Arial,'sans-serif'" font-size="1.39636" >328&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 419.591 425.328)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#25991;&#40857;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 419.202 422.127)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-015</text>
        <text transform="matrix(2.44115 0 -0 2.44115 421.295 419.282)" font-family="Arial,'sans-serif'" font-size="1.39636" >380&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 407.701 407.313)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#31077;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 411.267 403.944)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-022</text>
        <text transform="matrix(2.44115 0 -0 2.44115 413.36 401.349)" font-family="Arial,'sans-serif'" font-size="1.39636" >378&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 388.189 414.676)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#38271;&#20840;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 387.465 411.435)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-017</text>
        <text transform="matrix(2.44115 0 -0 2.44115 389.558 408.342)" font-family="Arial,'sans-serif'" font-size="1.39636" >382&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 392.107 386.166)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26102;&#26124;&#21220;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 391.152 382.798)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-025</text>
        <text transform="matrix(2.44115 0 -0 2.44115 393.244 380.205)" font-family="Arial,'sans-serif'" font-size="1.39636" >386&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 374.84 358.347)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#27946;&#24742;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 373.783 354.978)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-024</text>
        <text transform="matrix(2.44115 0 -0 2.44115 375.876 352.554)" font-family="Arial,'sans-serif'" font-size="1.39636" >394&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 355.881 377.808)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#20108;&#21033;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 355.155 374.44)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-021</text>
        <text transform="matrix(2.44115 0 -0 2.44115 357.248 371.869)" font-family="Arial,'sans-serif'" font-size="1.39636" >396&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 339.106 375.695)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#31435;&#20852;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 339.13 372.633)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-010</text>
        <text transform="matrix(2.44115 0 -0 2.44115 341.223 370.074)" font-family="Arial,'sans-serif'" font-size="1.39636" >398&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 331.428 367.548)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#24314;&#25991;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 331.033 364.454)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-011</text>
        <text transform="matrix(2.44115 0 -0 2.44115 333.126 361.94)" font-family="Arial,'sans-serif'" font-size="1.39636" >398&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 317.823 358.72)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#37329;&#21326;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 317.107 355.376)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-020</text>
        <text transform="matrix(2.44115 0 -0 2.44115 319.2 352.544)" font-family="Arial,'sans-serif'" font-size="1.39636" >400&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 296.374 343.08)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#36827;&#31077;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 295.97 339.711)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-007</text>
        <text transform="matrix(2.44115 0 -0 2.44115 298.063 337.03)" font-family="Arial,'sans-serif'" font-size="1.39636" >402&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 366.078 367.618)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#37329;&#33391;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 364.42 364.249)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-006</text>
        <text transform="matrix(2.44115 0 -0 2.44115 366.513 361.989)" font-family="Arial,'sans-serif'" font-size="1.39636" >396&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 377.839 379.188)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#22686;&#24191;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 376.007 375.819)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-003</text>
        <text transform="matrix(2.44115 0 -0 2.44115 378.1 372.894)" font-family="Arial,'sans-serif'" font-size="1.39636" >392&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 394.763 360.077)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#31168;&#29645;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 393.716 356.805)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-005</text>
        <text transform="matrix(2.44115 0 -0 2.44115 395.809 354.329)" font-family="Arial,'sans-serif'" font-size="1.39636" >388&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 433.858 359.572)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#28113;&#33452;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 432.956 356.192)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-004</text>
        <text transform="matrix(2.44115 0 -0 2.44115 435.049 353.877)" font-family="Arial,'sans-serif'" font-size="1.39636" >354&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 488.568 402.007)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#24378;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 486.553 398.485)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-022</text>
        <text transform="matrix(2.44115 0 -0 2.44115 488.646 395.817)" font-family="Arial,'sans-serif'" font-size="1.39636" >326&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 501.65 390.481)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#28113;&#33521;&#65288;&#24352;&#26223;&#26862;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 499.851 387.254)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-005</text>
        <text transform="matrix(2.44115 0 -0 2.44115 499.442 384.969)" font-family="Arial,'sans-serif'" font-size="1.39636" >318&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 494.55 377.032)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#27704;&#21326;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 492.535 373.689)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-019</text>
        <text transform="matrix(2.44115 0 -0 2.44115 494.628 370.887)" font-family="Arial,'sans-serif'" font-size="1.39636" >318&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 465.684 409.981)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#26223;&#20964;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 464.384 406.647)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-023</text>
        <text transform="matrix(2.44115 0 -0 2.44115 466.006 404.3)" font-family="Arial,'sans-serif'" font-size="1.39636" >364&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 454.353 398.382)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20184;&#36234;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 451.855 395.615)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-003</text>
        <text transform="matrix(2.44115 0 -0 2.44115 453.205 392.967)" font-family="Arial,'sans-serif'" font-size="1.39636" >362&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 442.745 390.151)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#21191;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 440.73 387.158)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-024</text>
        <text transform="matrix(2.44115 0 -0 2.44115 441.698 384.956)" font-family="Arial,'sans-serif'" font-size="1.39636" >360&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 424.759 376.213)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#20864;&#19996;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 424.155 372.882)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-027</text>
        <text transform="matrix(2.44115 0 -0 2.44115 425.203 370.124)" font-family="Arial,'sans-serif'" font-size="1.39636" >358&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 418.884 391.449)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#26223;&#39034;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 418.195 388.313)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-019</text>
        <text transform="matrix(2.44115 0 -0 2.44115 420.288 385.304)" font-family="Arial,'sans-serif'" font-size="1.39636" >376&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 433.685 400.662)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25991;&#31077;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 432.668 397.738)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-023</text>
        <text transform="matrix(2.44115 0 -0 2.44115 433.852 395.314)" font-family="Arial,'sans-serif'" font-size="1.39636" >374&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 474.589 355.765)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25991;&#21451;&#12289;&#24352;&#25991;&#24378;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 478.404 352.575)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-006</text>
        <text transform="matrix(2.44115 0 -0 2.44115 476.4 349.789)" font-family="Arial,'sans-serif'" font-size="1.39636" >300&#12289;302&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 513.955 367.391)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#22686;&#21916;&#12289;&#26472;&#28113;&#33452;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 513.674 363.935)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-012-1&#12289;-2</text>
        <text transform="matrix(2.44115 0 -0 2.44115 519.436 361.269)" font-family="Arial,'sans-serif'" font-size="1.39636" >308&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 433.197 301.653)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#26377;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 431.182 298.767)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-004</text>
        <text transform="matrix(2.44115 0 -0 2.44115 433.275 295.732)" font-family="Arial,'sans-serif'" font-size="1.39636" >280&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 420.558 314.657)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#26223;&#20803;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 419.124 311.053)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-013</text>
        <text transform="matrix(2.44115 0 -0 2.44115 421.217 308.192)" font-family="Arial,'sans-serif'" font-size="1.39636" >282&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 432.058 329.296)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24535;&#31077;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 431.213 326.115)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-015</text>
        <text transform="matrix(2.44115 0 -0 2.44115 433.306 323.234)" font-family="Arial,'sans-serif'" font-size="1.39636" >284&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 456.075 308.662)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38647;&#31168;&#29645;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 455.34 305.611)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-016</text>
        <text transform="matrix(2.44115 0 -0 2.44115 457.432 302.415)" font-family="Arial,'sans-serif'" font-size="1.39636" >288&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 468.595 253.314)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36213;&#28113;&#25935;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 467.615 250.62)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-017</text>
        <text transform="matrix(2.44115 0 -0 2.44115 469.708 247.807)" font-family="Arial,'sans-serif'" font-size="1.39636" >258&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 489.631 245.496)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24464;&#28113;&#32418;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 489.033 242.732)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-007</text>
        <text transform="matrix(2.44115 0 -0 2.44115 491.126 239.93)" font-family="Arial,'sans-serif'" font-size="1.39636" >256&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 503.315 259.455)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#26216;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 501.3 255.828)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-008</text>
        <text transform="matrix(2.44115 0 -0 2.44115 502.55 252.596)" font-family="Arial,'sans-serif'" font-size="1.39636" >252&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 490.26 263.713)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21016;&#20339;&#29734;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 489.204 260.792)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-009</text>
        <text transform="matrix(2.44115 0 -0 2.44115 491.297 257.935)" font-family="Arial,'sans-serif'" font-size="1.39636" >254&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 487.227 286.169)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24464;&#21355;&#19996;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 486.232 283.302)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-002</text>
        <text transform="matrix(2.44115 0 -0 2.44115 488.324 280.534)" font-family="Arial,'sans-serif'" font-size="1.39636" >262&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 498.472 275.355)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#20964;&#20113;&#12289;&#24352;&#31119;&#24426;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 502.838 272.215)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-025</text>
        <text transform="matrix(2.44115 0 -0 2.44115 504.931 269.038)" font-family="Arial,'sans-serif'" font-size="1.39636" >250&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 493.345 299.851)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#31398;&#25991;&#21326;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 492.733 297.018)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-001</text>
        <text transform="matrix(2.44115 0 -0 2.44115 494.826 294.201)" font-family="Arial,'sans-serif'" font-size="1.39636" >264&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 508.445 290.229)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#19975;&#20041;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 507.332 287.496)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-010</text>
        <text transform="matrix(2.44115 0 -0 2.44115 509.425 284.779)" font-family="Arial,'sans-serif'" font-size="1.39636" >248&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 501.953 313.529)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21490;&#19975;&#27665;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 501.041 310.296)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-014</text>
        <text transform="matrix(2.44115 0 -0 2.44115 502.482 307.129)" font-family="Arial,'sans-serif'" font-size="1.39636" >266&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 525.926 312.05)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23558;&#26195;&#26609;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 525.016 309.582)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-011</text>
        <text transform="matrix(2.44115 0 -0 2.44115 527.726 307.131)" font-family="Arial,'sans-serif'" font-size="1.39636" >244&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 523.587 329.571)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#24191;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 521.572 326.358)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-021</text>
        <text transform="matrix(2.44115 0 -0 2.44115 523.665 324.022)" font-family="Arial,'sans-serif'" font-size="1.39636" >270&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 533.644 344.973)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#32988;&#32676;&#12289;&#26446;&#29790;&#20848;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 535.458 340.78)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-018</text>
        <text transform="matrix(2.44115 0 -0 2.44115 535.457 336.942)" font-family="Arial,'sans-serif'" font-size="1.39636" >240&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 546.063 336.414)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#29577;&#26757;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 544.801 333.333)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-020</text>
        <text transform="matrix(2.44115 0 -0 2.44115 545.32 330.806)" font-family="Arial,'sans-serif'" font-size="1.39636" >238&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 609.866 317.994)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#32993;&#31168;&#25935;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 610.05 315.111)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-001</text>
        <text transform="matrix(2.44115 0 -0 2.44115 611.796 312.233)" font-family="Arial,'sans-serif'" font-size="1.39636" >158&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 618.195 323.934)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#20250;&#22686;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 617.973 320.977)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-020</text>
        <text transform="matrix(2.44115 0 -0 2.44115 620.283 318.166)" font-family="Arial,'sans-serif'" font-size="1.39636" >160&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="385.153,383.772 373.889,395.078 " />
        <polyline points="373.889,395.078 384.548,405.905 " />
        <polyline points="384.548,405.905 396.16,394.358 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 380.037 398.071)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#25391;&#22269;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 379.729 394.852)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-028</text>
        <text transform="matrix(2.44115 0 -0 2.44115 381.822 392.065)" font-family="Arial,'sans-serif'" font-size="1.39636" >384&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="513.611,388.435 502.409,378.124 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 508.285 383.004)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#31435;&#26118;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 506.854 379.649)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-029</text>
        <text transform="matrix(2.44115 0 -0 2.44115 507.747 376.803)" font-family="Arial,'sans-serif'" font-size="1.39636" >316&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="483.767,336.419 498.898,320.669 " />
        <polyline points="498.898,320.669 510.384,332.255 " />
        <polyline points="510.384,332.255 509.124,333.405 " />
        <polyline points="509.124,333.405 511.532,335.814 " />
        <polyline points="511.532,335.814 496.727,350.309 " />
        <polyline points="496.727,350.309 483.767,336.419 " />
        <polyline points="505.373,341.882 490.609,329.297 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 496.755 334.696)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#20110;&#31119;&#33459;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 494.74 331.571)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-030</text>
        <text transform="matrix(2.44115 0 -0 2.44115 496.833 328.288)" font-family="Arial,'sans-serif'" font-size="1.39636" >304&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 489.261 342.545)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#26223;&#21326;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 487.246 339.376)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-031</text>
        <text transform="matrix(2.44115 0 -0 2.44115 489.339 336.624)" font-family="Arial,'sans-serif'" font-size="1.39636" >304&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="562.581,334.396 577.204,321.8 " />
        <polyline points="577.204,321.8 579.7,324.069 " />
        <polyline points="579.7,324.069 589.926,336.791 " />
        <polyline points="589.926,336.791 576.035,348.449 " />
        <polyline points="576.035,348.449 565.403,336.64 " />
        <polyline points="565.403,336.64 564.882,337.086 " />
        <polyline points="564.882,337.086 562.572,334.404 " />
        <polyline points="589.803,311.988 604.741,324.821 " />
        <polyline points="604.741,324.821 609.817,328.471 " />
        <polyline points="609.817,328.471 606.721,332.208 " />
        <polyline points="606.721,332.208 601.506,328.587 " />
        <polyline points="601.506,328.587 596.375,334.559 " />
        <polyline points="596.375,334.559 591.91,332.203 " />
        <polyline points="591.91,332.203 583.974,325.134 " />
        <polyline points="583.974,325.134 581.448,321.977 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 588.778 327.085)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#27743;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 585.963 324.465)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-030</text>
        <text transform="matrix(2.44115 0 -0 2.44115 588.056 321.649)" font-family="Arial,'sans-serif'" font-size="1.39636" >120&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 574.037 340.034)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#20041;&#22269;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 572.022 336.555)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-016</text>
        <text transform="matrix(2.44115 0 -0 2.44115 574.115 333.308)" font-family="Arial,'sans-serif'" font-size="1.39636" >152&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="589.803,311.988 589.134,311.292 " />
        <polyline points="589.134,311.292 599.983,299.897 " />
        <polyline points="599.983,299.897 605.059,293.634 " />
        <polyline points="605.059,293.634 618.76,301.378 " />
        <polyline points="616.468,300.083 614.841,302.71 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 591.826 312.215)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27494;&#24535;&#26469;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 596.843 309.009)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-002</text>
        <text transform="matrix(2.44115 0 -0 2.44115 598.936 306.374)" font-family="Arial,'sans-serif'" font-size="1.39636" >156&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 596.538 316.182)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#28113;&#36149;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="630.696,280.927 645.714,289.332 " />
        <polyline points="645.714,289.332 638.786,301.289 " />
        <polyline points="638.786,301.289 623.808,292.729 " />
        <polyline points="618.76,301.378 630.696,280.927 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 630.452 294.457)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#29579;&#26397;&#29748;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 629.401 291.124)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-031</text>
        <text transform="matrix(2.44115 0 -0 2.44115 630.53 287.871)" font-family="Arial,'sans-serif'" font-size="1.39636" >164&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="656.465,269.588 649.666,266.583 " />
        <polyline points="649.666,266.583 641.705,283.435 " />
        <polyline points="641.705,283.435 647.044,285.925 " />
        <polyline points="647.044,285.925 654.296,274.288 " />
        <polyline points="654.296,274.288 656.465,269.588 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 645.909 278.804)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21556;&#24800;&#33805;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 646.642 274.845)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-014</text>
        <text transform="matrix(2.44115 0 -0 2.44115 648.735 272.456)" font-family="Arial,'sans-serif'" font-size="1.39636" >166&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="649.591,266.49 641.026,262.631 " />
        <polyline points="641.026,262.631 637.925,269.079 " />
        <polyline points="637.925,269.079 630.696,280.927 " />
        <polyline points="630.696,280.927 643.253,287.955 " />
        <polyline points="643.253,287.955 644.879,284.935 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 636.041 277.602)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#21556;&#24800;&#26469;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 636.375 274.468)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-009</text>
        <text transform="matrix(2.44115 0 -0 2.44115 638.734 272.056)" font-family="Arial,'sans-serif'" font-size="1.39636" >168&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="638.174,262.383 624.12,257.228 " />
        <polyline points="624.12,257.228 617.026,272.931 " />
        <polyline points="617.026,272.931 615.353,276.024 " />
        <polyline points="615.353,276.024 628.926,283.96 " />
        <polyline points="627.159,282.927 636.561,267.095 " />
        <polyline points="636.561,267.095 638.174,262.383 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 615.45 272.735)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#26223;&#20041;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 621.048 269.108)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-028</text>
        <text transform="matrix(2.44115 0 -0 2.44115 623.53 265.978)" font-family="Arial,'sans-serif'" font-size="1.39636" >170&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 620.85 277.205)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25903;&#31168;&#29645;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="615.529,276.127 605.057,293.633 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 612.143 292.951)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#26223;&#26519;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 611.477 290.195)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-027</text>
        <text transform="matrix(2.44115 0 -0 2.44115 612.317 287.327)" font-family="Arial,'sans-serif'" font-size="1.39636" >172&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="620.346,257.036 607.118,251.172 " />
        <polyline points="607.118,251.172 599.524,267.474 " />
        <polyline points="611.745,274.872 620.346,257.036 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 597.572 289.492)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#20142;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 595.557 286.335)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-008</text>
        <text transform="matrix(2.44115 0 -0 2.44115 597.65 283.392)" font-family="Arial,'sans-serif'" font-size="1.39636" >174&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="603.945,251.717 583.187,243.967 " />
        <polyline points="583.187,243.967 580.315,259.387 " />
        <polyline points="580.315,259.387 575.654,267.586 " />
        <polyline points="575.654,267.586 593.795,282.637 " />
        <polyline points="593.795,282.637 597.37,277.512 " />
        <polyline points="597.37,277.512 595.758,276.644 " />
        <polyline points="595.758,276.644 599.524,267.474 " />
        <polyline points="595.758,276.644 593.644,275.692 " />
        <polyline points="593.644,275.692 602.581,256.058 " />
        <polyline points="602.581,256.058 604.17,251.801 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 584.898 262.965)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24503;&#20184;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 584.191 259.523)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-011</text>
        <text transform="matrix(2.44115 0 -0 2.44115 585.712 256.58)" font-family="Arial,'sans-serif'" font-size="1.39636" >178&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="583.187,243.967 583.363,243.116 " />
        <polyline points="583.363,243.116 565.905,239.094 " />
        <polyline points="565.905,239.094 561.474,255.657 " />
        <polyline points="567.471,258.696 579.272,261.224 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 568.406 254.678)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24503;&#20840;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 567.821 251.522)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-007</text>
        <text transform="matrix(2.44115 0 -0 2.44115 569.914 248.506)" font-family="Arial,'sans-serif'" font-size="1.39636" >182&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="544.214,236.054 556.446,233.363 " />
        <polyline points="556.446,233.363 558.802,245.393 " />
        <polyline points="558.802,245.393 554.089,246.757 " />
        <polyline points="554.089,246.757 546.896,248.245 " />
        <polyline points="546.896,248.245 544.214,236.054 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 548.06 245.331)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#39033;&#25104;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 546.045 242.301)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-006</text>
        <text transform="matrix(2.44115 0 -0 2.44115 548.138 239.546)" font-family="Arial,'sans-serif'" font-size="1.39636" >184&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="527.301,234.851 542.68,231.007 " />
        <polyline points="542.68,231.007 546.896,248.245 " />
        <polyline points="546.896,248.245 532.384,251.708 " />
        <polyline points="532.384,251.708 527.301,234.851 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 532.798 245.262)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#30003;&#20271;&#20250;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 531.675 242.039)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-029</text>
        <text transform="matrix(2.44115 0 -0 2.44115 533.768 238.857)" font-family="Arial,'sans-serif'" font-size="1.39636" >192&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="527.301,234.851 526.681,231.379 " />
        <polyline points="526.681,231.379 512.109,233.867 " />
        <polyline points="512.109,233.867 513.039,239.316 " />
        <polyline points="513.039,239.316 513.8,241.798 " />
        <polyline points="513.8,241.798 518.247,256.306 " />
        <polyline points="518.247,256.306 532.389,252.227 " />
        <polyline points="532.389,252.227 532.315,251.477 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 516.774 247.738)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#20964;&#33635;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 515.793 244.468)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-012</text>
        <text transform="matrix(2.44115 0 -0 2.44115 517.885 241.614)" font-family="Arial,'sans-serif'" font-size="1.39636" >196&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="518.247,256.306 517.751,256.43 " />
        <polyline points="517.751,256.43 522.339,270.816 " />
        <polyline points="522.339,270.816 534.741,265.731 " />
        <polyline points="534.741,265.731 534.741,265.731 " />
        <polyline points="534.741,265.731 534.741,265.731 " />
        <polyline points="534.741,265.731 534.741,265.731 " />
        <polyline points="534.741,265.731 534.741,265.731 " />
        <polyline points="534.741,265.731 534.741,265.731 " />
        <polyline points="532.36,252.235 536.095,265.202 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 521.532 264.436)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#31119;&#29618;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 520.45 261.156)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-013</text>
        <text transform="matrix(2.44115 0 -0 2.44115 522.543 258.434)" font-family="Arial,'sans-serif'" font-size="1.39636" >198&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="534.741,265.731 556.941,257.05 " />
        <polyline points="556.941,257.05 554.089,246.757 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 538.651 258.877)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#22799;&#28113;&#38134;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 537.946 255.475)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-003</text>
        <text transform="matrix(2.44115 0 -0 2.44115 540.039 252.701)" font-family="Arial,'sans-serif'" font-size="1.39636" >186&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="570.583,260.274 554.528,267.829 " />
        <polyline points="554.528,267.829 559.024,277.189 " />
        <polyline points="554.277,278.731 547.396,260.782 " />
        <polyline points="547.396,260.782 556.929,257.02 " />
        <polyline points="556.929,257.02 561.474,255.657 " />
        <polyline points="561.474,255.657 570.583,260.274 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 550.562 265.525)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24247;&#24535;&#36828;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 550.24 262.948)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-004</text>
        <text transform="matrix(2.44115 0 -0 2.44115 552.333 260.632)" font-family="Arial,'sans-serif'" font-size="1.39636" >188&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="570.583,260.274 574.468,268.531 " />
        <polyline points="574.468,268.531 581.207,281.078 " />
        <polyline points="565.682,289.416 559.024,277.189 " />
        <polyline points="586.049,276.21 568.101,294.254 " />
        <polyline points="568.101,294.254 565.543,289.491 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 565.503 279.68)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24247;&#28009;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 562.386 276.043)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-005</text>
        <text transform="matrix(2.44115 0 -0 2.44115 564.479 271.876)" font-family="Arial,'sans-serif'" font-size="1.39636" >190&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="531.144,292.394 559.544,279.869 " />
        <polyline points="559.544,279.869 560.258,279.486 " />
        <polyline points="560.258,279.486 568.473,294.998 " />
        <polyline points="568.473,294.998 540.88,307.936 " />
        <polyline points="540.88,307.936 531.144,292.394 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.95292 0 -0 1.95292 555.55 294.527)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#29790;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(1.95292 0 -0 1.95292 555.235 288.533)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-025</text>
        <text transform="matrix(1.95292 0 -0 1.95292 556.084 286.219)" font-family="Arial,'sans-serif'" font-size="1.39636" >202&#21495;</text>
        <text transform="matrix(1.95292 0 -0 1.95292 545.339 293.441)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-024</text>
        <text transform="matrix(1.95292 0 -0 1.95292 546.108 296.085)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#20250;&#26469;</text>
        <text transform="matrix(1.95292 0 -0 1.95292 535.001 297.392)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-023</text>
        <text transform="matrix(1.95292 0 -0 1.95292 536.928 299.93)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#20250;&#24544;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="568.969,293.634 576.658,300.827 " />
        <polyline points="576.658,300.827 554.085,322.654 " />
        <polyline points="554.085,322.654 544.406,312.564 " />
        <polyline points="544.406,312.564 540.88,307.936 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 554.143 312.451)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33931;&#26195;&#33635;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 553.541 309.34)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-021</text>
        <text transform="matrix(2.44115 0 -0 2.44115 555.634 306.339)" font-family="Arial,'sans-serif'" font-size="1.39636" >204&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="554.085,322.654 563.038,334.002 " />
        <polyline points="575.853,322.963 565.287,311.82 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 559.351 326.83)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#22763;&#26480;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 558.319 323.719)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-017</text>
        <text transform="matrix(2.44115 0 -0 2.44115 560.412 320.841)" font-family="Arial,'sans-serif'" font-size="1.39636" >154&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="576.495,300.627 583.727,293.758 " />
        <polyline points="585.834,291.431 597.398,302.612 " />
        <polyline points="589.134,311.292 589.803,311.988 " />
        <polyline points="589.803,311.988 579.7,324.069 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 567.623 312.156)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#22763;&#23398;&#12289;&#25991;&#20122;&#20848;&#12289;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 573.978 308.505)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-015</text>
        <text transform="matrix(2.44115 0 -0 2.44115 576.071 305.241)" font-family="Arial,'sans-serif'" font-size="1.39636" >428&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 566.716 315.758)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#25991;&#22763;&#24544;&#12289;&#25991;&#22763;&#21644;&#12289;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="593.795,282.637 583.727,293.758 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 577.315 288.035)" font-family="Arial,'sans-serif'" font-size="1.39636" >180&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="611.745,274.872 615.109,276.83 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 590.062 293.09)" font-family="Arial,'sans-serif'" font-size="1.39636" >176&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="638.786,301.289 632.628,312.065 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 622.739 299.412)" font-family="Arial,'sans-serif'" font-size="1.39636" >162&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="534.741,265.731 543.179,287.086 " />
        <polyline points="522.339,270.816 531.179,292.378 " />
        <polyline points="554.277,278.731 555.555,281.628 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 530.545 279.214)" font-family="Arial,'sans-serif'" font-size="1.39636" >200&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 541.732 272.277)" font-family="Arial,'sans-serif'" font-size="1.39636" >194&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="221.215,190.454 214.766,201.74 " />
        <polyline points="214.766,201.74 228.051,209.635 " />
        <polyline points="228.051,209.635 234.755,198.179 " />
        <polyline points="234.755,198.179 221.22,190.445 " />
        <polyline points="214.518,202.36 203.797,220.81 " />
        <polyline points="203.797,220.81 217.67,227.7 " />
        <polyline points="217.67,227.7 228.036,209.661 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 220.602 200.87)" font-family="Arial,'sans-serif'" font-size="1.39636" >492&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 212.802 214.681)" font-family="Arial,'sans-serif'" font-size="1.39636" >494&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="224.636,218.903 235.278,224.606 " />
        <polyline points="235.278,224.606 228.045,237.312 " />
        <polyline points="228.045,237.312 217.568,231.376 " />
        <polyline points="217.568,231.376 224.338,218.743 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 223.42 228.593)" font-family="Arial,'sans-serif'" font-size="1.39636" >480&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="332.684,230.077 346.498,237.378 " />
        <polyline points="346.498,237.378 338.656,252.216 " />
        <polyline points="338.656,252.216 325.251,245.132 " />
        <polyline points="325.251,245.132 332.684,230.077 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 332.673 240.756)" font-family="Arial,'sans-serif'" font-size="1.39636" >424&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="287.254,241.977 301.325,248.826 " />
        <polyline points="301.325,248.826 292.387,265.418 " />
        <polyline points="292.387,265.418 278.987,258.2 " />
        <polyline points="278.987,258.2 287.254,241.977 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 287.197 253.213)" font-family="Arial,'sans-serif'" font-size="1.39636" >446&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="439.74,408.844 450.988,417.663 " />
        <polyline points="450.988,417.663 459.623,406.64 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 445.926 405.252)" font-family="Arial,'sans-serif'" font-size="1.39636" >372&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="461.197,293.882 475.113,281.576 " />
        <polyline points="475.113,281.576 478.706,285.968 " />
        <polyline points="478.706,285.968 486.001,297.727 " />
        <polyline points="486.001,297.727 473.599,308.073 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 470.493 293.175)" font-family="Arial,'sans-serif'" font-size="1.39636" >290&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 591.886 297.628)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24503;&#31119;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 590.334 295.335)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-018</text>
        <text transform="matrix(2.44115 0 -0 2.44115 622.266 305.342)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#19977;&#39034;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 621.751 302.654)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-010</text>
        <text transform="matrix(2.44115 0 -0 2.44115 575.217 293.706)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#33495;&#37329;&#23665;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 575.187 290.986)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-026</text>
        <text transform="matrix(2.44115 0 -0 2.44115 541.688 278.23)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36213;&#23731;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 540.338 275.147)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-033</text>
        <text transform="matrix(2.44115 0 -0 2.44115 528.724 282.746)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-032</text>
        <text transform="matrix(2.44115 0 -0 2.44115 529.933 286.354)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#36213;&#23665;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 469.941 299.334)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#31177;&#25991;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 468.745 296.539)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-031</text>
        <text transform="matrix(2.44115 0 -0 2.44115 515.875 304.966)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#26480;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 513.86 300.381)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-026</text>
        <text transform="matrix(2.44115 0 -0 2.44115 515.953 296.214)" font-family="Arial,'sans-serif'" font-size="1.39636" >246&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="525.067,289.046 532.383,301.695 " />
        <polyline points="379.497,366.148 391.734,377.072 " />
        <polyline points="373.948,395.019 359.751,385.405 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 385.597 370.585)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#32654;&#20848;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 384.792 367.216)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-029</text>
        <text transform="matrix(2.44115 0 -0 2.44115 385.578 364.74)" font-family="Arial,'sans-serif'" font-size="1.39636" >390&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="397.196,324.63 409.853,311.12 " />
        <polyline points="409.853,311.12 413.202,314.965 " />
        <polyline points="413.202,314.965 421.534,322.006 " />
        <polyline points="421.534,322.006 408.241,335.675 " />
        <polyline points="408.241,335.675 397.196,324.63 " />
        <polyline points="424.735,297.728 423.708,296.764 " />
        <polyline points="423.708,296.764 409.853,311.12 " />
        <polyline points="531.733,355.428 539.202,360.602 " />
        <polyline points="539.202,360.602 553.637,346.511 " />
        <polyline points="553.637,346.511 555.056,345.128 " />
        <polyline points="555.056,345.128 536.103,326.374 " />
        <polyline points="536.103,326.374 526.224,336.357 " />
        <polyline points="526.528,336.05 526.528,336.081 " />
        <polyline points="519.961,341.533 526.212,336.344 " />
        <polyline points="526.224,336.357 537.672,349.385 " />
        <polyline points="537.672,349.385 531.733,355.428 " />
        <polyline points="531.733,355.428 519.961,341.533 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 219.275 197.82)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-035</text>
        <text transform="matrix(2.44115 0 -0 2.44115 220.602 203.947)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#23435;&#21018;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 211.566 211.683)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-037</text>
        <text transform="matrix(2.44115 0 -0 2.44115 212.892 217.809)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#19969;&#24314;&#31119;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 285.603 250.481)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-039</text>
        <text transform="matrix(2.44115 0 -0 2.44115 286.209 256.292)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#32735;&#31168;&#29645;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="266.287,247.944 279.592,255.254 " />
        <polyline points="279.592,255.254 270.2,272.629 " />
        <polyline points="270.2,272.629 256.706,265.335 " />
        <polyline points="256.706,265.335 266.267,247.933 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 266.186 259.839)" font-family="Arial,'sans-serif'" font-size="1.39636" >462&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 264.591 257.106)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-040</text>
        <text transform="matrix(2.44115 0 -0 2.44115 265.198 262.917)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#31119;&#20852;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="391.7,232.198 402.693,241.029 " />
        <polyline points="402.693,241.029 392.403,253.836 " />
        <polyline points="392.403,253.836 381.408,244.998 " />
        <polyline points="381.408,244.998 391.694,232.193 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 389.402 248.455)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26472;&#39034;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 387.387 244.875)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-041</text>
        <text transform="matrix(2.44115 0 -0 2.44115 389.48 242.215)" font-family="Arial,'sans-serif'" font-size="1.39636" >408&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 222.138 225.458)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-044</text>
        <text transform="matrix(2.44115 0 -0 2.44115 223.465 231.584)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#29233;&#20891;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 332.059 246.491)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#38889;&#26149;&#26480;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 330.818 243.314)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-1-045</text>
        <text transform="matrix(2.44115 0 -0 2.44115 368.073 388.273)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#26446;&#22686;&#20803;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 366.241 384.904)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-2-030</text>
        <text transform="matrix(2.44115 0 -0 2.44115 368.334 381.979)" font-family="Arial,'sans-serif'" font-size="1.39636" >392&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="371.798,373.564 384.009,384.92 " />
        <polyline points="469.257,351.611 462.853,358.563 " />
        <polyline points="487.386,366.761 481.246,373.97 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 471.183 365.037)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#25991;&#28165;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 469.527 362.44)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-027</text>
        <text transform="matrix(2.44115 0 -0 2.44115 469.815 360.134)" font-family="Arial,'sans-serif'" font-size="1.39636" >298&#21495;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 445.492 410.843)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#37036;&#26690;&#33457;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 444.078 408.076)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-3-032</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="596.818,274.063 611.611,282.677 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(2.44115 0 -0 2.44115 604.291 268.733)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#24352;&#24503;&#31119;</text>
        <text transform="matrix(2.44115 0 -0 2.44115 603.364 265.577)" font-family="Arial,'sans-serif'" font-size="1.39636" >7-4-019</text>
        <text transform="matrix(2.44115 0 -0 2.44115 605.199 262.328)" font-family="Arial,'sans-serif'" font-size="1.39636" >174&#21495;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="590.08,286.74 603.768,295.227 " />
        <polyline points="548.952,304.152 541.33,287.902 " />
        <polyline points="558.416,299.714 550.897,283.682 " />
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="rgb(0,0,0)" stroke="none" >
        <text transform="matrix(1.95292 0 -0 1.95292 556.275 291.699)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#28023;&#28059;</text>
        <text transform="matrix(1.95292 0 -0 1.95292 533.494 295.196)" font-family="Arial,'sans-serif'" font-size="1.39636" >202&#21495;(&#20869;2)</text>
        <text transform="matrix(1.95292 0 -0 1.95292 542.956 291.06)" font-family="Arial,'sans-serif'" font-size="1.39636" >202&#21495;(&#20869;1)</text>
        <text transform="matrix(1.95292 0 -0 1.95292 545.527 298.711)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#29790;&#65288;&#24050;&#25925;&#65289;</text>
        <text transform="matrix(1.95292 0 -0 1.95292 536.009 303.049)" font-family="Arial,'sans-serif'" font-size="1.39636" >&#27573;&#29790;&#65288;&#24050;&#25925;&#65289;</text>
        </g>
        <g stroke-width="0.3" clip-path="url(#clipId0)" fill="none" stroke="rgb(0,0,0)" >
        <polyline points="623.908,307.276 632.713,312.112 " />
        <polyline points="632.713,312.112 622.407,331.381 " />
        <polyline points="622.407,331.381 613.521,326.376 " />
        <polyline points="615.103,302.439 623.908,307.276 " />
        <polyline points="623.908,307.276 613.492,326.429 " />
        <polyline points="613.492,326.429 604.155,320.808 " />
        <polyline points="604.155,320.808 614.841,302.71 " />
        <polyline points="536.103,326.374 543.925,318.943 " />
        <polyline points="543.925,318.943 562.394,338.279 " />
        <polyline points="562.394,338.279 555.34,345.409 " />
        <polyline points="513.182,329.956 520.972,338.279 " />
        <polyline points="520.972,338.279 541.064,320.545 " />
        <polyline points="541.064,320.545 537.091,315.86 " />
        <polyline points="520.909,309.96 532.383,301.695 " />
        <polyline points="532.383,301.695 540.196,313.725 " />
        <polyline points="540.196,313.725 537.274,315.716 " />
        <polyline points="537.274,315.716 534.317,312.236 " />
        <polyline points="534.317,312.236 527.751,317.659 " />
        <polyline points="507.767,299.838 517.316,312.968 " />
        <polyline points="517.316,312.968 506.463,322.778 " />
        <polyline points="506.463,322.778 496.08,306.982 " />
        <polyline points="502.247,285.077 520.603,276.644 " />
        <polyline points="520.603,276.644 525.641,288.394 " />
        <polyline points="525.641,288.394 506.918,297.708 " />
        <polyline points="502.247,285.077 507.767,299.838 " />
        <polyline points="507.767,299.838 496.08,306.983 " />
        <polyline points="496.08,306.983 488.218,292.477 " />
        <polyline points="496.171,269.948 515.642,262.383 " />
        <polyline points="515.642,262.383 520.851,275.156 " />
        <polyline points="520.851,275.156 502.247,283.341 " />
        <polyline points="502.247,283.341 495.555,270.41 " />
        <polyline points="495.555,270.41 496.171,269.948 " />
        <polyline points="480.19,278.524 495.087,270.914 " />
        <polyline points="495.087,270.914 502.247,285.077 " />
        <polyline points="502.247,285.077 488.218,292.477 " />
        <polyline points="488.218,292.477 480.19,278.524 " />
        <polyline points="490.433,269.253 503.116,264.987 " />
        <polyline points="509.194,244.153 510.19,243.792 " />
        <polyline points="510.19,243.792 515.642,260.522 " />
        <polyline points="515.642,260.522 503.116,264.987 " />
        <polyline points="503.116,264.987 497.389,248.223 " />
        <polyline points="505.445,232.293 509.194,244.152 " />
        <polyline points="509.194,244.152 483.939,252.818 " />
        <polyline points="478.848,241.539 505.432,232.256 " />
        <polyline points="463.554,245.889 478.189,240.06 " />
        <polyline points="478.189,240.06 484.26,253.688 " />
        <polyline points="484.26,253.688 469.132,260.426 " />
        <polyline points="469.132,260.426 463.554,245.889 " />
        <polyline points="448.952,304.718 449.167,303.927 " />
        <polyline points="449.167,303.927 461.197,293.882 " />
        <polyline points="461.197,293.882 473.599,308.073 " />
        <polyline points="473.599,308.073 462.733,317.569 " />
        <polyline points="448.517,329.298 448.816,329.606 " />
        <polyline points="448.816,329.606 442.23,336.011 " />
        <polyline points="442.23,336.011 439.369,337.163 " />
        <polyline points="439.369,337.163 438.649,336.442 " />
        <polyline points="438.214,311.117 425.816,325.425 " />
        <polyline points="436.827,285.635 424.612,297.851 " />
        <polyline points="424.612,297.851 438.214,311.117 " />
        <polyline points="438.214,311.117 449.979,299.567 " />
        <polyline points="521.592,352.293 510.926,363.95 " />
        <polyline points="510.926,363.95 524.221,376.044 " />
        <polyline points="524.221,376.044 535.109,364.819 " />
        <polyline points="535.109,364.819 521.592,352.293 " />
        <polyline points="481.967,336.386 500.25,354.288 " />
        <polyline points="500.25,354.288 487.386,366.761 " />
        <polyline points="487.386,366.761 469.257,351.611 " />
        <polyline points="469.257,351.611 481.967,336.386 " />
        <polyline points="427.304,399.242 439.74,408.844 " />
        <polyline points="439.74,408.844 448.954,397.537 " />
        <polyline points="423.123,376.352 414.193,388.877 " />
        <polyline points="414.193,388.877 427.304,399.242 " />
        <polyline points="427.304,399.242 435.781,386.732 " />
        <polyline points="441.973,375.236 426.719,362.71 " />
        <polyline points="426.719,362.71 423.498,360.351 " />
        <polyline points="423.498,360.351 417.556,359.591 " />
        <polyline points="417.556,359.591 415.699,371.795 " />
        <polyline points="415.699,371.795 418.658,372.755 " />
        <polyline points="418.658,372.755 423.619,376.724 " />
        <polyline points="423.619,376.724 433.852,384.622 " />
        <polyline points="433.852,384.622 441.973,375.236 " />
        <polyline points="455.614,386.273 443.833,376.848 " />
        <polyline points="443.833,376.848 435.781,386.732 " />
        <polyline points="435.781,386.732 447.9,396.671 " />
        <polyline points="468.226,396.363 455.614,386.273 " />
        <polyline points="455.614,386.273 446.845,395.806 " />
        <polyline points="446.845,395.806 459.668,406.33 " />
        <polyline points="479.906,406.391 468.226,396.363 " />
        <polyline points="468.226,396.363 459.668,406.33 " />
        <polyline points="459.668,406.33 471.364,416.372 " />
        <polyline points="471.364,416.372 480.099,406.563 " />
        <polyline points="509.998,369.879 498.648,359.734 " />
        <polyline points="498.648,359.734 484.543,375.513 " />
        <polyline points="484.543,375.513 495.404,385.734 " />
        <polyline points="495.404,385.734 509.998,369.879 " />
        <polyline points="509.998,369.879 521.221,379.928 " />
        <polyline points="521.221,379.928 506.853,395.991 " />
        <polyline points="506.853,395.991 495.404,385.734 " />
        <polyline points="495.404,385.734 495.404,385.734 " />
        <polyline points="491.359,383.24 506.853,395.991 " />
        <polyline points="506.853,395.991 492.5,412.602 " />
        <polyline points="492.5,412.602 477.069,398.302 " />
        <polyline points="477.069,398.302 491.359,383.24 " />
        <polyline points="424.785,355.878 441.725,338.527 " />
        <polyline points="441.725,338.527 454.871,351.301 " />
        <polyline points="454.871,351.301 438.149,368.652 " />
        <polyline points="438.149,368.652 424.749,355.914 " />
        <polyline points="401.544,343.612 388.325,357.179 " />
        <polyline points="387.337,356.16 399.884,369.101 " />
        <polyline points="398.332,367.5 410.149,355.287 " />
        <polyline points="410.149,355.287 401.544,343.612 " />
        <polyline points="358.883,363.082 370.929,374.418 " />
        <polyline points="295.013,322.53 319.208,343.849 " />
        <polyline points="319.208,343.849 307.453,354.449 " />
        <polyline points="307.453,354.449 283.232,334.683 " />
        <polyline points="283.232,334.683 295.013,322.53 " />
        <polyline points="335.123,357.078 320.065,342.992 " />
        <polyline points="320.065,342.992 310.392,352.665 " />
        <polyline points="310.392,352.665 325.273,366.401 " />
        <polyline points="333.233,373.912 324.902,366.803 " />
        <polyline points="324.902,366.803 335.123,357.078 " />
        <polyline points="335.123,357.078 344.501,347.737 " />
        <polyline points="344.501,347.737 352.164,354.99 " />
        <polyline points="354.284,379.697 345.826,388.916 " />
        <polyline points="345.826,388.916 342.436,385.805 " />
        <polyline points="342.436,385.805 332.93,374.19 " />
        <polyline points="332.93,374.19 343.123,364.827 " />
        <polyline points="343.123,364.827 352.164,354.99 " />
        <polyline points="352.164,354.99 359.851,362.055 " />
        <polyline points="368.181,353.592 348.465,373.624 " />
        <polyline points="348.465,373.624 359.751,385.405 " />
        <polyline points="359.751,385.405 380.064,365.439 " />
        <polyline points="380.064,365.439 378.804,364.207 " />
        <polyline points="379.212,342.77 390.128,353.095 " />
        <polyline points="390.128,353.095 387.159,356.356 " />
        <polyline points="387.159,356.356 380.065,365.438 " />
        <polyline points="380.065,365.438 368.308,353.657 " />
        <polyline points="368.308,353.657 379.313,342.872 " />
        <polyline points="385.174,383.793 395.971,394.396 " />
        <polyline points="395.971,394.396 408.089,382.277 " />
        <polyline points="408.089,382.277 400.579,374.767 " />
        <polyline points="400.579,374.767 405.089,371.008 " />
        <polyline points="405.089,371.008 402.412,367.795 " />
        <polyline points="402.412,367.795 399.305,369.4 " />
        <polyline points="399.305,369.4 397.258,371.446 " />
        <polyline points="397.258,371.446 385.153,383.772 " />
        <polyline points="391.848,398.719 380.992,410.141 " />
        <polyline points="380.992,410.141 395.607,424.365 " />
        <polyline points="395.607,424.365 406.467,412.781 " />
        <polyline points="406.467,412.781 397.362,403.557 " />
        <polyline points="397.362,403.557 392.049,398.507 " />
        <polyline points="425.236,403.269 419.898,397.93 " />
        <polyline points="419.898,397.93 415.244,394.744 " />
        <polyline points="415.244,394.744 406.753,406.019 " />
        <polyline points="406.753,406.019 409.754,413.398 " />
        <polyline points="409.754,413.398 413.889,416.545 " />
        <polyline points="413.889,416.545 414.586,417.082 " />
        <polyline points="425.236,403.269 409.015,424.25 " />
        <polyline points="409.015,424.25 424.91,439.919 " />
        <polyline points="424.91,439.919 430.954,433.788 " />
        <polyline points="430.954,433.788 433.411,430.752 " />
        <polyline points="433.411,430.752 443.816,417.745 " />
        <polyline points="443.816,417.745 431.511,407.816 " />
        <polyline points="431.511,407.816 429.093,406.246 " />
        <polyline points="429.093,406.246 425.238,403.265 " />
        <polyline points="477.683,370.78 481.245,373.97 " />
        <polyline points="481.245,373.97 490.26,380.893 " />
        <polyline points="490.26,380.893 479.346,394.494 " />
        <polyline points="479.346,394.494 478.803,394.059 " />
        <polyline points="478.803,394.059 475.953,397.434 " />
        <polyline points="475.953,397.434 464.791,388.629 " />
        <polyline points="462.853,358.563 451.124,373.464 " />
        <polyline points="451.124,373.464 448.934,376.057 " />
        <polyline points="448.934,376.057 455.675,381.876 " />
        <polyline points="455.675,381.876 459.784,385.057 " />
        <polyline points="459.784,385.057 464.791,388.629 " />
        <polyline points="464.791,388.629 477.683,370.78 " />
        <polyline points="477.683,370.78 462.853,358.563 " />
        <polyline points="408.241,335.675 405.68,338.326 " />
        <polyline points="405.68,338.326 411.573,344.084 " />
        <polyline points="411.573,344.084 411.259,344.436 " />
        <polyline points="411.259,344.436 415.565,348.304 " />
        <polyline points="415.565,348.304 417.127,349.823 " />
        <polyline points="417.127,349.823 421.271,353.805 " />
        <polyline points="421.271,353.805 438.594,336.498 " />
        <polyline points="438.594,336.498 425.479,325.134 " />
        <polyline points="425.479,325.134 421.534,322.006 " />
        <polyline points="471.206,416.236 461.938,426.578 " />
        <polyline points="461.938,426.578 473.251,436.715 " />
        <polyline points="473.251,436.715 482.195,426.746 " />
        <polyline points="480.815,406.841 471.531,416.999 " />
        <polyline points="470.976,416.492 482.81,427.308 " />
        <polyline points="482.81,427.308 492.094,417.15 " />
        <polyline points="492.094,417.15 480.814,406.842 " />
        <polyline points="513.182,329.956 527.67,317.569 " />
        <polyline points="527.67,317.569 523.95,314.097 " />
        <polyline points="523.95,314.097 520.909,309.96 " />
        <polyline points="520.909,309.96 516.633,313.477 " />
        <polyline points="516.633,313.477 506.463,322.778 " />
        <polyline points="506.463,322.778 513.236,329.908 " />
        <polyline points="448.952,304.718 462.189,317.569 " />
        <polyline points="462.189,317.569 448.517,329.298 " />
        <polyline points="448.517,329.298 434.126,315.834 " />
        <polyline points="435.649,317.259 448.952,304.718 " />
        <polyline points="470.956,260.76 483.104,254.459 " />
        <polyline points="482.996,254.251 489.784,267.338 " />
        <polyline points="489.784,267.338 490.71,270.073 " />
        <polyline points="490.71,270.073 486.949,273.069 " />
        <polyline points="486.949,273.069 478.923,276.975 " />
        <polyline points="478.923,276.975 470.956,260.76 " />
        <polyline points="449.979,299.567 442.686,291.663 " />
        <polyline points="442.686,291.663 436.743,285.72 " />
        <polyline points="436.743,285.72 450.16,272.924 " />
        <polyline points="450.16,272.924 462.745,287.788 " />
        <polyline points="462.745,287.788 449.979,299.567 " />
        <polyline points="180.161,162.303 172.749,174.35 " />
        <polyline points="172.749,174.35 183.635,180.905 " />
        <polyline points="183.635,180.905 185.372,181.773 " />
        <polyline points="185.372,181.773 192.564,169.744 " />
        <polyline points="201.523,155.237 194.347,150.595 " />
        <polyline points="194.347,150.595 189.306,147.847 " />
        <polyline points="189.306,147.847 180.161,162.303 " />
        <polyline points="180.161,162.303 192.564,169.744 " />
        <polyline points="192.564,169.744 201.523,155.237 " />
        <polyline points="183.636,187.788 196.722,196.149 " />
        <polyline points="191.076,175.697 176.195,199.879 " />
        <polyline points="176.195,199.879 186.242,205.956 " />
        <polyline points="186.242,205.956 185.492,207.313 " />
        <polyline points="185.492,207.313 188.843,208.975 " />
        <polyline points="188.843,208.975 192.842,202.222 " />
        <polyline points="192.842,202.222 200.864,189.666 " />
        <polyline points="200.864,189.666 203.407,183.62 " />
        <polyline points="196.934,166.725 191.095,175.709 " />
        <polyline points="191.095,175.709 203.407,183.62 " />
        <polyline points="203.407,183.62 209.433,174.032 " />
        <polyline points="215.826,163.739 203.294,155.685 " />
        <polyline points="203.294,155.685 196.82,166.658 " />
        <polyline points="196.82,166.658 209.378,173.997 " />
        <polyline points="209.378,173.997 215.826,163.739 " />
        <polyline points="196.855,199.784 188.226,213.025 " />
        <polyline points="188.226,213.025 201.249,220.714 " />
        <polyline points="201.249,220.714 208.194,207.826 " />
        <polyline points="204.291,187.234 196.438,200.488 " />
        <polyline points="196.438,200.488 208.194,207.826 " />
        <polyline points="208.194,207.826 215.772,196.092 " />
        <polyline points="215.772,196.092 216.254,194.671 " />
        <polyline points="223.128,183.6 216.254,194.671 " />
        <polyline points="216.254,194.671 209.185,190.95 " />
        <polyline points="209.185,190.95 203.987,187.238 " />
        <polyline points="203.987,187.238 210.424,176.317 " />
        <polyline points="210.424,176.317 217.89,180.489 " />
        <polyline points="217.89,180.489 223.128,183.6 " />
        <polyline points="223.128,183.6 232.044,167.937 " />
        <polyline points="232.044,167.937 227.059,164.793 " />
        <polyline points="227.059,164.793 219.547,160.807 " />
        <polyline points="219.547,160.807 210.784,175.421 " />
        <polyline points="210.784,175.421 210.424,176.317 " />
        <polyline points="229.156,177.653 221.967,189.219 " />
        <polyline points="221.967,189.219 227.52,193.155 " />
        <polyline points="227.52,193.155 234.493,197.469 " />
        <polyline points="234.493,197.469 241.554,184.75 " />
        <polyline points="241.554,184.75 229.156,177.653 " />
        <polyline points="158.634,166.352 149.997,181.004 " />
        <polyline points="149.997,181.004 162.846,188.386 " />
        <polyline points="162.846,188.386 170.803,174.923 " />
        <polyline points="170.803,174.923 170.984,173.836 " />
        <polyline points="178.306,161.934 170.984,173.836 " />
        <polyline points="170.984,173.836 158.705,166.396 " />
        <polyline points="158.705,166.396 165.898,154.366 " />
        <polyline points="172.47,143.081 177.189,145.799 " />
        <polyline points="177.189,145.799 179.292,146.801 " />
        <polyline points="179.292,146.801 185.245,150.15 " />
        <polyline points="185.245,150.15 180.459,159.371 " />
        <polyline points="180.459,159.371 180.02,159.14 " />
        <polyline points="180.02,159.14 178.306,161.934 " />
        <polyline points="178.306,161.934 165.898,154.366 " />
        <polyline points="165.898,154.366 172.417,143.05 " />
        <polyline points="239.694,191.694 232.378,204.344 " />
        <polyline points="232.378,204.344 245.59,211.563 " />
        <polyline points="245.59,211.563 252.575,198.877 " />
        <polyline points="262.39,181.897 255.941,178.301 " />
        <polyline points="255.941,178.301 249.739,174.456 " />
        <polyline points="249.739,174.456 239.694,191.694 " />
        <polyline points="239.694,191.694 252.593,198.887 " />
        <polyline points="252.593,198.887 262.39,181.897 " />
        <polyline points="239.371,224.852 230.891,239.316 " />
        <polyline points="230.891,239.316 226.45,247.976 " />
        <polyline points="226.45,247.976 239.668,255.367 " />
        <polyline points="239.668,255.367 244.534,247.005 " />
        <polyline points="244.534,247.005 250.757,235.824 " />
        <polyline points="250.757,235.824 252.5,232.572 " />
        <polyline points="247.013,212.157 239.324,224.93 " />
        <polyline points="239.324,224.93 252.5,232.572 " />
        <polyline points="252.5,232.572 259.776,218.999 " />
        <polyline points="255.073,198.019 247.013,212.157 " />
        <polyline points="247.013,212.157 259.776,218.999 " />
        <polyline points="259.776,218.999 267.664,205.236 " />
        <polyline points="277.769,187.478 271.568,184.006 " />
        <polyline points="271.568,184.006 264.498,181.897 " />
        <polyline points="264.498,181.897 255.073,198.019 " />
        <polyline points="255.073,198.019 267.606,205.202 " />
        <polyline points="267.606,205.202 278.477,187.478 " />
        <polyline points="278.477,187.478 277.769,187.478 " />
        <polyline points="251.107,238.944 240.691,258.457 " />
        <polyline points="240.691,258.457 253.398,265.179 " />
        <polyline points="253.398,265.179 258.845,257.955 " />
        <polyline points="258.845,257.955 264.744,247.29 " />
        <polyline points="264.744,247.29 257.175,242.652 " />
        <polyline points="257.175,242.652 251.107,238.944 " />
        <polyline points="258.672,225.178 251.107,238.944 " />
        <polyline points="251.107,238.944 264.189,246.251 " />
        <polyline points="264.189,246.251 271.942,232.371 " />
        <polyline points="266.112,212.405 258.649,225.165 " />
        <polyline points="258.649,225.165 271.942,232.371 " />
        <polyline points="271.942,232.371 279.128,219.914 " />
        <polyline points="273.179,199.068 266.112,212.405 " />
        <polyline points="266.112,212.405 279.011,219.846 " />
        <polyline points="279.011,219.846 286.327,206.824 " />
        <polyline points="293.2,193.714 280.746,186.61 " />
        <polyline points="280.746,186.61 273.179,199.068 " />
        <polyline points="273.179,199.068 286.187,206.738 " />
        <polyline points="286.187,206.738 293.2,193.714 " />
        <polyline points="274.05,233.859 266.238,245.765 " />
        <polyline points="266.238,245.765 279.081,253.358 " />
        <polyline points="279.081,253.358 287.545,241.209 " />
        <polyline points="294.018,226.543 287.545,241.209 " />
        <polyline points="287.545,241.209 274.05,233.859 " />
        <polyline points="274.05,233.859 281.243,219.598 " />
        <polyline points="299.133,216.81 294.018,226.543 " />
        <polyline points="294.018,226.543 291.757,225.841 " />
        <polyline points="291.757,225.841 286.824,223.194 " />
        <polyline points="286.824,223.194 285.708,221.954 " />
        <polyline points="285.708,221.954 281.243,219.598 " />
        <polyline points="281.243,219.598 286.08,210.421 " />
        <polyline points="286.08,210.421 286.576,209.925 " />
        <polyline points="291.288,201.616 286.576,209.925 " />
        <polyline points="286.576,209.925 290.792,212.033 " />
        <polyline points="290.792,212.033 292.405,213.273 " />
        <polyline points="292.405,213.273 299.133,216.81 " />
        <polyline points="299.133,216.81 303.939,208.188 " />
        <polyline points="308.773,199.636 296.007,192.798 " />
        <polyline points="296.007,192.798 291.288,201.616 " />
        <polyline points="291.288,201.616 303.939,208.188 " />
        <polyline points="303.939,208.188 308.773,199.636 " />
        <polyline points="308.773,199.636 308.773,199.636 " />
        <polyline points="308.773,199.636 308.773,199.636 " />
        <polyline points="324.161,204.484 321.13,203.081 " />
        <polyline points="321.13,203.081 311.212,199.16 " />
        <polyline points="311.212,199.16 309.242,202.6 " />
        <polyline points="309.242,202.6 298.415,222.469 " />
        <polyline points="298.415,222.469 296.808,226.077 " />
        <polyline points="296.808,226.077 305.175,230.427 " />
        <polyline points="305.175,230.427 309.602,233.118 " />
        <polyline points="309.602,233.118 324.161,204.484 " />
        <polyline points="303.752,248.379 297.242,260.254 " />
        <polyline points="297.242,260.254 295.151,264.153 " />
        <polyline points="295.151,264.153 303.729,268.755 " />
        <polyline points="303.729,268.755 308.084,271.09 " />
        <polyline points="308.084,271.09 310.294,266.97 " />
        <polyline points="310.294,266.97 310.319,266.92 " />
        <polyline points="310.319,266.92 310.558,267.041 " />
        <polyline points="310.558,267.041 312.493,263.353 " />
        <polyline points="312.493,263.353 316.844,254.95 " />
        <polyline points="323.329,242.95 316.844,254.95 " />
        <polyline points="316.844,254.95 303.737,248.371 " />
        <polyline points="303.737,248.371 310.039,235.799 " />
        <polyline points="310.039,235.799 310.156,235.852 " />
        <polyline points="329.65,231.208 323.067,227.661 " />
        <polyline points="323.067,227.661 316.485,224.113 " />
        <polyline points="316.485,224.113 310.206,235.76 " />
        <polyline points="310.206,235.76 310.156,235.852 " />
        <polyline points="310.156,235.852 316.742,239.401 " />
        <polyline points="316.742,239.401 323.33,242.948 " />
        <polyline points="323.33,242.948 329.65,231.208 " />
        <polyline points="321.366,215.433 317.002,223.869 " />
        <polyline points="317.002,223.869 325.78,228.967 " />
        <polyline points="325.78,228.967 329.696,230.993 " />
        <polyline points="329.696,230.993 334.233,222.224 " />
        <polyline points="334.233,222.224 334.146,222.181 " />
        <polyline points="340.029,210.793 334.147,222.179 " />
        <polyline points="334.147,222.179 327.255,218.73 " />
        <polyline points="327.255,218.73 321.054,215.257 " />
        <polyline points="321.054,215.257 327.255,204.096 " />
        <polyline points="327.255,204.096 340.029,210.793 " />
        <polyline points="346.355,237.084 332.96,229.519 " />
        <polyline points="332.96,229.519 342.262,213.521 " />
        <polyline points="342.262,213.521 346.726,216.001 " />
        <polyline points="346.726,216.001 347.279,216.247 " />
        <polyline points="347.279,216.247 347.491,215.772 " />
        <polyline points="347.491,215.772 355.502,219.884 " />
        <polyline points="355.502,219.884 346.355,237.084 " />
        <polyline points="341.766,250.043 361.502,261.254 " />
        <polyline points="347.967,238.324 335.565,261.763 " />
        <polyline points="335.565,261.763 355.232,272.291 " />
        <polyline points="355.232,272.291 368.426,249.064 " />
        <polyline points="354.433,241.724 347.967,238.324 " />
        <polyline points="372.027,227.907 357.888,219.846 " />
        <polyline points="357.888,219.846 347.967,238.324 " />
        <polyline points="347.967,238.324 358.137,243.656 " />
        <polyline points="358.137,243.656 369.379,249.565 " />
        <polyline points="369.379,249.565 371.67,245.253 " />
        <polyline points="383.809,233.983 372.027,227.907 " />
        <polyline points="372.027,227.907 364.462,241.424 " />
        <polyline points="364.462,241.424 376.368,247.749 " />
        <polyline points="376.368,247.749 383.809,233.983 " />
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
	alert(jsonObj);
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
