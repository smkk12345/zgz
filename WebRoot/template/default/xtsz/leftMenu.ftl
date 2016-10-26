<@override name="main_left">
<ul class="menu-group">

    <li <#if CURENT_TAB_2 =='JBSZ'>class="active"</#if>>
        <a href="${BASE_PATH}xtsz/jbsz.action"><#if CURENT_TAB_2 =='JBSZ'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>基本设置</a>
    </li>
    
    <#if role.roleAuthority[6]=="2">
	    <li <#if CURENT_TAB_2 =='YHGL'>class="active"</#if>>
	        <a href="${BASE_PATH}user/yhgl.action">
	        <#if CURENT_TAB_2 =='YHGL'>
	        	<span class="yu-tu-fgsj-active"></span>
	        <#else>	
	        	<span class="yu-tu-fgsj-commen"></span>
	        </#if>用户管理</a>
	    </li>
	</#if>
	
    <li <#if CURENT_TAB_2 =='GRSZ'>class="active"</#if>>
        <a href="${BASE_PATH}user/personDetail.action?oType=detail"><#if CURENT_TAB_2 =='GRSZ'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>个人设置</a>
    </li>
</ul>
</@override>