<@override name="main_left">
<ul class="menu-group">
    <li <#if CURENT_TAB_2 =='GJCX'>
        class="active"
        </#if>>
        <a href="${BASE_PATH}gjxx/lqgj.action">
            <#if CURENT_TAB_2 =='GJCX'>
            <span class="yu-tu-fgsj-active"></span>
            <#else>
            <span class="yu-tu-fgsj-commen"></span>
            </#if>
            告警查询
        </a>
    </li>
    <#if role.roleAuthority[18]=="2">
    <li <#if CURENT_TAB_2 =='CZCX'>class="active"</#if>>
        <a href="${BASE_PATH}gjxx/czcx.action">
            <#if CURENT_TAB_2 =='CZCX'>
            <span class="yu-tu-fgsj-active"></span>
            <#else>
            <span class="yu-tu-fgsj-commen"></span>
            </#if>操作查询
        </a>
    </li>
    </#if>
</ul>
</@override>