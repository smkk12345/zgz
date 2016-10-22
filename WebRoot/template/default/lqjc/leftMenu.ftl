<@override name="main_left">
<div title="点击切换仓房厫间">
    <button type="submit" id="aoJianDisplayBtn" class="btn btn-toolbar width-100- bold YL-ModalClick" data-url="${BASE_PATH}lqjc/aojianModal.action">
        ${disSelectName?default("无仓房信息")}
        <br>点击切换</button>
</div>
<ul class="menu-group">
    <li <#if CURENT_TAB_2 =='SSJC'>class="active"</#if>><a href="${BASE_PATH}lqjc/ssjc.action"><#if CURENT_TAB_2 =='SSJC'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>查看粮情</a></li>
    <#if role.roleAuthority[2]??>
    <#if role.roleAuthority[2]=="2">
    <li <#if CURENT_TAB_2 =='YTFX'>class="active"</#if>><a href="${BASE_PATH}lqjc/ytfx.action"><#if CURENT_TAB_2 =='YTFX'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>云图分析</a></li>
    </#if>
    </#if>
    <!--    
    <li <#if CURENT_TAB_2 =='LQYC'>class="active"</#if>><a href="${BASE_PATH}lqjc/lqyc.action"><#if CURENT_TAB_2 =='LQYC'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>粮情预测</a></li>
        <li <#if CURENT_TAB_2 =='LQPP'>class="active"</#if>><a href="${BASE_PATH}lqjc/lqyc.action"><#if CURENT_TAB_2 =='LQPP'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>粮情评判</a></li>
        -->
    <li <#if CURENT_TAB_2 =='LSXX'>class="active"</#if>><a href="${BASE_PATH}lqjc/lsxx.action"><#if CURENT_TAB_2 =='LSXX'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>粮食信息</a></li>
    <#if role.roleAuthority[19]??>
    <#if role.roleAuthority[19]=="2">
    <li <#if CURENT_TAB_2 =='BJLQ'>class="active"</#if>><a href="${BASE_PATH}lqjc/searchLq.action"><#if CURENT_TAB_2 =='BJLQ'><span class="yu-tu-fgsj-active"></span><#else><span class="yu-tu-fgsj-commen"></span></#if>编辑粮情</a></li>
    </#if>
    </#if>
</ul>
</@override>
