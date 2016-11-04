<form  action="${BASE_PATH}pgqq/checkresult.action?housebasicid=${bean.id}" accept-charset="UTF-8" method="post">
    <div class="modal-header clearfix">
        <h4 class="modal-title pull-left m0">基本情况调查表(共5项)</h4>
        <button type="submit" class="btn btn-primary btn-save fr ml15">保存</button>
        <button type="button" class="btn btn-default fr" data-dismiss="modal">关闭</button>
    </div>
    <div class="modal-body rhjc-add-con rhjc-check" id="rhjc-add-con">


        <input type="hidden" class='form-control input-sm ' name='id' value="${bean.id?default("")}" style="width: 0px;"/>
        <div class='container-fluid con-bg mb10'>	
            <div class='checkbox-2'>      
                <label class='fl control-label'>复核状态: &nbsp;&nbsp;</label>
                <input class="ml10"  type="radio" name="checkresult" id="optionsRadios3" value="1" <#if (bean.checkresult?default("0"))=='1'>checked</#if>> 通过&nbsp;&nbsp;
                       <input class="ml10" type="radio" name="checkresult" id="optionsRadios4" value="0" <#if (bean.checkresult?default("0"))=='0'>checked</#if>> 退回   

            </div>
            <div class='mt10'>      
                <label class='fl control-label pr10'>复核人员: </label>
                <input type='text' class='form-control input-sm  width-150px' name='checkname' value="${bean.checkname?default("")}" />  
            </div>
            <div class='mt10'>  
                <label class='fl control-label pr10'>复核日期: </label>
                <input type='text' class='form-control input-sm  width-150px' name='checkDate' value="${bean.checkDate?default("")}"/>    
            </div>
            <div class='mt10'>
                <label class='fl control-label'>备注:</label>
                <textarea class="form-control fr" rows="5" name="checkremark" placeholder="备注(选填，限1500字)" >${bean.checkremark?default("")}</textarea>
            </div>
        </div>


        <div id='aoJianiIndex+'>
            <h4><span class="label label-default">1.基本数据录入：</span></h4>
            <div class='container-fluid con-bg mb10'>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>房屋坐落: ${bean.location?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>被腾退人姓名: ${bean.names}</label>
                </div>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>手机: ${bean.mobile?default("/")}</label>      
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>联系固话: ${bean.telephone?default("/")}</label>     
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>性别:<#if  (bean.sex?default("-1"))=='1'>女<#else>男</#if></label>
                </div>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>年龄:${bean.age?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>备用联系电话:${bean.remobile?default("/")}</label>
                </div>

                <div class=' chkstyle fl'>
                    <label class='fl control-label'>权属取得方式:
                        <#if (bean.ownership?default("-1"))=='-1'>请选择
                        <#elseif (bean.ownership?default("-1"))=='0'>自有 
                        <#elseif (bean.ownership?default("-1"))=='1'>老宅
                        <#elseif (bean.ownership?default("-1"))=='2'>买卖
                        <#elseif (bean.ownership?default("-1"))=='3'>继承
                        <#elseif (bean.ownership?default("-1"))=='4'>其他</label>
                    </#if>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>房屋间数:${bean.housecount?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>本址在册户口簿数量:${bean.localbook?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>本址在册户籍数量:${bean.localpeoplecount?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>非本址在册户口簿数量:${bean.notlocalbook?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>非本址在册户籍数量:${bean.notlocalpeoplecount?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>拟被安置人口:${bean.people?default("/")}</label>
                </div>
            </div>
            <h4><span class="label label-default">2.被腾退房屋户籍登记情况：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <table id="table1" class="table">
                    <tr>
                        <td colspan="12" style="text-align: center;font-weight: bold">本址在册户籍家庭人口情况</td>
                    </tr>
                    <tr>
                        <th class="center">户主</th>
                        <th class="center">户籍性质</th>
                        <th class="center">姓名</th>
                        <th class="center">身份证号</th>
                        <th class="center">性别</th>
                        <th class="center">户关</th>
                        <th class="center">产关</th>
                        <th class="center">婚否</th>
                        <th class="center">工作单位</th>
                        <th class="center">人口类别</th>
                        <th class="center"></th>
                    </tr>

                    <#if bean.vacatelist?size gt 0>
                    <#list bean.vacatelist as vacate>
                    <tr class="add-list-1">
                        <td class="center">  <#if (vacate.householder?default("-1"))=='0'>户主 <#else>非户主</#if>  </th>  
                        <td class="center">
                            <#if (vacate.householdtype?default("-1"))=='0'>居<#else>农</#if> 
                        </td>
                        <td class="center">${vacate.name?default("/")}      </td>
                        <td class="center">${vacate.idcard?default("/")}       </td>

                        <td class="center">
                            <#if (vacate.sex?default("-1"))=='0'>男<#else>女</#if>
                        </td>
                        <td class="center">${vacate.registeredrelate?default("/")}        </td>
                        <td class="center">${vacate.changrelate?default("/")}      </td>
                        <td class="center">
                            <#if (vacate.hasmarry?default("-1"))=='0'>已婚<#else>未婚</#if> 
                        </td>

                        <td class="center">${vacate.unit?default("/")}     </td>
                        <td class="center">
                            <#if (vacate.peopletype?default("-1"))=='0'>婚姻衍生人员
                            <#elseif (vacate.peopletype?default("-1"))=='1'>配偶
                            <#elseif (vacate.peopletype?default("-1"))=='2'>新生婴儿
                            <#elseif (vacate.peopletype?default("-1"))=='3'>现役军人
                            <#elseif (vacate.peopletype?default("-1"))=='4'>院校在校生
                            <#elseif (vacate.peopletype?default("-1"))=='5'>服役人员
                            <#elseif (vacate.peopletype?default("-1"))=='6'>其他
                            </#if>
                        </td>
                    </tr>
                    </#list>
                    </#if>
                    <tr class="center">
                        <td colspan="12" style="text-align: center;font-weight: bold">非本址户籍家庭人口情况</td>
                    </tr>
                    <tr class="center">
                        <th class="center">户主</th>
                        <th class="center">户籍性质</th>
                        <th class="center">姓名</th>
                        <th class="center">身份证号</th>
                        <th class="center">性别</th>
                        <th class="center">户关</th>
                        <th class="center">产关</th>
                        <th class="center">婚否</th>

                        <th class="center">工作单位</th>
                        <th class="center">人口类别</th>
                        <th class="center"></th>
                    </tr>
                    <#if bean.list?size gt 0>
                    <#list bean.list as cate>
                    <tr class="add-list-2">
                        <td class="center">
                        <td>  <#if (cate.householder?default("-1"))=='0'>户主 <#else>非户主</#if>  </th>  
                        </td>
                        <td class="center">
                            <#if (cate.householdtype?default("-1"))=='0'>居<#else>农</#if> 
                        </td>
                        <td class="center">${cate.name?default("/")}       </td>
                        <td class="center">${cate.idcard?default("/")}      </td>

                        <td class="center">
                            <#if (cate.sex?default("-1"))=='0'>男<#else>女</#if>
                        </td>
                        <td class="center">${cate.registeredrelate?default("/")}      </td>
                        <td class="center">${cate.changrelate?default("/")}        </td>
                        <td class="center">
                            <#if (cate.hasmarry?default("-1"))=='0'>已婚<#else>未婚</#if> 
                        </td>

                        <td class="center">${cate.unit?default("/")}       </td>
                        <td class="center">
                            <#if (cate.peopletype?default("-1"))=='0'>婚姻衍生人员
                            <#elseif (cate.peopletype?default("-1"))=='1'>配偶
                            <#elseif (cate.peopletype?default("-1"))=='2'>新生婴儿
                            <#elseif (cate.peopletype?default("-1"))=='3'>现役军人
                            <#elseif (cate.peopletype?default("-1"))=='4'>院校在校生
                            <#elseif (cate.peopletype?default("-1"))=='5'>服役人员
                            <#elseif (cate.peopletype?default("-1"))=='6'>其他
                            </#if>
                        </td>
                    </tr>
                    </#list>
                    </#if>
                    </tbody>
                </table>
            </div>
            <h4><span class="label label-default">3.面积相关：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>宅基地测绘面积:${bean.zjdarea?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>房屋测绘面积:${bean.fwarea?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>首层测绘面积:${bean.firstfloorarea?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>二层以上面积:${bean.abovetwoarea?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>地下室面积:${bean.basement?default("/")}</label>
                </div>
            </div>
            <h4><span class="label label-default">4.经营状况：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>经营用房面积:${bean.operatearea?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>工商备案面积:${bean.businessarea?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>经营用途:${bean.operatecontent?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>执照字号:${bean.licensename?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>与被腾退人关系:
                        <#if (bean.relate?default("-1"))=='-1'>请选择
                        <#elseif (bean.relate?default("-1"))=='0'>本人
                        <#elseif (bean.relate?default("-1"))=='1'>本家庭成员
                        <#elseif (bean.relate?default("-1"))=='2'>租赁
                        <#elseif (bean.relate?default("-1"))=='3'>其他
                        </#if>
                    </label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>执照标明经营场所:${bean.licenselocation?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>税务登记证:
                        <#if (bean.taxlicense?default("-1"))=='-1'>请选择
                        <#elseif (bean.taxlicense?default("-1"))=='1'>有
                        <#elseif (bean.taxlicense?default("-1"))=='2'>无
                        </#if>
                    </label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>租赁协议:
                        <#if (bean.leaselicense?default("-1"))=='-1'>请选择
                        <#elseif (bean.leaselicense?default("-1"))=='0'>有
                        <#elseif (bean.leaselicense?default("-1"))=='1'>无
                        </#if>
                    </label>
                </div>    
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>完税证明:
                        <#if (bean.taxprove?default("-1"))=='-1'>请选择
                        <#elseif (bean.taxprove?default("-1"))=='0'>有
                        <#elseif (bean.taxprove?default("-1"))=='1'>无
                        </#if>
                    </label>
                </div> 
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>执照编号:${bean.license?default("/")}</label>
                </div>
            </div>
            <h4><span class="label label-default">4.其他，残疾，大病，低保等：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <table id="table1" class="table">
                    <thead>
                        <tr>
                            <th class="center">类型</th>
                            <th class="center">姓名</th>
                            <th class="center">户籍序号</th>
                            <th class="center">低保/残疾证号</th>
                            <th class="center">大病名称</th>
                            <th class="center">低保有效期</th>
                            <th class="center">大病证明材料</th>
                            <th class="center"></th>
                        </tr>
                    </thead>
                    <tbody id="four-list">
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
                    </tbody>
                </table>
            </div>
            <h4><span class="label label-default mb10">5.备注：</span></h4>
            <div class='container-fluid con-bg mb10'>${bean.remark?default("/")}</div>
        </div>
    </div>
</from>
<script type = "text/javascript">
    //设置模态框高度和宽度  
    $("#rhjc-add-con").css("height", ($(window).height() - 150) + "px");
    $("#rhjc-add-con").css("overflow-y", "scroll");

    function saveClick(btn) {
        var dataInfo = $("#rhjcAddForm").serialize();
        var url = $(btn - save).attr("data-url");
        $.ajax({
            type: "POST",
            url: url,
            dataType: "json",
            data: dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            },
            success: function (response) {
                var bean = response.bean;
                addAoJianInfo(bean);
                //初始化日期控件
                initDate();
            }
        })
    }

    function addlist(a, c) {
        var b = $(a + "").prev();
        var h = b.html();
        b.after("<tr class=" + c + "" + ">" + h + "</tr>" + "");
    }

    function delthis(f, c) {
        var num = $(f).parent().parent().parent().children('.' + c).length;
        if (num > 1) {
            $(f).parent().parent().remove();
        } else {
            alert("至少保留一行！");
        }


    }
</script>