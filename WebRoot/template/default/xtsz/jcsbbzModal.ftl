<!--检测设备布置--模态窗体--新增检测设备布置-->
<div class="modal-header" id="arrangementDetailModal" dataId = "${bean.id}">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">检测设备布置</h4>
</div>
<div class="modal-body" > 
	<form id="sensorArrangementForm" action="" method="post">
	 	<div class="container-fluid mb10">
	    	<div class="  autoGroup fl">      
	        	<label class="fl control-label">检测设备布置名称:</label>
	      		<input type="text" class="form-control  " id="arrangementNameInput" value="${bean.arrangementName?default("")}"  placeholder="布置名称"/>        
	        </div>        
	        <div class="  autoGroup fl"> 
				<label for="name" class="fl">布置范围</label>
	      		<select id="positionSelector" name="positionInfo" class="form-control fl" style="width:175px;">
	         		<option>粮堆</option>
	         		<option>仓外</option>
	         		<option>仓内</option>
	            </select>
	        </div>
	    </div>
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
	      		<label class="fl control-label">类型:${bean.horAttri?default("")}</label>
	       </div>
	    </div>
	    <div class="container-fluid mb10">
	    	<div class="  autoGroup fl">      
	        	<label class="fl control-label">距离粮面高(m):</label>
	      		<input type="text" class="form-control  " id="" value="${bean.arrangementName?default("0.5")}"  placeholder="距离两面高度"/>        
	        </div>  
	        <div class="  autoGroup fl">      
	        	<label class="fl control-label">距离地面高(m):</label>
	      		<input type="text" class="form-control  " id="" value="${bean.arrangementName?default("0.5")}"  placeholder="距离地面高(m)"/>        
	        </div>         
	    </div>
	    <div class="container-fluid mb10">
	    	<div class="  autoGroup fl">      
	        	<label class="fl control-label">距离墙面距离(m):</label>
	      		<input type="text" class="form-control  " id="" value="${bean.arrangementName?default("0.5")}"  placeholder="距离墙面距离"/>        
	        </div>  
	        <div class="  autoGroup fl">      
	        	<label class="fl control-label">层数:</label>
	      		<input type="text" class="form-control  " id="" value="${bean.arrangementName?default("0.5")}"  placeholder="层数"/>        
	        </div>         
	    </div>
	    <div class="container-fluid mb10">
	    	<div class="  autoGroup fl">      
	        	<label class="fl control-label">行数:</label>
	      		<input type="text" class="form-control  " id="" value="${bean.arrangementName?default("0.5")}"  placeholder="行数"/>        
	        </div>  
	        <div class="  autoGroup fl">      
	        	<label class="fl control-label">列数:</label>
	      		<input type="text" class="form-control  " id="" value="${bean.arrangementName?default("0.5")}"  placeholder="列数"/>        
	        </div>   
	        <button type="button" class="btn btn-default" data-dismiss="modal">保存</button>      
	    </div>
	    <input  type="text" id="sensorArrangementId" name="sensorArrangementId" value="${bean.id?default("")}" class="display-none" />
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
<script type="text/javascript">  
</script>