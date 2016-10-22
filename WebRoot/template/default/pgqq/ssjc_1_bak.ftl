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
    <ul class="nav nav-pills menu">
        <#include "ssjcMenu.ftl"/>
        <li role="presentation" class="pull-right">
            <button type="button"  class="btn btn-info pull-right ml5 ljssjc" onclick="realDetection()" title="实时检测"><span class="bold">实时检测</span></button>
            <button type="button" class="btn btn-success dropdown-toggle YL-ModalClick pull-right ml5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-url='${BASE_PATH}lqjc/lqModal.action' title="选择粮情，默认为最新粮情"><span class="bold">切换粮情:</span> <i class="bold">${lqtime}</i></button>
            <select class="form-control width-80px pull-right" id="WSS-Select">
                <option value="wd">温度</option>
                <option value="sd">湿度</option>
                <option value="sf">水分</option>
            </select>
        </li>
    </ul>
    <table id='yu-print-show' class="table table-condensed table-bordered mt10">
     <thead>  
        <tr>
            <th  colspan="${arrangementBean.columnCount?number+2}" class="danger textalign-vc" style="line-height: 29px">
            	<i class="bold">${CommenData.lkmc}${barnIndex}号仓粮情报表</i> 
            	<button type="button" class="btn btn-sm btn-default pull-right bold" onclick='yu_print()'>打 印</button>
            	<button type="button" class="btn btn-sm btn-default pull-right bold" onclick='yu_print1()'>导Excel</button>
            </th> 
        </tr>
        <tr class="warning">
            <th colspan="2" class="textalign-l">仓房：${barnIndex}号仓</th>
            <th colspan="1" class="textalign-l">仓型：${CommenData.cx}</th>
            <th colspan="3" class="textalign-l">检测日期：${CommenData.time_jc}</th>
            <th colspan="${arrangementBean.columnCount?number-6}" class="textalign-l"></th>
        </tr>
        <tr class="warning">
            <th colspan="2" class="textalign-l">实际储存量：${CommenData.cr}吨</th>
            <th colspan="1" class="textalign-l">粮食品种：${CommenData.lspz}</th>
            <th colspan="3" class="textalign-l">入仓时间：${CommenData.time_rc}</th>
            <th colspan="${arrangementBean.columnCount?number-6}" class="textalign-l">等级：${CommenData.grade}</th>
        </tr>
        <tr class="warning">
            <th colspan="2" class="textalign-l">收获年份：${CommenData.time_sh}</th>
            <th colspan="1" class="textalign-l">入仓水分：${CommenData.moisture}%</th>
            <th colspan="${arrangementBean.columnCount?number-1}" class="textalign-l">保管单位：${CommenData.bgdw}</th>
        </tr>
        <tr  class="warning">
            <th colspan="${arrangementBean.columnCount?number+2}" class="textalign-l">说明：默认显示每个点的温度，鼠标放上去显示湿度、水分、露点等参数</th>
        </tr>
        <tr  class="warning">
            <th colspan="2">行号</th>
            <th colspan="${arrangementBean.columnCount?number}">列号</th>
        </tr>
        </thead>
        <tbody>  
        <#list lqData as vo>

        <tr  class="success">
            <td colspan="2">第 ${vo_index+1} 行</td>
            <#list 1..arrangementBean.columnCount?number as x>
            <td>${x_index+1}列</td>
            </#list>
        </tr>
        <#list vo as vo1>
        <tr  class="active">
            <#if vo1_index ==0>
            <td rowspan="${arrangementBean.layerCount}" class="textalign-vc">层号</td>
            </#if>
            <td>${vo1_index+1}层</td>
            <#list vo1 as vo2>
            <#if vo2.wd?string !="">
            <td wd='<#if vo2.wd?string !="">${vo2.wd}℃</#if>' sd='<#if vo2.sd?string !="">${vo2.sd}%</#if>' sf='<#if vo2.sf?string !="">${vo2.sf}%</#if>' c='${vo1_index+1}' h='${vo_index+1}' l='${vo2_index+1}'  class="lqsj" onMouseOver="javascript:show(this, 'show-point-data');" onMouseOut="hide(this, 'show-point-data')">
                <#if vo2.wd?string !="">${vo2.wd}℃</#if>
            </td>
            <#else>
            <td></td>
            </#if>
            </#list>
        </tr>
        </#list>
        </#list>
        <tr  class="warning">
            <td colspan="${arrangementBean.columnCount?number+2}">仓温：${CommenData.cw}℃， 气温：${CommenData.qw}℃， 仓湿：${CommenData.cs}%， 气湿：${CommenData.qs}%</td>
        </tr>
        <tr  class="warning">
            <td style='font-weight: bold' class='lqsj-tj'  wd='各层温度'sd='各层湿度' sf='各层水分'>各层温度</td>
            <#list 1..arrangementBean.layerCount?number as layerIndex>
            <td style='font-weight: bold'>${layerIndex}层</td>
            </#list>
            <td  colspan='2' style='font-weight: bold' class='lqsj-tj'  wd='整仓温度'sd='整仓湿度' sf='整仓水分'>整仓温度</td>
            <#if (arrangementBean.columnCount?number+2-arrangementBean.layerCount?number-3) gt 0 >
            <td colspan='${arrangementBean.columnCount?number+2-arrangementBean.layerCount?number-3}'></td>
            </#if>
        </tr>
        <tr class="warning">
            <td class='lqsj-tj' wd='最高温度'sd='最高湿度' sf='最高水分'>最高温度</td>
            <#list layerData as layerVo>
            <td class='lqsj-tj' wd='${layerVo.maxTem}℃'sd='${layerVo.maxHum}%' sf='${layerVo.maxWet}%'>${layerVo.maxTem}℃</td>
            </#list>
            <td class='lqsj-tj' wd='最高温度'sd='最高湿度' sf='最高水分'>最高温度</td><td class='lqsj-tj' wd='${整仓.maxTem}℃'sd='${整仓.maxHum}%' sf='${整仓.maxWet}%'>${整仓.maxTem}℃</td>
        </tr>
        <tr class="warning">
            <td class='lqsj-tj' wd='最高温度'sd='最高湿度' sf='最高水分'>最低温度</td>
            <#list layerData as layerVo>
            <td class='lqsj-tj' wd='${layerVo.minTem}℃'sd='${layerVo.minHum}%' sf='${layerVo.minWet}%'>${layerVo.minTem}℃</td>
            </#list>
            <td class='lqsj-tj' wd='最低温度'sd='最低湿度' sf='最低水分'>最低温度</td><td class='lqsj-tj' wd='${整仓.minTem}℃'sd='${整仓.minHum}%' sf='${整仓.minWet}%'>${整仓.minTem}℃</td>
        </tr>
        <tr  class="warning">
            <td class='lqsj-tj' wd='平均温度'sd='平均湿度' sf='平均水分'>平均温度</td>
            <#list layerData as layerVo>
            <td class='lqsj-tj' wd='${layerVo.ageTem}℃'sd='${layerVo.ageHum}%' sf='${layerVo.ageWet}%'>${layerVo.ageTem}℃</td>
            </#list>
            <td class='lqsj-tj' wd='平均温度'sd='平均湿度' sf='平均水分'>平均温度</td><td class='lqsj-tj' wd='${整仓.ageTem}℃'sd='${整仓.ageHum}%' sf='${整仓.ageWet}%'>${整仓.ageTem}℃</td>
        </tr>
        <tr  class="warning">
            <td colspan="1" style="height: 50px;" class=" textalign-vc">风道(南)： </td>
            <td colspan="2" style="height: 50px;" class=" textalign-vc">${fd1DisplayStr}</td>
            <td colspan="1" style="height: 50px;" class=" textalign-vc">风道(北)： </td>
            <td colspan="2" style="height: 50px;" class=" textalign-vc">${fd2DisplayStr}</td>
            <td colspan="${arrangementBean.columnCount?number-4}" class="textalign-l  textalign-vc"></td>
        </tr>
        <tr  class="warning">
            <td colspan="2" style="height: 50px;" class="textalign-r textalign-vc">检测结果分析及处理意见： </td>
            <td colspan="${arrangementBean.columnCount?number}" class="textalign-l  textalign-vc"></td>
        </tr>
        <div id="show-point-data" ></div>
         </tbody> 
    </table>

</div>
<script type="text/javascript">
function toExcel(inTblId, inWindow) {
  var fileName = '${CommenData.time_jc}'+".xls";
  name.split(" ").join("");
  fileName = fileName.replace(" ","-");
  fileName = fileName.split(":").join("-");
  fileName = fileName.split("-").join("");
  $("#yu-print-show").tableExport({ type: 'excel', separator: ';', escape: 'false' },fileName);
  e.preventDefault();
}

function doFileExport(inName, inStr) {
    var xlsWin = null;
    if ( !! document.all("glbHideFrm")) {
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

	function yu_print1(){
		toExcel("yu-print-show",null);
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
