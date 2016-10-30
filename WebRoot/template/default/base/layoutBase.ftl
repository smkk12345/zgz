<!DOCTYPE html>
<html>
    <head>
        <title>长辛店棚改征收项目签约选房管理系统</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Access-Control-Allow-Origin" content="*">
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
    <body oncontextmenu="return false"  <@block name="bodyClass"></@block>>
          <div class="container-full"> 
            <@block name="mainBody"></@block>
        </div>
        <!-- Modal -->
        <div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
            <div class="modal-dialog modal-lg" >
                <div class="modal-content"> </div>
            </div>
        </div>
        <!-- yu-fade -->
<div id="yu-fade" tabindex="-1" class="modal fade in hidden"  style="padding-left: 17px; display: block; filter:alpha(opacity=70);-moz-opacity:0.7;-khtml-opacity: 0.7;opacity: 0.7; background-color:gray">
</div>
        <script src="${BASE_ASSETS_PATH}js/commen.js"></script>
        <script src="${BASE_ASSETS_PATH}js/CalendarUtil.js"></script>
        <script type="text/javascript">
            themeDoc = {
                "默认主题": "",
                "深蓝科技": "${BASE_ASSETS_PATH}css/style-1.css",
                "青花瓷韵": "${BASE_ASSETS_PATH}css/style-2.css",
                "萌芽新绿": "${BASE_ASSETS_PATH}css/style-3.css",
                "金属质感": "${BASE_ASSETS_PATH}css/style-4.css",
            };
            $(document).ready(function () {
                var theme = '${user.theme}';
                if (theme == -1000) {
                    theme = getCookie("theme");
                }
                else {
                    var date = new Date();
                    date.setTime(date.getTime() + 5256000 * 60 * 1000); //设置date为当前时间+10年                   
                    document.cookie = "theme=" + escape(theme) + ";expires=" + date.toGMTString();
                }
                if (theme !== "" && theme !== null) {
                    $("#theme").attr("href", themeDoc[theme]);
                }

            });
            //获取cookie
            function getCookie(theme) {
                var strCookie = document.cookie;
                var arrCookie = strCookie.split(";");
                for (var i = 0; i < arrCookie.length; i++) {
                    var arr = arrCookie[i].split("=");
                    var curTheme = unescape(arr[0]);
                    if (curTheme === theme) {
                        return unescape(arr[1]);
                    }
                }
            }
          
        </script>
    </body>
</html>