<#include "leftMenu.ftl"/>
<@override name="main_right">
<#setting date_format="yyyy-MM-dd HH:mm:ss">
<div class="container-fluid ycfx">
    <ul class="nav nav-pills menu">
        <#include "gjcxMenu.ftl"/>
        <li role="presentation" class="pull-right active">
            <#if role.id=='3'||role.id=='4'>
            <button type="button" class="fr btn btn-info  ml10"  data-url="${BASE_PATH}gjxx/changeStatus.action"  onClick="confirm_all(this)" >全部处理</button>
            </#if>
        </li>
    </ul>
    <div  class="menu mt20 clearfix">
        <form action="${BASE_PATH}gjxx/lqgj3.action" method="post">
            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">廒间列表:</label>
                <select id="selsectAoJian" class="form-control fl" style="width:110px;" name="aoJianId">  
                    <option value="-1">全 部</option>  
                    <#if aoJianList??>
                    <#if aoJianList?size gt 0>
                    <#list aoJianList as aoJian>
                     <#if aoJian.aoJianIndex??>
                    <option value="${aoJian.zyAoJianNum}" <#if aoJian.zyAoJianNum == aoJianId>selected="selected"</#if>>${aoJian.aoJianIndex} 厫</option>  
                    </#if>
                    </#list>
                    </#if>
                    </#if>
                </select>
            </div>
            <div class="form-group clearfix fl">
                <#if user.rightLevel=="1" || user.rightLevel=="2" || user.rightLevel=="5"|| user.rightLevel=="4">
                <label for="ckhInput" class="control-label fl mt10">库管员:</label>
                <select id="selectUser" class="form-control fl" style="width:110px;" name="userId">  
                    <option value="-1">全 部</option>  
                    <#if userList?size gt 0>
                    <#list userList as user1>
                    <option value="${user1.id}" <#if user1.id == userId>selected="selected"</#if>>${user1.displayName}</option>  
                    </#list>
                    </#if>
                </select>
                <#else>
                <input type="hidden" name="userId" value="${user.id}" />
                </#if>
            </div>
            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">告警类型:</label>
                <select id="selectAlarmType" class="form-control fl" style="width:120px;" name="alarmType">  
                    <option value="-1">全 部</option>  
                    <#if alarmTypeList?size gt 0>
                    <#list alarmTypeList as vo>
                    <option value="${vo}"   >${vo}</option>  
                    </#list>
                    </#if>
                </select>
            </div>
            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">处理状态:</label>
                <select id="selectAlarmType" class="form-control fl" style="width:80px;" name="status">  
                    <option value="-1" <#if '-1' == status>selected="selected"</#if>>全部</option>  
                    <option value="0" <#if '0' == status>selected="selected"</#if>>未读</option>
                    <option value="1" <#if '1' == status>selected="selected"</#if>>已读</option>  
                </select>
            </div>
            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">时间段:</label>
                <input type="text" class="form-control fl width-110px"   id="datepicker-start"  placeholder="选择开始时间" name="startDate" <#if startDate??>value="${startDate}"</#if>/>
            </div>
            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">到:</label>
                <input type="text" class="form-control fl width-110px"   id="datepicker-last"   placeholder="选择结束时间" name="endDate" <#if endDate??>value="${endDate}"</#if>/>
            </div>
            <div class="form-group clearfix fl">
                <input type="hidden" name="doSearch" value="do"/>
                <button type="submit" class="btn btn-success ml10" >查	询</button>
            </div>
        </form>
    </div>
    <table class="table table-hover  text-center">
        <tr class="info">
            <th style="width:50px;text-align: center">序号</th>
            <th style="width:160px;text-align: center">告警时间</th>
            <th style="width:auto;text-align: center">告警信息</th>
            <th style="width:150px;text-align: center">仓房厫间</th>
            <th style="width:150px;text-align: center">告警类型</th>
            <th style="width:110px;text-align: center">库管员</th>
            <th style="width:80px;text-align: center">处理状态</th>
        </tr>
        <#if alarmDataInfoList??>
        <#if alarmDataInfoList?size gt 0>
        <#list alarmDataInfoList as alarmDataInfo>
        <tr class="active">
            <td>${(pageNo?number-1)*pageSize?number+alarmDataInfo_index+1}</td>
            <td>${alarmDataInfo.alarmTime?date}</td>
            <td>${alarmDataInfo.alarmInfo}</td>
            <td>${alarmDataInfo.displayAlarmInfo}</td>  
            <td>${alarmDataInfo.alarmInfoType}/${alarmDataInfo.secondAlarmType}</td>
            <td>${alarmDataInfo.displayNames}</td>
            <td>
                <#if alarmDataInfo.status=="0">
                <#if (role.id=='3'||role.id=='4') && alarmDataInfo.userId?? >
                <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" 
                        data-url="${BASE_PATH}gjxx/changeStatus.action?operateType=single&alarmDataId=${alarmDataInfo.id}">处理</button>
                <#else>
                未阅
                </#if>
                <#else>
                已阅
                </#if>
            </td>
        </tr>
        </#list>
        </#if>
        </#if>
    </table>
    <div id="yu-pager" class="fl mb20">
        <#import "../macro_ftl/pager.ftl" as p>
        <#if recordCount??>
        <@p.pager pageNo=pageNo pageSize=12 recordCount=recordCount toURL="/gjxx/lqgj3.action" 
        OtherParameter="doSearch="+doSearch+","+"aoJianId="+aoJianId+","+"userId="+userId+","+"alarmType="+alarmType+","+"startDate="+startDate+","+"endDate="+endDate+","+"status="+status/>
        </#if>
    </div>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript">
                    //日期插件-只能选择过去日期
                    $('#datepicker-last').datepicker({
                        format: 'yyyy-mm-dd',
                        showMeridian: true,
                        todayBtn: true,
                        autoclose: true
                    }).on('changeDate', function (ev) {
                        var startTime = $("#datepicker-start")[0].value;
                        var endTime = $("#datepicker-last")[0].value;
                        if (startTime != "") {
                            if (endTime < startTime) {
                                alert(" 结束时间不能小于开始时间！");
                                $("#datepicker-last").focus();
                            }
                        }
                    });
                    $('#datepicker-start').datepicker({
                        format: 'yyyy-mm-dd',
                        showMeridian: true,
                        autoclose: true
                    }).on('changeDate', function (ev) {
                        var startTime = $("#datepicker-start")[0].value;
                        var endTime = $("#datepicker-last")[0].value;
                        if (endTime !== "") {
                            if (endTime < startTime) {
                                alert(" 开始时间不能大于结束时间 ！");
                                $("#datepicker-start").focus();
                            }
                        }
                    });
                    //已阅操作
                    function confirm_all(btn) {
                        confirm("您确认全部标记为已阅吗？");
                        editBtnClick(btn);
                    }
                    function editBtnClick(btn) {
                        var url = $(btn).attr("data-url");
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: {operateType: 'allSearch',aoJianId: '${aoJianId}', status: '${status}', userId: '${userId}', alarmType: '${alarmType}', startDate: '${startDate}', endDate: '${endDate}'},
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                            },
                            success: function (response) {
                                location.reload();
                            }
                        });
                    }
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
