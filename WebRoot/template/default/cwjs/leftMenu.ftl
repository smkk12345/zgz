<@override name="main_left">
<ul class="menu-group">
    <li <#if CURENT_TAB_2 =='CWJS_01'>
        class="active"
        </#if>>
        <a href="${BASE_PATH}cwjs/cwjs.action">
            <#if CURENT_TAB_2 =='CWJS_01'>
            <span class="yu-tu-fgsj-active"></span>
            <#else>
            <span class="yu-tu-fgsj-commen"></span>
            </#if>
          	财务结算
        </a>
    </li>
    
        <li <#if CURENT_TAB_2 =='bcklq'>
        class="active"
        </#if>>
        <a href="${BASE_PATH}bcklq/bcklq_0.action">
            <#if CURENT_TAB_2 =='cwjs'>
            <span class="yu-tu-fgsj-active"></span>
            <#else>
            <span class="yu-tu-fgsj-commen"></span>
            </#if>
          	补偿款领取
        </a>
    </li>
</ul>
</@override>