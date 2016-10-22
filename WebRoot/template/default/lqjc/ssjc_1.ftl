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
            <button type="button" class="btn btn-info dropdown-toggle YL-ModalClick pull-right ml5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-url='${BASE_PATH}lqjc/lqModal.action' title="选择粮情，默认为最新粮情"><span class="bold">历史粮情:</span> <i class="bold">${lqtime}</i></button>
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
                <th colspan="4" class="textalign-l">检测日期：${CommenData.time_jc}</th>
                <th colspan="${arrangementBean.layerCount?number*4-7}" class="textalign-l"></th>
            </tr>
            <tr class="warning">
                <th colspan="2" class="textalign-l">实际储量：${CommenData.cr}吨</th>
                <th colspan="2" class="textalign-l">粮食品种：${CommenData.lspz}</th>
                <th colspan="4" class="textalign-l">入仓时间：${CommenData.time_rc}</th>
                <th colspan="${arrangementBean.layerCount?number*4-7}" class="textalign-l">等级：${CommenData.grade}</th>
            </tr>
            <tr class="warning">
                <th colspan="4" class="textalign-l">收获年份：${CommenData.time_sh}</th>
                <th colspan="4" class="textalign-l">入仓水分：${CommenData.moisture}%</th>
                <th colspan="${arrangementBean.layerCount?number*4-7}" class="textalign-l">保管单位：${CommenData.bgdw}</th>
            </tr>
        </thead>
        <tbody>
            <tr  class="success">
                <td colspan="1" rowspan="2">检测点<br>(1~${maxCableIndex})</td>
                <#list 1..arrangementBean.layerCount?number as x>
                <td style="border-left: double 1px; font-weight: bold" colspan = 4>${x_index+1}层</td>
                </#list>
            </tr>
            <tr  class="success">
                <#list 1..arrangementBean.layerCount?number as x>
                <td style="border-left: double 1px">温度(℃)</td>
                <td>湿度(%)</td>
                <td>水份(%)</td>
                <td>露点(℃)</td>
                </#list>
            </tr>    
            <#list 1..maxCableIndex as vo> 
            <tr  class="success">   
                <td>${vo}</td>	
                <#list 1..arrangementBean.layerCount?number as x>
                <#if pointDirectionStr=="从上往下"> 
	                <!--<td style="border-left: double 1px">${lqData[''+vo+''][''+((arrangementBean.layerCount?number-1)*vo+x)+''].wd}</td>
	                <td >${lqData[''+vo+''][''+((arrangementBean.layerCount?number-1)*vo+x)+''].sd}</td>
	                <td >${lqData[''+vo+''][''+((arrangementBean.layerCount?number-1)*vo+x)+''].sf}</td>
	                <td >${lqData[''+vo+''][''+((arrangementBean.layerCount?number-1)*vo+x)+''].ld}</td>-->
	                
	                <td style="border-left: double 1px">${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*(vo -1) +x)+''].wd}</td>
	                <td >${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*(vo-1)+x)+''].sd}</td>
	                <td >${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*(vo-1)+x)+''].sf}</td>
	                <td >${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*(vo-1)+x)+''].ld}</td>
                <#else>
	                <!--<td style="border-left: double 1px">${lqData[''+vo+''][''+(arrangementBean.layerCount?number*(vo-1)+(arrangementBean.layerCount?number-x)+1)+''].wd}</td>
	                <td >${lqData[''+vo+''][''+(arrangementBean.layerCount?number*(vo-1)+(arrangementBean.layerCount?number-x)+1)+''].sd}</td>
	                <td >${lqData[''+vo+''][''+(arrangementBean.layerCount?number*(vo-1)+(arrangementBean.layerCount?number-x)+1)+''].sf}</td>
	                <td >${lqData[''+vo+''][''+(arrangementBean.layerCount?number*(vo-1)+(arrangementBean.layerCount?number-x)+1)+''].ld}</td>-->
	                
	                <td style="border-left: double 1px">${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*vo- (x-1))+''].wd}</td>
	                <td >${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*vo-(x-1))+''].sd}</td>
	                <td >${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*vo-(x-1))+''].sf}</td>
	                <td >${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*vo-(x-1))+''].ld}</td>
                </#if>
                </#list>
            </tr> 
            </#list>
            <tr  class="success">
                <td style='font-weight: bold'>层平均值</td>
                <#list 1..arrangementBean.layerCount?number as x>
                <td style="border-left: double 1px">${layerData[x-1].ageTem}℃</td>
                <td>${layerData[x-1].ageHum}%</td>
                <td>${layerData[x-1].ageWet}%</td>
                <td>${layerData[x-1].ageDewPoint}℃</td>
                </#list>
            </tr>
            <tr  class="success">
                <td style='font-weight: bold'>层最大值</td>
                <#list 1..arrangementBean.layerCount?number as x>
                <td style="border-left: double 1px">${layerData[x-1].maxTem}℃</td>
                <td>${layerData[x-1].maxHum}%</td>
                <td>${layerData[x-1].maxWet}%</td>
                <td>${layerData[x-1].maxDewPoint}℃</td>
                </#list>
            </tr>
            <tr  class="success">
                <td style='font-weight: bold'>层最小值</td>
                <#list 1..arrangementBean.layerCount?number as x>
                <td style="border-left: double 1px">${layerData[x-1].minTem}℃</td>
                <td>${layerData[x-1].minHum}%</td>
                <td>${layerData[x-1].minWet}%</td>
                <td>${layerData[x-1].minDewPoint}℃</td>
                </#list>
            </tr>
            <tr  class="warning">
                <td 
                    <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='3' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='3' 
                    </#if>
                    style='font-weight: bold'>粮堆平均值</td>
                <td 
                     <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if>
                    style='text-align: right'>温度平均值：</td>
                <td>${整仓.ageTem}℃</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>湿度平均值：</td>
                <td>${整仓.ageHum}%</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>水分平均值：</td>
                <td>${整仓.ageWet}%</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>露点平均值：</td>
                <td>${整仓.ageDewPoint}℃</td>
                <#if arrangementBean.layerCount?number*4+1-9 gt 0>
				   <td colspan='${arrangementBean.layerCount?number*4+1-9}'></td>
				</#if>
            </tr>
            <tr  class="warning">
                <td 
                     <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='3' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='3' 
                    </#if>
                    style='font-weight: bold'>粮堆最大值</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>温度最大值：</td>
                <td>${整仓.maxTem}℃</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>湿度最大值：</td>
                <td>${整仓.maxHum}%</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>水分最大值：</td>
                <td>${整仓.maxWet}%</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>露点最大值：</td>
                <td>${整仓.maxDewPoint}℃</td>
				<#if arrangementBean.layerCount?number*4+1-9 gt 0>
				   <td colspan='${arrangementBean.layerCount?number*4+1-9}'></td>
				</#if>
            </tr>
            <tr  class="warning">
                <td 
                     <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='3' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='3' 
                    </#if>
                    style='font-weight: bold'>粮堆最小值</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>温度最小值：</td>
                <td>${整仓.minTem}℃</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>湿度最小值：</td>
                <td>${整仓.minHum}%</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if>  style='text-align: right'>水分最小值：</td>
                <td>${整仓.minWet}%</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>露点最小值：</td>
                <td>${整仓.minDewPoint}℃</td>
                <#if arrangementBean.layerCount?number*4+1-9 gt 0>
				   <td colspan='${arrangementBean.layerCount?number*4+1-9}'></td>
		</#if>
               
            </tr>
            <tr  class="warning">
                <td 
                     <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='3' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='3' 
                    </#if>
                    style='font-weight: bold;'>仓内/外空间</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>仓温：</td>
                <td>${CommenData.cw}℃</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>仓湿：</td>
                <td>${CommenData.cs}%</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if>  style='text-align: right'>气温：</td>
                <td>${CommenData.qw}℃</td>
                <td <#if arrangementBean.layerCount?number lt 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number== 3>
                      colspan='1' 
                    <#elseif arrangementBean.layerCount?number gt 3>
                      colspan='2' 
                    </#if> style='text-align: right'>气湿：</td>
                <td>${CommenData.qs}%</td>
                <#if arrangementBean.layerCount?number*4+1-9 gt 0>
				   <td colspan='${arrangementBean.layerCount?number*4+1-9}'></td>
		</#if>
            </tr>
            <tr  class="warning">
                <td colspan="2" style="height: 50px; font-weight: bold" class=" textalign-vc">风道(南)： </td>
                <td colspan="${(arrangementBean.layerCount?number*4+1-4-1)/2}" style="height: 50px;" class=" textalign-vc">${fd1DisplayStr}</td>
                <td colspan="2" style="height: 50px; font-weight: bold" class=" textalign-vc">风道(北)： </td>
                <td colspan="${(arrangementBean.layerCount?number*4+1-4+1)/2}" style="height: 50px;" class=" textalign-vc">${fd2DisplayStr}</td>

            </tr>
            <tr  class="warning">
                <td colspan="3" style="height: 50px;" class="textalign-r textalign-vc">检测结果分析及处理意见： </td>
                <td colspan="${arrangementBean.layerCount?number*4-2}" class="textalign-l  textalign-vc"></td>
            </tr>
            <tr  class="warning">
                <td colspan="1" style="height: 50px;" class="textalign-r textalign-vc">粮情员： </td>
                <td colspan="3" style="height: 50px;" class="textalign-l textalign-vc">${lqy?default("无")} </td>
                <td colspan="${arrangementBean.layerCount?number*4+1-8}" ></td>
                <td colspan="1" style="height: 50px;" class="textalign-r textalign-vc">库管员： </td>
                <td colspan="3" style="height: 50px;" class="textalign-l textalign-vc">${(kgy.displayName)?default("无")}  </td>
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
    <div class="alert alert-danger">未选择厫间或当前用户未分配廒间！</div>
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
                if (response.success !== "false") {
                    if (response.hasNewData === "true") {
                        if (response.successTwo === "true") {
                            alert("恭喜您！实时数据采集成功！");
                        } else {
                            alert("实时数据采集失败！请检查数据连接！");
                        }
                    } else {
                        alert("传感器已(" + response.hasNewDataTime + ")连接异常，请检查数据线或电缆是否连接完好？");
                    }
                } else {
                    alert("实时数据采集失败，请检查数据库远程连接问题");
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
