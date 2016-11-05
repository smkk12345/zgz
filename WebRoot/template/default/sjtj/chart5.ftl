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
<style>
    .chart_content div {
        float: left;
        width: 48%;
        height: 550px;
        margin-top: 15px;
    }
</style>
<div>
    <div style="text-align: center;font-size: 45px;font-weight: bold;">长辛店张郭庄整体签约情况</div>
    <div style="font-size: 25px;font-weight: bold;text-align: center;">2016年07月23日 <span  class= "ml10" id="time1"></span></div>
    <script>
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
    <div class="chart_content">
        <div id="chart"></div>
        <div id="chart1"></div>
    </div>

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
        });
    </script>
</div>

<script type="text/javascript">

    $(document).ready(function(){
    });

</script>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">

</script>
