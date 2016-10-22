<#if userList?size gt 0>
<#list userList as ROW>
<tr class="table_ModalDbClick active" id="${ROW.id}"  data-url="${BASE_PATH}user/yhglModal.action?userId=${ROW.id}">
    <td>${ROW.userName?default("")}</td>
    <td>${ROW.displayName?default("")}</td>
    <td>
        <#list roleList as role1>
        <#if role1.id==ROW.rightLevel>
        ${role1.roleName}
        </#if>
        </#list>
    </td>
    <td>
        <#if ROW.right_Content??>
        <#if ROW.right_Content == 'all'>
        全部仓房
        <#else>
        ${ROW.dispalyContent?default("")}
        </#if>
        </#if>
    </td>
    <td>${ROW.email?default("")}</td>
    <td>${ROW.tel?default("")}</td>
    <td>${ROW.memo?default("")}</td>
    <#if role.roleAuthority[12]=="2">
    <td style="text-align: left">

        <#if ROW.right_Content??>
	        <#if ROW.right_Content == 'all'>
	        <#else>
	        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" data-url="${BASE_PATH}/user/aoJianSelectedModal.action?userId=${ROW.id}">管辖仓房</button>
	        </#if>
        <#else>
        	<button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" data-url="${BASE_PATH}/user/aoJianSelectedModal.action?userId=${ROW.id}">管辖仓房</button>
        </#if>

        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" data-url="${BASE_PATH}user/yhglModal.action?userId=${ROW.id}">编辑</button>
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="delBtnClick(this)" data-url="${BASE_PATH}user/userDel.action" pname="${ROW.id}">删除</button>
    </td>
    </#if>
</tr>
</#list>
</#if>