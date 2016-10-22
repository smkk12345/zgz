<#include "leftMenu.ftl"/>
<@override name="main_right">
<#setting date_format="yyyy-MM-dd HH:mm:ss">
<div class="container-fluid ycfx">
    <ul class="nav nav-pills menu">
        <#include "gjcxMenu.ftl"/>
        <li role="presentation" class="pull-right active">
            <#if role.id=='3'||role.id=='4'>
            <button type="button" class="fr btn btn-info  ml10"  data-url="${BASE_PATH}gjxx/changeStatus.action?operateType=all"  onClick="confirm_all(this)" >全部处理</button>
            </#if>
        </li>
    </ul>
    <table class="table table-hover mt7 text-center">
        <tr class="info ">
            <th style="width:50px;text-align: center">序号</th>
            <th style="width:160px;text-align: center">告警时间</th>
            <th style="width:auto;text-align: center">告警信息</th>
            <th style="width:150px;text-align: center">仓房厫间</th>
            <th style="width:150px;text-align: center">告警类型</th>
            <th style="width:130px;text-align: center">库管员</th>
            <th style="width:100px;text-align: center">处理状态</th>
        </tr>
        <#if alarmDataInfoList?size gt 0>
        <#list alarmDataInfoList as alarmDataInfo>
        <tr class="active">
            <td>${(pageNo-1)*pageSize+alarmDataInfo_index+1}</td>
            <td>${alarmDataInfo.alarmTime?date}</td>
            <td>${alarmDataInfo.alarmInfo}</td>
            <td>${alarmDataInfo.displayAlarmInfo}</td>  
            <td>${alarmDataInfo.alarmInfoType}/${alarmDataInfo.secondAlarmType}</td>
            <td>${alarmDataInfo.displayNames}</td>
            <td>
                <#if (role.id=='3'||role.id=='4')  && alarmDataInfo.userId?? && alarmDataInfo.userId!="">
                <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" 
                        data-url="${BASE_PATH}gjxx/changeStatus.action?operateType=single&alarmDataId=${alarmDataInfo.id}">处理</button>
                <#else>
                未阅
                </#if>
            </td>
        </tr>
        </#list>
        </#if>
    </table>
    <div id="yu-pager" class="fl mb20">
        <#import "../macro_ftl/pager.ftl" as p>
        <#if recordCount??>
        <@p.pager pageNo=pageNo pageSize=14 recordCount=recordCount toURL="/gjxx/lqgj.action" OtherParameter=""/>
        </#if>
    </div>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">
    function confirm_all(btn) {
        confirm("您确认全部标记为已阅吗？");
        editBtnClick(btn);
    }
    function editBtnClick(btn) {
        var url = $(btn).attr("data-url");
        $.ajax({
            type: "POST",
            url: url,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            },
            success: function (response) {
                location.reload();
            }
        });
    }

</script>
