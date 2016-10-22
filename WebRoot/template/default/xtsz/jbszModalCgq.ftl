
<div class="modal-header" id="sensorModal">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">
        <#if sensorBean.id??>
    		编辑传感器
    	<#else>
    		     新增传感器
    	</#if>
    </h4>
</div>

<div class="modal-body">
  <form id="operateSensorForm"  action="${BASE_PATH}/xtsz/saveSensorInfo.action" method="post">
      <div class="container-fluid mb10" >
    	<div class="autoGroup fl "> 
      		<label class="control-label required" for="name">名称:</label>
      		<div class="width-170px fl">
	      		<input type="text" class="form-control required width-160px" name="name" id="name" value="${sensorBean.sensorName?default("")}" errorMsg="传感器名称不能为空"   placeholder="传感器名称"/>
	      		<div class="cl"></div>
      		</div>
        </div>
    	<div class="autoGroup fl "> 
      		<label class="control-label" for="sensorType">类型:</label>
      			<select id="selectSensorType" class="form-control" style="width:170px;"  >  
	            <#list sensorTypes as sensorType>
	            	<option 
	            		<#if sensorBean.sensorType==sensorType>
                			selected="selected"
               			</#if>
	            	sensorValue=${sensorType}>${sensorType}</option>  
	            </#list>
	    	</select>
        </div>
    </div>
    <div class="container-fluid mb10" >
    	<div class="autoGroup fl "> 
      		<label class="control-label " for="serialNum">编号:</label>
      		<div class="width-170px fl">
	      		<input type="text" class="form-control  width-160px" name="sensorNum" id="serialNum" value="${sensorBean.serialNum?default("")}"   placeholder="传感器编号"/>
	      		<div class="cl"></div>
      		</div>
        </div>
    	<div class="autoGroup fl "> 
      		<label class="control-label " for="sensorFactory">厂家:</label>
      		<div class="width-170px fl">
	      		<input type="text" class="form-control  width-160px" name="sensorFactory" id="sensorFactory" value="${sensorBean.sensorFactory?default("")}"   placeholder="传感器厂家"/>
	      		<div class="cl"></div>
      		</div>
        </div>
    </div>
   
   <input  type="text" name="sensorId" value="${sensorBean.id?default("")}" class="display-none" />
  </form>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary" id="send" data-url="" >保存</button>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>
<script type="text/javascript">
function save(btn){
		var p = '${BASE_PATH}'+"/xtsz/saveSensorInfo.action";
		var dataInfo = $("#operateSensorForm").serialize();
		var val=$('#selectSensorType option:selected').attr("sensorValue");
		
		dataInfo = dataInfo+"&sensorType="+val;
		$.ajax({
			cache:true,
			type : "POST",
			url : p,
			dataType : "json",
			data : dataInfo,
			error: function (XMLHttpRequest, textStatus, errorThrown) {
    		 	alert("出错");
     		},
			success : function(response) {
				location.reload();
			}
		});
		return;
    };
</script>