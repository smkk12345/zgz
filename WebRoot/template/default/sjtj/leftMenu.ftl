<@override name="main_left">
<ul class="menu-group">
	<#if role.roleAuthority[4]=="2">
	    <li <#if CURENT_TAB_2 =='sjtj'>class="active"</#if>><a href="${BASE_PATH}sjtj.action">
	    	<#if CURENT_TAB_2 =='sjtj'><span class="yu-tu-fgsj-active"></span>
	    	<#else><span class="yu-tu-fgsj-commen"></span>
	    	</#if>基本数据</a>
	    </li>
	</#if>
	<#if role.roleAuthority[4]=="2">
	    <li <#if CURENT_TAB_2 =='xfpx'>class="active"</#if>><a href="${BASE_PATH}xfpx.action">
	    	<#if CURENT_TAB_2 =='xfpx'><span class="yu-tu-fgsj-active"></span>
	    	<#else><span class="yu-tu-fgsj-commen"></span>
	    	</#if>选房排序号公示</a>
	    </li>
	</#if>
</ul>
</@override>
