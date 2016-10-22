<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  width-100- center">
        <#if oType=='wd'>
        温度变化曲线
        <#elseif oType=='sd'>
        湿度变化曲线
        <#else>
        水分变化曲线
        </#if>
    </h4>
</div>
<div class="modal-body" style="height:500px;">
    <div  class="menu clearfix">
        <div class="form-group  pull-right">
            <label for="ckhInput" class="control-label fl mt10">起始日期:</label>
            <span style="position: relative; z-index: 9999;"><input type="text" class="form-control fl" name="startDate" value="${CommenDate.startDate}" id="datepicker-last"   placeholder="填写曲线开始时间"/></span>
            <button class="btn btn-success ml10" onclick="javascript:refresh();">更 新</button>
        </div>
    </div>
    <div id="tu-container"></div>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/Highcharts/highcharts.js"></script>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/Highcharts/exporting.js"></script>
    <script type="text/javascript">
                $(document).ready(function () {
                    /*Auth:yulei,2015.7.7
                     * 加载厫间 
                     */
                    $('#datepicker-last').datepicker({
                        format: 'yyyy-mm-dd',
                        showMeridian: true,
                        todayBtn: true,
                        autoclose: true,
                        endDate: '${CommenDate.startDate}'
                    });
                    Chart();
                });
                function getAllName() {
                    var nameArr = new Array();
                    var oType = '${oType}';
                    var title = "";
                    var subTitle = "";
                    if (oType == "wd") {
                        title = "该点温度曲线分析图";
                        subTitle = "温度(℃)";
                    } else if (oType == "sd") {
                        title = "该点湿度曲线分析图";
                        subTitle = "温度(%)";
                    } else {
                        title = "该点水分曲线分析图";
                        subTitle = "水分(%)";
                    }
                    nameArr[0] = title;
                    nameArr[1] = subTitle;
                    return nameArr;
                }
                function refresh() {
                    var values = '${point}';
                    startDate = $('input[name="startDate"]')[0].value;
                    endDate = '${CommenDate.RecentDate}';
                    getChartData(values, startDate, endDate, '${grainId}', '${oType}');
                }

                function getChartData(ids, startDateStr, endDate, grainId, oType) {
                    var url = '${BASE_PATH}lqjc/getPointChartData.action';
                    $.ajax({
                        type: "POST",
                        url: url,
                        dataType: "json",
                        data: {ids: ids, startDateStr: startDateStr, endDateStr: endDate, grainId: grainId, oType: oType},
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("出错");
                        },
                        success: function (response) {
                            var curChartXAxis = response.chartXAxis;
                            var curChartSeries = response.chartSeries;
                            var nameArr = getAllName();
                            CallChart('', curChartXAxis, curChartSeries, nameArr[0], "（最近监测时间：${CommenDate.RecentDate}）", nameArr[1]);
                        }
                    });
                }
                /*Auth:yulei,2015.7.7
                 * 三维图及曲线图绘制
                */
                function CallChart(ajaxUrl, chartXAxis, chartSeries, title, subtitle, yAxis_title) {
                    var chartXAxis = chartXAxis;
                    var chartSeries = chartSeries;
                    var chartXAxisArry = [];
                    chartXAxisArry = chartXAxis.split(",");
                    var chartSeriesArry = [];
                    chartSeriesArry = JSON.parse(chartSeries);
                    var width_modal = $(window).width() * 0.75;
                    $(".modal-lg").css("width", width_modal + "px");
                    $(".modal-lg").css("min-width", "600px");
                    $("#tu-container").css("width", $(".modal-lg").width() - 100 + "px");


                    BaseChart(chartXAxisArry, chartSeriesArry, title, subtitle, yAxis_title);
                }
                /* BaseChart,2015.7.17,yulei
                 * 2015.6.1，于磊
                 */
                function BaseChart(chartXAxisArry, chartSeriesArry, title, subtitle, yAxis_title) {
                    var chart;
                    chart = new Highcharts.Chart({
                        chart: {
                            renderTo: 'tu-container',
                            defaultSeriesType: 'spline',
                            marginRight: 110,
                            marginBottom: 35
                        },
                        title: {
                            text: title,
                            x: -20 //center
                        },
                        subtitle: {
                            text: subtitle,
                            x: -20
                        },
                        xAxis: {
                            categories: chartXAxisArry //设置x轴数据
                        },
                        yAxis: {
                            title: {
                                text: yAxis_title
                            },
                            plotLines: [{
                                    value: 0,
                                    width: 1,
                                    color: '#808080'
                                }]
                        },
                        tooltip: {
                            formatter: function () {
                                 return '' + this.series.name + '(' + this.x.substr(0,11) + ')<br/>' +
                        '<b>' +yAxis_title.substr(0,yAxis_title.length-3)+':'+ this.y + yAxis_title.substr(yAxis_title.length-3)+ '</b>';
                            }
                        },
                        legend: {
                            layout: 'vertical',
                            align: 'right', //设置说明文字的文字 left/right/top/
                            verticalAlign: 'top',
                            x: 0,
                            y: 100,
                            borderWidth: 0
                        },
                        plotOptions: {
                            line: {
                                dataLabels: {
                                    enabled: true //显示每条曲线每个节点的数据项的值
                                },
                                enableMouseTracking: false
                            }
                        },
                        series: chartSeriesArry
                    });
                }
                /*Auth:yulei,2015.7.7
                 * 三维图及曲线图绘制
                 * CallChart(ajaxURL, X数据, Y数据, title,subtitle, 单位);
                 */
                function Chart() {
                    var nameArr = getAllName();
                    CallChart('', '${chartXAxis}', '${chartSeries}', nameArr[0], "（最近监测时间：${CommenDate.RecentDate}）", nameArr[1]);
                }
    </script>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
</div>