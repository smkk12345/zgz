<@override name="main_left">
<ul class="menu-group">
 <#if role.roleAuthority[29]=="2">  
    <li <#if CURENT_TAB_2 =='gbdqytj'>class="active"</#if>><a href="${BASE_PATH}sjfx/gbdqytj.action">
            <#if CURENT_TAB_2 =='gbdqytj'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>各标段签约情况统计</a>
    </li>
    </#if>
    
    <li <#if CURENT_TAB_2 =='yqykxtj'>class="active"</#if>><a href="${BASE_PATH}sjfx/yqykxtj.action">
            <#if CURENT_TAB_2 =='yqykxtj'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>已签约款项统计</a>
    </li>
    
     <!--<#if role.roleAuthority[30]=="2">  
    <li <#if CURENT_TAB_2 =='gbdjftj'>class="active"</#if>><a href="${BASE_PATH}sjfx/gbdjftj.action">
            <#if CURENT_TAB_2 =='gbdjftj'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>各标段交房情况统计</a>
    </li>
      </#if>-->
  <!--  <li <#if CURENT_TAB_2 =='bcxytz'>class="active"</#if>><a href="${BASE_PATH}sjfx/bcxytz.action">
            <#if CURENT_TAB_2 =='bcxytz'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>补偿协议台账</a>
    </li>-->
    
    <#if role.roleAuthority[31]=="2">  
    <li <#if CURENT_TAB_2 =='qysxhtz'>class="active"</#if>><a href="${BASE_PATH}sjfx/qysxhtz.action">
            <#if CURENT_TAB_2 =='qysxhtz'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>签约顺序号台账</a>
    </li>
    </#if>
      
          
    <!--<#if role.roleAuthority[31]=="2">  
    <li <#if CURENT_TAB_2 =='shtz'>class="active"</#if>><a href="${BASE_PATH}sjfx/shtz.action">
            <#if CURENT_TAB_2 =='shtz'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>审核台账</a>
    </li>
    </#if>-->
    <li <#if CURENT_TAB_2 =='export'>class="active"</#if>><a href="${BASE_PATH}sjfx/export.action">
            <#if CURENT_TAB_2 =='export'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>数据导出</a>
    </li>
    
   <!-- <li <#if CURENT_TAB_2 =='gbdttjetj'>class="active"</#if>><a href="${BASE_PATH}sjfx/gbdttjetj.action">
            <#if CURENT_TAB_2 =='gbdttjetj'><span class="yu-tu-fgsj-active"></span>
            <#else><span class="yu-tu-fgsj-commen">
            </span></#if>腾退补偿总款统计</a>
    </li>-->
</ul>
</@override>
