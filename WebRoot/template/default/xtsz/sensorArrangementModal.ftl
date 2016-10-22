<!--检测设备布置--模态窗体--新增检测设备布置-->
<div class="modal-header" id="alarmModal">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">
        <#if bean.id??>
    		编辑检测设备布置方法
    	<#else>
    		      新增检测设备布置方法
    	</#if>
</h4>
</div>
<div class="modal-body">
  <form id="sensorArrangementForm" action="" method="post">
    <div class="container-fluid mb10">
    	<div class="autoGroup fl">
      		<label class="fl control-label">检测设备:</label>
      		<select id="sensorSelector" class="form-control fl" name="sensorName" onchange="sensorChange(this)" style="width:175px;">
	      		<#if sensorBeanList?size gt 0>
	      			<#list sensorBeanList as sensorBean>
	      				<option name="sensorItem" dataId="${sensorBean.id}" sensorType="${sensorBean.sensorType}">${sensorBean.sensorName}</option>
	      			</#list>
	      		</#if>
		     </select>
        </div>
    	<div class="autoGroup fl clearfix"> 
      		<label class="fl control-label">类型:</label>
      		<input type="text" id="sensorTypeInput" disabled="true" class="form-control fl " name="horAttri" value="${bean.horAttri?default("")}"  placeholder="检测设备类型"/>
       </div>
    </div>
    <div class="container-fluid mb10">
    	<div class="  autoGroup fl">      
        	<label class="fl control-label">名称:</label>
      		<input type="text" class="form-control  " id="arrangementNameInput" value="${bean.arrangementName?default("")}"  placeholder="布置名称"/>        
        </div>        
       <div class="  autoGroup fl"> 
			<label for="name" class="fl">选择列表</label>
      		<select id="positionSelector" name="positionInfo" class="form-control fl" style="width:175px;">
         		<option>粮堆</option>
         		<option>仓外</option>
         		<option>仓内</option>
      </select>
       </div>
    </div>
    <input  type="text" id="sensorArrangementId" name="sensorArrangementId" value="${bean.id?default("")}" class="display-none" />
  </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary " data-url="${BASE_PATH}/xtsz/saveArrangementInfo.action" onclick="saveClick(this)" >保存</button>
</div>
<script type="text/javascript">  
	$(function(){  
		var sensorName = '${bean.sensor.sensorName?default("")}';
		if(sensorName!=""){
			$("#sensorSelector ").val(sensorName); 
		}
		var positionInfo = '${bean.positionInfo?default("")}';
		if(positionInfo!=""){
			$("#positionSelector ").val(positionInfo); 
		}
	});
	function sensorChange(selector){
		var sensorType = $("#sensorSelector").find("option:selected").attr("sensorType");
		$("#sensorTypeInput").val(sensorType);
	}
	
</script>