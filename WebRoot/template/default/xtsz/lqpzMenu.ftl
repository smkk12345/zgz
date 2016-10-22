<li <#if CURENT_TAB_3 =='CSSZ'>class="active"</#if> role="presentation" ><a href="${BASE_PATH}xtsz/cssz.action">告警阈值配置</a></li>
<li <#if CURENT_TAB_3 =='DSJCGL'>class="active"</#if> role="presentation"><a href="${BASE_PATH}xtsz/dsqsz.action">定时检测管理</a></li>
<li <#if CURENT_TAB_3 =='JCSBLB'>class="active"</#if> role="presentation"><a href="${BASE_PATH}xtsz/jcsblb.action">检测设备列表</a></li>
<li <#if CURENT_TAB_3 =='JCSBBZ'>class="active"</#if> role="presentation"><a href="${BASE_PATH}xtsz/jcsbbz.action">检测设备布置</a></li>
<#if CURENT_TAB_3 =='DSJCGL'>
	<#if role.roleAuthority[10]=="2">
         <li role="presentation" class="pull-right"><a class="fr YL-ModalClick btn btn-default" href="#" data-url="${BASE_PATH}xtsz/dsqszModal.action" title="点击添加"><span class="glyphicon glyphicon-plus blue"></span> 新 增</a></li>
	</#if>
<#elseif CURENT_TAB_3 =='JCSBBZ'>
	<#if role.roleAuthority[9]=="2">
           <li role="presentation" class="pull-right"><a class="fr YL-ModalClick btn btn-default" href="#" data-url="${BASE_PATH}xtsz/jcsbbzModal0.action" title="点击添加"><span class="glyphicon glyphicon-plus blue"></span> 新 增</a></li>
	</#if>
<#elseif CURENT_TAB_3 =='JCSBLB'>
	<#if role.roleAuthority[9]=="2">
           <li role="presentation" class="pull-right"><a class="fr YL-ModalClick btn btn-default" href="#" data-url="${BASE_PATH}xtsz/jbszModalCgq.action" title="点击添加"><span class="glyphicon glyphicon-plus blue"></span> 新 增</a></li>
	</#if>
</#if>
</li>