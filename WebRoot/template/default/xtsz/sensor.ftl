<#include "leftMenu.ftl"/>
<#include "../macro_ftl/xtszList.ftl">
<@override name="main_right">
<div class="container-fluid xtsz">
    <ul class="nav nav-pills menu">
        <#include "lqpzMenu.ftl"/>
        <li role="presentation" class="pull-right"></li>
    </ul>
     <div class="mt7 ml0">
        <table class="table table-hover timerTaskTable text-center">
            <tr class="info">
                <th style="width:150px;text-align: center">传感器名称</th>
                <th style="width:150px;text-align: center">类型</th>
                <th style="text-align: center">厂家</th>
                <th style="width:150px;text-align: center">编号</th>
                <#if role.roleAuthority[10]=="2">
                <th style="width:230px;text-align: center">操作</th>
                </#if>
            </tr>
             <@SensorList sensorList/>
        </table>
    </div>
<script type="text/javascript">
$(document).ready(function () {
	
	initRoleAuthority();
})	
	function initRoleAuthority(){
		var authority =  '${role.roleAuthority}';
		if(authority[6]=="1"){
			//传感器列表
			$("#sensorList").find(":input").attr("disabled",true);
			$("#sensorList").find(":button").attr("disabled",true);
		}
	}
    function editBtnClick(btn) {
        $('#myModal').modal({
            keyboard: false
        });
        $(".modal-content").load(
                $(btn).attr("data-url"), {name: "yl", title: "ly"},
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').focus();
        })
                );

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
</script>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>