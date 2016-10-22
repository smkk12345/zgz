<!--系统设置--基本设置--传感器信息列表-->
<#macro SensorList items>	
<#if items?size gt 0>
<#list items as ROW>
<tr class="table_ModalDbClick" id="${ROW.id}" alarmType="${ROW.alarmType}" data-url="${BASE_PATH}xtsz/csszModalGjfz.action?alarmId=${ROW.id}">
    <td>${ROW.sensorName?default("")}</td>
    <td>${ROW.sensorType?default("")}</td>
    <td>${ROW.serialNum?default("")}</td>
    <td>${ROW.sensorFactory?default("")}</td>
    <td>
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" data-url="${BASE_PATH}xtsz/jbszModalCgq.action?sensorId=${ROW.id}"">编辑</button>
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="popUpModel(this)" data-url="${BASE_PATH}xtsz/confirmDeleteModel.action?deleteUrl=${BASE_PATH}xtsz/sensorDel.action?curDataId=${ROW.id}" pname="${ROW.id}">删除</button>
    </td>
</tr>
</#list>
</#if>
</#macro>
<!--系统设置--基本设置--粮食信息列表-->
<#macro GrainList items>	
<#if items?size gt 0>
<#list items as ROW>
<div  id="${ROW.id}" curDataId="${ROW.id}">
    <div class="form-group fl">
        <label class="control-label  fl">品种${ROW_index +1}:</label>
        <input  type="text"   class="form-control fl" value="${ROW.grainType?default("")}" placeholder="粮食品种" disabled="disabled"/>		
    </div>
    <div class="form-group fl">
        <label class="control-label  fl">备注:</label>      
        <input  type="text"   class="form-control fl" value="${ROW.remarks?default("")}" placeholder="备注" disabled="disabled"/>	
    </div> 
    <#if ROW.defaultGrain == "0">
    <div class="form-group fl">
        <button type="button" class="btn btn-primary ml10 "  data-url="${BASE_PATH}xtsz/grainTypeModal.action?grainTypeId=${ROW.id}"
                onclick="editBtnClick(this)">修改</button>
        <button type="button"  data-url="${BASE_PATH}xtsz/delGrain.action?grainTypeId=${ROW.id}" onclick="delBtnClick(this)"
                class="btn btn-primary ml10">删除</button>
    </div>
    </#if>
    <div class="cl"></div>
</div> 
</#list>
</#if>
</#macro>
<!--系统设置--参数设置--温度阈值-->
<#macro AlarmList items>
<#if items?size gt 0>
<#list items as ROW>
<tr class="table_ModalDbClick" id="${ROW.id}" alarmType="${ROW.alarmType}" data-url="${BASE_PATH}xtsz/csszModalGjfz.action?alarmId=${ROW.id}">
    <td>${ROW.startDateStr?default("")}</td>
    <td>${ROW.endDateStr?default("")}</td>
    <td>${ROW.averageAttri?default("")}</td>
    <td>${ROW.maxAttri?default("")}</td>
    <td>${ROW.horAttri?default("")}</td>
    <td>${ROW.verAttri?default("")}</td>
    <td>${ROW.gtAverageAttri?default("")}</td>
    <td>
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" data-url="${BASE_PATH}xtsz/csszModalGjfz.action?alarmId=${ROW.id}">编辑</button>
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="delBtnClick(this)" data-url="${BASE_PATH}xtsz/alarmDel.action" pname="${ROW.id}">删除</button>
    </td>
</tr>
</#list>
</#if>
</#macro>

<!--用户管理--用户管理--用户列表-->
<#macro UserList items roleList>
<#if items?size gt 0>
<#list items as ROW>
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
    <td>${ROW.email?default("")}</td>
    <td>${ROW.tel?default("")}</td>
    <td>${ROW.memo?default("")}</td>
    <#if role.roleAuthority[12]=="2">
    <td style="text-align: left">
        
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" data-url="${BASE_PATH}user/yhglModal.action?userId=${ROW.id}">编辑</button>
        <#if ROW.id!="1" && ROW.id!=user.id>
        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="delBtnClick(this)" data-url="${BASE_PATH}user/userDel.action" pname="${ROW.id}">删除</button>
        </#if>
    </td>
    </#if>
</tr>
</#list>
</#if>
</#macro>

<#macro BarnList items>
<#if items?size gt 0>
<#list items as ROW>
<div class="aojian-${ROW.aoJianCount} aojian-commen " id="${ROW.id}">
    <div class="top">
        <div class="top-left">
        </div>
        <div class="top-middle">
        </div>
        <div class="top-right">
        </div>
    </div>
    <div class="middle">
        <#if ROW.aoJianSet?exists>
        <#list ROW.aoJianSet as aoJian>

        <#list ROW.aoJianSet as aoJian1>			
        <#if userList??>
        <#list userList as u>
        <#if u.right_Content??>
        <#if u.right_Content?index_of(aoJian1.zyAoJianNum) != -1>
        <#assign storeKeeper=u.displayName>
        </#if>
        </#if>
        </#list>
        </#if>
        </#list> 
        <div class="middle-left ao-commen">
            <div class="storeKeeper">
                <#if storeKeeper??&&storeKeeper!=""><i class="rgb">${storeKeeper}</i><#else><i class="red">无保管员</i></#if> <#assign storeKeeper="">
            </div>
            <div class="title1">${aoJian.aoJianIndex?default("")}</div>
            <#if aoJian.grainStatus=="0"><div class="emptyBarn">空仓</div></#if>
        </div>

        </#list>
        </#if>
        <div class="middle-right"></div>
    </div>
    <div class="bottom-info">
        <#if role.id=="3"||role.id=="2"||role.id=="5">
        <div class="btn-group" role="group" aria-label="...">
            <#list ROW.aoJianSet as aoJian>		
            <div class="btn-group btn-group-xs btn-group-aojian" role="group">
                <button type="button" class="btn btn-primary dropdown-toggle btn-group-xs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                        <#if (user.right_Content?index_of(aoJian.zyAoJianNum)!=-1||user.right_Content=='all')>
                        <#else>                
                        disabled="disabled" 
                        </#if>
                        >操 作<span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="javascript:"  base-url="${BASE_PATH}xtsz/singleAoJianModel.action?aoJianId=${aoJian.zyAoJianNum}" onclick="editBarn(this)">编辑厫间</a></li>
                    <#if aoJian.grainStatus??>
                    <#if aoJian.grainStatus == '0'>
                    <li><a href="javascript:" onclick="aoJianEditClick(this, 'import')" data-url="${BASE_PATH}xtsz/singleAoJianModel.action?aoJianId=${aoJian.zyAoJianNum}">进粮</a></li>
                    <#else>
                    <li><a href="javascript:" onclick="aoJianEditClick(this, 'export')" data-url="${BASE_PATH}xtsz/exportDateSelectModel.action?aoJianId=${aoJian.zyAoJianNum}">出粮</a></li>
                    </#if>
                    </#if>
                </ul>
            </div>
            </#list>
        </div>
        </#if>
        <#if role.id="2"||role.id=="5">
        <div class="btn-group btn-group-xs btn-group-cang" role="group">
            <button type="button" class="btn btn-primary dropdown-toggle btn-group-xs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">高级权限<span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="javascript:" base-url="${BASE_PATH}xtsz/editAoJianModal.action?barnId=${ROW.id}" onclick="editBarn(this)">批量编辑</a></li>
                <#if role.roleAuthority[7]=="2">
                <li><a href="javascript:" data-url="${BASE_PATH}xtsz/confirmDeleteModel.action?deleteUrl=${BASE_PATH}xtsz/delBarnList.action?beanId=${ROW.id}" onclick="popUpModel(this)">删除仓房</a></li>
                </#if>
            </ul>
        </div>
        </#if>
        <div class="title2">${ROW.barnIndex?default("")}仓</div>
        <p class="red">
            <#assign str="">
            <#assign nonIndexNum=0>
            <#list ROW.aoJianSet as aoJian0>
            <#if aoJian0.sensorArrangementbeanId??>
            <#else>
            <#if aoJian0.aoJianIndex??>
            <#assign str=str+" "+aoJian0.aoJianIndex>
            <#else>
            <#assign nonIndexNum=nonIndexNum+1>
            </#if>
            </#if>
            </#list>	
            <#if nonIndexNum gt 0>
            ${nonIndexNum}个廒间信息不完整<a href="javascript:" base-url="${BASE_PATH}xtsz/editAoJianModal.action?barnId=${ROW.id}" onclick="editBarn(this)">立即完善</a><br>
            </#if>
            <#if str!="">
            ${str}廒间传感器布置方式为空 <a href="${BASE_PATH}xtsz/jcsbbz.action">立即添加</a><br>
            </#if>
        </p>
    </div>
</div>
</#list>
</#if>
</#macro>
<!--首页权限下所有仓房-->
<#macro OwnerBarnList items>
<#if items?size gt 0>
<#list items as ROW>
<div class="aojian-${ROW.aoJianCount} aojian-commen " >
    <div class="top">
        <div class="top-left">
        </div>
        <div class="top-middle">
        </div>
        <div class="top-right"></div>
    </div>
    <div class="middle">
        <#if ROW.aoJianSet?exists>
        <#list ROW.aoJianSet as aoJian>	

        <#list ROW.aoJianSet as aoJian1>			
        <#if userList??>
        <#list userList as u>
        <#if u.right_Content??>
        <#if u.right_Content?index_of(aoJian1.zyAoJianNum) != -1>
        <#assign storeKeeper=u.displayName>
        </#if>
        </#if>
        </#list>
        </#if>
        </#list>    
        <#if alarmCountMap['${aoJian.id}'] gt 0>
        <a class="warning-info" title='点击查看告警信息' href="
           <#if aoJian.sensorArrangementbeanId??&&(user.right_Content?index_of(aoJian.zyAoJianNum)!=-1||user.right_Content=='all')>
           ${BASE_PATH}gjxx/lqgj3.action?doSearch=do&aoJianId=${aoJian.zyAoJianNum}&status=0&userId=&alarmType=&startDate=&endDate=
           <#else>
           javascript:alert('您没有该廒间的管理权限！')
           </#if>
           ">${alarmCountMap["${aoJian.id}"]?c}</a>
        </#if>
        <a href="
           <#if aoJian.sensorArrangementbeanId??&&(user.right_Content?index_of(aoJian.zyAoJianNum)!=-1||user.right_Content=='all')>
           ${BASE_PATH}lqjc/ssjc.action?aoJianId=${aoJian.zyAoJianNum}
           <#else>
           javascript:alert('您没有该廒间的管理权限！或该厫间设置信息不完善！')
           </#if>
           " title="<#if aoJian.aoJianIndex??>${aoJian.aoJianIndex?default("0")}/${ROW.barnIndex}<#else>空编号</#if>/保管员:<#if storeKeeper??>${storeKeeper}<#else>无保管员</#if>/粮情员:${lqyDisplayName}">
           <div class="middle-left <#if alarmCountMap['${aoJian.id}'] gt 0> ao-warning  <#else> ao-commen</#if>">
                <div class="storeKeeper">
                    <#if storeKeeper??&&storeKeeper!=""><i class="rgb">${storeKeeper}</i><#else><i class="red">无保管员</i></#if> <#assign storeKeeper="">
                </div>
                <div class="title">
                    <#if aoJian.aoJianIndex??>${aoJian.aoJianIndex}<#else>未设置</#if>
                </div>
                <#if aoJian.grainStatus=="0"><div class="emptyBarn">空仓</div></#if>
            </div> 
        </a>
        </#list>
        </#if>
        <div class="middle-right"></div>
    </div>
    <div class="bottom-info">
        <div class="title2">${ROW.barnIndex?default("")}仓</div>
        <#if user.right_Content??&&user.right_Content !="">
        <#if aoJian.sensorArrangementbeanId??&&(user.right_Content?index_of(aoJian.zyAoJianNum)!=-1||user.right_Content=='all')>
        <div class="btn-group" role="group" aria-label="...">
            <#list ROW.aoJianSet as aoJian1>			
            <div class="btn-group btn-group-xs btn-group-aojian" role="group">
                <button type="button" class="btn btn-primary dropdown-toggle btn-group-xs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                        <#if (user.right_Content?index_of(aoJian1.zyAoJianNum)!=-1||user.right_Content=='all')>
                        <#else>                
                        disabled="disabled" 
                        </#if>
                        >
                        <#if (aoJian1.aoJianGrainInfoBean.storeType)??>${aoJian1.aoJianGrainInfoBean.storeType}<#else>空仓</#if><span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#"  data-url="${BASE_PATH}xtsz/confirmOperateModel.action?deleteUrl=${BASE_PATH}xtsz/updateStoreType.action?beanId=${aoJian1.zyAoJianNum}@1" onclick="popUpModel(this)">常温储粮</a></li>
                    <li><a href="#" data-url="${BASE_PATH}xtsz/confirmOperateModel.action?deleteUrl=${BASE_PATH}xtsz/updateStoreType.action?beanId=${aoJian1.zyAoJianNum}@2" onclick="popUpModel(this)">低温储粮</a></li>
                    <li><a href="#" data-url="${BASE_PATH}xtsz/confirmOperateModel.action?deleteUrl=${BASE_PATH}xtsz/updateStoreType.action?beanId=${aoJian1.zyAoJianNum}@3" onclick="popUpModel(this)">准低温储粮</a></li>
                </ul>
            </div>
            </#list>
        </div>
        <!--        <div class="btn-group" role="group">
                    <button type="button" class="btn-primary btn-xs"  onclick="" title="点击修改储粮模式">常</button>
                    <button type="button" class="btn-primary btn-xs"  onclick="" title="点击修改储粮模式">低</button>
                    <button type="button" class="btn-primary btn-xs"  onclick="" title="点击修改储粮模式">准低</button>
                </div>-->
        </#if>
        </#if>
    </div>
</div>
</#list>
</#if>
</#macro>
<!--用户管理--用户管理--用户组列表-->
<#macro RoleList items>
<#if items?size gt 0>
<#list items as ROW>
<tr class="table_ModalDbClick active" id="${ROW.id}"  data-url="${BASE_PATH}user/roleModal.action?roleId=${ROW.id}">
    <td>${ROW.roleName?default("")}</td>
    <td>${ROW.section?default("")}
    </td>
    <td>${ROW.remarks?default("")}</td>
    <td style="text-align: left">
        <#if role.roleAuthority[12]=="2">
	        <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" data-url="${BASE_PATH}user/roleAuthorityModal.action?roleId=${ROW.id}">权限配置</button>
	       	    <button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" data-url="${BASE_PATH}user/roleModal.action?roleId=${ROW.id}">编辑</button>
	        	<button type="button" class="btn btn-primary btn-xs ml10"  onClick="delBtnClick(this)" data-url="${BASE_PATH}user/roleDel.action" pname="${ROW.id}">删除</button>
        </#if>
    </td>
</tr>
</#list>
</#if>
</#macro>
<!--系统设置--仓房布置--检测设备布置-->
<#macro SensorArrangementList items>
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
</#macro>


