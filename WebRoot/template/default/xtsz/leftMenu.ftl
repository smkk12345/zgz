<@override name="main_left">
<ul class="menu-group">
    <li <#if CURENT_TAB_2 =='JBSZ'>class="active"</#if>>
        <a href="${BASE_PATH}xtsz/jbsz.action"><#if CURENT_TAB_2 =='JBSZ'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>基本设置</a>
    </li>
    <li <#if CURENT_TAB_2 =='CFSZ'>class="active"</#if>>
        <a href="${BASE_PATH}xtsz/cfsz.action"><#if CURENT_TAB_2 =='CFSZ'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>仓房设置</a>
    </li>	
    <li <#if CURENT_TAB_2 =='LQPZ'>class="active"</#if>>
        <a href="${BASE_PATH}xtsz/cssz.action"><#if CURENT_TAB_2 =='LQPZ'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>粮情配置</a>
    </li>
    <li <#if CURENT_TAB_2 =='YHGL'>class="active"</#if>>
        <a href="${BASE_PATH}user/yhgl.action"><#if CURENT_TAB_2 =='YHGL'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>用户管理</a>
    </li>
    <#if hasVentilate> 
    <li <#if CURENT_TAB_2 =='ZNTF'>class="active"</#if>>
        <a href="${BASE_PATH}xtsz/tfsb.action"><#if CURENT_TAB_2 =='ZNTF'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>通风配置</a>
    </li>
    </#if>
    <li <#if CURENT_TAB_2 =='GRSZ'>class="active"</#if>>
        <a href="${BASE_PATH}user/personDetail.action?oType=detail"><#if CURENT_TAB_2 =='GRSZ'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>个人设置</a>
    </li>
</ul>
</@override>