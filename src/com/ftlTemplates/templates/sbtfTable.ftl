<tr class="info">
    <th style="width:50px">序号</th>
    <th style="width:50px">设备编号</th>
    <th style="width:75px">设备名称</th>
    <th style="width:75px">设备位置</th>
    <th style="width:75px">控制器编号</th>
    <th style="width:200px">操作</th>
</tr>
<#if baseDevices?size gt 0>
	<#list baseDevices as device>
        <tr class="active" id=${device.id}>
            <td style="width:50px">${device_index?number+1}</td>
            <td style="width: 30px">${device.deviceNo}</td>
            <td style="width:75px">${device.deviceName}</td>
            <td style="width:75px">${device.posInfo}</td>
            <td style="width:75px">${device.controllerNum}</td>
            <td style="width:75px">
            	<button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" tfType=${device.deviceName} tfId=${device.id} aoJianId = ${bean.zyAoJianNum}>编辑</button>
				<button type="button" class="btn btn-primary btn-xs ml10"  onClick="delBtnClick(this)" data-url="${BASE_PATH}xtsz/deleteDevice.action?curDataId=${device.id}" tfId=${device.id} tfType=${device.deviceName}>删除</button>
			</td>
        </tr>
	</#list>
</#if>