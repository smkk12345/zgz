<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="container-fluid">
    <ul class="nav nav-pills menu">
        <#include "zntfMenu.ftl"/>
        <li role="presentation" class="pull-right"></li>
    </ul>
    <div class="panel panel-default  mt7 content">
    	<div class="panel-heading"><span class="fl clearfix">降温通风</span> </div>
    	<div class=" panel-body">
    		<form id="tem">
		    	<div class="container-fluid mb10" >
			        <div class="autoGroup fl"> 
			      		<label class="control-label required" for="deviceNo">自动通风:</label>
			      		<div class="width-170px fl">
				      		<select id="autoModetem" class="form-control" style="width:172px;">  
					            <#list selectBooleanArr as v>
					            	<option 
					            		<#if temBean.autoMode??>
						            		<#if temBean.autoMode==v>
					                			selected="selected"
					               			</#if>
					            		</#if>
					            	isSel=${v}>${v}</option>  
					            </#list>
						    </select>
				      		<div class="cl"></div>
			      		</div>
			       </div>
				   <div class=" autoGroup fl "> 
				  		<label class="control-label  "  for="deviceFactory">通风开始条件判别:</label>
				  		<div class="width-170px fl">
				  			<select id="startVentDistinguishtem" class="form-control" style="width:172px;">  
					            <#list selectBooleanArr as w>
					            	<option 
					            		<#if temBean.startVentDistinguish??>
						            		<#if temBean.startVentDistinguish==w>
					                			selected="selected"
					               			</#if>
					            		</#if>
					            	isSel=${w}>${w}</option>  
					            </#list>
						    </select>
				  			<div class="cl"></div>
				  		</div>
				    </div>
		     	</div>
		     	<div class="container-fluid mb10" >
			        <div class="autoGroup fl"> 
			      		<label class="control-label required" for="deviceNo">保水通风:</label>
			      		<div class="width-170px fl">
				      		<select id="waterRetentiontem" class="form-control" style="width:172px;">  
					            <#list selectBooleanArr as h>
					            	<option 
					            		<#if temBean.waterRetention??>
						            		<#if temBean.waterRetention==h>
					                			selected="selected"
					               			</#if>
					            		</#if>
					            	isSel=${h}>${h}</option>  
					            </#list>
						    </select>
				      		<div class="cl"></div>
			      		</div>
			       </div>
				   <div class=" autoGroup fl  
				   		<#if temBean.waterRetention??>
				   			<#if temBean.waterRetention=="否">
				   				display-none
				   			</#if>
				   		</#if>
				   " id="waterRetentionFactorCon"> 
				  		<label class="control-label  "  for="waterRetentionFactor">保水降温湿度控制系数(0~1):</label>
				  		<div class="width-170px fl">
				  			<input type="text" class="form-control  width-160px" name="waterRetentionFactor" id="waterRetentionFactor" value="${temBean.waterRetentionFactor?default("")}"  errorMsg="设备厂家不能为空"   placeholder="保水降温湿度控制系数(0~1)"/>
				  			<div class="cl"></div>
				  		</div>
				    </div>
		     	</div>
		     	<div class="container-fluid mb10" >
			        <div class="autoGroup fl"> 
			      		<label class="control-label required" for="targetTem">目标粮温:</label>
			      		<div class="width-170px fl">
				      		<input type="text" class=" form-control width-160px required" name="targetTem" id="targetTem" value="${temBean.targetTem?default("")}"   placeholder="目标粮温"/>
				      		<div class="cl"></div>
			      		</div>
			       </div>
				   <div class=" autoGroup fl "> 
				  		<label class="control-label  "  for="temDiffer">粮温与大气的温差:</label>
				  		<div class="width-170px fl">
				  			<input type="text" class="form-control  width-160px" name="temDiffer" id="temDiffer" value="${temBean.temDiffer?default("")}"     placeholder="粮温与大气的温差"/>
				  			<div class="cl"></div>
				  		</div>
				    </div>
		     	</div>
		     	<div class="container-fluid mb10" >
			        <div class="autoGroup fl"> 
			      		<label class="control-label required" for="airInOutTemDiffer">粮温进出气温差:</label>
			      		<div class="width-170px fl">
				      		<input type="text" class=" form-control width-160px required" name="airInOutTemDiffer" id="airInOutTemDiffer" value="${temBean.airInOutTemDiffer?default("")}"   placeholder="粮温进出气温差"/>
				      		<div class="cl"></div>
			      		</div>
			       </div>
				   <div class=" autoGroup fl "> 
				  		<label class="control-label  "  for="airInOutWetDiffer">粮温进出气水份差:</label>
				  		<div class="width-170px fl">
				  			<input type="text" class="form-control  width-160px" name="airInOutWetDiffer" id="airInOutWetDiffer" value="${temBean.airInOutWetDiffer?default("")}"  errorMsg="设备厂家不能为空"   placeholder="粮温进出气水份差"/>
				  			<div class="cl"></div>
				  		</div>
				    </div>
		     	</div>
		     	<div class="container-fluid mb10" >
			        <div class="autoGroup fl"> 
			      		<label class="control-label required" for="deviceNo">空气相对湿度:</label>
			      		<div class="width-170px fl">
				      		<input type="text" class=" form-control width-160px required" name="airRelativeHum" id="airRelativeHum" value="${temBean.airRelativeHum?default("")}"   placeholder="空气相对湿度"/>
				      		<div class="cl"></div>
			      		</div>
			       </div>
				   <div class=" autoGroup fl "> 
				  		<label class="control-label  "  for="windSpeed">风速:</label>
				  		<div class="width-170px fl">
				  			<input type="text" class="form-control  width-160px" name="windSpeed" id="windSpeed" value="${temBean.windSpeed?default("")}"  errorMsg="设备厂家不能为空"   placeholder="风速"/>
				  			<div class="cl"></div>
				  		</div>
				    </div>
					<div class=" autoGroup fl "> 
					    <button type="button" class="btn btn-primary ml10 "  tfType="tem" onclick="editBtnClick(this)">保存</button>
				    </div>
				    <input  type="text" name="beanId" value="${temBean.id?default("")}" class="display-none" />
				    <input  type="text" name="ventType" value="${temBean.ventType?default("")}" class="display-none" />
		     	</div>
	     	</form>
       	</div>
    </div>  
    <div class="panel panel-default mt7 content">
    	<div class="panel-heading"><span class="fl clearfix">降水通风</span> </div>
    	<div class=" panel-body">
    		<form id="wet">
 			<div class="container-fluid mb10" >
		        <div class="autoGroup fl"> 
		      		<label class="control-label required" for="deviceNo">自动通风:</label>
		      		<div class="width-170px fl">
			      		<select id="autoModewet" class="form-control" style="width:172px;">  
				            <#list selectBooleanArr as v>
				            	<option 
				            		<#if wetBean.autoMode??>
					            		<#if wetBean.autoMode==v>
				                			selected="selected"
				               			</#if>
				            		</#if>
				            	isSel=${v}>${v}</option>  
				            </#list>
					    </select>
			      		<div class="cl"></div>
		      		</div>
		       </div>
			   <div class=" autoGroup fl "> 
			  		<label class="control-label  "  for="deviceFactory">通风开始条件判别:</label>
			  		<div class="width-170px fl">
			  			<select id="startVentDistinguishwet" class="form-control" style="width:172px;">  
				            <#list selectBooleanArr as w>
				            	<option 
				            		<#if wetBean.startVentDistinguish??>
					            		<#if wetBean.startVentDistinguish==w>
				                			selected="selected"
				               			</#if>
				            		</#if>
				            	isSel=${w}>${w}</option>  
				            </#list>
					    </select>
			  			<div class="cl"></div>
			  		</div>
			    </div>
	     	</div> 
	     	<div class="container-fluid mb10" >
		        <div class="autoGroup fl"> 
		      		<label class="control-label required" for="deviceNo">空气相对湿度:</label>
		      		<div class="width-170px fl">
			      		<input type="text" class=" form-control width-160px required" name="airRelativeHum" id="airRelativeHum" value="${wetBean.airRelativeHum?default("")}"   placeholder="空气相对湿度"/>
			      		<div class="cl"></div>
		      		</div>
		       </div>
			   <div class=" autoGroup fl "> 
			  		<label class="control-label  "  for="windSpeed">风速:</label>
			  		<div class="width-170px fl">
			  			<input type="text" class="form-control  width-160px" name="windSpeed" id="windSpeed" value="${wetBean.windSpeed?default("")}"  errorMsg="设备厂家不能为空"   placeholder="风速"/>
			  			<div class="cl"></div>
			  		</div>
			    </div>
				<div class=" autoGroup fl "> 
				    <button type="button" class="btn btn-primary ml10 "   tfType="wet"
      					onclick="editBtnClick(this)">保存</button>
			    </div>
			</div>
			<input  type="text" name="beanId" value="${wetBean.id?default("")}" class="display-none" />
			<input  type="text" name="ventType" value="${wetBean.ventType?default("")}" class="display-none" />
			</form>
			<#if grainList?size gt 0>
		    	<#list grainList as ROW>
		        	<div  class="container-fluid mb10"  curDataId="${ROW.id}">
		        		<div class="autoGroup fl">
		            		<label class="control-label  fl">品种${ROW_index +1}:</label>
		       				<input  type="text"   class="form-control fl" value="${ROW.grainType?default("")}" placeholder="粮食品种" disabled="disabled"/>		
		           		</div>
		            	<div class="autoGroup fl">
		                 	<label class="control-label  fl">安全水份(%):</label>      
		       			 	<input  type="text"  id="${ROW.id}wet" class="form-control fl"  defaultValue="${ROW.defaultSafeWet*100?default("")}" value="${ROW.safeWet*100?default("")}" placeholder="安全水份" />	
		            	</div> 
		            	<div class="autoGroup fl">
		      				<button type="button" class="btn btn-primary ml10 "  grainId=${ROW.id} tfType="wet" operateType="edit"
		      				onclick="editGrainClick(this)">修改</button>
		      				<button type="button"   onclick="editGrainClick(this)" grainId=${ROW.id} tfType="wet"  operateType="reset"
		      				class="btn btn-primary ml10">恢复默认值</button>
		            	</div>
		            	<div class="cl"></div>
		            </div> 
		      	</#list>
		    </#if>	

    	</div>
    </div>
    <div class="panel panel-default mt7 content">
    	<div class="panel-heading"><span class="fl clearfix">防结露通风</span> </div>
    	<div class=" panel-body">
    		<form id="dew">
    		<div class="container-fluid mb10" >
		        <div class="autoGroup fl"> 
		      		<label class="control-label required" for="deviceNo">自动通风:</label>
		      		<div class="width-170px fl">
			      		<select id="autoModedew" class="form-control" style="width:172px;">  
				            <#list selectBooleanArr as v>
				            	<option 
				            		<#if dewBean.autoMode??>
					            		<#if dewBean.autoMode==v>
				                			selected="selected"
				               			</#if>
				            		</#if>
				            	isSel=${v}>${v}</option>  
				            </#list>
					    </select>
			      		<div class="cl"></div>
		      		</div>
		       </div>
			   <div class=" autoGroup fl "> 
			  		<label class="control-label  "  for="deviceFactory">通风开始条件判别:</label>
			  		<div class="width-170px fl">
			  			<select id="startVentDistinguishdew" class="form-control" style="width:172px;">  
				            <#list selectBooleanArr as w>
				            	<option 
				            		<#if dewBean.startVentDistinguish??>
					            		<#if dewBean.startVentDistinguish==w>
				                			selected="selected"
				               			</#if>
				            		</#if>
				            	isSel=${w}>${w}</option>  
				            </#list>
					    </select>
			  			<div class="cl"></div>
			  		</div>
			    </div>
	     	</div>
	     	<div class="container-fluid mb10" >
		        <div class="autoGroup fl"> 
		      		<label class="control-label required" for="targetTem">目标粮温:</label>
		      		<div class="width-170px fl">
			      		<input type="text" class=" form-control width-160px required" name="targetTem" id="targetTem" value="${dewBean.targetTem?default("")}"   placeholder="目标粮温"/>
			      		<div class="cl"></div>
		      		</div>
		       </div>
			   <div class=" autoGroup fl "> 
			  		<label class="control-label  "  for="temDiffer">粮温与大气的温差:</label>
			  		<div class="width-170px fl">
			  			<input type="text" class="form-control  width-160px" name="temDiffer" id="temDiffer" value="${dewBean.temDiffer?default("")}"  errorMsg="设备厂家不能为空"   placeholder="粮温与大气的温差"/>
			  			<div class="cl"></div>
			  		</div>
			    </div>
	     	</div>
	     	<div class="container-fluid mb10" >
		        <div class="autoGroup fl"> 
		      		<label class="control-label required" for="airInOutTemDiffer">粮温进出气温差:</label>
		      		<div class="width-170px fl">
			      		<input type="text" class=" form-control width-160px required" name="airInOutTemDiffer" id="airInOutTemDiffer" value="${dewBean.airInOutTemDiffer?default("")}"   placeholder="粮温进出气温差"/>
			      		<div class="cl"></div>
		      		</div>
		       </div>
			   <div class=" autoGroup fl "> 
			  		<label class="control-label  "  for="airInOutWetDiffer">粮温进出气水份差:</label>
			  		<div class="width-170px fl">
			  			<input type="text" class="form-control  width-160px" name="airInOutWetDiffer" id="airInOutWetDiffer" value="${dewBean.airInOutWetDiffer?default("")}"  errorMsg="设备厂家不能为空"   placeholder="粮温进出气水份差"/>
			  			<div class="cl"></div>
			  		</div>
			    </div>
	     	</div>
	     	<div class="container-fluid mb10" >
		        <div class="autoGroup fl"> 
		      		<label class="control-label required" for="deviceNo">空气相对湿度:</label>
		      		<div class="width-170px fl">
			      		<input type="text" class=" form-control width-160px required" name="airRelativeHum" id="airRelativeHum" value="${dewBean.airRelativeHum?default("")}"   placeholder="空气相对湿度"/>
			      		<div class="cl"></div>
		      		</div>
		       </div>
			   <div class=" autoGroup fl "> 
			  		<label class="control-label  "  for="windSpeed">风速:</label>
			  		<div class="width-170px fl">
			  			<input type="text" class="form-control  width-160px" name="windSpeed" id="windSpeed" value="${dewBean.windSpeed?default("")}"  errorMsg="设备厂家不能为空"   placeholder="风速"/>
			  			<div class="cl"></div>
			  		</div>
			    </div>
				<div class=" autoGroup fl "> 
				    <button type="button" class="btn btn-primary ml10 " tfType="dew"  
      					onclick="editBtnClick(this)">保存</button>
			    </div>
	     	</div>
	     	<input  type="text" name="beanId" value="${dewBean.id?default("")}" class="display-none" />
			<input  type="text" name="ventType" value="${dewBean.ventType?default("")}" class="display-none" />
	     	</form>
    	</div>
    </div>
    <div class="panel panel-default mt7 content">
    	<div class="panel-heading"><span class="fl clearfix">排积热通风</span> </div>
    	<div class=" panel-body">
    	<div class="container-fluid mb10" >
    		<form id="heading">
		        <div class="autoGroup fl"> 
		      		<label class="control-label required" for="deviceNo">自动通风:</label>
		      		<div class="width-170px fl">
			      		<select id="autoModeheading" class="form-control" style="width:172px;">  
				            <#list selectBooleanArr as v>
				            	<option 
				            		<#if headingBean.autoMode??>
					            		<#if headingBean.autoMode==v>
				                			selected="selected"
				               			</#if>
				            		</#if>
				            	isSel=${v}>${v}</option>  
				            </#list>
					    </select>
			      		<div class="cl"></div>
		      		</div>
		       </div>
			   <div class=" autoGroup fl "> 
			  		<label class="control-label  "  for="deviceFactory">通风开始条件判别:</label>
			  		<div class="width-170px fl">
			  			<select id="startVentDistinguishheading" class="form-control" style="width:172px;">  
				            <#list selectBooleanArr as w>
				            	<option 
				            		<#if headingBean.startVentDistinguish??>
					            		<#if headingBean.startVentDistinguish==w>
				                			selected="selected"
				               			</#if>
				            		</#if>
				            	isSel=${w}>${w}</option>  
				            </#list>
					    </select>
			  			<div class="cl"></div>
			  		</div>
			    </div>
	     	</div>
	     	<div class="container-fluid mb10" >
		        <div class="autoGroup fl"> 
		      		<label class="control-label required" for="deviceNo">空气相对湿度:</label>
		      		<div class="width-170px fl">
			      		<input type="text" class=" form-control width-160px required" name="airRelativeHum" id="airRelativeHum" value="${headingBean.airRelativeHum?default("")}"   placeholder="空气相对湿度"/>
			      		<div class="cl"></div>
		      		</div>
		       </div>
			   <div class=" autoGroup fl "> 
			  		<label class="control-label  "  for="windSpeed">风速:</label>
			  		<div class="width-170px fl">
			  			<input type="text" class="form-control  width-160px" name="windSpeed" id="windSpeed" value="${headingBean.windSpeed?default("")}"  errorMsg="设备厂家不能为空"   placeholder="风速"/>
			  			<div class="cl"></div>
			  		</div>
			    </div>
				<div class=" autoGroup fl "> 
				    <button type="button" class="btn btn-primary ml10 "   tfType="heading"  
      					onclick="editBtnClick(this)">保存</button>
			    </div>
	     	</div>
	     	<input  type="text" name="beanId" value="${headingBean.id?default("")}" class="display-none" />
			<input  type="text" name="ventType" value="${headingBean.ventType?default("")}" class="display-none" />
	     	</form>
    	</div>
    </div>    
    <div class="panel panel-default mt7 content">
    	<div class="panel-heading"><span class="fl clearfix">调质通风</span> </div>
    	<div class=" panel-body">
    		<form id="tempering">
    		<div class="container-fluid mb10" >
		        <div class="autoGroup fl"> 
		      		<label class="control-label required" for="deviceNo">自动通风:</label>
		      		<div class="width-170px fl">
			      		<select id="autoModetempering" class="form-control" style="width:172px;">  
				            <#list selectBooleanArr as v>
				            	<option 
				            		<#if temperingBean.autoMode??>
					            		<#if temperingBean.autoMode==v>
				                			selected="selected"
				               			</#if>
				            		</#if>
				            	isSel=${v}>${v}</option>  
				            </#list>
					    </select>
			      		<div class="cl"></div>
		      		</div>
		       </div>
			   <div class=" autoGroup fl "> 
			  		<label class="control-label  "  for="deviceFactory">通风开始条件判别:</label>
			  		<div class="width-170px fl">
			  			<select id="startVentDistinguishtempering" class="form-control" style="width:172px;">  
				            <#list selectBooleanArr as w>
				            	<option 
				            		<#if temperingBean.startVentDistinguish??>
					            		<#if temperingBean.startVentDistinguish==w>
				                			selected="selected"
				               			</#if>
				            		</#if>
				            	isSel=${w}>${w}</option>  
				            </#list>
					    </select>
			  			<div class="cl"></div>
			  		</div>
			    </div>
	     	</div> 
	     	<div class="container-fluid mb10" >
		        <div class="autoGroup fl"> 
		      		<label class="control-label required" for="deviceNo">空气相对湿度:</label>
		      		<div class="width-170px fl">
			      		<input type="text" class=" form-control width-160px required" name="airRelativeHum" id="airRelativeHum" value="${temperingBean.airRelativeHum?default("")}"   placeholder="空气相对湿度"/>
			      		<div class="cl"></div>
		      		</div>
		       </div>
			   <div class=" autoGroup fl "> 
			  		<label class="control-label  "  for="windSpeed">风速:</label>
			  		<div class="width-170px fl">
			  			<input type="text" class="form-control  width-160px" name="windSpeed" id="windSpeed" value="${temperingBean.windSpeed?default("")}"  errorMsg="设备厂家不能为空"   placeholder="风速"/>
			  			<div class="cl"></div>
			  		</div>
			    </div>
				<div class=" autoGroup fl "> 
				    <button type="button" class="btn btn-primary ml10 "   tfType="tempering" 
      					onclick="editBtnClick(this)">保存</button>
			    </div>
			</div>
			<input  type="text" name="beanId" value="${temperingBean.id?default("")}" class="display-none" />
			<input  type="text" name="ventType" value="${temperingBean.ventType?default("")}" class="display-none" />
	     	</form>
			<#if grainList?size gt 0>
		    	<#list grainList as ROW>
		        	<div  class="container-fluid mb10"  curDataId="${ROW.id}">
		        		<div class="autoGroup fl">
		            		<label class="control-label  fl">品种${ROW_index +1}:</label>
		       				<input  type="text"   class="form-control fl" value="${ROW.grainType?default("")}" placeholder="粮食品种" disabled="disabled"/>		
		           		</div>
		            	<div class="autoGroup fl">
		                 	<label class="control-label  fl">目标水份:</label>      
		       			 	<input  type="text"  id="${ROW.id}tempering" defaultValue="${ROW.defaultTargetWet*100?default("")}" class="form-control fl" value="${ROW.targetWet*100?default("")}" placeholder="目标水份" />	
		            	</div> 
		            	<div class="autoGroup fl">
		      				<button type="button" class="btn btn-primary ml10 "  grainId=${ROW.id} tfType="tempering"  operateType="edit"
		      				onclick="editGrainClick(this)">修改</button>
		            	</div>
		            	<div class="cl"></div>
		            </div> 
		      	</#list>
		    </#if>	
    	</div>
    </div>
</div>    
     
	<script type="text/javascript">
		$(document).ready(function(){
			$("#waterRetentiontem").change(function(){
				var tem =  $("#waterRetentiontem option:selected").attr("isSel");
				if(tem=="否"){
					$("#waterRetentionFactorCon").addClass("display-none")
				}else{
					$("#waterRetentionFactorCon").removeClass("display-none")
				}
			})
       }); 	
	
	function editBtnClick(btn){
		var tfType = $(btn).attr("tfType");
		var autoMode = $("#autoMode"+tfType).find('option:selected').attr("isSel");
		var startVentDistinguish = $("#startVentDistinguish"+tfType).find('option:selected').attr("isSel");
		var waterRetention = $("#waterRetention"+tfType).find('option:selected').attr("isSel");
		
		var dataInfo = $("#"+tfType).serialize();
		dataInfo  = dataInfo+"&autoMode="+autoMode+"&startVentDistinguish="+startVentDistinguish+"&waterRetention="+waterRetention;
		var url = '${BASE_PATH}'+"xtsz/saveTfMode.action";
		$.ajax({
            type: "POST",
            url: url,
            data : dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
        	},
        	success: function (response) {
        		alert("保存成功！");
        	}
    	})
	}
	
	function editGrainClick(btn){
		var grainId = $(btn).attr("grainId");
		var tfType = $(btn).attr("tfType");
		var operateType = $(btn).attr("operateType");
		var value = $("#"+grainId+tfType).val();
		var url = '${BASE_PATH}'+"xtsz/updateGrainInfo.action";
		var dataInfo = "operateType="+ operateType+"&tfType=" + tfType+"&beanId=" + grainId+"&wetValue="+value;
		$.ajax({
            type: "POST",
            url: url,
            data : dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
        	},
        	success: function (response) {
        		if(operateType=="reset"){
        			document.getElementById(grainId+tfType).value=$("#"+grainId+tfType).attr("defaultValue");
        		}
        		alert("保存成功！");
        	}
    	})
	}
		
	</script>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>