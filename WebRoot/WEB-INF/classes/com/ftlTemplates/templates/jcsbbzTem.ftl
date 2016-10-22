<#if items?size gt 0>
<#list items as ROW>
<#if ROW.defaultType== "1">
<tr class="table_ModalDbClick active" id="${ROW.id}"  data-url="${BASE_PATH}user/sensorArrangementModal.action?sensorArrangementId=${ROW.id}">
    <td>${ROW_index + 1}</td>
    <td>${ROW.arrangementName?default("")}</td>
    <td>${ROW.sensor.sensorType?default("")}</td>
    <td>${ROW.sensor.sensorName?default("")}</td>
     <td>
        <#list items  as vo>
        <#if vo.id == ROW.templateId>
          ${vo.arrangementName?default("")}
        </#if>
        </#list>
    </td>
    <td>
        <#if role.roleAuthority[9]=="2">
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" data-url="${BASE_PATH}xtsz/aoJianSelectedModal.action?sensorArrangementId=${ROW.id}">布置范围</button>
        <#if ROW.defaultType == "1">
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" data-url="${BASE_PATH}xtsz/jcsbbzModal1.action?sensorArrangementId=${ROW.id?default("")}">编辑</button>
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="popUpModel(this)" data-url="${BASE_PATH}xtsz/confirmDeleteModel.action?deleteUrl=${BASE_PATH}xtsz/delSensorArrangement.action?sensorArrangementId=${ROW.id}">删除</button>
        </#if>
        </#if>
    </td>
</tr>
</#if>
</#list>
</#if>