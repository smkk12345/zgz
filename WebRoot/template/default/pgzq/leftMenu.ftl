<@override name="main_left">
<ul class="menu-group">
    <li <#if CURENT_TAB_2 =='fgxy'>class="active"</#if>><a href="${BASE_PATH}fgxy.action">
    	<#if CURENT_TAB_2 =='fgxy'><span class="yu-tu-fgsj-active"></span>
    	<#else><span class="yu-tu-fgsj-commen"></span>
    	</#if>房改协议</a>
    	</li>
    <li <#if CURENT_TAB_2 =='bcxy'>class="active"</#if>><a href="${BASE_PATH}bcxy.action">
    <#if CURENT_TAB_2 =='bcxy'><span class="yu-tu-fgsj-active"></span>
    <#else><span class="yu-tu-fgsj-commen">
    </span></#if>补偿协议</a></li>
    
</ul>
</@override>
