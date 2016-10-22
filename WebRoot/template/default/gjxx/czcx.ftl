<#include "leftMenu.ftl"/>
<@override name="main_right">
<#setting date_format="yyyy-MM-dd HH:mm:ss">
<div class="container-fluid ycfx">
    <div  class="menu mt7 clearfix">
        <form action="${BASE_PATH}gjxx/czcx.action" method="post">
<!--            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">操作类型:</label>
                <select name="operateType" class="form-control fl" style="width:175px;" >  
                    <option value="-1" >请选择操作类型</option>  
                    <#if operateTypeList?size gt 0>
                    <#list operateTypeList as vo>
                    <option value="${vo}" <#if vo == operateType>selected="selected"</#if>>${vo}</option>  
                    </#list>
                    </#if>
                </select>
            </div>-->
            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">操作人:</label>
                <select name="userId" class="form-control fl" style="width:175px;" >  
                    <option value="-1" >请选择操作人</option>  
                    <#if userList?size gt 0>
                    <#list userList as user>
                    <option  value="${user.id}" <#if user.id == userId>selected="selected"</#if>>${user.displayName}</option>  
                    </#list>
                    </#if>
                </select>
            </div>
            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">操作内容:</label>
                <input type="text" id="searchTi" class="form-control fl" placeholder="模糊查询" name="operateInfo" <#if operateInfo??> value="${operateInfo}"</#if>/>
            </div>
            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">时间段:</label>
                <input type="text" class="form-control fl"   id="datepicker-start"   placeholder="请选择开始时间" name="startDate" <#if startDate??>value="${startDate}</#if>"/>
            </div>
            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">到:</label>
                <input type="text" class="form-control fl"   id="datepicker-last"   placeholder="请选择结束时间" name="endDate" <#if startDate??>value="${endDate}"</#if>/>
            </div>
            <input type="hidden" name="doSearch" value="do"/>
            <button type="submit" class="btn btn-success ml10" >查 询</button>
        </form>
    </div> 
    <ol class="breadcrumb">
        <li class='bold green'>
            <#if doSearch?? && doSearch=='do'>搜索结果<#else>最近100条操作记录</#if>
        </li>
    </ol>
    <table class="table table-hover mt7 text-center">
        <tr class="info">
            <th style="width:50px;text-align: center">序号</th>
            <th style="width:160px;text-align: center">操作时间</th>
            <th style="width:auto;text-align: center">操作内容</th>
            <th style="width:80px;text-align: center">操作类型</th>
            <th style="width:110px;text-align: center">操作人</th>
        </tr>
        <#if operateRecordList?size gt 0>
        <#list operateRecordList as operateBean>
        <tr class="active">
            <td>${(pageNo?number-1)*pageSize?number+operateBean_index+1}</td>
            <td>${operateBean.operateTime?date}</td>
            <td>${operateBean.operateInfo?default("")}</td>
            <td>${operateBean.operateType?default("")}</td>
            <td >
                <#if userList?size gt 0>
                <#list userList as user>
                <#if user.id == operateBean.operateUserId>
                ${user.displayName}
                <#break>
                </#if>
                </#list>
                </#if>
            </td> 
        </tr>
        </#list>
        </#if>
    </table>
    <div id="yu-pager" class="fl mb20">
        <#import "../macro_ftl/pager.ftl" as p>
        <#if recordCount??>   
        <#if doSearch??>
        <@p.pager pageNo=pageNo pageSize=13 recordCount=recordCount toURL="/gjxx/czcx.action" 
        OtherParameter="doSearch="+doSearch+","+"operateType="+operateType+","+"startDate="+startDate+","+"endDate="+endDate+","+"userId="+userId+","+"operateInfo="+operateInfo/>
        <#else>
        <@p.pager pageNo=pageNo pageSize=13 recordCount=recordCount toURL="/gjxx/czcx.action" OtherParameter=""/>
        </#if>
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
                alert(" 结束时间不能小于开始时间 ！");
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
        if (endTime != "") {
            if (endTime < startTime) {
                alert(" 开始时间不能大于结束时间 ！");
                $("#datepicker-start").focus();
            }
        }
    });
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
