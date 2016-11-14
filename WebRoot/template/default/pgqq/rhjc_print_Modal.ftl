
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">查看基本情况调查表</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save"   onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body ">
    <div class="container-fluid rhjc-print-con"  id="xy-print">
        <div class="title" style="margin-top: 5px;" >张郭庄村宅基地腾退拟定基本信息一览表</div>
        <div class="leftTitle"  style="margin-top: 5px;">1.基本数据录入：&nbsp;</div>
        <div class="contex-1 container-fluid" style="margin-top: 0px;">
            <div class=' rhjc-print-group fl'>
                <label class='fl control-label'>房屋坐落: ${bean.location?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>
                <label class='fl control-label'>被腾退人姓名: ${bean.names}</label>
            </div>
        </div>
        <div class="contex-1 container-fluid" style="margin-top: 0px;">
            <div class=' rhjc-print-group fl'>
                <label class='fl control-label'>手机: ${bean.mobile?default("/")}</label>      
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>联系固话: ${bean.telephone?default("/")}</label>     
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>性别:<#if  (bean.sex?default("-1"))=='1'>女<#else>男</#if></label>
            </div>
            <div class=' rhjc-print-group fl'>
                <label class='fl control-label'>年龄:${bean.age?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>备用联系电话:${bean.remobile?default("/")}</label>
            </div>

            <div class=' rhjc-print-group fl'>
                <label class='fl control-label'>权属取得方式:
                    <#if (bean.ownership?default("-1"))=='-1'>请选择
                    <#elseif (bean.ownership?default("-1"))=='0'>自有 
                    <#elseif (bean.ownership?default("-1"))=='1'>老宅
                    <#elseif (bean.ownership?default("-1"))=='2'>买卖
                    <#elseif (bean.ownership?default("-1"))=='3'>继承
                    <#elseif (bean.ownership?default("-1"))=='4'>其他</label>
                </#if>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>本址在册户口簿数量:${bean.localbook?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>非本址在册户口簿数量:${bean.notlocalbook?default("/")}</label>
            </div>
            <!--            <div class=' rhjc-print-group fl'>      
                            <label class='fl control-label' style="font-weight: bold">拟被安置人口:${bean.people?default("/")}</label>
                        </div>-->
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>本址在册户籍数量:${bean.localpeoplecount?default("/")}</label>
            </div>

            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>非本址在册户籍数量:${bean.notlocalpeoplecount?default("/")}</label>
            </div>
        </div>

        <div class="leftTitle"  style="margin-top: 10px;">2.安置人口认定情况：&nbsp;</div>
        <div class="contex-1 container-fluid" style="margin-top: 0px;">
            <table id="table1" class="table">
                <tr>
                    <td colspan="12" style="text-align: center;">本址在册户籍家庭人口情况</td>
                </tr>
                <tr>
                    <th class="center">序号</th>
                    <th class="center">认定结果</th>
                    <th class="center">户主</th>
                    <th class="center">户籍性质</th>
                    <th class="center">姓名</th>
                    <th class="center">身份证号</th>
                    <th class="center">产关</th>
                    <th class="center">性别</th>
                    <th class="center">年龄</th>
                    <th class="center">婚否</th>
                    <th class="center">超生</th>
                    <th class="center">备注</th>
                </tr>

                <#if bean.vacatelist?size gt 0>
                <#list bean.vacatelist as vacate>
                <tr class="add-list-1">
                    <td class="center">${vacate_index+1}</td>
                    <td class="center">
                        <label class="title1"><input type="checkbox"></label>
                    </td>
                    <td class="center">  <#if (vacate.householder?default("-1"))=='0'>户主 <#else>非户主</#if>
                    <td class="center">
                        <#if (vacate.householdtype?default("-1"))=='0'>居<#else>农</#if> 
                    </td>
                    <td class="center">${vacate.name?default("/")}      </td>
                    <td class="center">${vacate.idcard?default("/")}       </td>
                    <td class="center">
                        ${vacate.changrelate?default("/")}
                    </td>
                    <td class="center">
                        <#if (vacate.sex?default("-1"))=='0'>男<#else>女</#if>
                    </td>
                    <td class="center">
                         ${vacate.age?default("/")}
                    </td>
                    <td class="center">
                        <#if (vacate.hasmarry?default("-1"))=='0'>已婚<#else>未婚</#if> 
                    </td>
                    <td class="center">
                        <label class="title1"><input type="checkbox"></label>
                    </td>
                    <td class="center"></td>
                </tr>
                </#list>
                <#else>
                    <#list 1..10 as t>
                    <tr>
                        <td class="center">${t_index+1}</td>
                        <#list 1..11 as t>
                             <td class="center"></td>
                        </#list>
                    </tr>
                   </#list>
                </#if>
                <tr class="center">
                    <td colspan="12" style="text-align: center;">非本址户籍家庭人口情况</td>
                </tr>
                <tr class="center">
                    <th class="center">序号</th>
                    <th class="center">认定结果</th>
                    <th class="center">户主</th>
                    <th class="center">户籍性质</th>
                    <th class="center">姓名</th>
                    <th class="center">身份证号</th>
                    <th class="center">产关</th>
                    <th class="center">性别</th>
                    <th class="center">年龄</th>
                    <th class="center">婚否</th>
                    <th class="center">超生</th>
                    <th class="center">备注</th>
                </tr>
                <#if bean.list?size gt 0>
                <#list bean.list as cate>
                <tr class="add-list-2">
                    <td class="center">${cate_index+1}</td>
                    <td class="center">
                        <label class="title1"><input type="checkbox"></label>
                    </td>
                    <td>  <#if (cate.householder?default("-1"))=='0'>户主 <#else>非户主</#if> 
                    </td>
                    <td class="center">
                        <#if (cate.householdtype?default("-1"))=='0'>居<#else>农</#if> 
                    </td>
                    <td class="center">${cate.name?default("/")}       </td>
                    <td class="center">${cate.idcard?default("/")}      </td>
                    <td class="center">
                    ${cate.changrelate?default("/")}
                    </td>

                    <td class="center">
                        <#if (cate.sex?default("-1"))=='0'>男<#else>女</#if>
                    </td>
                    <td class="center">
                    ${cate.age?default("/")}
                    </td>
                    <td class="center">
                        <#if (cate.hasmarry?default("-1"))=='0'>已婚<#else>未婚</#if> 
                    </td>
                    <td class="center">
                        <label class="title1"><input type="checkbox"></label>
                    </td>
                    <td class="center">
                    </td>
                </tr>
                </#list>
                <#else>
                    <#list 1..10 as t>
                        <tr>
                            <td class="center">${t_index+1}</td>
                            <#list 1..11 as t>
                                <td class="center"></td>
                            </#list>
                        </tr>
                    </#list>
                </#if>
                </tbody>
            </table>
        </div>
        <div class="leftTitle"  style="margin-top: 10px;">3.面积相关：&nbsp;</div>
        <div class="contex-1 container-fluid" style="margin-top: 0px;">
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label' style="font-weight: bold">宅基地测绘面积:${bean.zjdarea?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label' style="font-weight: bold">房屋测绘面积:${bean.fwarea?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>首层测绘面积:${bean.firstfloorarea?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>二层以上面积:${bean.abovetwoarea?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>地下室面积:${bean.basement?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>棚面积:${bean.shed?default("/")}</label>
            </div>
        </div>
        <div class="leftTitle"  style="margin-top: 10px;">4.经营状况：&nbsp;</div>
        <div class="contex-1 container-fluid" style="margin-top: 0px;">
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>经营用房面积:${bean.operatearea?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>工商备案面积:${bean.businessarea?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>经营用途:${bean.operatecontent?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>执照字号:${bean.licensename?default("/")}</label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>与被腾退人关系:
                    <#if (bean.relate?default("-1"))=='-1'>请选择
                    <#elseif (bean.relate?default("-1"))=='0'>本人
                    <#elseif (bean.relate?default("-1"))=='1'>本家庭成员
                    <#elseif (bean.relate?default("-1"))=='2'>租赁
                    <#elseif (bean.relate?default("-1"))=='3'>其他
                    </#if>
                </label>
            </div>
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>执照标明经营场所:${bean.licenselocation?default("/")}</label>
            </div>
            <#--<div class=' rhjc-print-group fl'>
                <label class='fl control-label'>税务登记证:
                    <#if (bean.taxlicense?default("-1"))=='-1'>请选择
                    <#elseif (bean.taxlicense?default("-1"))=='1'>有
                    <#elseif (bean.taxlicense?default("-1"))=='2'>无
                    </#if>
                </label>
            </div>-->
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>租赁协议:
                    <#if (bean.leaselicense?default("-1"))=='-1'>请选择
                    <#elseif (bean.leaselicense?default("-1"))=='0'>有
                    <#elseif (bean.leaselicense?default("-1"))=='1'>无
                    </#if>
                </label>
            </div>    
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>完税证明:
                    <#if (bean.taxprove?default("-1"))=='-1'>请选择
                    <#elseif (bean.taxprove?default("-1"))=='0'>有
                    <#elseif (bean.taxprove?default("-1"))=='1'>无
                    </#if>
                </label>
            </div> 
            <div class=' rhjc-print-group fl'>      
                <label class='fl control-label'>执照编号:${bean.license?default("/")}</label>
            </div>
        </div>
        <div class="leftTitle"  style="margin-top: 10px;">5.其他，残疾，大病，低保等：&nbsp;</div>
        <div class="contex-1 container-fluid" style="margin-top: 0px;">
            <table id="table1" class="table">
                <tr>
                    <th class="center">类型</th>
                    <th class="center">姓名</th>
                    <th class="center">户籍序号</th>
                    <th class="center">低保/残疾证号</th>
                    <th class="center">大病名称</th>
                    <th class="center">低保有效期</th>
                    <th class="center">大病证明材料</th>
                </tr>
                <#if bean.otherList?size gt 0>
                <#list bean.otherList as other>
                <tr class="add-list-3">
                    <td class="center">
                        <#if (other.otype?default("-1"))=='-1'>请选择
                        <#elseif (other.otype?default("-1"))=='0'>低保
                        <#elseif (other.otype?default("-1"))=='1'>残疾
                        <#elseif (other.otype?default("-1"))=='2'>大病
                        </#if>
                    </td>
                    <td class="center">${other.name?default("/")}    </td>
                    <td class="center">${other.peopleid?default("/")}      </td>
                    <td class="center">${other.otypenum?default("/")}  </td>
                    <td class="center">${other.illnessname?default("/")}      </td>
                    <td class="center">${other.validatedate?default("/")}      </td>
                    <td class="center">${other.illnessprove?default("/")}      </td>
                </tr>
                </#list>
                </#if>
            </table>
        </div>
        <div class="leftTitle2"  style="margin-top: 10px;">[认定结果]：&nbsp;</div>
        <div class="contex-1 container-fluid" style="margin-top: 0px;">
            1. 认定依据：
            <label class="title1"><input type="checkbox"> 宅基地原始批单 </label>
            <label class="title1"><input type="checkbox"> 翻建表 </label>
            <label class="title1"><input type="checkbox"> 认定小组认定 </label>
            <label class="title1"><input type="checkbox"> 其它 </label>
        </div>
        <div class="contex-1 container-fluid" style="margin-top: 0px;">
            2. 宅基地认定年限：
            <label class="title1"><input type="checkbox"> 82年前 </label>
            <label class="title1"><input type="checkbox"> 82年后 </label>
        </div>
        <div class="contex-1 container-fluid" style="margin-top: 0px;">
            <div class="fl" style="width: 137px">
                3. 认定人口数量：
            </div>
            <div class="fl" style="width: 480px">
                <label class="title1"><input type="checkbox">1 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">2 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">3 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">4 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">5 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">6 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">7 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">8 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">9 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">10 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">11 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">12 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">13 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">14 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">15 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">16 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">17 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">18 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">19 &nbsp;&nbsp;</label>
                <label class="title1"><input type="checkbox">20 &nbsp;&nbsp;</label>
            </div>
        </div>
        <div class="contex-1 container-fluid" style="margin-top: 0px;">
            4. 认定宅基地补偿面积：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>平方米
        </div>
        <div class="contex-1 container-fluid" style="margin-top: 5px;">
            5. 认定房屋补偿面积：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>平方米
        </div>
        <#--<div class="contex-1 container-fluid" style="margin-top: 5px;">
            6. 房屋重置成新价：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>元
        </div>-->
        <div class="pageBreak"></div>
    </div>
</div>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js" ></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<script type = "text/javascript">
            //设置模态框高度和宽度  
            //设置模态框高度和宽度  
            $("#myModal .modal-dialog").width(750);
            $(".modal-body").css("height", ($(window).height() - 150) + "px");
            $(".modal-body").css("overflow-y", "scroll");

            function yu_print() {
                $("#xy-print").jqprint();
            }
</script>