<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<meta http-equiv="refresh" content="5">
<div class='container-fluid' style="background-color:#000; padding: 50px 30px 30px 30px;height:100%">
    <div style='color:#FFF;font-size:36px; font-family:"宋体";font-weight:bold;text-align: center;'>长辛店张郭庄交房汇总情况</div>
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
</@override>
<@extends name = "../base/layout.ftl"/>
