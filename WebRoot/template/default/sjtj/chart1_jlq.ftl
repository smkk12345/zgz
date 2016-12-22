<!DOCTYPE html>
<html>
<head>
    <title>长辛店镇张郭庄村棚改项目签约选房管理系统</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta http-equiv="refresh" content="5">
    <!--CSS文件-->
    <link href="${BASE_ASSETS_PATH}libs/bootstrap-3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="${BASE_ASSETS_PATH}libs/bootstrap-3.3.4/css/bootstrap-switch.min.css" rel="stylesheet">
    <link href="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet">
    <link href="${BASE_ASSETS_PATH}libs/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <link href="${BASE_ASSETS_PATH}css/common.css" rel="stylesheet">
    <link href="${BASE_ASSETS_PATH}css/lqt-v1.css" rel="stylesheet">
    <link href="${BASE_ASSETS_PATH}css/style-1.css" rel="stylesheet" id="theme">
    <!--JS文件-->
    <script src="${BASE_ASSETS_PATH}libs/jquery-2.1.4.min.js"></script>
    <script src="${BASE_ASSETS_PATH}libs/bootstrap-3.3.4/js/bootstrap.min.js"></script>
    <script src="${BASE_ASSETS_PATH}libs/bootstrap-3.3.4/js/bootstrap-switch.js"></script>
    <script src="${BASE_ASSETS_PATH}libs/bootstrap-progressbar/js/bootstrap-progressbar.min.js"></script>
</head>
<body oncontextmenu="return false">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
<div class="container-fluid" style="background-color:#000; padding: 120px 30px 30px 30px;height:100%;">
<#if from?? >
    <#if from = "touch">
        <a href="${BASE_PATH}sjtj/touch.action" class="btn btn-default glyphicon glyphicon-chevron-left"
           style="position:absolute;left: 20px;top:30px; font-size: 20px;">返回</a>
    </#if>
</#if>
    <div style='color:#FFF;font-size:70px; font-family:"Microsoft YaHei";font-weight:bold;text-align: center;'>
        长辛店镇张郭庄村棚户区改造宅基地腾退项目
    </div>
    <!--    <div id='currentDate' style='margin-top: 20px;color:#FFF;font-size:25px; font-family:"宋体";font-weight:bold;text-align: center;'></div>-->
    <div style='margin-top:100px;color:red;font-size:70px; font-family:"Microsoft YaHei";font-weight:bold;text-align: center;'>
        	奖励期：第${day+1}天
    </div>

    <div style='margin-top: 80px;color:#FF0;font-size:60px; font-family:"Microsoft YaHei";font-weight:bold;text-align: center;'>
        整体签约比例：<span style="color: red">${qybl?default(0)}</span>
    </div>
   <div style='margin-top: 80px;color:#FF0;font-size:45px; font-family:"Microsoft YaHei";font-weight:bold;text-align: center;'>
           累计签约户数：<span style="color: red">&nbsp;${yqy?default(50)}户</span> &nbsp;&nbsp;&nbsp;&nbsp;房屋安置:<span style="color: red">&nbsp;${az?default(50)}户</span>&nbsp;&nbsp;&nbsp;&nbsp;货币补偿：<span style="color: red">&nbsp;${hb?default(50)}户</span>
    </div>

    

</div>
</body>
</html>
