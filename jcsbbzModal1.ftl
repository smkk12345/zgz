<!--检测设备布置--模态窗体--新增检测设备布置-->
<div class="modal-header" id="arrangementDetailModal" dataId = "${bean.id}">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">检测设备布置</h4>
</div>
<div class="modal-body" > 
	<form id="arrangeForm1" action="" method="post">
	 	<div class="container-fluid mb10">
	    	<div class="  autoGroup fl">      
	        	<label class="fl control-label required">检测设备布置名称:</label>
	        	<div class="width-170px fl">
	      			<input type="text" class="form-control  required" id="arrangementName" name="arrangementName" value="${bean.arrangementName?default("")}"  placeholder="布置名称"/>        
	        		<div class='cl'></div>
	        	</div>
	        </div>        
	        <div class="  autoGroup fl"> 
				<label for="positionInfo" class="fl required">布置范围</label>
	      		<select id="positionSelector" name="positionInfo" class="form-control fl" style="width:175px;">
	         		<option <#if bean.positionInfo == "粮堆">selected='selected'</#if> >粮堆</option>
	         		<option <#if bean.positionInfo == "仓外">selected='selected'</#if> >仓外</option>
	         		<option <#if bean.positionInfo == "仓内">selected='selected'</#if> >仓内</option>
	            </select>
	        </div>
	    </div>
	    <div class="container-fluid mb10">
	    	<div class="autoGroup fl">
	      		<label class="fl control-label required">检测设备:</label>
	      		<select id="sensorSelector" class="form-control fl" name="sensorName" onchange="sensorChange(this)" style="width:175px;">
		      		<#if sensorBeanList?size gt 0>
		      			<#list sensorBeanList as sensorBean>
		      				<option name="sensorItem" dataId="${sensorBean.id}" sensorType="${sensorBean.sensorType}"
		      				<#if (bean.sensor)??>
								<#if sensorBean.id == bean.sensor.id>
									selected='selected'
								</#if>
							</#if>
		      				>${sensorBean.sensorName}</option>
		      			</#list>
		      		</#if>
			     </select>
	        </div>
	    	<div class="autoGroup fl clearfix"> 
	      		<label class="fl control-label">类型:</label>
                        <label class="fl" style="text-align: left;color: #777" id="sensorType"></label>
	       </div>
	    </div>
	    <div class="container-fluid mb10">
	    	<div class="  autoGroup fl">      
	        	<label class="fl control-label required">距离粮面高(m):</label>
	        	<div class="width-170px fl">
	      			<input type="text" class="form-control  required" id="distanceGrainHeight" name="distanceGrainHeight" value="${bean.distanceGrainHeight?default("0.5")}"  placeholder="距离粮面高度"/>        
	       			<div class='cl'></div>
	       		</div>
	        </div>  
	        <div class="  autoGroup fl">      
	        	<label class="fl control-label required">距离地面高(m):</label>
	        	<div class="width-170px fl">
	      			<input type="text" class="form-control required" id="distanceGroundHeight" name="distanceGroundHeight" value="${bean.distanceGroundHeight?default("0.5")}"  placeholder="距离地面高(m)"/>        
	       			<div class='cl'></div>
	       		</div>
	        </div>         
	    </div>
	    <div class="container-fluid mb10">
	    	<div class="  autoGroup fl">      
	        	<label class="fl control-label required">距离墙面距离(m):</label>
	  	        <div class="width-170px fl">
	      			<input type="text" class="form-control  required" id="wallDistance" name="wallDistance" value="${bean.wallDistance?default("0.5")}"  placeholder="距离墙面距离"/>        
	       			<div class='cl'></div>
	       		</div>
	        </div>  
	        <div class="  autoGroup fl">      
	        	<label class="fl control-label required">层数:</label>
	        	<div class="width-170px fl">
	      			<input type="text" class="form-control  required" id="layerCount" name="layerCount" value="${bean.layerCount?default("0.5")}"  placeholder="层数"/>        
	       			<div class='cl'></div>
	       		</div>
	        </div>         
	    </div>
	    <div class="container-fluid mb10">
	    	<div class="  autoGroup fl">      
	        	<#if bean.templateId == "1">
	        		<label class="fl control-label ">行数:</label>
	        		<label class="fl" style="text-align: left;color: #777" >${bean.rowCount?default("")}行</label>
	        		<input  type="text" id="rowCount" name="rowCount" value="${bean.rowCount?default("")}" class="display-none" />
	        	<#else>
	        		<label class="fl control-label required">行数:</label>
		        	<div class="width-170px fl">
		      			<input type="text" class="form-control  required" id="rowCount" name="rowCount" value="${bean.rowCount?default("0.5")}"  placeholder="行数"/>        
		       			<div class='cl'></div>
		       		</div>
	        	</#if>
	        </div>  
	        <div class="  autoGroup fl">      
	        	<#if bean.templateId == "1">
	        		<label class="fl control-label ">列数:</label>
	        		<label class="fl" style="text-align: left;color: #777" >${bean.columnCount?default(7)}列</label>
	        		<input  type="text" id="columnCount" name="columnCount" value="${bean.columnCount?default("")}" class="display-none" />
	        	<#else>
	        		<label class="fl control-label required">列数:</label>
		        	<div class="width-170px fl">
		      			<input type="text" class="form-control required " id="columnCount" name="columnCount" value="${bean.columnCount?default("0.5")}"  placeholder="列数"/>        
		       			<div class='cl'></div>
		       		</div>
	        	</#if>
	        </div>   
	    </div>
	    <div class="container-fluid mb10">
	    	<div class="  autoGroup fl">      
	        	<label class="fl control-label required">电缆编号排序:</label>
				<select id="typeSelector" class="form-control fl"  style="width:175px;">
		      		<option <#if bean.cableDirection == "按行排序">selected='selected'</#if> >按行排序</option>
		      		<option <#if bean.cableDirection == "按列排序">selected='selected'</#if> >按列排序</option>
			     </select>
	        </div>
	        <div class="  autoGroup fl">      
	        	<label class="fl control-label required">同缆线探头排序:</label>
				<select id="typeSelector" class="form-control fl"  style="width:175px;" name="pointDirection">
		      		<option value="从下往上" <#if bean.pointDirection == "从下往上">selected='selected'</#if> >从下往上</option>
		      		<option value="从上往下" <#if bean.pointDirection == "从上往下">selected='selected'</#if> >从上往下</option>
			    </select>
	        </div>
	    </div>
	    <div class="container-fluid mb10">
	    	<div class="autoGroup fl">      
	        	<label class="fl control-label required">缆线起始点位置:</label>
				<select id="typeSelector" class="form-control fl"  style="width:175px;" name="startCablePos">
		      		<option <#if bean.startCablePos == "东南">selected='selected'</#if> >东南</option>
		      		<option <#if bean.startCablePos == "东北">selected='selected'</#if> >东北</option>
		      		<option <#if bean.startCablePos == "西北">selected='selected'</#if> >西北</option>
		      		<option <#if bean.startCablePos == "西南">selected='selected'</#if> >西南</option>
			     </select>
	        </div>
	    </div>
	    <input  type="text" id="sensorArrangementId" name="sensorArrangementId" value="${bean.id?default("")}" class="display-none" />
	    <input  type="text" id="templateId" name="templateId" value="${bean.templateId?default("")}" class="display-none" />
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default"  data-url="${BASE_PATH}xtsz/jcsbbzModal0.action" onclick="backStepClick(this)">上一步</button>
    <button type="button" class="btn btn-default"  data-url="${BASE_PATH}/xtsz/saveStep1.action" id="send">下一步</button>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>
<script type="text/javascript">  
	$(document).ready(function(){
		document.getElementById('sensorType').innerHTML = $("#sensorSelector option:selected").attr("sensorType");
		$("#sensorSelector").change(function(){
			var val =  $("#sensorSelector option:selected").attr("sensorType");
			document.getElementById('sensorType').innerHTML=""+val;
		})
   }); 
</script>