<#include "leftMenu.ftl"/>
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js" ></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<script src="${BASE_ASSETS_PATH}libs/tableExport/tableExport.js" charset="UTF-8"></script>
<script src="${BASE_ASSETS_PATH}libs/tableExport/jquery.base64.js" charset="UTF-8"></script>
<script src="${BASE_ASSETS_PATH}libs/tableExport/jspdf/jspdf.js" charset="UTF-8"></script>
<script src="${BASE_ASSETS_PATH}libs/tableExport/jspdf/libs/base64.js" charset="UTF-8"></script>
<script src="${BASE_ASSETS_PATH}libs/tableExport/jspdf/libs/sprintf.js" charset="UTF-8"></script>
<script src="${BASE_ASSETS_PATH}libs/tableExport/jspdf/libs/a.js" charset="UTF-8"></script>
<div class="container-fluid ssjc_1">
    <#if aoJian??>
    <#if aoJian.grainStatus?? && aoJian.grainStatus == '1'>
    <#if lqData??>
    <ul class="nav nav-pills menu">
        <#include "ssjcMenu.ftl"/>
        <li role="presentation" class="pull-right">
            <button type="button"  class="btn btn-info pull-right ml5 ljssjc" onclick="realDetection()" title="实时检测"><span class="bold">实时检测</span></button>
            <button type="button" class="btn btn-success dropdown-toggle YL-ModalClick pull-right ml5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-url='${BASE_PATH}lqjc/lqModal.action' title="选择粮情，默认为最新粮情"><span class="bold">当前粮情:</span> <i class="bold">${lqtime}</i></button>
<!--            <select class="form-control width-80px pull-right" id="WSS-Select">
                <option value="wd">温度</option>
                <option value="sd">湿度</option>
                <option value="sf">水分</option>
            </select>-->
        </li>
    </ul>

    <table id='yu-print-show' class="table table-condensed table-bordered mt10">
        <thead>
            <tr>
                <th fontsize="26" colspan="${arrangementBean.layerCount?number*4+1}" class="danger textalign-vc" style="line-height: 29px">
                    <i class="bold">${CommenData.lkmc}${barnIndex}号仓粮情报表</i> 
                    <button type="button" class="btn btn-sm btn-default pull-right bold" onclick='yu_print()'>打 印</button>
                    <button type="button" class="btn btn-sm btn-default pull-right bold" onclick='yu_print1()'>导Excel</button>
                </th> 
            </tr>
            <tr class="warning">
                <th colspan="2" class="textalign-l">仓房：${barnIndex}号仓</th>
                <th colspan="2" class="textalign-l">仓型：${CommenData.cx}</th>
                <th colspan="5" class="textalign-l">检测日期：${CommenData.time_jc}</th>
                <th colspan="${arrangementBean.layerCount?number*4-8}" class="textalign-l"></th>
            </tr>
            <tr class="warning">
                <th colspan="4" class="textalign-l">实际储存量：${CommenData.cr}吨</th>
                <th colspan="5" class="textalign-l">粮食品种：${CommenData.lspz}</th>
                <th colspan="6" class="textalign-l">入仓时间：${CommenData.time_rc}</th>
                <th colspan="${arrangementBean.layerCount?number*4-14}" class="textalign-l">等级：${CommenData.grade}</th>
            </tr>
            <tr class="warning">
                <th colspan="4" class="textalign-l">收获年份：${CommenData.time_sh}</th>
                <th colspan="5" class="textalign-l">入仓水分：${CommenData.moisture}%</th>
                <th colspan="${arrangementBean.layerCount?number*4-8}" class="textalign-l">保管单位：${CommenData.bgdw}</th>
            </tr>
            <tr  class="warning">
                <th colspan="${arrangementBean.layerCount?number*4+1}" class="textalign-l">说明：默认显示每个点的温度，鼠标放上去显示湿度、水分、露点等参数</th>
            </tr>
        </thead>
        <tbody>
            <tr  class="success">
                <td colspan="1" rowspan="2">检测点<br>(1~13)</td>
                <#list 1..arrangementBean.layerCount?number as x>
                <td colspan = 4>${x_index+1}层</td>
                </#list>
            </tr>
            <tr  class="success">
                <#list 1..arrangementBean.layerCount?number as x>
                <td>温度</td>
                <td>湿度</td>
                <td>水份</td>
                <td>露点</td>
                </#list>
            </tr>    
            <#list 1..13 as vo>
            <tr  class="success">
                <td>${vo}</td>
                <#list 1..arrangementBean.layerCount?number as x>
                <#if vo lt 4>
                <td>${lqData[x-1][vo*2-2][0].wd}</td>
                <td>${lqData[x-1][vo*2-2][0].sd}</td>
                <td>${lqData[x-1][vo*2-2][0].sf}</td>
                <td>${lqData[x-1][vo*2-2][0].ld}</td>
                <#elseif vo lt 6>
                <td>${lqData[x-1][(vo-3)*2-1][1].wd}</td>
                <td>${lqData[x-1][(vo-3)*2-1][1].sd}</td>
                <td>${lqData[x-1][(vo-3)*2-1][1].sf}</td>
                <td>${lqData[x-1][(vo-3)*2-1][1].ld}</td>
                <#elseif vo lt 9>
                <td>${lqData[x-1][(vo-5)*2-2][2].wd}</td>
                <td>${lqData[x-1][(vo-5)*2-2][2].sd}</td>
                <td>${lqData[x-1][(vo-5)*2-2][2].sf}</td>
                <td>${lqData[x-1][(vo-5)*2-2][2].ld}</td>
                <#elseif vo lt 11>
                <td>${lqData[x-1][(vo-8)*2-1][3].wd}</td>
                <td>${lqData[x-1][(vo-8)*2-1][3].sd}</td>
                <td>${lqData[x-1][(vo-8)*2-1][3].sf}</td>
                <td>${lqData[x-1][(vo-8)*2-1][3].ld}</td>
                <#else>
                <td>${lqData[x-1][(vo-10)*2-2][4].wd}</td>
                <td>${lqData[x-1][(vo-10)*2-2][4].sd}</td>
                <td>${lqData[x-1][(vo-10)*2-2][4].sf}</td>
                <td>${lqData[x-1][(vo-10)*2-2][4].ld}</td>
                </#if>
                </#list>
            </tr> 
            </#list>
            <tr  class="success">
                <td style='font-weight: bold'>层平均值</td>
                <#list 1..arrangementBean.layerCount?number as x>
                <td>${layerData[x-1].ageTem}℃</td>
                <td>${layerData[x-1].ageHum}%</td>
                <td>${layerData[x-1].ageWet}%</td>
                <td>${layerData[x-1].ageDewPoint}℃</td>
                </#list>
            </tr>
            <tr  class="success">
                <td style='font-weight: bold'>层最大值</td>
                <#list 1..arrangementBean.layerCount?number as x>
                <td>${layerData[x-1].maxTem}℃</td>
                <td>${layerData[x-1].maxHum}%</td>
                <td>${layerData[x-1].maxWet}%</td>
                <td>${layerData[x-1].maxDewPoint}℃</td>
                </#list>
            </tr>
            <tr  class="success">
                <td style='font-weight: bold'>层最小值</td>
                <#list 1..arrangementBean.layerCount?number as x>
                <td>${layerData[x-1].minTem}℃</td>
                <td>${layerData[x-1].minHum}%</td>
                <td>${layerData[x-1].minWet}%</td>
                <td>${layerData[x-1].minDewPoint}℃</td>
                </#list>
            </tr>
            <tr  class="warning">
                <td colspan='5' style='font-weight: bold'>整仓平均值</td>
                <td colspan='2'>温度平均值</td>
                <td>${整仓.ageTem}℃</td>
                <td colspan='2'>湿度平均值</td>
                <td>${整仓.ageHum}%</td>
                <td colspan='2'>水分平均值</td>
                <td>${整仓.ageWet}%</td>
                <td colspan='2'>露点平均值</td>
                <td>${整仓.ageDewPoint}℃</td>
            </tr>
            <tr  class="warning">
                <td colspan='5' style='font-weight: bold'>整仓最大值</td>
                <td colspan='2'>温度最大值</td>
                <td>${整仓.maxTem}℃</td>
                <td colspan='2'>湿度最大值</td>
                <td>${整仓.maxHum}%</td>
                <td colspan='2'>水分最大值</td>
                <td>${整仓.maxWet}%</td>
                <td colspan='2'>露点最大值</td>
                <td>${整仓.maxDewPoint}℃</td>
            </tr>
            <tr  class="warning">
                <td colspan='5' style='font-weight: bold'>整仓最小值</td>
                <td colspan='2'>温度最小值</td>
                <td>${整仓.minTem}℃</td>
                <td colspan='2'>湿度最小值</td>
                <td>${整仓.minHum}%</td>
                <td colspan='2'>水分最小值</td>
                <td>${整仓.minWet}%</td>
                <td colspan='2'>露点最小值</td>
                <td>${整仓.minDewPoint}℃</td>
            </tr>
            <tr  class="warning">
                <td colspan='5' style='font-weight: bold'>仓内空间</td>
                <td colspan="${arrangementBean.layerCount?number*4-4}" style='text-align: left'>仓温：${CommenData.cw}℃， 气温：${CommenData.qw}℃， 仓湿：${CommenData.cs}%， 气湿：${CommenData.qs}%</td>
            </tr>
            <tr  class="warning">
                <td colspan="2" style="height: 50px; font-weight: bold" class=" textalign-vc">风道(南)： </td>
                <td colspan="6" style="height: 50px;" class=" textalign-vc">${fd1DisplayStr}</td>
                <td colspan="2" style="height: 50px; font-weight: bold" class=" textalign-vc">风道(北)： </td>
                <td colspan="7" style="height: 50px;" class=" textalign-vc">${fd2DisplayStr}</td>

            </tr>
            <tr  class="warning">
                <td colspan="3" style="height: 50px;" class="textalign-r textalign-vc">检测结果分析及处理意见： </td>
                <td colspan="${arrangementBean.layerCount?number*4-2}" class="textalign-l  textalign-vc"></td>
            </tr>

            <tr  class="warning">
                <td colspan="2" style="height: 50px;" class="textalign-r textalign-vc">检测员： </td>
                <td colspan="2" style="height: 50px;" class="textalign-l textalign-vc">${(lqy.displayName)?default("无")} </td>
                <td colspan="9" ></td>
                <td colspan="2" style="height: 50px;" class="textalign-r textalign-vc">库管员： </td>
                <td colspan="2" style="height: 50px;" class="textalign-l textalign-vc">${(kgy.displayName)?default("无")}  </td>
            </tr>
        <div id="show-point-data" ></div> 
        </tbody>
    </table>
    <#else>
    <div class="alert alert-danger">当前厫间无数据！</div>
    <button type="button"  class="btn btn-info pull-left ljssjc" onclick="realDetection()" title="立即检测一次粮情数据"><span class="bold">立即检测一次粮情数据</span></button>
    </#if>
    <#else>
    <div class="alert alert-danger">${disSelectName?default("")} 仓内没有粮食！</div>
    </#if>
    <#else>
    <#if hasdata == "no">
    <div class="alert alert-danger">当前厫间无数据！</div>
    <button type="button"  class="btn btn-info pull-left ljssjc m10" onclick="realDetection()" title="立即检测一次粮情数据"><span class="bold">立即检测一次粮情数据</span></button>
    <#else>
    <div class="alert alert-danger">当前用户未分配廒间！</div>
    </#if>
    </#if>
</div>
<script type="text/javascript">
    function toExcel(inTblId, inWindow) {
        var fileName = '${CommenData.time_jc}' + ".xls";
        name.split(" ").join("");
        fileName = fileName.replace(" ", "-");
        fileName = fileName.split(":").join("-");
        fileName = fileName.split("-").join("");
        $("#yu-print-show").tableExport({type: 'excel', separator: ';', escape: 'false'}, fileName);
        e.preventDefault();
    }

    function doFileExport(inName, inStr) {
        var xlsWin = null;
        if (!!document.all("glbHideFrm")) {
            xlsWin = glbHideFrm;
        } else {
            var width = 1;
            var height = 1;
            var openPara = "left=" + (window.screen.width / 2 + width / 2) + ",top=" + (window.screen.height + height / 2) + ",scrollbars=no,width=" + width + ",height=" + height;
            xlsWin = window.open("", "_blank", openPara);
        }
        xlsWin.document.write(inStr);
        xlsWin.document.close();
        xlsWin.document.execCommand('Saveas', true, inName);
        xlsWin.close();
    }

    function yu_print1() {
        toExcel("yu-print-show", null);
    }
    //鼠标经过显示数据
    function show(obj, id) {
        var objDiv = $("#" + id + "");
        $(objDiv).css("display", "block");
        $(objDiv).css("visibility", "visible");
        $(objDiv).css("left", ($(obj).offset().left + 50) + "px");
        $(objDiv).css("top", ($(obj).offset().top - 30) + "px");
        $(objDiv).empty();
        $(objDiv).append(
                "当前坐标：" + $(obj).attr('h') + "行," + $(obj).attr('c') + "层," + $(obj).attr('l') + "列<br>"
                + "温度：" + $(obj).attr('wd') + "<br>"
                + "湿度：" + $(obj).attr("sd") + "<br>"
                + "水分：" + $(obj).attr("sf") + "<br>"
                + "露点：" + $(obj).attr("ld") + "<br>"

                );
    }
    function hide(obj, id) {
        var objDiv = $("#" + id + "");
        $(objDiv).css("display", "none");
    }
    $('#WSS-Select').change(function () {
        $('.lqsj,.lqsj-tj').each(function () {
            if ($('#WSS-Select').children('option:selected').val() === 'wd') {
                $(this).html($(this).attr('wd'));
            } else if ($('#WSS-Select').children('option:selected').val() === 'sd') {
                $(this).html($(this).attr('sd'));
            } else if ($('#WSS-Select').children('option:selected').val() === 'sf') {
                $(this).html($(this).attr('sf'));
            }
        });
    });

    function realDetection() {
        $("#yu-fade").html('');
        $("#yu-fade").html('<div id="wait" class="waitPic "></div>');
        $("#yu-fade").removeClass("hidden");

        $(".ljssjc").attr("disabled", "disabled");
        var url = '${BASE_PATH}' + "lqjc/realTimeMonitoring.action";
        $.ajax({
            type: "POST",
            url: url,
            async: true,
            error: function (XMLHttpRequest, errorThrown) {
            },
            success: function (response) {
                if (response.success) {
                    alert("采集数据成功！");
                } else {
                    alert("远程数据采集失败，请检查数据库远程连接问题");
                }
                $("#yu-fade").html('');
                $("#yu-fade").addClass('hidden');
                window.location.reload();
            }
        });
    }
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
