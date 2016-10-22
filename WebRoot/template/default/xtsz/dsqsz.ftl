<#include "leftMenu.ftl"/>
<#include "../macro_ftl/xtszList.ftl">
<#setting date_format="yyyy-MM-dd HH:mm:ss">
<@override name="main_right">
<div class="container-fluid">
    <ul class="nav nav-pills menu">
        <#include "lqpzMenu.ftl"/>
        <li role="presentation" class="pull-right"></li>
    </ul>
    <div class="mt7 ml0">
        <table class="table table-hover timerTaskTable text-center">
            <tr class="info">
                <th style="width:190px;text-align: center">任务名称</th>
                <th style="width:120px;text-align: center">类型</th>
                <th style="width:80px;text-align: center">状态</th>
                <th style="width:150px;text-align: center">开始时间</th>
                <th style="width:150px;text-align: center">结束时间</th>
                <th style="width:60px;text-align: center">周期</th>
                <th style="width:80px;text-align: center">周期单位</th>
                <th style="width:auto;text-align: center">描述</th>
                <#if role.roleAuthority[10]=="2">
                <th style="width:230px">操作</th>
                </#if>
            </tr>
            <#if timerTaskList?size gt 0>
            <#list timerTaskList as task>
            <tr class="active" id="${task.id}">
                <td>${task.taskName?default("")}</td>
                <td >${task.timerType?default("")}</td>
                <td >
                    <#if task.status==1>
                    已启动
                    <#else>
                    未启动	
                    </#if>
                </td>
                <td >${task.startTime?date}</td>
                <td >${task.stopTime?date}</td>
                <td >${task.period?default("")}</td>
                <td >${task.units?default("")}</td>
                <td>${task.taskDesc?default("")}</td>
                <#if role.roleAuthority[10]=="2">
                <td style="text-align: left">
                    <button type="button" class="btn btn-primary btn-xs ml10"  onclick="editBtnClick(this)" 
                            data-url="${BASE_PATH}/xtsz/changeStatus.action?timerTaskId=${task.id}" pName=${task.id}>
                        <#if task.status==1>暂停任务<#else>启动任务</#if> 
                    </button>
                    
                    <button type="button" class="btn btn-primary btn-xs ml10 "  
                            data-url="${BASE_PATH}xtsz/timerAoJianSelectedModal.action?taskId=${task.id}"  onclick="edit(this)">适用范围</button>
                            
                    <button type="button" class="btn btn-primary btn-xs ml10 "  
                            data-url="${BASE_PATH}xtsz/dsqszModal.action?taskId=${task.id}"  onclick="edit(this)">编辑</button>
                    <button type="button" class="btn btn-primary btn-xs ml10"  onclick="popUpModel(this)" 
                            data-url="${BASE_PATH}xtsz/confirmDeleteModel.action?deleteUrl=${BASE_PATH}xtsz/delTimerTask.action?timerTaskId=${task.id}" pName=${task.id}>删除</button>
                </td>
                </#if>
            </tr>	
            </#list>
            </#if>
        </table>
    </div>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">

		function popUpModel(btn){
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
    function edit(btn) {
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
    function getLocalTime(nS) {
        return new Date(parseInt(nS)).toLocaleString().replace(/年|月/g, "-").replace(/日/g, " ");
    }
    function save(btn) {
        var dataInfo = $("#timerTaskForm").serialize();
        var obj = document.getElementById('timerType');
        var index = obj.selectedIndex; //序号，取当前选中选项的序号
        var val = $('#timerType option:selected').val();
        dataInfo = dataInfo + "&timerType=" + val;

        var obj1 = document.getElementById('periodUnit');
        var index1 = obj1.selectedIndex; //序号，取当前选中选项的序号
        var val1 = $('#periodUnit option:selected').val();
        dataInfo = dataInfo + "&units=" + val1;
        var url = $(btn).attr("data-url");
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            dataType: "json",
            data: dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                location.reload();
                $('#myModal').modal('hide');
            }
        })
    }
    
    function afterOperate(isOk,operateId){
    	if(isOk){
    		alert("删除成功");
    		location.reload();
    		$('#myModal').modal('hide');
    	}
    	else{
    		alert("请先删除掉关联数据，再进行删除操作");
    	}
    }
    
    function editBtnClick(btn) {
        var url = $(btn).attr("data-url");
        var pName = $(btn).attr("pName");
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            dataType: "json",
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                location.reload();
            }
        })
    }
    
       function updateTimerInfo(btn){
	    var ids = getAoJianIndexStrs();
	    var url = $(btn).attr("data-url");
	    $.ajax({
		    cache:true,
		    type : "POST",
		    url : url,
		    data : {"ids":ids},
		    error: function (XMLHttpRequest, textStatus, errorThrown) {
		    alert("出错");
		    },				
		    success : function(response) {
		    }
		    })
	    $('#myModal').modal('hide');
    }
    //获取颜色为绿色的选择状态下的廒间信息
    function getAoJianIndexStrs(){
	    var aoJIanIndexStrs = "";
	    $("#aojian .btn-success").each(function () {
		    var aoJianId = $(this).attr("dataId");
		    aoJIanIndexStrs = aoJIanIndexStrs+aoJianId+"#";
	    });
	    aoJIanIndexStrs = aoJIanIndexStrs.substr(0,aoJIanIndexStrs.length-1);
	    return aoJIanIndexStrs;
    }
</script>