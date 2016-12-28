<@override name="main_left">
<ul class="menu-group">

<#if role.roleAuthority[19]=="2">
    <li <#if CURENT_TAB_2 =='index'>class="active"</#if>><a href="${BASE_PATH}sjtj/lists.action">
            <#if CURENT_TAB_2 =='index'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>实时数据展示</a>
    </li>
   </#if>
   
    <li <#if CURENT_TAB_2 =='touch'>class="active"</#if>><a href="${BASE_PATH}sjtj/touch.action" target="_blank">
            <#if CURENT_TAB_2 =='touch'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>触摸屏展示</a>
    </li>

</ul>
</@override>
