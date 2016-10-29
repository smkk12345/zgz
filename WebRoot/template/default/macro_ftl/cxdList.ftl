
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

<!--协议基础数据列表-->
<#macro XyList items  pageNo pageSize>
<#if items?size gt 0>
<#list items as ROW>
<tr id="${ROW.id}">
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
        <button type="button" class="btn btn-info btn-xs ml10 YL-ModalClick glyphicon glyphicon-zoom-in" title='浏览' data-url="${BASE_PATH}pgzq/xy_add_Modal.action?housebasicid=${ROW.id}&agreenmentid=${(ROW.agreenment.id)!""}"> </button>
        <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick glyphicon glyphicon-pencil" title='编辑' data-url="${BASE_PATH}pgzq/xy_add_Modal.action?housebasicid=${ROW.id}&agreenmentid=${(ROW.agreenment.id)!""}"> </button>
        <button type="button" class="btn btn-danger btn-xs ml10 YL-ModalClick glyphicon glyphicon-print" title='打印' data-url="${BASE_PATH}pgzq/xy_print_Modal.action?housebasicid=${ROW.id}&agreenmentid=${(ROW.agreenment.id)!""}"> </button>
    </td>
</tr>
</#list>
</#if>
</#macro>

<!--顺序号获取-->
<#macro SxhList items  pageNo pageSize>
<#if items?size gt 0>
<#list items as ROW>
<tr id="${ROW.id}">
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
    <#if (ROW.indexNum)??>
	    <td >${ROW.indexNum.indexnum?default("")}</td>
	    <td >${ROW.indexNum.displaydate?default("")}</td>
	<#else>
		<td ></td>
	    <td ></td>
	</#if>
    <td>    
     <form id='rhjcAddForm' modelAttribute = "Agreement" action="${BASE_PATH}/indexnum/get.action?housebasicid=${ROW.id}"
          accept-charset="UTF-8" method="post">
        <button type="submit"    class="btn btn-info btn-xs ml10  glyphicon glyphicon-zoom-in <#if (ROW.indexNum)??>disabled='disabled'</#if>" title='获取顺序号' > </button>
      </form>
    </td>
</tr>
</#list>
</#if>
</#macro>