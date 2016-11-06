<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>

<meta http-equiv="refresh" content="5">
<script src="${BASE_ASSETS_PATH}libs/Highcharts/highcharts.js"></script>
<script src="${BASE_ASSETS_PATH}libs/Highcharts/exporting.js"></script>

<div class="container-fluid" style="padding: 20px;height:100%">
    <div style="text-align: center;font-size:36px;font-weight: bold;">长辛店张郭庄整体签约情况</div>
    <div id='currentDate' style='margin-top: 20px;font-size:20px; font-family:"宋体";font-weight:bold;text-align: center;'></div>
    <div style='margin-top: 20px;color:#FF0;font-size:30px; font-family:"宋体";font-weight:bold;text-align: center;height:400px'>
        <div style='float: left;width:50%; height:auto' id="chart"> </div>
        <div style='float: left;width:50%; height:auto' id="chart1"> </div>
    </div>
</div>

</@override>
<@extends name = "../base/layout.ftl"/>
<script>
    $(function () {
    $("#chart").highcharts({
    chart: {
    renderTo: 'pie_chart',
            plotBackgroundColor: 'white', //背景颜色
            plotBorderWidth: 0,
            plotShadow: false
    },
            title: {
            text: '整体签约情况',
                    x: 0,
                    y: 20,
                    style: {
                    color: "#000",
                            fontSize: 30,
                            fontWeight: "bold",
                    }
            },
            colors: ['#84C1FF', '#ff4330'],
            credits: {//去掉右下角标识
            text: ''
            },
            tooltip: {//鼠标移动到每个饼图显示的内容
            pointFormat: '{series.name}:{point.percentage:.1f}%',
                    percentageDecimals: 1,
                    //                    formatter: function() {
                    //                        return pointFormat+ this.point.name+this.point.percentage/100;
                    //                    }
            },
            plotOptions: {
            pie: {
            borderWidth: 0,
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                    enabled: true,
                            color: '#000',
                            distance: - 50, //通过设置这个属性，将每个小饼图的显示名称和每个饼图重叠
                            style: {
                            fontSize: '18px',
                                    lineHeight: '10px'
                            },
                            formatter: function () {
                            //'{point.name}: {point.percentage:.1f} %'

                            return this.point.name + this.point.percentage.toFixed(2) + "%";
                            }
                    },
                    padding: 20
            }
            },
            series: [{//设置每小个饼图的颜色、名称、百分比
            type: 'pie',
                    name: '占比',
                    data: [
                    {name: '已签约', y: ${yqy}},
                    {name: '未签约', y: ${wqy}}

                    ]
            }]
    });
    $("#chart1").highcharts({
    chart: {
    renderTo: 'pie_chart',
            plotBackgroundColor: 'white', //背景颜色
            plotBorderWidth: 0,
            plotShadow: false
    },
            title: {
            text: '安置方式签约情况',
                    x: 0,
                    y: 20,
                    style: {
                    color: "#000",
                            fontSize: 30,
                            fontWeight: "bold",
                    }
            },
            colors: ['#84C1FF', '#00E3E3', '#ff4330'
            ],
            credits: {//去掉右下角标识
            text: ''
            }
    ,
            tooltip: {//鼠标移动到每个饼图显示的内容
            pointFormat: '{series.name}:{point.percentage:.1f}%',
                    percentageDecimals
                    :
                    1,
                    //                    formatter: function() {
                    //                        return pointFormat+ this.point.name+this.point.percentage/100;
                    //                    }
            }
    ,
            plotOptions: {
            pie: {
            borderWidth: 0,
                    allowPointSelect
                    :
                    true,
                    cursor
                    :
                    'pointer',
                    dataLabels
                    :
            {
            enabled: true,
                    color
                    :
                    '#000',
                    distance
                    :
                    - 50, //通过设置这个属性，将每个小饼图的显示名称和每个饼图重叠
                    style
                    :
            {
            fontSize: '18px',
                    lineHeight
                    :
                    '10px'
            }
            ,
                    formatter: function () {
                    //'{point.name}: {point.percentage:.1f} %'

                    return this.point.name + this.point.percentage.toFixed(2) + "%";
                    }
            }
            ,
                    padding: 20
            }
            }
    ,
            series: [{//设置每小个饼图的颜色、名称、百分比
            type: 'pie',
                    name: '占比',
                    data: [
                    {name: '安置协议', y: ${az}},
                    {name: '货币协议', y: ${hb}}

                    ]
            }]
    })
            ;
    });</script>
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

    var now = new Date();
    function createtime()
    {

    var grt = new Date("7/31/2016 20:00:00");
    now.setTime(now.getTime() + 250);
    days = (grt - now) / 1000 / 60 / 60 / 24;
    dnum = Math.floor(days);
    hours = (grt - now) / 1000 / 60 / 60 - (24 * dnum);
    hnum = Math.floor(hours);
    if (String(hnum).length == 1) {
    hnum = "0" + hnum;
    }
    minutes = (grt - now) / 1000 / 60 - (24 * 60 * dnum) - (60 * hnum);
    mnum = Math.floor(minutes);
    if (String(mnum).length == 1) {
    mnum = "0" + mnum;
    }
    seconds = (grt - now) / 1000 - (24 * 60 * 60 * dnum) - (60 * 60 * hnum) - (60 * mnum);
    snum = Math.round(seconds);
    if (String(snum).length == 1) {
    snum = "0" + snum;
    }

    //        document.getElementById(timeDate).innerHTML = dnum;
    document.getElementById("time1").innerHTML = hnum + "时" + mnum + "分" + snum + "秒";
    }
    setInterval("createtime()", 250);
</script>
