<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
        <script src="${BASE_ASSETS_PATH}libs/jquery/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/jquery/scoll/scroll.js"></script>     
   <meta charset="UTF-8">
        <title>Title</title>
        <meta http-equiv="refresh" content="5">
        <style>
            * {
                margin: 0;
                padding: 0;
                background-color: black;
            }
            .myscroll {
                width: 1600px;
                height:600px;
                position: absolute;
                left: 450px;
                top:50px;
                margin: 0 auto;
                line-height: 26px;
                font-size: 12px;
                overflow: hidden;
            }
            .myscroll ul{
                list-style: none;
            }
            .myscroll li {
                height: 80px;
                margin-left: 25px;
                font-size: 60px;
                color: white;
                font-weight: bold;
                line-height: 80px;
            }
            .myscroll a {
                color: #333;
                text-decoration: none;
            }
            .myscroll a:hover {
                color: #ED5565;
                text-decoration: underline;
            }
        </style>
<body>
        <div class="myscroll">
            <ul>			
                <li>截止到2016年07月07日12点15分<br>
                	长辛店张郭庄棚户区改造项目
                </li>
                <li></li>
                <li>&nbsp;&nbsp;&nbsp; 总签约户数：&nbsp;&nbsp;${zqy}户</li>
                <li>&nbsp;&nbsp;&nbsp; 今日交房户数：${jrjf}户</li>
                <li>&nbsp;&nbsp;&nbsp; 累计交房户数：${yjf}户</li>
                <li>&nbsp;&nbsp;&nbsp; 剩余交房户数：${wjf}户</li>
                <li>&nbsp;&nbsp;&nbsp; 整体交房比例：<font color="red">${jfbi}</font></li>
                <li></li>
            </ul>
        </div>


    </body>

<script type="text/javascript">

	$(document).ready(function(){ 
	});  
	
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">
   
</script>
