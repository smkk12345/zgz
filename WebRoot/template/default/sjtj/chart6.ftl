<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/Highcharts/highcharts.js"></script>
<meta http-equiv="refresh" content="5">

<div class="container-fluid" style="padding: 20px;height:100%">
    <div style="text-align: center;font-size:36px;font-weight: bold;">长辛店张郭庄安置及房源使用情况</div>
    <div id='currentDate' style='margin-top: 20px;font-size:20px; font-family:"宋体";font-weight:bold;text-align: center;'></div>
    <div style='margin-top: 50px;color:#FF0;font-size:30px; font-family:"宋体";font-weight:bold;text-align: center;height:450px'>
        <div style='float: left;width:auto; height:auto' id="chart1"> </div>
        <div style='float: left;width:auto; height:auto' id="chart2"> </div>
    </div>
</div>

<script type="text/javascript">

    $(function () {
    $('#chart1').highcharts({
    chart: {
    plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
    },
            title: {
            text: '房源使用情况',
                    x: 0,
                    y: 10,
                    style: {
                    color: "#000",
                            fontSize: 20,
                            fontWeight: "bold",
                    }
            },
            colors: [ '#F9F900', '#FF44FF'],
            credits: {//去掉右下角标识
            text: ''
            },
            tooltip: {
            pointFormat: '{series.name}:{point.percentage:.1f}%'
            },
            plotOptions: {
            pie: {
            size:'80%',
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                    enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            distance:'1',
                            formatter: function () {
                            //'{point.name}: {point.percentage:.1f} %'

                            return this.point.name + this.point.percentage.toFixed(2) + "%";
                            }
                    },
                    showInLegend: false
            }
            },
            series: [{
            type: 'pie',
                    name: '',
                    data: [
                    ['剩余', ${syzs}],
                    ['已签约', ${yxzs}]

                    ]
            }]
    });
    $('#chart2').highcharts({
    chart: {
    type: 'column'
    },
            title: {
            text: ''
            },
            colors: ['#84C1FF', '#ff4330'],
            credits: {//去掉右下角标识
            text: ''
            },
            xAxis: {
            categories: ['一居室', '二居室70', '二居室75', '二居室80', '二居室85', '三居室'],
                    title: {
                    text: '居室'
                    }
            },
            yAxis: {
            allowDecimals: false,
                    min: 0,
                    title: {
                    text: '总套数'
                    }
            },
            credits: {//去掉右下角标识
            text: ''
            },
            tooltip: {
            formatter: function () {
            return '<b>' + this.x + '</b><br/>' +
                    this.series.name + ': ' + this.y + '<br/>' +
                    '共: ' + this.point.stackTotal + "户";
            }
            },
            plotOptions: {
            column: {
            stacking: 'normal',
                    borderWidth: 0,
                    dataLabels: {
                    enabled: true,
                            color: '#000000'
                    }
            }
            },
            series: [{
            name: '签约',
                    data: ${yx},
            }, {
            name: '剩余',
                    data: ${sy},
            }]
    });
    });</script>
</@override>
<@extends name = "../base/layout.ftl"/>
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
