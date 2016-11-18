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
        <div class='container-fluid' style="background-color:#000; padding: 50px 30px 30px 30px;height:100%">
            <div style='color:#FFF;font-size:36px; font-family:"宋体";font-weight:bold;text-align: center;'>长辛店镇张郭庄村棚改项目交房汇总情况</div>
            <div style='margin-top: 20px;color:#FFF;font-size:25px; font-family:"宋体";font-weight:bold;text-align: center;'>
                (截止到<span id='currentDate'></span>)
            </div>
            <div style=' padding-left: 100px;'>
                <div style='margin-top: 50px; padding-left: 70px;  color:#0F0;font-size:36px; font-family:"宋体";font-weight:bold;text-align:left;'>
                    总签约户数：<span style="color: yellow">${zqy} </span> 户
                </div>
                <div style='margin-top: 10px; padding-left: 70px;  color:#0F0;font-size:36px; font-family:"宋体";font-weight:bold;text-align:left;'>
                    今日交房户数：<span style="color: yellow">${jrjf} </span> 户
                </div>
                <div style='margin-top: 10px; padding-left: 70px;  color:#0F0;font-size:36px; font-family:"宋体";font-weight:bold;text-align:left;'>
                    累计交房户数：<span style="color: yellow">${yjf} </span> 户
                </div>
                <div style='margin-top: 10px; padding-left: 70px;  color:#0F0;font-size:36px; font-family:"宋体";font-weight:bold;text-align:left;'>
                    剩余交房户数：<span style="color: yellow">${wjf} </span> 户
                </div>
                <div style='margin-top: 20px; padding-left: 70px;  color:#0F0;font-size:36px; font-family:"宋体";font-weight:bold;text-align:left;'>
                    整体交房比例：<font color="red"> ${jfbi} </font>
                </div>
            </div>

        </div>

        <script type="text/javascript">
            $(document).ready(function () {
                var displayDay = getNowFormatDate();
                document.getElementById("currentDate").innerHTML = "当前时间：" + displayDay;
            });
            function getNowFormatDate() {
                    var date = new Date();
                    var seperator1 = "年";
                    var seperator2 = "月";
                var seperator3 = "日";
                var seperator4 = "星期";
                    var year = date.getFullYear();
                    var month = date.getMonth() + 1;
                    var strDate = date.getDate();
                var week = date.getDay();
                var str = "";
                if (week == 0) {  
                            	str = "星期日";  
                } else if (week == 1) {  
                        str = "星期一";  
                } else if (week == 2) {  
                        str = "星期二";  
                } else if (week == 3) {  
                        str = "星期三";  
                } else if (week == 4) {  
                        str = "星期四";  
                } else if (week == 5) {  
                        str = "星期五";  
                } else if (week == 6) {  
                        str = "星期六";  
                }  
                    if (month >= 1 && month <= 9) {
                            month = "0" + month;
                    }
                    if (strDate >= 0 && strDate <= 9) {
                            strDate = "0" + strDate;
                    }
                    var currentdate = year + seperator1 + month + seperator2 + strDate + seperator3
                                    + " " + str;
                    return currentdate;
            }

        </script>
    </body>
</html>
