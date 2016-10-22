<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title">选择仓房厫间</h4>
</div>
<div class="modal-body">
    <ul class="aojian-modle clearfix " id="aojian">
       <#list barnList as vo>
			<li  title="${vo.barnIndex}号仓房" aria-label="${vo.barnIndex}">
			    <div class="btn-group btn-group-xm" role="group">
			        <#list vo.aoJianSet as voo>
			        <#if type=='arrangementPage'>
				        <button type="button" class="btn 
				        	<#if (voo.sensorArrangementbeanId?default("#"))?index_of(bean.id) gt -1>
				        		btn-success
				        	<#elseif (voo.sensorArrangementbeanId?default("#")) !="#">
		        				btn-warning
				        	<#else>
				        		btn-default
				        	</#if>"  
				       	 dataId=${voo.zyAoJianNum} barnIndex=${vo.barnIndex} aria-label="${voo.aoJianIndex?default("")}">${voo.aoJianIndex?default("")}#厫间
				        </button>
				    <#elseif type=='userPage'>
				    	<button type="button" class="btn 
		        		<#if (bean.right_Content?default("#"))?index_of(voo.zyAoJianNum) gt -1>
		        			btn-success
		        		<#elseif ((bean.rightLevel == "3") &&(ids?default("#"))?index_of(voo.zyAoJianNum) gt -1)>
		        			btn-warning
		        		<#else>
		        			btn-default
		        		</#if>"  
		        		dataId=${voo.zyAoJianNum} barnIndex=${vo.barnIndex} aria-label="${voo.aoJianIndex?default("")}">${voo.aoJianIndex?default("")}#厫间
		        		</button>
		        	<#elseif type=='tfsbAoJianSelect'>
				    	<button type="button" class="btn 
		        		<#if (bean.zyAoJianNum?default("#"))?index_of(voo.zyAoJianNum) gt -1>
		        			btn-success
		        		<#else>
		        			btn-default
		        		</#if>"  
		        		dataId=${voo.zyAoJianNum} barnIndex=${vo.barnIndex} aria-label="${voo.aoJianIndex?default("")}">${voo.aoJianIndex?default("")}#厫间
		        		</button>
		        	<#else>
				    	<button type="button" class="btn 
		        		<#if (bean.aoJianIds??)&&(bean.aoJianIds?index_of(voo.zyAoJianNum) gt -1)>
		        			btn-success
		        		<#elseif ids?index_of(voo.zyAoJianNum) gt -1>
		        			btn-warning
		        		<#else>
		        			btn-default
		        		</#if>"  
		        		dataId=${voo.zyAoJianNum}  aria-label="${voo.aoJianIndex?default("")}">${voo.aoJianIndex?default("")}#厫间
		        		</button>		        	
		        	</#if>
			        </#list>
			    </div>
			    <p>${vo.barnIndex}号仓房</p>
			</li>
		</#list>
    </ul>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary " 
    <#if type=='arrangementPage'>
   		data-url="${BASE_PATH}/xtsz/updateAoJianArrangement.action?arrangementId=${bean.id}" onclick="updateAoJianArrangement(this)">确认</button>
    <#elseif type=='userPage'>
    	data-url="${BASE_PATH}/user/updateUserInfo.action?userId=${bean.id}" onclick="updateUserInfo(this)">确认</button>
    <#elseif type=='tfsbAoJianSelect'>
    	data-url="${BASE_PATH}xtsz/getAoJianTfsb.action" onclick="selectAoJianChange(this)">确认</button>
    <#else>
    	data-url="${BASE_PATH}/xtsz/updateTimerAoJianInfo.action?taskId=${bean.id}" onclick="updateTimerInfo(this)">确认</button>
    </#if>
</div>
<script type="text/javascript">
	//modal  barnList
    $(document).ready(function () {

        /*Auth:lxb,2015.7.17
         * 选择厫间 
         */
        $("#aojian button").click(function () {
        	var type = '${type}';
        	if(type == "arrangementPage"){
	        	if($(this).hasClass('btn-success')){
	        		$(this).removeClass().addClass("btn btn-default");
	        	}
	        	else if($(this).hasClass('btn-warning')){
					alert("该廒间已经有布置信息，请先清除该该布置信息");
	        	}
	        	else{
	        		$(this).removeClass().addClass("btn btn-success");
	        	}
        	}else if(type=="userPage"){
        		var roleId = '${bean.rightLevel}';
        		if(roleId == "3"){
	        		if($(this).hasClass('btn-success')){
	        			$(this).removeClass().addClass("btn btn-default");
	        		}
	            	else if($(this).hasClass('btn-warning')){
						alert("该廒间已经分配库管员，请删除后再分配新的库管员");
		        	}
		        	else {
		        		$(this).removeClass().addClass("btn btn-success");
		        	}
        		}else{
	        		if($(this).hasClass('btn-success')){
		        		$(this).removeClass().addClass("btn btn-default");
		        	}
		        	else{
		        		$(this).removeClass().addClass("btn btn-success");
		        	}
        		}
        	}else if(type=="tfsbAoJianSelect"){
        	
	        	$("#aojian .btn-success").each(function () {
	                $(this).removeClass().addClass("btn btn-default");
	            });
	            $(this).removeClass().addClass("btn btn-success");
        	}
        	else{
        		if($(this).hasClass('btn-success')){
	        		$(this).removeClass().addClass("btn btn-default");
	        	}
	        	else if($(this).hasClass('btn-warning')){
					alert("该廒间已经分配定时方案，请删除后再分配新的定时方案");
	        	}
	        	else{
	        		$(this).removeClass().addClass("btn btn-success");
	        	}
        	}
        
        });
    });
    
</script>