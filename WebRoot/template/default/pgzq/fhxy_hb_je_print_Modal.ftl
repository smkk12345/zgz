<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">【${bean.names}】完全货币补偿方式金额审查表</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save"   onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body center">
    <div class="container-fluid fhfa-rdjg-print-con"  id="xy-print" >
        <table class="table table-bordered" style="font-size: 8px !important">
            <tr>
                <td class=""colspan="11" class="center">（张郭庄村）村宅基地房屋“安置房补偿”方式金额审查表（ ${bean.section}  ）标段</td>
            </tr>
            <tr>
                <td class="" colspan="2">被腾退人</td>
                <td class="">${bean.names?default("")} </td>
                <td class="">坐落</td>
                <td class="" colspan="3">${bean.location?default("")}</td>
                <td class="" colspan="2">签约时间</td>
                <td class="" colspan="2">${bean.operatedate?default("")}</td>
            </tr>
            <tr>
                <td class=""colspan="2">宅基地实测(m<sup>2</sup>)</td>
                <td class="" >${bean.zjdarea?default("")}</td>
                <td class="" >身份证</td>
                <td class="" colspan=3>${bean.idcard?default("")}</td>
                <td class="" >认定年限</td>
                <td class=""><#if (bean.homesteadyear?default("-1"))=='0'>82年前<#elseif bean.homesteadyear?default("-1")=='1'>82年后<#else>/</#if></td>
                <td class="">签约顺序号</td>
                <td class="">${bean.indexNumStr?default("/")}</td>
            </tr>
            <tr>
                <td class="" colspan="2">实测建面(m<sup>2</sup>)</td>
                <td class="">${bean.fwarea?default("")}</td>
                <td class="">首层(m<sup>2</sup>)</td>
                <td class="" >${bean.firstfloorarea?default(0)}</td>
                <td class="">二层及以上(m<sup>2</sup>)</td>
                <td class="">${bean.abovetwoarea?default(0)}</td>
                <td class="">地下室(m<sup>2</sup>)</td>
                <td class="">${bean.basement?default(0)}</td>
                <td class="">棚(m<sup>2</sup>)</td>
                <td class="">${bean.shed?default(0)}</td>
            </tr>
            <tr>
                <td class="" colspan=3>认定宅基地面积(m<sup>2</sup>)</td>
                <td class="" colspan=3>${bean.rdzjdallarea?default(0)}</td>
                <td class="" colspan=3>补偿宅基地面积(m<sup>2</sup>)</td>
                <td class="" colspan=2>${bean.bczjdmj?default(0)}</td>
            </tr>
            <tr>
                <td class="" colspan=2>控制面积(m<sup>2</sup>)</td>
                <td class="" colspan=1>${bean.conhomestarea?default(0)}</td>
                <td class="" colspan="2">区位单价</td>
                <!--                <td class="">${bean.kzzjdqwbcj?default(0)}</td>-->
                <td class="" >6000</td>
                <td class="" colspan="2">超控面积(m<sup>2</sup>)</td>
                <td class="" >${bean.overhomesteadarea?default(0)}</td>
                <td class="" >区位单价</td>
                <td class="" <#if (bean.homesteadyear?default("-1"))=='0'>3000<#else>1800</#if></td>
            </tr>
            <tr>
                <td class="" colspan="2">认定房屋面积(m<sup>2</sup>)</td>
                <td class="">${bean.fwbcmj?default(0)}</td>
                <td class="">经营面积(m<sup>2</sup>)</td>
                <td class="" >${bean.operatearea?default(0)}</td>
                <td class="">本址在册户籍人数</td>
                <td class="">${bean.localpeoplecount?default(0)}</td>
                <td class="">非本址在册户籍人数</td>
                <td class="">${bean.notlocalpeoplecount?default(0)}</td>
                <td class="">认定人数总和</td>
                <td class="">${bean.localpeoplecount?number+bean.notlocalpeoplecount?number}</td>
            </tr>
            <tr>
                <td class="" colspan="2">被认定全体人员姓名（注明代际关系）</td>
                <td class="" colspan=9>
                    <#if bean.vacatelist??>
                    <#if bean.vacatelist?size gt 0>
                    在册人员：<br>
                    <#list bean.vacatelist as ROW>
                    姓名：${ROW.name} 身份证号：${ROW.idcard}
                    </#list>
                    </#if>
                    </#if>
                    <#if bean.list??>
                    <#if bean.list?size gt 0>
                    非在册人员：<br>
                    <#list bean.list as ROW>
                    姓名：${ROW.name} 身份证号：${ROW.idcard}
                    </#list>
                    </#if>
                    </#if>
                </td>
            </tr>

            <tr>
                <td class="" colspan=2>宅基地腾退补偿总价(元)</td>
                <td class="" colspan=9>${bean.zjdttzj?default("")}</td>
            </tr>
            <tr>	
                <td class="" colspan=6 >一，宅基地补偿款合计(元)</td>
                <td class="" colspan=1>${bean.zjdttbck?default("")}</td>
                <td class="" colspan=4 >结算及领款内容</td>
            </tr>
            <tr>
                <td  style="width: 10px !important;">1</td>
                <td class="" colspan=5>控制区位补偿价(元)</td>
                <td class="" colspan=1>${bean.kzzjdqwbcj?default("")}</td>
                <td class="" colspan=4 rowspan="8" style="text-align: left"><p>项目审计部门审核通过后，及时通知被腾退人在约定期限内进行搬迁。</p><p>搬迁完毕并经拆除公司验收合格后，房屋交甲方拆除。</p><p>在被腾退人完成交房验收后 20 个工作日内，开具领款凭证。</p></td>
            </tr>
            <tr>
                <td class="">2</td>
                <td class="" colspan=5>超控制区位补偿价(元)</td>
                <td class="" colspan=1>${bean.ckzjdqwbcj?default("")}</td>
            </tr>
            <tr>
                <td class="">3</td>
                <td class="" colspan=5>房屋价款(元)</td>
                <td class="" colspan=1>${bean.bttfwczcxj?default("")}</td>
            </tr>
            <tr>
                <td class="">4</td>
                <td class="" colspan=5>装修、设备附属物价款(元)</td>
                <td class="" colspan=1>${bean.zxsbfswjk?default("")}</td>
            </tr>
            <tr>
                <td class="" colspan=6>二、各项奖励、补助、周转合计(元)</td>
                <td class="" colspan=1>${bean.jlfsum?default("/")}</td>
            </tr>

            <tr>
                <td class="">1</td>
                <td class="" colspan=5>提前搬家奖（5000元/院）(元)</td>
                <td class="" >${bean.tqbjl?default("/")}</td>
            </tr>
            <tr>
                <td class="">2</td>
                <td class="" colspan=5>工程配合奖（100000元/院）(元)</td>
                <td class="" >${bean.gcphjl?default("")}</td>
            </tr>
            <tr>
                <td class="">3</td>
                <td class="" colspan=5>腾退促进奖（50000元/院）(元)</td>
                <td class="">${bean.ttcjjl?default("/")}</td>
            </tr>
            <tr>
                <td class="">4</td>
                <td class="" colspan=5>无违章奖励（500元㎡）(元)</td>
                <td class="" colspan=1>${bean.wwzjl?default("/")}</td>
                <td class="" colspan=4 rowspan=4 style="text-align: left;vertical-align:top !important">腾退服务公司经手人签字:</td>
            </tr>
            <tr>
                <td class="">5</td>
                <td class="" colspan=5>未建二层奖（500元㎡）(元)</td>
                <td class="" >${bean.wjecjj?default("/")}</td>
            </tr>
            <tr>
                <td class="">6</td>
                <td class="" colspan=5>已建二层补助（500元㎡）(元)</td>
                <td class="" >${bean.wjpzyjecbz?default("/")}</td>
            </tr> 
            <tr>
                <td class="">7</td>
                <td class="" colspan=5>家电迁移补助（12000元/院）(元)</td>
                <td class="" >${bean.bjbz?default("/")}</td>
            </tr>  
            <tr>
                <td class="">8</td>
                <td class="" colspan=5>大病补助（50000元/人）(元)</td>
                <td class="">${bean.dbbz?default("/")}</td>
                <td colspan="4" rowspan="2" style="text-align: left;vertical-align:top !important">实施主体意见: </td>
            </tr> 
            <tr>
                <td class="">9</td>
                <td class="" colspan=5>残疾补助（30000元/人）(元)</td>
                <td class="">${bean.cjbz?default("/")}</td>
            </tr> 
            <tr>
                <td class="">10</td>
                <td class="" colspan=5>低保补助（30000元/人）(元)</td>
                <td class="">${bean.dbhbz?default("/")}</td>
                <td colspan="4" rowspan="3" style="text-align: left;vertical-align:top !important">内审组经手人签字:</td>
            </tr>
            <tr>
                <td class="">11</td>
                <td class="" colspan=5>独生子女（30000元/人）(元)</td>
                <td class="" >${bean.dsznbz?default("/")}</td>
            </tr>  
            <tr>
                <td class="">12</td>
                <td class="" colspan=5>停产停业补助（800元㎡）(元)</td>
                <td class="">${bean.tctdbz?default("/")}</td>
            </tr>  
            <tr>
                <td class="">13</td>
                <td class="" colspan=5>周转补助费（1200元/人/月）(元)</td>
                <td class="">${bean.zzbz?default("/")}</td>
                <td colspan="4" rowspan="2" style="text-align: left;vertical-align:top !important">备注:</td>
            </tr> 
            <tr>
                <td class="">14</td>
                <td class="" colspan=5>其他补助35万、信鸽补助、滴水补助(元)</td>
                <td class="">${bean.dsbzf?number+bean.xgbzf?number+bean.zjdypwpbz?number+bean.yhzbwxmbc?number}</td>
            </tr>                   
        </table>
    </div>
</div>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js" ></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<script type = "text/javascript">
    //设置模态框高度和宽度  
    $("#myModal .modal-dialog").width(700);
    $(".modal-body").css("height", ($(window).height() - 150) + "px");
    $(".modal-body").css("overflow-y", "scroll");

    function yu_print() {
        $("#xy-print").jqprint();
    }

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

    function addlist(a) {
        var h = $(a + "").html();
        $(a + "").after("<tr>" + h + "</tr>" + "");

    }
</script>