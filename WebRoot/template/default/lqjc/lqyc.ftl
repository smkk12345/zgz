<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="lqyc container-fluid">
    <form class="width-100-">
        <div class="panel panel-default">
            <div class="panel-heading"><span class="fl clearfix">选择日期</span></div>
            <div class="panel-body">
                <div class="form-group clearfix">
                    <label for="ckhInput" class="control-label mt10 width-60px fl ">未来日期:</label>
                    <input type="text" class="form-control width-200px fl" name="endDate" value="" id="datepicker-future"   placeholder="输入预测未来粮情的日期"/>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-primary  fl">预测未来粮情</button>
    </form>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript">
    //日期插件-只能未来日期
    $('#datepicker-future').datepicker({
        format: 'yyyy-mm-dd',
        showMeridian: true,
        todayBtn: true,
        autoclose: true,
        startDate: new Date
    });
    /*Auth:yulei,2015.7.7
     * 三维图及曲线图绘制
     * CallChart(ajaxURL, X数据, Y数据, title,subtitle, 单位);
     */
    function Chart() {
        CallChart('', '${chartXAxis}', '${chartSeries}', "平均湿度曲线分析图", "（最近监测时间：${CommenDate.RecentDate}）", "湿度(%)");
    }
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
