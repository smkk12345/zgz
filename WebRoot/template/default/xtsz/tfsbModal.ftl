<!--用户管理--添加编辑用户界面-->
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">
    		新增通风设备
    </h4>
</div>

<div class="modal-body" >
  <form id="roleForm" action="" method="post">
    <div class="container-fluid mb10" >
    	<div class="autoGroup fl "> 
      		<label class="control-label required" >设备类型:</label>
	    	<select id="selectType" class="form-control" style="width:179px;">  
	            <#list tfTypes as tfType>
	            	<option 
	            	tfType=${tfType}>${tfType}</option>  
	            </#list>
	    	</select>
        </div>
        <div class="autoGroup fl"> 
      		<label class="control-label" for="deviceNo">设备编号:</label>
      		<div class="width-170px fl">
	      		<input type="text" class=" form-control width-160px" name="deviceNo" id="deviceNo" value=""   placeholder="设备编号"/>
	      		<div class="cl"></div>
      		</div>
       </div>
     </div
     <#if deviceType == "tfk">
       <!--通风口-->
       <div class="activePart">
		 <div class="container-fluid mb10" >
			<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="facePos">水平位置:</label>
		  		<div class="width-170px fl">
		  			<select id="selectType" class="form-control" style="width:179px;">  
			            <#list horPos as hpos>
			            	<option 
			            		<#if ventBean.horPos==hpos>
		                			selected="selected"
		               			</#if>
			            	horPos=${hpos}>${hpos}</option>  
			            </#list>
			    	</select>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="verPos">垂直位置:</label>
		  		<div class="width-170px fl">
		  			<select id="selectType" class="form-control" style="width:179px;">  
			            <#list verPos as vpos>
			            	<option 
			            		<#if ventBean.verPos==vpos>
		                			selected="selected"
		               			</#if>
			            	verPos=${vpos}>${vpos}</option>  
			            </#list>
			    	</select>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div>    
		<div class="container-fluid mb10" >
			<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="pos">具体x信息:</label>
		  		<div class="width-170px fl">
		  			<input type="text" class="form-control required width-160px" name="pos" id="pos" value="${ventBean.pos?default("")}"   placeholder="具体x信息"/>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="factoryName">控制器厂家:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="factoryName" id="factoryName" value="${fanBean.factoryName?default("")}"     placeholder="控制器厂家"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div> 
		<div class="container-fluid mb10" >
			<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="factoryNum">控制器厂家编号:</label>
		  		<div class="width-170px fl">
		  			<input type="text" class="form-control required width-160px" name="factoryNum" id="factoryNum" value="${fanBean.factoryNum?default("")}"    placeholder="控制器厂家编号"/>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="controllerNum">控制器编号:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="controllerNum" id="controllerNum" value="${fanBean.controllerNum?default("")}"     placeholder="控制器编号"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div>   
		</div> 
  	</#if>
  	<#if deviceType == "fj">
  	  <div class="activePart">
		 <div class="container-fluid mb10" >
			<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="deviceFactory">设备厂家:</label>
		  		<div class="width-170px fl">
		  			<input type="text" class="form-control required width-160px" name="deviceFactory" id="deviceFactory" value="${fanBean.deviceFactory?default("")}"  errorMsg="设备厂家不能为空"   placeholder="设备厂家"/>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="deviceNum">设备厂家编号:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="deviceNum" id="deviceNum" value="${fanBean.deviceNum?default("")}"     placeholder="设备厂家编号"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div>    
		<div class="container-fluid mb10" >
			<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="windDir">风向:</label>
		  		<div class="width-170px fl">
		  			<select id="selectType" class="form-control" style="width:179px;">  
			            <#list windDir as dir>
			            	<option 
			            		<#if fanBean.windDir==dir>
		                			selected="selected"
		               			</#if>
			            	tfType=${dir}>${dir}</option>  
			            </#list>
			    	</select>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="model">型号:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="model" id="model" value="${fanBean.model?default("")}"    placeholder="型号"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div> 
		<div class="container-fluid mb10" >
			<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="power">功率(KW):</label>
		  		<div class="width-170px fl">
		  			<input type="text" class="form-control required width-160px" name="power" id="power" value="${fanBean.power?default("")}"    placeholder="功率"/>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="frequenceyType">频率:</label>
		  		<div class="width-170px fl">
		      		<select id="selectType" class="form-control" style="width:179px;">  
			            <#list pinlv as lv>
			            	<option 
			            		<#if fanBean.frequenceyType==lv>
		                			selected="selected"
		               			</#if>
			            	frequenceyType=${lv}>${lv}</option>  
			            </#list>
			    	</select>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div>   
		<div class="container-fluid mb10" >
			<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="displayName">对应通风口编号:</label>
		  		<div class="width-170px fl">
		  			<input type="text" class="form-control required width-160px" name="displayName" id="displayName" value="${bean.displayName?default("")}"  errorMsg="姓名不能为空"   placeholder="对应通风口编号"/>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="factoryName">控制器厂家:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="factoryName" id="factoryName" value="${fanBean.factoryName?default("")}"     placeholder="控制器厂家"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div> 
		<div class="container-fluid mb10" >
			<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="factoryNum">控制器厂家编号:</label>
		  		<div class="width-170px fl">
		  			<input type="text" class="form-control required width-160px" name="factoryNum" id="factoryNum" value="${fanBean.factoryNum?default("")}"    placeholder="控制器厂家编号"/>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="controllerNum">控制器编号:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="controllerNum" id="controllerNum" value="${fanBean.controllerNum?default("")}"     placeholder="控制器编号"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div>        
  		</div>
  	</#if>
   	<#if deviceType == "fljc">
   		  <div class="activePart">
		 <div class="container-fluid mb10" >
			<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="deviceFactory">设备厂家:</label>
		  		<div class="width-170px fl">
		  			<input type="text" class="form-control required width-160px" name="deviceFactory" id="deviceFactory" value="${windBean.deviceFactory?default("")}"  errorMsg="设备厂家不能为空"   placeholder="设备厂家"/>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="deviceNum">设备厂家编号:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="deviceNum" id="deviceNum" value="${windBean.deviceNum?default("")}"     placeholder="设备厂家编号"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div>
		
		<div class="container-fluid mb10" >
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="factoryName">控制器厂家:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="factoryName" id="factoryName" value="${windBean.factoryName?default("")}"     placeholder="控制器厂家"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   	<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="factoryNum">控制器厂家编号:</label>
		  		<div class="width-170px fl">
		  			<input type="text" class="form-control required width-160px" name="factoryNum" id="factoryNum" value="${windBean.factoryNum?default("")}"    placeholder="控制器厂家编号"/>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		   <div class="cl"></div>
		</div> 
		<div class="container-fluid mb10" >
		
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="controllerNum">控制器编号:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="controllerNum" id="controllerNum" value="${windBean.controllerNum?default("")}"     placeholder="控制器编号"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div> 
		</div>   	
  	</#if> 	
  	<#if deviceType == "ch">
  	  <div class="activePart">
		 <div class="container-fluid mb10" >
			<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="deviceFactory">设备厂家:</label>
		  		<div class="width-170px fl">
		  			<input type="text" class="form-control required width-160px" name="deviceFactory" id="deviceFactory" value="${windowBean.deviceFactory?default("")}"  errorMsg="设备厂家不能为空"   placeholder="设备厂家"/>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="deviceNum">设备厂家编号:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="deviceNum" id="deviceNum" value="${windowBean.deviceNum?default("")}"     placeholder="设备厂家编号"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div> 
		<div class="container-fluid mb10" >
			<div class=" autoGroup fl "> 
		  		<label class="control-label required " >水平位置:</label>
		  		<div class="width-170px fl">
		  			<select id="selectType" class="form-control" style="width:179px;">  
			            <#list horPos as hpos>
			            	<option 
			            		<#if windowBean.horPos==hpos>
		                			selected="selected"
		               			</#if>
			            	horPos=${hpos}>${hpos}</option>  
			            </#list>
			    	</select>
		  			<div class="cl"></div>
		  		</div>
		    </div>
			<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="pos">具体x信息:</label>
		  		<div class="width-170px fl">
		  			<input type="text" class="form-control required width-160px" name="pos" id="pos" value="${windowBean.pos?default("")}"   placeholder="具体x信息"/>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		   <div class="cl"></div>
		</div>    
		
		<div class="container-fluid mb10" >
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="factoryName">控制器厂家:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="factoryName" id="factoryName" value="${windowBean.factoryName?default("")}"     placeholder="控制器厂家"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   	<div class=" autoGroup fl "> 
		  		<label class="control-label required "  for="factoryNum">控制器厂家编号:</label>
		  		<div class="width-170px fl">
		  			<input type="text" class="form-control required width-160px" name="factoryNum" id="factoryNum" value="${windowBean.factoryNum?default("")}"    placeholder="控制器厂家编号"/>
		  			<div class="cl"></div>
		  		</div>
		    </div>
		   <div class="cl"></div>
		</div> 
		<div class="container-fluid mb10" >
		
		    <div class=" autoGroup fl"> 
		  		<label class="control-label required" for="controllerNum">控制器编号:</label>
		  		<div class="width-170px fl">
		      		<input type="text" class="form-control required width-160px" name="controllerNum" id="controllerNum" value="${windowBean.controllerNum?default("")}"     placeholder="控制器编号"/>
		      		<div class="cl"></div>
		  		</div>
		   </div>
		   <div class="cl"></div>
		</div> 
		</div>
  	</#if> 

    <input  type="text" name="userId" value="${bean.id?default("")}" class="display-none" />
  </form>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary " id="send" data-url="${BASE_PATH}user/saveRoleInfo.action"  >保存</button>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#selectType").change(function(){
			//改变之后
			var tfType=$('#selectType option:selected').attr("tfType");
			tfType = getTfType(tfType);
			var url = '${BASE_PATH}'+"xtsz/getDeviceTem.action?deviceType="+tfType;
			$.ajax({
            cache: true,
            type: "POST",
            url: url,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            	alert(errorThrown);
            }, 
            success: function (response) {
            	$(".activePart").empty().append(response);
            }
        });
		})
		function getTfType(curType){
			if(curType == "窗户"){
				return "ch";
			}
			if(curType == "通风口"){
				return "tfk";
			}
			if(curType == "分机"){
				return "fj";
			}
			if(curType == "风力检测"){
				return "fljc";
			}
		}
	})
</script>