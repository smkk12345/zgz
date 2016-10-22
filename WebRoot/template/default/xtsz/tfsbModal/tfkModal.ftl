<!--用户管理--添加编辑用户界面-->
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">
    	<#if bean.id??>
    		编辑通风口
    	<#else>
    		新增通风口
    	</#if>
    </h4>
</div>
<div class="modal-body" >
  <form id="tfkForm" action="" method="post">
    <div class="container-fluid mb10">
        <div class="autoGroup fl"> 
      		<label class="control-label required" for="deviceNo">设备编号:</label>
      		<div class="width-170px fl">
	      		<input type="text" class=" form-control width-160px required" name="deviceNo" id="deviceNo" value="${bean.deviceNo?default("")}"   placeholder="设备编号"/>
      		</div>
       </div>
		<div class=" autoGroup fl "> 
	  		<label class="control-label required "  for="facePos">水平位置:</label>
	  		<div class="width-170px fl">
	  			<select id="horPos" class="form-control" style="width:179px;">  
		            <#list horPos as hpos>
		            	<option 
		            		<#if bean.facePos==hpos>
	                			selected="selected"
	               			</#if>
		            	horPos=${hpos}>${hpos}</option>  
		            </#list>
		    	</select>
	  			<div class="cl"></div>
	  		</div>
	    </div>
	 </div>
	 <div class="container-fluid mb10" >
	    <div class=" autoGroup fl"> 
	  		<label class="control-label required" for="verPos">垂直位置:</label>
	  		<div class="width-170px fl">
	  			<select id="verPos" class="form-control" style="width:179px;">  
		            <#list verPos as vpos>
		            	<option 
		            		<#if bean.verPos==vpos>
	                			selected="selected"
	               			</#if>
		            	verPos=${vpos}>${vpos}</option>  
		            </#list>
		    	</select>
	  		</div>
	   </div>
	   <div class=" autoGroup fl "> 
	  		<label class="control-label required "  for="pos">具体x信息:</label>
	  		<div class="width-170px fl">
	  			<input type="text" class="form-control required width-160px" name="pos" id="pos" value="${bean.pos?default("")}"   placeholder="具体x信息"/>
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
	   <div class="cl"></div>
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
    <button type="button" class="btn btn-primary " id="send" data-url="${BASE_PATH}xtsz/saveTfk.action">保存</button>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>

<script type="text/javascript">

	function save(btn){
		var dataInfo = $("#tfkForm").serialize();
		var val=$('#horPos option:selected').attr("horPos");
		dataInfo = dataInfo+"&facePos="+val;
		
		var val1 = $('#verPos option:selected').attr("verPos");
		dataInfo = dataInfo+"&verPos="+val1;
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