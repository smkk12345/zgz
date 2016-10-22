
<#if barnList?size gt 0>
<#list barnList as ROW>
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
                    <#if storeKeeper??><i class="rgb">${storeKeeper}</i><#else><i class="red">无保管员</i></#if>
                </div>
                <div class="title1">${aoJian.aoJianIndex?default("")}</div>
                <#if aoJian.grainStatus=="0"><div class="emptyBarn">空仓</div></#if>
            </div> 
        </#list>
        </#if>
        <div class="middle-right"></div>
    </div>
    <div class="bottom-info">
        <div class="btn-group" role="group" aria-label="...">
            <#list ROW.aoJianSet as aoJian>		
            <div class="btn-group btn-group-xs btn-group-aojian" role="group">
                <button type="button" class="btn btn-primary dropdown-toggle btn-group-xs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">操 作<span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">编辑厫间</a></li>
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