<#include "leftMenu.ftl"/>
<#include "../macro_ftl/xtszList.ftl">
<@override name="main_right">
<div class="container-fluid cssz-xtsz">
    <ul class="nav nav-pills menu">
        <#include "lqpzMenu.ftl"/>
        <li role="presentation" class="pull-right"></li>
    </ul>
    <div class="panel panel-default mt7">
        <div class="panel-heading"><span class="fl clearfix">温度告警阈值列表</span><a class="fr " href="#" data-url="${BASE_PATH}xtsz/csszModalGjfz.action?alarmType=tem" title="点击添加"></a></div>
        <div class="panel-body">
            <form class="width-100-" id="temInfo">
                <#if temAlarmList?size gt 0>
                <#list temAlarmList as temAlarm>
                <div class="form-group fl">
                    <label class="control-label fl" style="width:70px;color: blue">
                        <#if grainList?size gt 0>
                        <#list grainList as grain>
                        <#if grain.id==temAlarm.grainBeanId>
                        ${grain.grainType} :&nbsp
                        </#if>
                        </#list>
                        </#if>
                    </label> 
                    <label for="avg${temAlarm.id}" class="control-label fl">平均温度告警阈值:</label>
                    <div class="input-group fl width-130px">
                        <input type="text" class="form-control fl  width-80px" id="avg${temAlarm.id}" name="averageAttri" value="${temAlarm.averageAttri?default("")}" placeholder="平均温告警阈值" onblur="onBlurFun(${temAlarm.id}, this)" defaultValue="${temAlarm.averageAttri?default("")}"><div class="input-group-addon width-50px bold">℃</div>
                    </div>

                    <label for="max${temAlarm.id}" class="control-label  fl">最高温度告警阈值:</label> 
                    <div class="input-group fl width-130px">
                        <input type="text" class="form-control fl  width-80px" id="max${temAlarm.id}" name="maxAttri" value="${temAlarm.maxAttri?default("")}" placeholder="最高温告警阈值" onblur="onBlurFun(${temAlarm.id}, this)" defaultValue="${temAlarm.maxAttri?default("")}"><div class="input-group-addon width-50px bold">℃</div>
                    </div>
                    <#if role.roleAuthority[8]=="2">
                    <button type="button" class="btn btn-primary ml10  fl"  data-url="${BASE_PATH}xtsz/saveAlarmInfo.action?id=${temAlarm.id}" pId="${temAlarm.id}" onclick="save(this)">保存</button>
                    <button type="button"  data-url="${BASE_PATH}xtsz/reSetAlarmInfo.action?id=${temAlarm.id}" pId="${temAlarm.id}" onclick="reSetData(this, 'tem')"   class="btn btn-primary ml10 sensorDelBtn  fl">默认值</button>
                    <input type="hidden"  name="id" value="${temAlarm.id?default("")}">
                    </#if>
                </div>
                </#list>
                </#if>
            </form>
        </div>
    </div> 
    <div class="panel panel-default">
        <div class="panel-heading"><span class="fl clearfix">水份告警阈值列表</span></div>
        <div class="panel-body">
            <form class="width-100-" id="wetInfo">
                <#if wetAlarmList?size gt 0>
                <#list wetAlarmList as wetAlarm>
                <div class="form-group fl">
                    <label class="control-label fl" style="width:70px;color: blue">
                        <#if grainList?size gt 0>
                        <#list grainList as grain>
                        <#if grain.id==wetAlarm.grainBeanId>
                        ${grain.grainType} :&nbsp
                        </#if>
                        </#list>
                        </#if>
                    </label> 
                    <label for="ckhInput" class="control-label fl">平均水份告警阈值:</label> 
                    <div class="input-group fl width-130px">
                        <input type="text" class="form-control fl width-80px" id="avg${wetAlarm.id}" name="lkmc" value="${wetAlarm.averageAttri*100?default("")}" placeholder="平均湿度告警阈值" onblur="onBlurFun1(${wetAlarm.id}, this)" defaultValue="${wetAlarm.averageAttri*100?default("")}"><div class="input-group-addon width-50px bold">%</div>
                    </div>
                    <label for="btlInput" class="control-label  fl">最高水份告警阈值:</label>
                    <div class="input-group fl width-130px">
                        <input type="text" class="form-control fl width-80px" id="max${wetAlarm.id}" name="lkmc" value="${wetAlarm.maxAttri*100?default("")}" placeholder="最高湿度告警阈值" onblur="onBlurFun1(${wetAlarm.id}, this)" defaultValue="${wetAlarm.maxAttri*100?default("")}"><div class="input-group-addon width-50px bold">%</div>
                    </div>
                    <#if role.roleAuthority[8]=="2">
                    <button type="button" class="btn btn-primary ml10 "  data-url="${BASE_PATH}xtsz/saveAlarmInfo.action?id=${wetAlarm.id}" pId="${wetAlarm.id}" onclick="save(this)">保存</button>
                    <button type="button"  data-url="${BASE_PATH}xtsz/reSetAlarmInfo.action?id=${wetAlarm.id}" pId="${wetAlarm.id}" onclick="reSetData(this, 'wet')" class="btn btn-primary ml10 sensorDelBtn">默认值</button>
                    <input type="hidden"  name="id" value="${wetAlarm.id?default("")}">
                    </#if>
                </div>
                </#list>
                </#if>
            </form>
        </div>
    </div>  
</div>
</@override>
<@extends name = "../base/layout.ftl"/>

<script type="text/javascript">

            $(document).ready(function () {
    initRoleAuthority()
    })

                    function initRoleAuthority(){
                    var authority = '${role.roleAuthority}';
                            if (authority[8] == "1"){
                    //常温
                    $("#temInfo").find(":input").attr("disabled", true);
                            $("#temInfo").find(":button").attr("disabled", true);
                            //水分
                            $("#wetInfo").find(":input").attr("disabled", true);
                            $("#wetInfo").find(":button").attr("disabled", true);
                    }
                    }

            function onBlurFun1(id, it){
            var averageAttri = $("#avg" + id).val();
                    var maxAttri = $("#max" + id).val();
                    if (Number(averageAttri) > Number(maxAttri)){
            alert("最高告警阈值不能小于平均告警阈值！");
                    $(it).val($(it).attr("defaultValue"));
            }
            if (Number(averageAttri) < 0 || Number(averageAttri) > 100 || Number(maxAttri) < 0 || Number(maxAttri) > 100){
            alert("水份阈值设定范围在0~100%之间！");
                    $(it).val($(it).attr("defaultValue"));
            }
            }
            function onBlurFun(id, it){
            var averageAttri = $("#avg" + id).val();
                    var maxAttri = $("#max" + id).val();
                    if (Number(averageAttri) > Number(maxAttri)){
            alert("最高告警阈值不能小于平均告警阈值！");
                    $(it).val($(it).attr("defaultValue"));
            }
            if (Number(averageAttri) < - 15 || Number(averageAttri) > 40 || Number(maxAttri) < - 15 || Number(maxAttri) > 40){
            alert("阈值设定范围在-15~40之间！");
                    $(it).val($(it).attr("defaultValue"));
            }
            }
            function save(btn){
            var url = $(btn).attr("data-url");
                    var id = $(btn).attr("pId");
                    var averageAttri = $("#avg" + id).val();
                    var maxAttri = $("#max" + id).val();
                    $.ajax({
                    type : "POST",
                            url : url,
                            dataType : "json",
                            data : {"averageAttri":averageAttri, "maxAttri":maxAttri},
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("出错");
                            },
                            success : function(response) {
                            alert("保存成功！");
                            }
                    })
            }

            function reSetData(btn, type){
            var url = $(btn).attr("data-url");
                    var id = $(btn).attr("pId");
                    $.ajax({
                    cache:true,
                            type : "POST",
                            url : url,
                            dataType : "json",
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("出错");
                            },
                            success : function(response) {
                            alert("恢复默认值！");
                                    if (type == 'wet'){
                            $("#avg" + id).val((response.averageAttri * 100).toFixed(1));
                                    $("#max" + id).val((response.maxAttri * 100).toFixed(1));
                            }
                            else{
                            $("#avg" + id).val((response.averageAttri));
                                    $("#max" + id).val((response.maxAttri));
                            }
                            }
                    })
            }
            function editBtnClick(btn){

            $('#myModal').modal({
            keyboard: false
            });
                    $(".modal-content").load(
                    $(btn).attr("data-url"), {name: "yl", title: "ly"},
                    //Modal
                    $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').focus();
            })
                    );
            }

            function delBtnClick(btn){
            if (yu_confirm("确认删除该信息？")) {
            var curDataId = $(btn).attr("pname");
                    var p = $(btn).attr("data-url");
                    var par = $(btn).parent().parent();
                    //var par = $("#"+pname);
                    $.ajax({
                    cache:true,
                            type : "POST",
                            url : p,
                            dataType : "json",
                            data : {curDataId:curDataId},
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("出错");
                            },
                            success : function(response) {
                            if (response.success == true){
                            par.remove();
                            }
                            else{
                            alert("删除数据出错");
                            }
                            }
                    })
            }
            }
</script>