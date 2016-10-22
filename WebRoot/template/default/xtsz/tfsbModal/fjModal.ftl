<!--用户管理--添加编辑用户界面-->
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">
    	 <#if bean.id??>
    		编辑风机
    	<#else>
    		新增风机
    	</#if>
    </h4>
</div>

<div class="modal-body" >
  <form id="fjForm" action="" method="post">
    <div class="container-fluid mb10" >
        <div class="autoGroup fl"> 
      		<label class="control-label required" for="deviceNo">设备编号:</label>
      		<div class="width-170px fl">
	      		<input type="text" class=" form-control width-160px required" name="deviceNo" id="deviceNo" value="${bean.deviceNo?default("")}"   placeholder="设备编号"/>
      			<div class="cl"></div>
      		</div>
       </div>
       <div class=" autoGroup fl "> 
	  		<label class="control-label  "  for="deviceFactory">设备厂家:</label>
	  		<div class="width-170px fl">
	  			<input type="text" class="form-control  width-160px" name="deviceFactory" id="deviceFactory" value="${bean.deviceFactory?default("")}"  errorMsg="设备厂家不能为空"   placeholder="设备厂家"/>
	  			<div class="cl"></div>
	  		</div>
	    </div>
     </div>

	 <div class="container-fluid mb10" >
	    <div class=" autoGroup fl"> 
	  		<label class="control-label " for="deviceNum">设备厂家编号:</label>
	  		<div class="width-170px fl">
	      		<input type="text" class="form-control  width-160px" name="deviceNum" id="deviceNum" value="${bean.deviceNum?default("")}"     placeholder="设备厂家编号"/>
	      		<div class="cl"></div>
	  		</div>
	   </div>
	   <div class=" autoGroup fl "> 
	  		<label class="control-label required "  for="windDir">风向:</label>
	  		<div class="width-170px fl">
	  			<select id="windDir" class="form-control" style="width:179px;">  
		            <#list windDir as dir>
		            	<option 
		            		<#if bean.windDir==dir>
	                			selected="selected"
	               			</#if>
		            	tfType=${dir}>${dir}</option>  
		            </#list>
		    	</select>
	  			<div class="cl"></div>
	  		</div>
	    </div>
	   <div class="cl"></div>
	</div>    
	<div class="container-fluid mb10" >

	    <div class=" autoGroup fl"> 
	  		<label class="control-label required" for="model">型号:</label>
	  		<div class="width-170px fl">
	      		<input type="text" class="form-control required width-160px" name="model" id="model" value="${bean.model?default("")}"    placeholder="型号"/>
	      		<div class="cl"></div>
	  		</div>
	   </div>
		<div class=" autoGroup fl "> 
	  		<label class="control-label required "  for="power">功率(KW):</label>
	  		<div class="width-170px fl">
	  			<input type="text" class="form-control required width-160px" name="power" id="power" value="${bean.power?default("")}"    placeholder="功率"/>
	  			<div class="cl"></div>
	  		</div>
	    </div>
	</div> 
	<div class="container-fluid mb10" >
	    <div class=" autoGroup fl"> 
	  		<label class="control-label required" for="frequenceyType">频率:</label>
	  		<div class="width-170px fl">
	      		<select id="frequenceyType" class="form-control" style="width:179px;">  
		            <#list pinlv as lv>
		            	<option 
		            		<#if bean.frequenceyType==lv>
	                			selected="selected"
	               			</#if>
		            	frequenceyType=${lv}>${lv}</option>  
		            </#list>
		    	</select>
	      		<div class="cl"></div>
	  		</div>
	   </div>
		<div class=" autoGroup fl "> 
	  		<label class="control-label required "  for="displayName">对应通风口编号:</label>
	  		<div class="width-170px fl">
	  			<select id="ventList" class="form-control" style="width:179px;">  
		            <#list ventList as vent>
		            	<option 
		            		<#if bean.ventDevice??>
			            		<#if bean.ventDevice.id==vent.id>
		                			selected="selected"
		               			</#if>
	               			</#if>	
		            	ventId=${vent.id}>${vent.deviceNo}号${vent.deviceName}</option>  
		            </#list>
		    	</select>
	  			<div class="cl"></div>
	  		</div>
	    </div>
	</div>   
	<div class="container-fluid mb10" >
	    <div class=" autoGroup fl"> 
	  		<label class="control-label " for="factoryName">控制器厂家:</label>
	  		<div class="width-170px fl">
	      		<input type="text" class="form-control  width-160px" name="factoryName" id="factoryName" value="${bean.factoryName?default("")}"     placeholder="控制器厂家"/>
	      		<div class="cl"></div>
	  		</div>
	   </div>
		<div class=" autoGroup fl "> 
	  		<label class="control-label  "  for="factoryNum">控制器厂家编号:</label>
	  		<div class="width-170px fl">
	  			<input type="text" class="form-control  width-160px" name="factoryNum" id="factoryNum" value="${bean.factoryNum?default("")}"    placeholder="控制器厂家编号"/>
	  			<div class="cl"></div>
	  		</div>
	    </div>
	</div> 
	<div class="container-fluid mb10" >
	    <div class=" autoGroup fl"> 
	  		<label class="control-label required" for="controllerNum">控制器编号:</label>
	  		<div class="width-170px fl">
	      		<input type="text" class="form-control required width-160px" name="controllerNum" id="controllerNum" value="${bean.controllerNum?default("")}"     placeholder="控制器编号"/>
	      		<div class="cl"></div>
	  		</div>
	   </div>
	   <div class="cl"></div>
	</div>        
    <input  type="text" name="beanId" value="${bean.id?default("")}" class="display-none" />
  </form>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary " id="send" data-url="${BASE_PATH}xtsz/saveFj.action"  >保存</button>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>
<script type="text/javascript">

	function save(btn){
		var dataInfo = $("#fjForm").serialize();
		var windDir=$('#windDir option:selected').attr("tfType");
		var frequenceyType=$('#frequenceyType option:selected').attr("frequenceyType")
		var ventId = $("#ventList option:selected").attr("ventId");
		dataInfo = dataInfo+"&windDir="+windDir+"&frequenceyType="+frequenceyType+"&ventId="+ventId;
		dataInfo = dataInfo + "&aoJianId="+'${aoJianId}';
		var url = $(btn).attr("data-url");
		$.ajax({
			type : "POST",
			url : url,
			data : dataInfo,
			error: function (XMLHttpRequest, textStatus, errorThrown) {
     		},				
			success : function(response) {
				$("#tfsbTable").empty().append(response);
				$('#myModal').modal('hide');
			}
		})
	}

	$(document).ready(function(){
		})
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
</script>