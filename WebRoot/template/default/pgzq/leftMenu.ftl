<@override name="main_left">
<ul class="menu-group">
	<#if role.roleAuthority[4]=="2">
	    <li <#if CURENT_TAB_2 =='fgxy'>class="active"</#if>><a href="${BASE_PATH}pgzq/xy.action">
	    	<#if CURENT_TAB_2 =='fgxy'><span class="yu-tu-fgsj-active"></span>
	    	<#else><span class="yu-tu-fgsj-commen"></span>
	    	</#if>分户方案管理</a>
	    </li>
	</#if>
	<#if role.roleAuthority[5]=="2">
	    <li <#if CURENT_TAB_2 =='sxh'>class="active"</#if>><a href="${BASE_PATH}pgzq/sxh.action">
	    <#if CURENT_TAB_2 =='sxh'><span class="yu-tu-fgsj-active"></span>
	    <#else><span class="yu-tu-fgsj-commen">
	    </span></#if>协议签订管理</a></li>
    </#if>
</ul>
</@override>
