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
        <link href="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" >
        <link href="${BASE_ASSETS_PATH}libs/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" >
        <link href="${BASE_ASSETS_PATH}css/common.css" rel="stylesheet">
        <link href="${BASE_ASSETS_PATH}css/lqt-v1.css" rel="stylesheet">
        <link href="${BASE_ASSETS_PATH}css/style-1.css" rel="stylesheet" id="theme" >
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
        <div class='container-fluid' style="background-color:#000; padding: 50px 30px 30px 30px;height:100%">
            <div style='color:#FFF;font-size:36px; font-family:"宋体";font-weight:bold;text-align: center;'>长辛店张郭庄签约排号情况实时公示</div>
            <div style='margin-top: 20px;color:#FFF;font-size:25px; font-family:"宋体";font-weight:bold;text-align: center;'>
                <table class="table table-bordered mt10" width="100%" border="0" cellspacing="1" cellpadding="10" align="center" bgcolor="#FFFFFF">
                    <tr>
                        <td>签约顺序号</td>
                        <td>所属标段</td>
                        <td>安置方式</td>
                        <td>被腾退人</td>
                        <td>签约时间</td>
                    </tr>
                    <#if list?size gt 0>
                    <#list list as ROW>
                    <tr>
                        <td style="color:#FF0;">${ROW.indexNumStr?default("")}</td>
                        <td style="color:#0F0;">
                            <#if ROW.section == "1">
                            第一标段
                            <#elseif ROW.section == "2">
                            第二标段
                            <#elseif ROW.section == "3">
                            第三标段
                            <#elseif ROW.section == "4">
                            第四标段
                            <#elseif ROW.section == "5">
                            第五标段
                            <#elseif ROW.section == "6">
                            第六标段
                            <#elseif ROW.section == "7">
                            第七标段
                            </#if>
                        </td>
                        <td style="color:#FF0;"><#if (ROW.atype?default("0"))=='0'>房屋安置<#else>货币安置</#if></td>
                        <td style="color:#FF0;">${ROW.names?default("")}</td>
                        <td style="color:#0F0;">${ROW.displaydate?default("")}</td>
                    </tr>
                    </#list>
                    </#if>
                </table>
            </div>
        </div>
        <script type="text/javascript">

            $(document).ready(function () {
            });

        </script>
    </body>
</html>
