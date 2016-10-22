<#assign operateData=[["粮情检测",["查看粮情#lqjc/ssjc.action","云图分析#lqjc/ytfx.action","粮食信息#lqjc/lsxx.action"]],
				 ["信息管理",["告警查询#gjxx/lqgj.action","操作查询#gjxx/czcx.action"]],
				 ["系统管理",["基本设置#xtsz/jbsz.action","仓房设置#xtsz/cfsz.action","粮情配置#xtsz/cssz.action","用户管理#user/yhgl.action","个人设置#user/personDetail.action?oType=detail"]]]>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title">自定义快捷入口</h4>
</div>
<div class="modal-body">
    <ul class="aojian-modle clearfix " id="operate">
		<#list operateData as vo>
		<li >
		    <div class="btn-group" role="group">
		        <#list vo as voo>
		          <#if voo_index gt 0>
		            <#list voo as vooo > 
		            	<#if vooo == "操作查询#gjxx/czcx.action">
		            		<#if role.id!="3">
			            		<button type="button " class="btn 
				        		<#if user.fastCutUrls??&&(user.fastCutUrls?index_of(vooo?split("#")[1]) gt -1)>
				        			btn-success
				        		<#else>
				        			btn-default
				        		</#if>
				        		" fastCutUrl=${vooo}>${vooo?split("#")[0]}</button>
		            		</#if>
		            	<#else>
			        		<button type="button " class="btn 
			        		<#if user.fastCutUrls??&&(user.fastCutUrls?index_of(vooo?split("#")[1]) gt -1)>
			        			btn-success
			        		<#else>
			        			btn-default
			        		</#if>
			        		" fastCutUrl=${vooo}>${vooo?split("#")[0]}</button>
		            	</#if>
		            	
		            </#list>
		          </#if>
		        </#list>
		    </div>
		    <p>${vo[0]}</p>
		</li>
		</#list>
    </ul>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary" data-url="${BASE_PATH}user/updateUserFastCutInfo.action" onclick="updateUserFastCutInfo(this)">确认</button>
</div>
<script type="text/javascript">
    $(document).ready(function () {
    	$("#operate button").click(function () {
		    if($(this).hasClass('btn-success')){
        		$(this).removeClass().addClass("btn btn-default");
        	}
        	else{
        		$(this).removeClass().addClass("btn btn-success");
        	}
    	})
    })
</script>