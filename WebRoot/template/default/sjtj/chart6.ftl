<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
     
   	<meta charset="UTF-8">
    <title>安置及房源使用情况</title>
    <meta http-equiv="refresh" content="5">
    <script src="${BASE_ASSETS_PATH}libs/Highcharts/highcharts.js"></script>
    <style>
        html, body {
            font-family: '微软雅黑';
        }

        .chart_content div {
            float: left;
            width: 50%;
            height: 100%;
            margin-top: 15px;
        }
    </style>
    <div style="text-align: center;font-size: 45px;font-weight: bold;">东城区望坛棚改征收项目安置及房源使用情况</div>
	<div style="width: 100%;" class="chart_content">
	    <div id="chart1"></div>
	    <div id="chart2" ></div>
	</div>
<script>

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
            colors: [ '#F9F900','#FF44FF'],
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
                categories: ['一居室', '二居室70','二居室75','二居室80','二居室85','三居室'],
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

    });
</script>
<script type="text/javascript">

	$(document).ready(function(){ 
	});  
	
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">
   
</script>
