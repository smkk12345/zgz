<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
     
     <style>
        body {
            background-color:#000;
        }
        tr {
            background-color:#000;
        }
        td {
            color:#FFF;
            font-size:72px;
            font-family:"宋体";
            font-weight:bold;
            text-align: center;
        }
        
    </style>  
   <table cellpadding="80" cellspacing="0" border="0" align="center">
    <!--<tr>-->
        <!--<td style="font-size:36px;">奖励期倒计时公示</td>-->
    <!--</tr>-->
    <tr>
        <td id="currentDate" style="color:#FF0;" style="padding-top:50px;font-size:72px;"></td>
    </tr>
    <tr>
        <td style="color:#0F0;" style="font-size:72px;">距离奖励期结束还有<span id="timeDate2" style="color: red">22</span>天<span id="times2" style="color: red">11小时40分15秒</span></td>
    </tr>
    <tr>
        <td style="color:#FF0;" style="font-size:72px;">整体签约比例：<span style="color: red">${qybl?default(0)}</span></td>
    </tr>
</table>
<script type="text/javascript">

	$(document).ready(function(){ 
		var displayDay=getNowFormatDate();
		document.getElementById("currentDate").innerHTML = "当前时间："+displayDay;
		
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
	    var currentdate = year + seperator1 + month + seperator2 + strDate+seperator3
	            + " " +str;
	    return currentdate;
	}
	
	var now = new Date();
	   
    function createtime(timeDate,times)
    {

        var grt= new Date("7/31/2016 20:00:00");

        now.setTime(now.getTime()+250);
        days = (grt - now) / 1000 / 60 / 60 / 24;
        dnum = Math.floor(days);
        hours = (grt - now) / 1000 / 60 / 60 - (24 * dnum);
        hnum = Math.floor(hours);
        if(String(hnum).length ==1 ){hnum = "0" + hnum;}
        minutes = (grt - now) / 1000 /60 - (24 * 60 * dnum) - (60 * hnum);
        mnum = Math.floor(minutes);
        if(String(mnum).length ==1 ){mnum = "0" + mnum;}
        seconds = (grt - now) / 1000 - (24 * 60 * 60 * dnum) - (60 * 60 * hnum) - (60 * mnum);
        snum = Math.round(seconds);
        if(String(snum).length ==1 ){snum = "0" + snum;}

        document.getElementById(timeDate).innerHTML = dnum;
        document.getElementById(times).innerHTML = hnum + "小时" + mnum + "分" + snum + "秒";

//setTimeout("createtime("+timeDate+","+times+")",250);
    }

    //执行示例2
    setInterval("createtime('timeDate2','times2')",250);
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">
   
</script>
