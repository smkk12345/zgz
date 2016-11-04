<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
    <script src="${BASE_ASSETS_PATH}libs/Highcharts/highcharts.js"></script>
    <script src="${BASE_ASSETS_PATH}libs/Highcharts/exporting.js"></script>     
 	<meta charset="UTF-8">
    <title>实时签约比例公示</title>
    <meta http-equiv="refresh" content="5">
    
    <style>
        /*.chart_content .div1 {*/
        /*float: left;*/
        /*width: 65%;*/
        /*height: 650px;*/
        /*margin-top: 15px;*/
        /*}*/

        /*.chart_content .div2 {*/
        /*position: absolute;*/
        /*left: 69%;*/
        /*top: 60px;*/
        /*width: 30%;*/
        /*height: 650px;*/
        /*margin-top: 15px;*/
        /*}*/

        .chart_content .div3 {
            position: absolute;
            top: 660px;
            float: left;
            width: 100%;
            height: 50px;
            left: 0;
            margin-top: 10px;
        }

        .ul {
            list-style: none;
        }

        .ul li {
            float: left;
            margin-left: 45px;
        }

        .ul li img {
            width: 35px;
            height: 35px;
        }
    </style>
<div style="width: 100%;" class="chart_content">
    <div style="text-align: center;font-size: 45px;font-weight: bold;">长辛店镇张郭庄村改造征收项目各标段签约情况</div>
    <div style="position: absolute;top: 10px;left: 20px;font-size: 25px;font-weight: bold;text-align: center;">2016年07月23日<br/><span id="time1"></span></div>
    <script>
        var now = new Date();
        function createtime()
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

//        document.getElementById(timeDate).innerHTML = dnum;
            document.getElementById("time1").innerHTML = hnum + "时" + mnum + "分" + snum + "秒";
        }
        setInterval("createtime()",250);
    </script>

    <table style="width: 100%;">
        <tr>
            <td style="width: 75%;">
                <div style=" height: 650px" id="chart1"></div>
            </td>
            <td style="width: 25%;">
                <div id="chart3" style="width: 400px;height: 650px"></div>
            </td>
        </tr>
    </table>
    <!--<div class="div1">-->
    <!--&lt;!&ndash;<div style="text-align: center; font-size: 25px">2016年08月01日 星期一 距离奖励期结束还有29天12小时13分钟56秒</br>总户数5560户，今日签约356户，累计签约3965户；签约比例65.89% </div>&ndash;&gt;-->
    <!--&lt;!&ndash;<div style="text-align: center;font-size: 36px;font-weight: bold;">各分指签约情况</div>&ndash;&gt;-->
    <!--<div style=" height: 590px" id="chart1"></div>-->
    <!--</div>-->
    <!--<div style="margin-right: -120px;" class="div2" id="chart2">-->
    <!--<div class="" id="chart3" style="width: 400px;height: 590px"></div>-->
    <!--</div>-->
    <div class="div3">
        <div style="margin-top:20px; ">
            <marquee direction="left"
                     behavior="scroll"
                     scrollamount="100"
                     scrolldelay="1000"
                     loop="-1"
                     align=""
                     height="50"
                     bgcolor="#000000"
                     hspace="10"
                     vspace="10"
                     valign="middle"
                     onmouseover=stop()
                     onmouseout=start()>
                <font style="color: #ffffff ;font-size: 25px;line-height: 50px">12</font>
            </marquee>
        </div>
    </div>
</div>
<script type="text/javascript">

$(function () {
        $('#chart1').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: '各标段签约情况',
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
            xAxis: {
                categories: ['1标段', '2标段', '3标段', '4标段', "5标段", '6标段'
                ]
            },

            yAxis: {
                allowDecimals: false,
                min: 0,
                title: {
                    text: '总户数'
                },
                stackLabels: {
                    enabled: true,
                    style: {
                        fontWeight: 'bold',
                        color: '#000000'
                    },
                    useHTML: true,
                    formatter: function () {
                        return this.total;
                    }
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
                        color: '#000000',
                        formatter: function () {
                            return this.series.name == '已签约' ? this.point.y + "<br/>" + parseFloat(this.point.y * 100 / this.point.stackTotal).toFixed(2) + '%' : "";
                        }
                    }
                }
            },
            series: ${chartSeries}
        });
        $('#chart3').highcharts({
            chart: {
                type: 'column'
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
            xAxis: {
                categories: ['整体',
                ]
            },

            yAxis: {
//                allowDecimals: false,
                min: 0,
                title: {
                    text: '总户数'
                },
                stackLabels: {
                    enabled: true,
                    style: {
                        fontWeight: 'bold',
                        color: '#000000'
                    },
                    useHTML: true,
                    formatter: function () {
                        return this.total;
                    }
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
                        color: '#000000',
                        formatter: function () {
                            return this.series.name == '已签约' ? this.point.y + "<br/>" + parseFloat(this.point.y * 100 / this.point.stackTotal).toFixed(2) + '%' : "";
                        }
                    }
                }
            },
            series: [{
                name: '已签约',
                data: [${zyqy}],
            }, {
                name: '未签约',
                data: [${zwqy}],
            }]
        });
    })
	
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">
   
</script>
