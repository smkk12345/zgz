
<!--基础数据-->
<#macro HousebasicList items>
<#if items?size gt 0>
<#list items as ROW>
<tr class="table_ModalDbClick active" id="${ROW.id}"  data-url="${BASE_PATH}user/yhglModal.action?userId=${ROW.id}">
    <td  >${ROW.names?default("")}<br></td>
    <td  >${role.section?default("")}</td>
    <td  >${ROW.telephone?default("")}</td>
    <td  >${ROW.idcard?default("")}</td>
    <td  >${ROW.location?default("")}</td>
    <#if role.roleAuthority[12]=="2">
    <td style="text-align: left">    
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" data-url="${BASE_PATH}user/yhglModal.action?userId=${ROW.id}">编辑</button>
        <#if ROW.id!="1" && ROW.id!=user.id>
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="delBtnClick(this)" data-url="${BASE_PATH}pgqq/del.action" pname="${ROW.id}">删除</button>
        </#if>
    </td>
    </#if>
</tr>
</#list>
</#if>
</#macro>
