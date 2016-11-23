<@override name="main_left">
<ul class="menu-group">
 <#if role.roleAuthority[21]=="2">
	<li <#if CURENT_TAB_2 =='bd1'>class="active"</#if>><a href="${BASE_PATH}dzdt/bd1.action"><#if CURENT_TAB_2 =='bd1'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>第一标段</a></li>
 </#if>
 <#if role.roleAuthority[22]=="2">
	<li <#if CURENT_TAB_2 =='bd2'>class="active"</#if>><a href="${BASE_PATH}dzdt/bd2.action"><#if CURENT_TAB_2 =='bd2'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>第二标段</a></li>
</#if>
 <#if role.roleAuthority[23]=="2">
	<li <#if CURENT_TAB_2 =='bd3'>class="active"</#if>><a href="${BASE_PATH}dzdt/bd3.action"><#if CURENT_TAB_2 =='bd3'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>第三标段</a></li>
</#if>
 <#if role.roleAuthority[24]=="2">
	<li <#if CURENT_TAB_2 =='bd4'>class="active"</#if>><a href="${BASE_PATH}dzdt/bd4.action"><#if CURENT_TAB_2 =='bd4'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>第四标段</a></li>
 </#if>
 <#if role.roleAuthority[25]=="2">
	<li <#if CURENT_TAB_2 =='bd5'>class="active"</#if>><a href="${BASE_PATH}dzdt/bd5.action"><#if CURENT_TAB_2 =='bd5'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>第五标段</a></li>
</#if>
 <#if role.roleAuthority[26]=="2">
	<li <#if CURENT_TAB_2 =='bd6'>class="active"</#if>><a href="${BASE_PATH}dzdt/bd6.action"><#if CURENT_TAB_2 =='bd6'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>第六标段</a></li>
 </#if>
  <#if role.roleAuthority[27]=="2">
        <li <#if CURENT_TAB_2 =='bd7'>class="active"</#if>><a href="${BASE_PATH}dzdt/bd7.action"><#if CURENT_TAB_2 =='bd7'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>第七标段</a></li>
	</#if>
</ul>
</@override>
