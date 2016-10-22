/*Auth:yulei,2015.7.7
 * 三维图及曲线图绘制
 */
function CallChart(ajaxUrl, chartXAxis, chartSeries, title, subtitle, yAxis_title) {
    //取到“后台获取数据”需要的参数
        var switch_values = [];
        $('input[name="switch"]').each(function () {
            if ($(this).attr("checked") === "checked") {
                switch_values.push($(this).val());
            }
        });
    startDate = $('input[name="startDate"]')[0].value;//获取日期
    if (switch_values.length < 1 ) {
        
    } else {
        var chartXAxis = chartXAxis;
        var chartSeries = chartSeries;

        var chartXAxisArry = [];
        chartXAxisArry = chartXAxis.split(",");
        var chartSeriesArry = [];
        chartSeriesArry = JSON.parse(chartSeries);

        BaseChart(chartXAxisArry, chartSeriesArry, title, subtitle, yAxis_title);
    }
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

