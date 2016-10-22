<tr class="info">
	<th style="width:50px">序号</th>
    <th style="width:50px">操作类型</th>
    <th style="width:75px">操作人</th>
    <th style="width:200px">操作内容</th>
    <th style="width:75px">操作时间</th>
</tr>
<#if operateRecordList?size gt 0>
	<#list operateRecordList as operateBean>
        <tr class="active">
        	<td style="width:50px">${operateBean_index+1}</td>
            <td style="width:50px">${operateBean.operateType?default("")}</td>
            <td style="width:75px">
            <#if userList?size gt 0>
            	<#list userList as user>
            		<#if user.id == operateBean.operateUserId>
            			${user.displayName}
            			<#break>
            		</#if>
            	</#list>
            </#if>
			</td>
            <td style="width:200px">${operateBean.operateInfo?default("")}</td>
            <td style="width:75px">${operateBean.operateTime?datetime?default("")}</td>
        </tr>
	</#list>
</#if>