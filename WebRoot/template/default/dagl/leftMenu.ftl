<@override name="main_left">
<ul class="menu-group">
 <#if role.roleAuthority[21]=="2">
	<li <#if CURENT_TAB_2 =='dagl'>class="active"</#if>>
	<a href="${BASE_PATH}dagl/list.action">
	<#if CURENT_TAB_2 =='dagl'><span class="yu-tu-fgsj-active"></span><#else>
	<span class="yu-tu-fgsj-commen"></span></#if>档案管理</a></li>
 </#if>
 
 <!-- <#if role.roleAuthority[21]=="2">
	<li <#if CURENT_TAB_2 =='dagl_c'>class="active"</#if>>
	<a href="${BASE_PATH}dagl/dagl_c.action">
	<#if CURENT_TAB_2 =='dagl_c'><span class="yu-tu-fgsj-active"></span><#else>
	<span class="yu-tu-fgsj-commen"></span></#if>档案查看</a></li>
 </#if>-->
</ul>
</@override>
