<#include "leftMenu.ftl"/>
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js" ></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<div class="container-fluid ssjc_1">
    <#if aoJian??>
    <#if aoJian.grainStatus?? && aoJian.grainStatus == '1'>
    <#if lqData??>
    <form id='editLqForm'>
        <table  class="table table-condensed table-bordered mt10"  method="post">
            <thead>
                <tr>
                    <th fontsize="26" colspan="${arrangementBean.layerCount?number*4+1}" class="danger textalign-vc" style="line-height: 29px">
                        <i class="bold">${CommenData.lkmc}${barnIndex}号仓粮情报表</i> 
                    </th> 
                </tr>
                <tr class="warning">
                    <th colspan="2" class="textalign-l">仓房：${barnIndex}号仓</th>
                    <th colspan="2" class="textalign-l">仓型：${CommenData.cx}</th>
                    <th colspan="3" class="textalign-l">检测日期：${CommenData.time_jc}</th>
                    <th colspan="${arrangementBean.layerCount?number*4+1-7}" class="textalign-l"></th>
                </tr>

            </thead>
            <tbody>
                <tr  class="success">
                    <td colspan="1" rowspan="2">检测点<br>(1~13)</td>
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
                    <td style="border-left: double 1px">                                     
                        <input name="${vo}_${x-1}_wd" type='text' class='form-control' value=" ${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*(vo -1) +x)+''].wd}"/>
                    </td>
                    <td >
                        <input name="${vo}_${x-1}_sd" type='text' class='form-control' value=" ${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*(vo-1)+x)+''].sd}"/>
                    </td>
                    <td >
                        <input name="${vo}_${x-1}_sf" type='text' class='form-control' value=" ${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*(vo-1)+x)+''].sf}"/>
                    </td>
                    <td>
                        <input name="${vo}_${x-1}_ld" type='text' class='form-control' value=" ${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*(vo-1)+x)+''].ld}"/>
                    </td>
                    <#else>
                    <td style="border-left: double 1px">
                        <input name="${vo}_${x-1}_wd" type='text' class='form-control' value="${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*vo- (x-1))+''].wd}"/>
                    </td>
                    <td >
                        <input name="${vo}_${x-1}_sd" type='text' class='form-control' value="${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*vo-(x-1))+''].sd}"/>
                    </td>
                    <td >
                        <input name="${vo}_${x-1}_sf" type='text' class='form-control' value="${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*vo-(x-1))+''].sf}"/>
                    </td>
                    <td >
                        <input name="${vo}_${x-1}_ld" type='text' class='form-control' value="${lqData[''+vo+''][''+((arrangementBean.layerCount?number)*vo-(x-1))+''].ld}"/>
                    </td>		                			               
                    </#if>
                    </#list>
                </tr> 
                </#list>

            <div id="show-point-data" ></div> 
            </tbody>
        </table>
        <ul class="nav nav-pills menu mb20">
            <li role="presentation" class="pull-left">
                <button type="button"  class="btn btn-info pull-left ml5" data-url="${BASE_PATH}lqjc/updateAoJianData.action" title="保存" onclick="save(this)">
                    保存</button>
            </li>
        </ul>
        <input class="display-none" type="text"  name="aoJianId" value="${aoJian.zyAoJianNum}"/>
        <input  type="text" name="aoJianDataId" value="${aoJianDataBean.id}" class="display-none" />
    </form>
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
    function save(btn) {
        var p = $(btn).attr("data-url");
        var dataJson = $("#editLqForm").serialize();
        $.ajax({
            type: "POST",
            url: p,
            dataType: "json",
            data: dataJson,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                if (response) {
                    alert("保存成功！");
                }
                else {
                    alert("保存出现问题，请联系之云研发人员！");
                }
            }
        })
    }
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
