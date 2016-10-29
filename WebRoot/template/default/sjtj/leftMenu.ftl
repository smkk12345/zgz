<@override name="main_left">
<ul class="menu-group">
	<#if role.roleAuthority[4]=="2">
	    <li <#if CURENT_TAB_2 =='sjtj'>class="active"</#if>><a href="${BASE_PATH}sjtj_1.action">
	    	<#if CURENT_TAB_2 =='sjtj'><span class="yu-tu-fgsj-active"></span>
	    	<#else><span class="yu-tu-fgsj-commen"></span>
	    	</#if>数据统计</a>
	    </li>
	</#if>
	<#if role.roleAuthority[4]=="2">
	    <li <#if CURENT_TAB_2 =='sjtj'>class="active"</#if>><a href="${BASE_PATH}sjtj_1.action">
	    	<#if CURENT_TAB_2 =='sjtj'><span class="yu-tu-fgsj-active"></span>
	    	<#else><span class="yu-tu-fgsj-commen"></span>
	    	</#if>排序号公示</a>
	    </li>
	</#if>
</ul>
</@override>
