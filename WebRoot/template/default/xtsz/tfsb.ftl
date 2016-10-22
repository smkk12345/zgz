<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="container-fluid" style = "height:100%;">
    <ul class="nav nav-pills menu">
        <#include "zntfMenu.ftl"/>
        <li role="presentation" class="pull-right"></li>
    </ul>
    <div class="panel panel-default mt7 content" style = "height:95%;">
    	<div class="panel-heading"><span class="fl clearfix">通风设备</span>
	        <div class="btn-group fr mr20">
                注：选择廒间编辑廒间通风设备
            </div>
        </div>
    	<div class=" panel-body" >
	       	<ul class="aojian-modle clearfix " id="aojian">
		       <#list barnList as vo>
					<li  title="${vo.barnIndex}号仓房" aria-label="${vo.barnIndex}">
					    <div class="btn-group btn-group-xm" role="group">
					        <#list vo.aoJianSet as voo>
					        <button  
					         class="btn 
					        	<#if (voo.sensorArrangementbeanId?default("#"))?index_of(bean.id)==-1>
					        		btn-default
					        	<#else>
					        		btn-success
					        	</#if>"  
					        dataId=${voo.zyAoJianNum} barnIndex=${vo.barnIndex} onclick="clickBtn(this)" aria-label="${voo.aoJianIndex?default("")}">${voo.aoJianIndex?default("")}#厫间</button>
					        </#list>
					    </div>
					    <p>${vo.barnIndex}号仓房</p>
					</li>
				</#list>
	    	</ul>
       	</div>
    </div>  
</div>    
     
	<script type="text/javascript">
	$(document).ready(function(){
		$("#aojian .btn-success").each(function () {
		 	})
		$(".ModalClick").click(function () {
    }); 
       }); 	

	function addDevice(btn){
		var btn = $(btn);
		$("#aojian .btn-success").each(function () {
	 		var aoJianId = $(this).attr("dataId");
			var url = btn.attr("data-url");
			url = url+"?aoJianId="+aoJianId;
	        $('#myModal').modal({
	            keyboard: false
	        });
	        $(".modal-content").load(
	                url, {name: "yl", title: "ly"},
	        //Modal
	        $('#myModal').on('shown.bs.modal', function () {
	            $('#myInput').focus();
	        })
	       );
	 	})
	}
	
	function clickBtn(btn){
		var aoJianId = $(btn).attr("dataid");
		window.location.href = '${BASE_PATH}'+"xtsz/getAoJianTfsb.action?aoJianId="+aoJianId;
	}	
		
	function delBtnClick(btn){
	   if (yu_confirm("确认删除该通风设备信息？")) {
			var url = $(btn).attr("data-url");
			var type = $(btn).attr("tfType");
			type = getTfType(type);
			var sbId = $(btn).attr("tfId");
			url = url +"&deviceType="+type;
	 		$.ajax({
	            type: "POST",
	            url: url,
	            error: function (XMLHttpRequest, textStatus, errorThrown) {
	                alert(errorThrown);
	        	},
	        	success: function (response) {
	        		$("#"+sbId).remove();
	        	}
	    	})
    	}
	}	
	
		function getTfType(curType){
			if(curType == "窗户"){
				return "ch";
			}
			if(curType == "通风口"){
				return "tfk";
			}
			if(curType == "风机"){
				return "fj";
			}
			if(curType == "风力检测"){
				return "fljc";
			}
		}
		
	function editBtnClick(btn){
		var type = $(btn).attr("tftype");
		type = getTfType(type);
		var tfId = $(btn).attr("tfId");
		var aoJianId = $(btn).attr("aoJianId");
		var url = getEditUrl(type,tfId,aoJianId);
        $('#myModal').modal({
            keyboard: false
        });
        $(".modal-content").load(
                url, {name: "yl", title: "ly"},
        //Modal
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').focus();
        })
                );
	}
	function getEditUrl(type,tfId,aoJianId){
		if(type == "ch"){
			return '${BASE_PATH}'+"xtsz/chModal.action?deviceId="+tfId+"&aoJianId="+aoJianId;
		}else if(type == "tfk"){
			return '${BASE_PATH}'+"xtsz/tfkModal.action?deviceId="+tfId+"&aoJianId="+aoJianId;
		}else if (type == "fj"){
			return '${BASE_PATH}'+"xtsz/fjModal.action?deviceId="+tfId+"&aoJianId="+aoJianId;
		}else {
			return '${BASE_PATH}'+"xtsz/fljcModal.action?deviceId="+tfId+"&aoJianId="+aoJianId;
		}
	}
	
	 function saveAoJianTfsb(btn){
	 	var url = $(btn).attr("data-url");
	 	var aoJianId = $(btn).attr("aoJianId");
	 	var ventilationMode = $("#ventilationModeList  option:selected").attr("horPos");
	 	var openRatio = $("#openRatio").val();
	 	var wayThan = $("#wayThan").val();
	 	var ventResistance = $("#ventResistance").val();
	 	var ventRemark = $("#ventRemark").val();
	 	$.ajax({
            type: "POST",
            url: url,
            data: {ventilationMode: ventilationMode,openRatio:openRatio,wayThan:wayThan,ventResistance:ventResistance,ventRemark:ventRemark,aoJianId:aoJianId},
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
        	},
        	success: function (response) {
        		alert("保存成功");
        	}
    	})
	 }
	 	
	</script>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>