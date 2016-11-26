<!--基础数据-->
<#macro HousebasicList items  pageNo pageSize>
    <#if items?size gt 0>
        <#list items as ROW>
        <tr id="${ROW.id}" data-url="${BASE_PATH}user/yhglModal.action?userId=${ROW.id}">
            <td>${ROW.sectionindex}</td>
            <td>${ROW.section?default("")}</td>
            <td>${ROW.names?default("")}</td>
            <td>${ROW.idcard?default("")}</td>
            <td>${ROW.location?default("")}</td>
            <td>${ROW.people?default("")}</td>
            <td>${ROW.zjdarea?default("")}</td>
            <td>${ROW.fwarea?default("")}</td>
            <td>${ROW.mobile?default("")}</td>
            <td>
                <#if role.roleAuthority[3]=="2">
                    <#if (ROW.checkresult)??>
                        <#if ROW.checkresult=="1">
                            已锁定
                        <#else>
                            <button type="button"
                                    class="btn btn-success btn-xs ml10 YL-ModalClick glyphicon glyphicon-edit"
                                    title='编辑'
                                    data-url="${BASE_PATH}edithousebasic.action?housebasicid=${ROW.id}"></button>
                            <button type="button" class="btn btn-warning btn-xs ml10 glyphicon glyphicon-remove-circle"
                                    title='删除' onClick='delBtnClick(this)' data-url="${BASE_PATH}pgqq/del.action"
                                    pname="${ROW.id}"></button>
                        </#if>
                    <#else>
                        <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick glyphicon glyphicon-edit"
                                title='编辑' data-url="${BASE_PATH}edithousebasic.action?housebasicid=${ROW.id}"></button>
                        <button type="button" class="btn btn-warning btn-xs ml10 glyphicon glyphicon-remove-circle"
                                title='删除' onClick='delBtnClick(this)' data-url="${BASE_PATH}pgqq/del.action"
                                pname="${ROW.id}"></button>
                    </#if>
                </#if>
            </td>
            
          <!--    <td>  <#if role.roleAuthority[3]=="2">
                    <#if ROW.hassplit?default("0")=="0">
                        <#if (ROW.checkresult)??>
                            <#if ROW.checkresult=="1">
                                已锁定
                            <#else>
                                <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick  " title='分户'
                                        data-url="${BASE_PATH}edithousebasic.action?housebasicid=${ROW.id}&issplit=1">
                                    分户
                                </button>
                            </#if>
                        <#else>
                            <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick  " title='分户'
                                    data-url="${BASE_PATH}edithousebasic.action?housebasicid=${ROW.id}&issplit=1"> 分户
                            </button>
                        </#if>
                    </#if>
                </#if></td>
                -->
            
        </tr>
        </#list>
    </#if>
</#macro>

<!--基础数据查看-->
<#macro HousebasicList_c items  pageNo pageSize>
    <#if items?size gt 0>
        <#list items as ROW>
        <tr id="${ROW.id}" data-url="${BASE_PATH}user/yhglModal.action?userId=${ROW.id}">
            <!--<td >${ROW_index+1+(pageNo-1)*pageSize}</td>-->
            <td>${ROW.sectionindex}</td>
            <td>${ROW.section?default("")}</td>
            <td>${ROW.names?default("")}</td>
            <td>${ROW.idcard?default("")}</td>
            <td>${ROW.location?default("")}</td>
            <td>${ROW.housecount?default("")}</td>
            <td>${ROW.people?default("")}</td>
            <td>${ROW.zjdarea?default("")}</td>
            <td>${ROW.fwarea?default("")}</td>
            <td>${ROW.mobile?default("")}</td>
            <td>
                <button type="button" class="btn btn-info btn-xs ml10 YL-ModalClick glyphicon glyphicon-zoom-in"
                        title='浏览' data-url="${BASE_PATH}pgqq/rhjc_c_Modal.action?housebasicid=${ROW.id}"></button>
                <button type="button" class="btn btn-info btn-xs ml10 YL-ModalClick glyphicon glyphicon-print"
                        title='打印' data-url="${BASE_PATH}pgqq/rhjc_print.action?housebasicid=${ROW.id}"></button>
            </td>
        </tr>
        </#list>
    </#if>
</#macro>

<!--基础数据审计审查-->
<#macro HousebasicList_s items  pageNo pageSize>
    <#if items?size gt 0>
        <#list items as ROW>
        <tr id="${ROW.id}" data-url="${BASE_PATH}user/yhglModal.action?userId=${ROW.id}">
            <td>${ROW_index+1+(pageNo-1)*pageSize}</td>
            <td>${ROW.section?default("")}</td>
            <td>${ROW.names?default("")}</td>
            <td>${ROW.idcard?default("")}</td>
            <td>${ROW.location?default("")}</td>
            <td>${ROW.housecount?default("")}</td>
            <td>${ROW.people?default("")}</td>
            <td>${ROW.zjdarea?default("")}</td>
            <td>${ROW.fwarea?default("")}</td>
            <td>${ROW.mobile?default("")}</td>
            <td>
                <#if (ROW.checkresult?default("-1"))=='0'>未通过<#elseif (ROW.checkresult?default("-1"))=='1'>通过</#if>
            </td>
            <td>
                <#if (ROW.checkresult)??>
                    <#if ROW.checkresult=="0">
                        <button type="button" class="btn btn-warning btn-xs ml10 YL-ModalClick " title='重新审查'
                                data-url="${BASE_PATH}checkhousebasic.action?housebasicid=${ROW.id}"> 重新审查
                        </button>
                    <#else>
                        <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick" title='重新审查'
                                data-url="${BASE_PATH}checkhousebasic.action?housebasicid=${ROW.id}"> 重新审查
                        </button>
                    </#if>
                <#else>
                    <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick" title='审查'
                            data-url="${BASE_PATH}checkhousebasic.action?housebasicid=${ROW.id}"> 审查
                    </button>
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
            <td>${ROW.sectionindex}</td>
            <td>${ROW.section?default("")}</td>
            <td>${ROW.names?default("")}</td>
            <td>
                <#if (ROW.atype)??>
                    <#if ROW.atype?default("0")=="0">
                        房屋安置
                    <#else>
                        货币补偿
                    </#if>
                <#else>
                    未录入
                </#if>
            </td>
            <td>${ROW.fwbcmj?default("")}</td>
            <td>${ROW.rdbazrk?default("")}</td>
            <td>${ROW.zjdttzj?default("")}</td>
            <td>${ROW.azfgfk?default("")}</td>
            <td>${ROW.jshk?default("")}</td>
            <td>
                <#if role.roleAuthority[7]=="2">
                    <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick glyphicon glyphicon-pencil"
                            title='编辑修改'
                            data-url="${BASE_PATH}pgzq/fhfa_edit_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}"></button>
                </#if>
                <#if role.roleAuthority[8]=="2">
                    <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick glyphicon glyphicon-zoom-in"
                            title='数据查看'
                            data-url="${BASE_PATH}pgzq/fhfa_c_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}"></button>
                </#if>
            </td>
        </tr>
        </#list>
    </#if>
</#macro>

<!--财务结算——01-->
<#macro cwjs_01 items  pageNo pageSize>
    <#if items?size gt 0>
        <#list items as ROW>
        <tr id="${ROW.id}">
            <td>${ROW.sectionindex}</td>
            <td>${ROW.section?default("")}</td>
            <td>${ROW.names?default("")}</td>
            <td>${ROW.location?default("")}</td>
            <td>
                <#if (ROW.atype)??>
                    <#if ROW.atype?default("0")=="0">
                        房屋安置
                    <#else>
                        货币补偿
                    </#if>
                <#else>
                    未录入
                </#if>
            </td>
            <td>${ROW.fwbcmj?default("")}</td>
            <td>${ROW.rdbazrk?default("")}</td>
            <td>${ROW.zjdttzj?default("")}</td>
            <td>${ROW.azfgfk?default("")}</td>
            <td>${ROW.jshk?default("")}</td>
            <td>
                <button type="button" class="btn btn-success btn-xs ml10 YL-ModalClick glyphicon glyphicon-print"
                        title='财务结算表格打印'
                        data-url="${BASE_PATH}cwjs/cwjs_01_print_model.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}"></button>
            </td>
        </tr>
        </#list>
    </#if>
</#macro>


<!--方案审核审查-->
<#macro fhfa_s items  pageNo pageSize>
    <#if items?size gt 0>
        <#list items as ROW>
        <tr id="${ROW.id}">
            <td>${ROW.sectionindex}</td>
            <td>${ROW.section?default("")}</td>
            <td>${ROW.names?default("")}</td>
            <td>
                <#if (ROW.atype)??>
                    <#if ROW.atype?default("0")=="0">
                        房屋安置
                    <#else>
                        货币补偿
                    </#if>
                <#else>
                    未录入
                </#if>
            </td>
            <td>${(ROW.fwbcmj)!""}</td>
            <td>${(ROW.rdbazrk)!""}</td>
            <td>${(ROW.zjdttbck)!""}</td>
            <td>${(ROW.azfgfk)!""}</td>
            <td>${(ROW.wwzjlf)!""}</td>

            <td>
                <#if role.roleAuthority[15]=="2">
                    <button type="button" style="color: #006600"
                            class="btn btn-default btn-xs ml10 YL-ModalClick glyphicon glyphicon-print"
                            title='打印基本情况调查表' data-url="${BASE_PATH}pgqq/rhjc_print.action?housebasicid=${ROW.id}">
                        打印基本调查表
                    </button>
                </#if>
                <#if role.roleAuthority[16]=="2">
                    <button type="button" style="color: #006600"
                            class="btn btn-default btn-xs ml10 YL-ModalClick glyphicon glyphicon-print"
                            title='打印认定结果确认一览表'
                            data-url="${BASE_PATH}/pgzq/fnsjsh_rdjg_print.action?housebasicid=${ROW.id}&agreenmentid=${(ROW.agreenmentid)!""}">
                        打印认定结果表
                    </button>
                </#if>
            </td>
            <td>
                <#if (ROW.checkresult)??>
                    <#if ROW.checkresult=="1">
                        通过
                    <#else>
                        未通过
                    </#if>
                <#else>
                    未审核
                </#if>
            </td>
            <td>
                <#if role.roleAuthority[17]=="2">
                    <#if (ROW.checkresult)??>
                        <#if ROW.checkresult=="0">
                            <button type="button" class="btn btn-warning btn-xs ml10 YL-ModalClick " title='重新审查'
                                    data-url="${BASE_PATH}pgzq/fhfa_check_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}">
                                重新审查
                            </button>
                        <#elseif ROW.checkresult=="1">
                            <button type="button" class="btn btn-info btn-xs ml10 YL-ModalClick" title='重新审查'
                                    data-url="${BASE_PATH}pgzq/fhfa_check_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}">
                                重新审查
                            </button>
                        <#else>
                            <button type="button" class="btn btn-info btn-xs ml10 YL-ModalClick" title='审查'
                                    data-url="${BASE_PATH}pgzq/fhfa_check_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}">
                                审查
                            </button>
                        </#if>
                    <#else>
                        <button type="button" class="btn btn-info btn-xs ml10 YL-ModalClick" title='审查'
                                data-url="${BASE_PATH}pgzq/fhfa_check_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}">
                            审查
                        </button>
                    </#if>
                </#if>
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
            <td>${ROW.sectionindex}</td>
            <td>${ROW.section?default("")}</td>
            <td>${ROW.names?default("")}</td>
            <td>
                <#if (ROW.atype)??>
                    <#if ROW.atype?default("0")=="0">
                        房屋安置
                    <#else>
                        货币补偿
                    </#if>
                <#else>
                    未录入
                </#if>
            </td>
            <td>${(ROW.fwbcmj)!""}</td>
            <td>${(ROW.rdbazrk)!""}</td>
            <td>${(ROW.azfgfk)!""}</td>
            <td>${(ROW.jlfsum)!""}</td>
            <td>
             	<button type="button" class="btn btn-danger btn-xs ml10 YL-ModalClick bold" title='打印预结单' <span class="glyphicon glyphicon-print">预结单</span></button>
                <#if role.roleAuthority[9]=="2">
                    <button type="button" class="btn btn-danger btn-xs ml10 YL-ModalClick bold" title='打印金额审查表'
                            
                        <#if ROW.atype?default("0")=="0">
                           data-url="${BASE_PATH}pgzq/fhxy_az_je_print_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}"
                        <#else>
                           data-url="${BASE_PATH}pgzq/fhxy_hb_je_print_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}"
                        </#if>
                        >
                        <span class="glyphicon glyphicon-print">金额审查</span></button>
                       
                </#if>
                <#if role.roleAuthority[10]=="2">
                    <button type="button" class="btn btn-danger btn-xs ml10 YL-ModalClick bold" title='打印协议'

                        <#if ROW.atype?default("0")=="0">
                            data-url="${BASE_PATH}pgzq/fhxy_az_xy_print_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}"
                        <#else>
                            data-url="${BASE_PATH}pgzq/fhxy_hb_xy_print_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}"
                        </#if>
                        >
                        <span class="glyphicon glyphicon-print">协议</span></button>
                </#if>
            </td>
            <#if (ROW.atype)??>
                <td>
                    <#if role.roleAuthority[11]=="2">
                        <#if (ROW.protocolnumber)??>
                            <#if (ROW.protocolnumber?length>0)>
                            ${ROW.displaydate}
                            <#else>
                                <button type="button" class="btn btn-success btn-xs ml10  bold" title='签约状态'
                                        onclick="confirmSign(this)"
                                        data-url="${BASE_PATH}indexnum/get.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}">
                                    确认签约
                                </button>
                            </#if>
                        <#else>
                            <button type="button" class="btn btn-success btn-xs ml10  bold" title='签约状态'
                                    onclick="confirmSign(this)"
                                    data-url="${BASE_PATH}indexnum/get.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}">
                                确认签约
                            </button>
                        </#if>
                    </#if>
                </td>
                <td title="请点击左侧确认签约，获取协议编号">${(ROW.protocolnumber)!""}</td>
                <td>
                    <#if role.roleAuthority[12]=="2">
                        <#if (ROW.protocolnumber)??>
                            <#if (ROW.protocolnumber?length>0)>
                                <button type="button" class="btn btn-success btn-xs ml10  YL-ModalClick bold" title=''
                                        data-url="${BASE_PATH}/pgzq/fhxy_xy_sy_print_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}">
                                    打印首页
                                </button>
                            <#else>
                            </#if>
                        <#else>
                        </#if>
                    </#if>
                </td>
            <#else>
                <td colspan=3> 请先选择安置方式！</td>
            </#if>
            <td>
                <#if ROW.atype?default("0")=="0">
            ${ROW.indexNumStr?default("")}
            </#if>
            </td>
            <td>
                <#if role.roleAuthority[13]=="2">
                <#if ROW.atype?default("0")=="0">
                    <#if (ROW.protocolnumber)??>
                        <#if (ROW.protocolnumber?length>0)>
                        <button type="button"
                                class="btn btn-danger btn-xs ml10 YL-ModalClick bold glyphicon glyphicon-print"
                                title='打印定向安置房认购协议'
                                data-url="${BASE_PATH}pgzq/fhxy_sxh_print_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}"></button>
                        </#if>
                    </#if>
                 </#if>
                </#if>
                </td>

        </tr>
        </#list>
    </#if>
</#macro>


<!--签约排号管理-->
<#macro SxhList items  pageNo pageSize>
    <#if items?size gt 0>
        <#list items as ROW>
        <tr id="${ROW.id}">
            <td>${ROW.sectionindex}</td>
            <td>${ROW.section?default("")}</td>
            <td>${ROW.names?default("")}</td>
            <td>${ROW.idcard?default("")}</td>
            <td>${ROW.protocolnumber?default("")}</td>
            <td>${ROW.indexnum?default("")}</td>
            <td>${ROW.displaydate?default("")}</td>
            <td>
                <button type="button" class="btn btn-danger btn-xs ml10 YL-ModalClick bold glyphicon glyphicon-print"
                        title='打印协议'
                        data-url="${BASE_PATH}pgzq/fhxy_sxh_print_Modal.action?housebasicid=${ROW.housebasicid}&agreenmentid=${(ROW.agreenmentid)!""}"></button>
            </td>
        </tr>
        </#list>
    </#if>
</#macro>


<!--交房等级-->
<#macro JfdjList items  pageNo pageSize>
    <#if items?size gt 0>
        <#list items as ROW>
        <tr id="${ROW.id}">
            <td>${ROW.sectionindex}</td>
            <td>${ROW.section?default("")}</td>
            <td>${ROW.names?default("")}</td>
            <td>${ROW.mobile?default("")}</td>
            <td>${ROW.idcard?default("")}</td>
            <td>
                <#if (ROW.atype)??>
                    <#if ROW.atype?default("0")=="0">
                        房屋安置
                    <#else>
                        货币补偿
                    </#if>
                <#else>
                    未录入
                </#if>
            </td>
            <td>${(ROW.location)!""}</td>
            <td>${(ROW.housecount)!""}</td>
            <td>
                <#if (ROW.hasothers)??>
                    <#if ROW.hasothers?default("0")=="1">
                        已经交房
                    <#else>
                        <#if role.roleAuthority[33]=="2">
                            <button type="button" class="btn btn-success btn-xs ml10  bold" title='确认交房'
                                    onclick="confirmOthers(this)"
                                    data-url="${BASE_PATH}confirmOthers.action?housebasicid=${ROW.housebasicid}">确认交房
                            </button>
                        </#if>
                    </#if>
                <#else>
                    <#if role.roleAuthority[33]=="2">
                        <button type="button" class="btn btn-success btn-xs ml10  bold" title='确认交房'
                                onclick="confirmOthers(this)"
                                data-url="${BASE_PATH}confirmOthers.action?housebasicid=${ROW.housebasicid}">确认交房
                        </button>
                    </#if>
                </#if>
            </td>
        </tr>
        </#list>
    </#if>
</#macro>



<!--签约排号管理-->
<#macro QysxhtzList items  pageNo pageSize>
    <#if items?size gt 0>
        <#list items as ROW>
        <tr>
            <td>${ROW_index+1+(pageNo-1)*pageSize}</td>
            <td>${ROW.section?default("")}</td>
            <td>${ROW.protocolnumber?default("")}</td>
            <td>${ROW.names?default("")}</td>
            <td>${ROW.indexnum?default("")}</td>
            <td>${ROW.displaydate?default("")}</td>
            <td>${ROW.operatename?default("")}</td>
            <td>${ROW.serviceip?default("")}</td>
        </tr>
        </#list>
    </#if>
</#macro>
