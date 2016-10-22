<#assign AoDate=[["1",["1"]],["2",["1","2"]],["3",["1","2","3"]],["4",["1","2","3","4"]],["5",["1","2","3"]],["6",["1","2","3"]]]>
<#list barnList as vo>
<li  title="${vo.barnIndex}号仓房" aria-label="${vo.barnIndex}">
    <div class="btn-group" role="group">
        <#list vo.aoJianSet as voo>
        <button type="button" class="btn <#if aoJian.zyAoJianNum==voo.zyAoJianNum>btn-success<#else>btn-default</#if>"  
        dataId=${voo.zyAoJianNum} barnIndex=${vo.barnIndex} aria-label="${voo.aoJianIndex?default("")}">${voo.aoJianIndex?default("")}#厫间</button>
        </#list>
    </div>
    <p>${vo.barnIndex}号仓房</p>
</li>
</#list>