<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="container-fluid" style="height:100%;">
    <div class="panel panel-default mt7 content body" style="height:100%;">
    	<div class="panel-heading container-full">
    		<div >
    			<span class="ml20 ">${bean.aoJianIndex}号廒间</span>
    			<a class = "YL-ModalClick" style="cursor:pointer;" href="#" data-url="${BASE_PATH}/xtsz/tfsbAoJianSelectedModal.action?aoJianId=${bean.zyAoJianNum}">(点击切换廒间)</a>
    		</div>
        </div>
        <div class=" panel-body" >
        	<div class="container-fluid mb10" >
				<div class="  autoGroup fl "> 
  					<label class="control-label width-130px" for="barnIndex">通风模式:</label>
  					<div class="width-130px fl">
			      		<select id="ventilationModeList" class="form-control width-130px">  
				            <#list ventilationModeList as ventilationMode>
				            	<option 
				            		<#if bean.ventilationMode??>
					            		<#if bean.ventilationMode==ventilationMode>
				                			selected="selected"
				               			</#if>
				            		</#if> 
				            	horPos=${ventilationMode}>${ventilationMode}</option>  
				            </#list>
				    	</select>
      					<div class="cl"></div>
  					</div>
    			</div>
        		<div class="  autoGroup fl"> 
      				<label class="control-label width-130px" for="openRatio">开孔率(%):</label>
      				<div class="width-130px fl">
	      				<input type="text" class=" form-control  width-130px" name="openRatio" id="openRatio" value="${bean.openRatio?default("")}" errorMsg="开孔率不能为空"  placeholder="开孔率"/>
	      				<div class="cl"></div>
      				</div>
      			 </div>
        		<div class="  autoGroup fl"> 
      				<label class="control-label width-130px" for="wayThan">途径比:</label>
      				<div class="width-130px fl">
	      				<input type="text" class=" form-control  width-130px" name="wayThan" id="wayThan" value="${bean.wayThan?default("")}" errorMsg="途径比不能为空"  placeholder="途径比"/>
	      				<div class="cl"></div>
      				</div>
      			 </div>
				 <div class="  autoGroup fl"> 
      				<label class="control-label width-130px" for="ventResistance">风网阻力(pa):</label>
      				<div class="width-130px fl">
	      				<input type="text" class=" form-control  width-130px" name="ventResistance" id="ventResistance" value="${bean.ventResistance?default("")}" errorMsg="风网阻力不能为空"  placeholder="风网阻力"/>
	      				<div class="cl"></div>
      				</div>
      			 </div>
      			 <div class="autoGroup fl"> 
      				<label class="control-label width-130px" for="ventRemark">备注:</label>
      				<div class="width-130px fl">
	      				<input type="text" class=" form-control  width-130px" name="ventRemark" id="ventRemark" value="${bean.ventRemark?default("")}"   placeholder="备注"/>
	      				<div class="cl"></div>
      				</div>
      			 	<button type="button" class="btn btn-primary  ml10"  data-url="${BASE_PATH}xtsz/saveAoJianTfsbInfo.action" aoJianId=${bean.zyAoJianNum} onClick="saveAoJianTfsb(this)" >保存</button>
      			 </div>
			</div>
			<hr size='1' width='100%'  align='center' color='#999999;'>
	    	<div class="panel panel-default subContent" >
		        <div class="panel-heading">
		                <div class="btn-group fl">
		                    <button type="button" class="btn btn-primary btn-xs dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                        添加设备 <span class="caret"></span>
		                    </button>
		                    <ul class="dropdown-menu">
		                        <li><a  href="#" onclick="addDevice(this)" data-url="${BASE_PATH}xtsz/tfkModal.action?aoJianId=${bean.zyAoJianNum}">添加通风口</a></li>
		                        <li><a  href="#"  onclick="addDevice(this)" data-url="${BASE_PATH}xtsz/fjModal.action?aoJianId=${bean.zyAoJianNum}" href="#">添加风机</a></li>
		                        <li><a  href="#"  onclick="addDevice(this)" data-url="${BASE_PATH}xtsz/chModal.action?aoJianId=${bean.zyAoJianNum}" href="#">添加窗户</a></li>
		                        <li><a  href="#"  onclick="addDevice(this)" data-url="${BASE_PATH}xtsz/fljcModal.action?aoJianId=${bean.zyAoJianNum}" href="#">添加风力检测设备</a></li>
		                    </ul>
		                </div>
		        </div>
		        <div class=" panel-body" >
			        <table class="table table-hover mt7 " id="tfsbTable" >
				        <tr class="info">
				            <th style="width:100px">序号</th>
				            <th style="width:150px">设备编号</th>
				            <th style="width:175px">设备名称</th>
				            <th >设备位置</th>
				            <th style="width:120px">控制器编号</th>
				            <th style="width:200px">操作</th>
				        </tr>
				        <#if baseDevices?size gt 0>
				        	<#list baseDevices as device>
						        <tr class="active" id=${device.id}>
						            <td >${device_index?number+1}</td>
						            <td >${device.deviceNo}</td>
						            <td >${device.deviceName}</td>
						            <td >${device.posInfo}</td>
						            <td >${device.controllerNum}</td>
						            <td >
						            	<button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" tfType=${device.deviceName} tfId=${device.id} aoJianId = ${bean.zyAoJianNum}>编辑</button>
										<button type="button" class="btn btn-primary btn-xs ml10"  onClick="delBtnClick(this)" data-url="${BASE_PATH}xtsz/deleteDevice.action?curDataId=${device.id}" tfId=${device.id} tfType=${device.deviceName}>删除</button>
									</td>
						        </tr>
				        	</#list>
				        </#if>
			    	 </table>
		       	 </div>
	    	</div>      
       	</div>
    </div>  
</div>    
	<script type="text/javascript">

    function selectAoJianChange(btn){
	    var url = $(btn).attr("data-url");
	    var ids = getAoJianIndexStrs();
	    url = url +"?aoJianId="+ids;
	    window.location.href = url;
    }
    
    function getAoJianIndexStrs(){
	    var aoJIanIndexStrs = "";
	    $("#aojian .btn-success").each(function () {
		    var aoJianId = $(this).attr("dataId");
		    aoJIanIndexStrs = aoJIanIndexStrs+aoJianId+"#";
	    });
	    aoJIanIndexStrs = aoJIanIndexStrs.substr(0,aoJIanIndexStrs.length-1);
	    return aoJIanIndexStrs;
    }
    
	function addDevice(btn){
		var btn = $(btn);
 		var url = btn.attr("data-url");
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
	
	function clickBtn(btn){
		var aoJianId = $(btn).attr("dataId");
 		//ajax 请求
 		var url='${BASE_PATH}'+"xtsz/getAoJianTfsb.action?aoJianId="+aoJianId;
 		$.ajax({
            type: "POST",
            url: url,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
        	},
        	success: function (response) {
				$(".subContent").remove();
				$(".content").append(response);
        	}
    	})
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