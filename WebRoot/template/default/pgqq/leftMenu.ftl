<@override name="main_left">
<ul class="menu-group">
	
	  <#if role.roleAuthority[1]=="2">
    	<li <#if CURENT_TAB_2 =='rhjc'>class="active"</#if>><a href="${BASE_PATH}pgqq/rhjc.action"><#if CURENT_TAB_2 =='rhjc'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>入户信息管理</a></li>
      </#if>
      <#if role.roleAuthority[2]=="2">
    	<li <#if CURENT_TAB_2 =='rhjc_c'>class="active"</#if>><a href="${BASE_PATH}pgqq/rhjc_c.action"><#if CURENT_TAB_2 =='rhjc_c'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>入户信息查看</a></li>
 	  </#if>
 	  <#if role.roleAuthority[2]=="2">
    	<li <#if CURENT_TAB_2 =='rhjc_s'>class="active"</#if>><a href="${BASE_PATH}pgqq/rhjc_s.action"><#if CURENT_TAB_2 =='rhjc_s'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>入户信息审计审核</a></li>
 	  </#if>
</ul>
</@override>
