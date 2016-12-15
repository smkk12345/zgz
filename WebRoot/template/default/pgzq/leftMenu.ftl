<@override name="main_left">
<ul class="menu-group">
 
    <li <#if CURENT_TAB_2 =='fhfa'>class="active"</#if>><a href="${BASE_PATH}pgzq/fhfa.action">
            <#if CURENT_TAB_2 =='fhfa'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen"></span>
            </#if>分户方案管理</a>
    </li>


    <#if role.roleAuthority[7]=="2">
    <li <#if CURENT_TAB_2 =='fhxy'>class="active"</#if>><a href="${BASE_PATH}pgzq/fhxy.action">
            <#if CURENT_TAB_2 =='fhxy'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>协议签订管理</a></li>
    </#if>
    <#if role.roleAuthority[8]=="2">
    <#--<li <#if CURENT_TAB_2 =='sxh'>class="active"</#if>><a href="${BASE_PATH}pgzq/sxh.action">-->
            <#--<#if CURENT_TAB_2 =='sxh'><span class="yu-tu-fgsj-active"></span>-->
            <#--<#else><span class="yu-tu-fgsj-commen">-->
            <#--</span></#if>选房排号管理</a></li>-->
    </#if>
    <#if role.roleAuthority[14]=="2">
    <li <#if CURENT_TAB_2 =='fhfa_s'>class="active"</#if>><a href="${BASE_PATH}pgzq/fhfa_s.action">
            <#if CURENT_TAB_2 =='fhfa_s'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>方案审核审计</a></li>
    </#if>
    <#if role.id=="2">
    <#if role.roleAuthority[52]=="2">
    <li <#if CURENT_TAB_2 =='sdjs'>class="active"</#if>><a href="${BASE_PATH}pgzq/sdjs.action">
            <#if CURENT_TAB_2 =='sdjs'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>锁定/解锁</a></li>
    </#if>
    </#if>
</ul>
</@override>
