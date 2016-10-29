<@override name="main_left">
<ul class="menu-group">
	<#if role.roleAuthority[4]=="2">
	    <li <#if CURENT_TAB_2 =='jfdj'>class="active"</#if>><a href="${BASE_PATH}jfdj.action">
	    	<#if CURENT_TAB_2 =='jfdj'><span class="yu-tu-fgsj-active"></span>
	    	<#else><span class="yu-tu-fgsj-commen"></span>
	    	</#if>交房登记</a>
	    </li>
	</#if>
</ul>
</@override>
