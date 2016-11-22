<@override name="main_left">
<ul class="menu-group">

<#if role.roleAuthority[19]=="2">
    <li <#if CURENT_TAB_2 =='index'>class="active"</#if>><a href="${BASE_PATH}sjtj/index.action">
            <#if CURENT_TAB_2 =='index'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>实时数据展示</a>
    </li>
   </#if>
</ul>
</@override>
