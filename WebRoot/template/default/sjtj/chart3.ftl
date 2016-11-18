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
        <script src="${BASE_ASSETS_PATH}libs/Highcharts/highcharts.js"></script>
        <script src="${BASE_ASSETS_PATH}libs/Highcharts/exporting.js"></script>     
        <div class="container-fluid" style="padding: 20px;height:100%">
            <div style="text-align: center;font-size:36px;font-weight: bold;">长辛店镇张郭庄村棚改项目各标段签约情况</div>
            <div id='currentDate' style='margin-top: 20px;font-size:20px; font-family:"宋体";font-weight:bold;text-align: center;'></div>
            <div style='margin-top: 20px;color:#FF0;font-size:20px; font-family:"宋体";font-weight:bold;text-align: center;height:500px'>
                <div style='float: left;width:auto; height: 100%' id="chart1"> </div>
                <div style='float: left;width:270px; height: 100%' id="chart3"> </div>
            </div>
        </div>
        <script>
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
                            if (String(hnum).length == 1){hnum = "0" + hnum; }
                    minutes = (grt - now) / 1000 / 60 - (24 * 60 * dnum) - (60 * hnum);
                            mnum = Math.floor(minutes);
                            if (String(mnum).length == 1){mnum = "0" + mnum; }
                    seconds = (grt - now) / 1000 - (24 * 60 * 60 * dnum) - (60 * 60 * hnum) - (60 * mnum);
                            snum = Math.round(seconds);
                            if (String(snum).length == 1){snum = "0" + snum; }

        //        document.getElementById(timeDate).innerHTML = dnum;
                    document.getElementById("time1").innerHTML = hnum + "时" + mnum + "分" + snum + "秒";
                    }
            setInterval("createtime()", 250);</script>
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
                            categories: ['1标段', '2标段', '3标段', '4标段', "5标段", '6标段', '7标段']
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
    </body>
</html>
