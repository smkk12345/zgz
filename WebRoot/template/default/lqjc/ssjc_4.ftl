<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="ssjc_4 container-fluid  clearfix">
    <#if chartXAxis??>
    <ul class="nav nav-pills menu">
        <#include "ssjcMenu.ftl"/>
        <li role="presentation" class="pull-right"></li>
    </ul>
    <div  class="menu mt20 clearfix pull-right ">
        <div class="form-group pull-right m0">
            <button class="btn btn-success ml10" onclick="javascript:refresh('topRefresh');">更 新</button>
        </div>
        <div class="form-group clearfix pull-right ml5">
            <label for="ckhInput" class="control-label fl mt10">起始日期:</label>
            <input type="text" class="form-control fl" name="startDate" value="${CommenDate.startDate}" id="datepicker-last"   placeholder="填写曲线开始时间"/>
        </div>
        <div class="form-group clearfix pull-right ml5">
            <select class="form-control width-80px pull-right bold" id="WSS-Select">
                <option value="${BASE_PATH}lqjc/ssjc_2.action">温度</option>
                <option value="${BASE_PATH}lqjc/ssjc_3.action">湿度</option>
                <option selected='selected' value="${BASE_PATH}lqjc/ssjc_4.action">水分</option>
            </select>
        </div>
    </div>
    <div id="tu-container" class="clearfix fl"></div>
    <div  class="menu mt10 clearfix fl">
        <div class="form-group fl yu-switch">
            <ul class="clearfix bootstrap-switch-mini">
                <#list 1..arrangementBean.layerCount?number as vo>
                <li class="chui-jm">层${vo_index+1}：<input  type="checkbox" name="switch" value="%,%,${vo_index}"></li>
                </#list>
                <li class="base-sline">粮堆平均水分：<input  type="checkbox" name="switch" value="B1" checked="checked"></li>
                <li class="common-sw">截面总开关：<input  type="checkbox" id="switch-all" name="switch-all" value="all" ></li>
            </ul>
            <ul class="clearfix bootstrap-switch-mini">
                <#list 1..arrangementBean.rowCount?number as vo>
                <li class="heng-jm">行${vo_index+1}：<input  type="checkbox" name="switch" value="${vo_index},%,%"></li>
                </#list>
            </ul>
            <ul class="clearfix bootstrap-switch-mini">
                <#list 1..arrangementBean.columnCount?number as vo>
                <li class="lie-jm">列${vo_index+1}：<input  type="checkbox" name="switch" value="%,${vo_index},%"></li>
                </#list>
            </ul>
        </div>
    </div>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/Highcharts/highcharts.js"></script>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/Highcharts/exporting.js"></script>
    <script src="${BASE_ASSETS_PATH}js/ssjc.js"></script>
    <script type="text/javascript">
                //日期插件-只能选择过去日期
                $('#datepicker-last').datepicker({
                    format: 'yyyy-mm-dd',
                    showMeridian: true,
                    todayBtn: true,
                    autoclose: true,
                    endDate: '${CommenDate.startDate}'
                });


                $("input[name='switch-all']").on('switchChange.bootstrapSwitch', function (e, state) {

                    if ($("input[name='switch-all']").is(':checked')) {
                        $("input[name='switch']").each(function () {
                            if ($(this).val() !== "B1") {
                                $(this).attr("checked", "checked");
                            }
                        });
                    } else {
                        $("input[name='switch']").each(function () {
                            if ($(this).val() !== "B1") {
                                $(this).removeAttr("checked");
                            }
                        });
                    }


                    var values = "";
                    $("input[name='switch']").each(function () {
                        if ($(this).is(':checked') || $(this).attr("checked") === "checked") {
                            values = values + $(this).val() + "#";
                        }
                    });
                    refresh(values);
                });

                $("input[name='switch']").on('switchChange.bootstrapSwitch', function (e, state) {
                    var values = "";
                    $("input[name='switch']").each(function () {
                        if ($(this).is(':checked')) {
                            values = values + $(this).val() + "#";
                        }
                    });
                    refresh(values);
                });

                function refresh(values) {
                    if (values === "topRefresh") {
                        var values = "";
                        $("input[name='switch']").each(function () {
                            if ($(this).is(':checked')) {
                                values = values + $(this).val() + "#";
                            }
                        });
                    }
                    values = values.substring(0, values.length - 1);
                    startDate = $('input[name="startDate"]')[0].value;
                    endDate = '${CommenDate.RecentDate}';
                    getChartData(values, startDate, endDate, '${grainId}');
                }

                function getChartData(ids, startDateStr, endDate, grainId) {
                    var url = '${BASE_PATH}lqjc/getChartData.action?oType=' + "sf";
                    $.ajax({
                        type: "POST",
                        url: url,
                        dataType: "json",
                        data: {ids: ids, startDateStr: startDateStr, endDateStr: endDate, grainId: grainId, oType: "sf"},
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("出错");
                        },
                        success: function (response) {
                            var curChartXAxis = response.chartXAxis;
                            var curChartSeries = response.chartSeries;
                            if (curChartXAxis != null) {
                                CallChart('', curChartXAxis, curChartSeries, "平均水分曲线分析图", "（最近监测时间：${CommenDate.RecentDate}）", "水分(%)");
                            } else {
                                alert("此时间段没有粮情数据！");
                            }
                        }
                    });

                }
                /*Auth:yulei,2015.7.7
                 * 三维图及曲线图绘制
                 * CallChart(ajaxURL, X数据, Y数据, title,subtitle, 单位);
                 */
                function Chart() {
                    CallChart('', '${chartXAxis}', '${chartSeries}', "平均水分曲线分析图", "（最近监测时间：${CommenDate.RecentDate}）", "水分(%)");
                }
                //选择框切换温湿水
                $('#WSS-Select').change(function () {
                    var url = $(this).children('option:selected').val();
                    window.location.href = url;
                });
    </script>
    <#else>
    <div class="alert alert-danger">当前厫间内没有粮食或无粮情数据！</div>
    </#if>
</div>
</@override>
<script src="${BASE_ASSETS_PATH}js/yuChart.js"></script>
<@extends name = "../base/layout.ftl"/>
