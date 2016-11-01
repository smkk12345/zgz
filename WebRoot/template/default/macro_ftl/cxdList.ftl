
<!--基础数据-->
<#macro HousebasicList items  pageNo pageSize>
<#if items?size gt 0>
<#list items as ROW>
<tr id="${ROW.id}"  data-url="${BASE_PATH}user/yhglModal.action?userId=${ROW.id}">
    <td >${ROW_index+1+(pageNo-1)*pageSize}</td>
    <td >${role.section?default("")}</td>
    <td >${ROW.names?default("")}</td>
    <td >${ROW.idcard?default("")}</td>
    <td >${ROW.location?default("")}</td>
    <td >${ROW.housecount?default("")}</td>
    <td >${ROW.people?default("")}</td>
    <td >${ROW.zjdarea?default("")}</td>
    <td >${ROW.fwarea?default("")}</td>
    <td >${ROW.mobile?default("")}</td>
    <td>    
        <button type="button" class="btn btn-info btn-xs ml10 YL-ModalClick glyphicon glyphicon-zoom-in" title='浏览' data-url="${BASE_PATH}edithousebasic.action?housebasicid=${ROW.id}"> </button>
        <#if role.roleAuthority[12]=="2">
        <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick glyphicon glyphicon-edit" title='编辑' data-url="${BASE_PATH}edithousebasic.action?housebasicid=${ROW.id}"> </button>
        <button type="button" class="btn btn-warning btn-xs ml10 glyphicon glyphicon-remove-circle" title='删除' onClick='delBtnClick(this)' data-url="${BASE_PATH}pgqq/del.action" pname="${ROW.id}"> </button>
        </#if>
    </td>
</tr>
</#list>
</#if>
</#macro>

<!--分户方案数据列表-->
<#macro XyList items  pageNo pageSize>
<#if items?size gt 0>
<#list items as ROW>
<tr id="${ROW.id}">
    <td >${ROW_index+1+(pageNo-1)*pageSize}</td>
    <td >${role.section?default("")}</td>
    <td >${ROW.names?default("")}</td>
    <td > 
        <#if (ROW.agreenment.atype)??>
        <#if ROW.agreenment.atype?default("0")=="0">
        安置补偿
        <#else>
        货币补偿
        </#if>
        <#else>
        未录入
        </#if>
    </td>
    <td >${(ROW.agreenment.fwbcmj)!""}</td>
    <td >${(ROW.agreenment.rdbazrk)!""}</td>
    <td >${(ROW.agreenment.azfgfk)!""}</td>
    <td >${(ROW.agreenment.jlfsum)!""}</td>
    <td>    
        <button type="button" class="btn btn-info btn-xs ml10 YL-ModalClick glyphicon glyphicon-zoom-in" title='浏览' data-url="${BASE_PATH}pgzq/fhfa_edit_Modal.action?housebasicid=${ROW.id}&agreenmentid=${(ROW.agreenment.id)!""}"> </button>    
        <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick glyphicon glyphicon-pencil" title='编辑修改' data-url="${BASE_PATH}pgzq/fhfa_edit_Modal.action?housebasicid=${ROW.id}&agreenmentid=${(ROW.agreenment.id)!""}"> </button>     
    </td>
</tr>
</#list>
</#if>
</#macro>

<!--分户协议列表-->
<#macro FhxyList items  pageNo pageSize>
<#if items?size gt 0>
<#list items as ROW>
<tr id="${ROW.id}">
    <td >${ROW_index+1+(pageNo-1)*pageSize}</td>
    <td >${role.section?default("")}</td>
    <td >${ROW.names?default("")}</td>
    <td > 
        <#if (ROW.agreenment.atype)??>
        <#if ROW.agreenment.atype?default("0")=="0">
        安置补偿
        <#else>
        货币补偿
        </#if>
        <#else>
        未录入
        </#if>
    </td>
    <td >${(ROW.agreenment.fwbcmj)!""}</td>
    <td >${(ROW.agreenment.rdbazrk)!""}</td>
    <td >${(ROW.agreenment.azfgfk)!""}</td>
    <td >${(ROW.agreenment.jlfsum)!""}</td>
    <td>   
        <button type="button" class="btn btn-danger btn-xs ml10 YL-ModalClick bold" title='打印金额审查表' data-url="${BASE_PATH}pgzq/fhxy_az_je_print_Modal.action?housebasicid=${ROW.id}&agreenmentid=${(ROW.agreenment.id)!""}"><span class="glyphicon glyphicon-print">金额审查</span></button>
        <button type="button" class="btn btn-danger btn-xs ml10 YL-ModalClick bold" title='打印协议' data-url="${BASE_PATH}pgzq/fhxy_az_xy_print_Modal.action?housebasicid=${ROW.id}&agreenmentid=${(ROW.agreenment.id)!""}"><span class="glyphicon glyphicon-print">协议</span></button>
    </td>
    <td>  
    	<#if (ROW.agreenment.protocolnumber)??>
    		${ROW.indexNum.displaydate}
    	<#else>
       		<button type="button" class="btn btn-success btn-xs ml10  bold" title='签约状态' onclick="confirmSign(this)" data-url="${BASE_PATH}indexnum/get.action?housebasicid=${ROW.id}&agreenmentid=${(ROW.agreenment.id)!""}">确认签约</button>
    	</#if>
    </td>
    <td title="请点击左侧确认签约，获取协议编号">${(ROW.agreenment.protocolnumber)!""}</td>
</tr>
</#list>
</#if>
</#macro>


<!--签约排号管理-->
<#macro SxhList items  pageNo pageSize>
<#if items?size gt 0>
<#list items as ROW>
<tr id="${ROW.id}">
    <td >${ROW_index+1+(pageNo-1)*pageSize}</td>
    <td >${role.section?default("")}</td>
    <td >${ROW.names?default("")}</td>
    <td >${ROW.idcard?default("")}</td>
    <td >${ROW.protocolnumber?default("")}</td>
    <td >${ROW.indexnum?default("")}</td>
    <td >${ROW.displaydate?default("")}</td>
    <td>    
        <form id='rhjcAddForm' modelAttribute = "Agreement" action="${BASE_PATH}/indexnum/get.action?housebasicid=${ROW.housebasicid}"
              accept-charset="UTF-8" method="post">
            <button type="submit"    class="btn btn-info btn-xs ml10  glyphicon glyphicon-print <#if (ROW.indexNum)??>disabled='disabled'</#if>" title='打印选房顺序通知单' > </button>
        </form>
    </td>
</tr>
</#list>
</#if>
</#macro>