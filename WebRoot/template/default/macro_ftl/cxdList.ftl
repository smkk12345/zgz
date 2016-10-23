
<!--基础数据-->
<#macro HousebasicList items  pageNo pageSize>
<#if items?size gt 0>
<#list items as ROW>
<tr id="${ROW.id}"  data-url="${BASE_PATH}user/yhglModal.action?userId=${ROW.id}">
    <td >${ROW_index+1+pageNo*pageSize}</td>
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
        <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick glyphicon glyphicon-pencil" title='编辑' data-url="${BASE_PATH}edithousebasic.action?housebasicid=${ROW.id}"> </button>
        <button type="button" class="btn btn-warning btn-xs ml10 glyphicon glyphicon-remove-circle" title='删除' onClick='delBtnClick(this)' data-url="${BASE_PATH}pgqq/del.action" pname="${ROW.id}"> </button>
    </td>
</tr>
</#list>
</#if>
</#macro>
