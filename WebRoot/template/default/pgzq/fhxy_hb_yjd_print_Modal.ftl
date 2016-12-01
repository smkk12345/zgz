<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">【${bean.names}】货币补偿方式预结单</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save"   onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body center">
    <div class="container-fluid fhfa-rdjg-print-con"  id="xy-print" >
        <table class="table table-bordered" style="font-size: 8px !important">
            <tr>  
                <td class="" colspan="10">“完全货币补偿”第（ ${bean.section}  ）标段腾退补偿总价预结单</td>
            </tr>
            <tr>
                <td class="" colspan=1>被腾退人</td>
                <td class="" colspan=2>${bean.names?default("")} </td>
                <td class="" colspan=1>坐落</td>
                <td class=""colspan=6>${bean.location?default("")}</td>
            </tr>
            <tr>
                <td class="">宅基地实测(m<sup>2</sup>)</td>
                <td class="">${bean.zjdarea?default("")}</td>
                <td class="">身份证</td>
                <td class="" colspan=3>${bean.idcard?default("")}</td>
                <td class="">认定年限</td>
                <td class="" colspan=3><#if (bean.homesteadyear?default("-1"))=='0'>82年前<#elseif bean.homesteadyear?default("-1")=='1'>82年后<#else>/</#if></td>
            </tr>
            <tr>
                <td class="">实建面积(m<sup>2</sup>)</td>
                <td class="">${bean.fwarea?default(0)}</td>
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
			    <td class="" colspan=2>认定宅基地面积(m<sup>2</sup>)</td>
                <td class="" colspan=3>${bean.rdzjdallarea?default(0)}</td>
                <td class="" colspan=2>补偿宅基地面积(m<sup>2</sup>)</td>
                <td class="" colspan=3>${bean.bczjdmj?default(0)}</td>
			</tr>
            <tr>
                <td class="" colspan=1>控制面积(m<sup>2</sup>)</td>
                <td class="" colspan=1>${bean.conhomestarea?default(0)}</td>
                <td class="" >区位单价</td>
<!--                <td class="">${bean.kzzjdqwbcj?default(0)}</td>-->
                <td class="" >6000</td>
                <td class="" >超控面积(m<sup>2</sup>)</td>
                <td class="" >${bean.overhomesteadarea?default(0)}</td>
                <td class="" >区位单价</td>
                <td class="" colspan=3><#if (bean.homesteadyear?default("-1"))=='0'>3000<#else>1800</#if></td>
            </tr>
             <tr>
                <td class="">认定房屋补偿面积(m<sup>2</sup>)</td>
                <td class="">${bean.fwbcmj?default(0)}</td>
                <td class="">经营面积(m<sup>2</sup>)</td>
                <td class="" >${bean.operatearea?default(0)}</td>
                <td class="">本址在册人数</td>
                <td class="">${bean.localpeoplecount?default(0)}</td>
                <td class="">非本址在册人数</td>
                <td class="">${bean.notlocalpeoplecount?default(0)}</td>
                <td class="">认定人数总和</td>
                <td class="">${bean.localpeoplecount?number+bean.notlocalpeoplecount?number}</td>
            </tr>
            <tr>
                <td class="">被认定全体人员（注明代际关系）</td>
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
                <td class="" colspan=3>宅基地腾退补偿总价</td>
                <td class="" colspan=7>${bean.zjdttzj?default("")}</td>
            </tr>
            <tr>	
                <td class="" colspan=5>一，宅基地补偿款合计</td>
                <td class="" colspan=2>${bean.zjdttbck?default("")}</td>
                <td class="" colspan=3>房屋重置米均价</td>
            </tr>
            <tr>
                <td class="">1</td>
                <td class="" colspan=4>控制区位补偿价</td>
                <td class="" colspan=2>${bean.kzzjdqwbcj?default("")}</td>
                <td class="" colspan=3 >${bean.kzqwbcmjj?default("")}</td>
            </tr>
            <tr>
                <td class="">2</td>
                <td class="" colspan=4>超控制区位补偿价</td>
                <td class="" colspan=2>${bean.ckzjdqwbcj?default("")}</td>
                <td class="" colspan=3>${bean.ckzqwbcmjj?default("")}</td>
            </tr>
            <tr>
                <td class="">3</td>
                <td class="" colspan=4>房屋价款</td>
                <td class="" colspan=2>${bean.bttfwczcxj?default("")}</td>
                <td class="" colspan=3>${bean.fwjkmjj?default("")}</td>
            </tr>
            <tr>
                <td class="">4</td>
                <td class="" colspan=4>装修、设备附属物价款</td>
                <td class="" colspan=2>${bean.zxsbfswjk?default("")}</td>
                <td class="" colspan=3>${bean.sbzxmjj?default("")}</td>
            </tr>
            <tr>
                <td class="" colspan=5>二、各项奖励、补助、周转合计</td>
                <td class="" colspan=2>${bean.jlfsum?default("/")}</td>
                <td class="" colspan=3 >备注</td>
            </tr>

            <tr>
                <td class="">1</td>
                <td class="" colspan=2>提前搬家奖</td>
                <td class="" colspan=2>（5000元/院）</td>
                <td class="" colspan=2>${bean.tqbjl?default("/")}</td>

                <td class="" colspan=3 rowspan=13></td>
            </tr>
            <tr>
                <td class="">2</td>
                <td class=""  colspan=2>工程配合奖</td>
                <td class=""  colspan=2>（100000元/院）</td>
                <td class="" colspan=2>${bean.gcphjl?default("")}</td>
            </tr>
            <tr>
                <td class="">3</td>
                <td class=""  colspan=2>腾退促进奖</td>
                <td class=""  colspan=2>（50000元/院）</td>
                <td class="" colspan=2>${bean.ttcjjl?default("/")}</td>

            </tr>
            <tr>
                <td class="">4</td>
                <td class=""  colspan=2>无违章奖励</td>
                <td class=""  colspan=2>（500元㎡）</td>
                <td class="" colspan=2>${bean.wwzjl?default("/")}</td>


            </tr>
            <tr>
                <td class="">5</td>
                <td class=""  colspan=2>未建二层奖</td>
                <td class=""  colspan=2>（500元㎡）</td>
                <td class="" colspan=2>${bean.wjecjj?default("/")}</td>
            </tr>
            <tr>
                <td class="">6</td>
                <td class=""  colspan=2>已建二层补助</td>
                <td class=""  colspan=2>（500元㎡）</td>
                <td class="" colspan=2>${bean.wjpzyjecbz?default("/")}</td>
            </tr> 
            <tr>
                <td class="">7</td>
                <td class=""  colspan=2>家电迁移补助</td>
                <td class=""  colspan=2>（12000元/院）</td>
                <td class="" colspan=2>${bean.bjbz?default("/")}</td>

            </tr> 
            <tr>
                <td class="">8</td>
                <td class=""  colspan=2>大病补助</td>
                <td class=""  colspan=2>（50000元/人）</td>
                <td class="" colspan=2>${bean.dbbz?default("/")}</td>
            </tr> 
            <tr>
                <td class="">9</td>
                <td class=""  colspan=2>残疾补助</td>
                <td class=""  colspan=2>（30000元/人）</td>
                <td class="" colspan=2>${bean.cjbz?default("/")}</td>

            </tr> 
            <tr>
                <td class="">10</td>
                <td class=""  colspan=2>低保补助</td>
                <td class=""  colspan=2>（30000元/人）</td>
                <td class="" colspan=2>${bean.dbbz?default("/")}</td>
            </tr>
            <tr>
                <td class="">11</td>
                <td class=""  colspan=2>独生子女</td>
                <td class=""  colspan=2>（30000元/人）</td>
                <td class="" colspan=2>${bean.dsznbz?default("/")}</td>

            </tr>  
            <tr>
                <td class="">12</td>
                <td class=""  colspan=2>停产停业补助</td>
                <td class=""  colspan=2>（800元㎡）</td>
                <td class="" colspan=2>${bean.tctdbz?default("/")}</td>
            </tr>  
            <tr>
                <td class="">13</td>
                <td class=""  colspan=2>周转补助费</td>
                <td class=""  colspan=2>（1200元/人/月）</td>
                <td class="" colspan=2>${bean.zzbz?default("/")}</td>
            </tr> 
            <tr>
                <td class="" colspan=5>三、其他补助合计</td>
                <td class="" colspan=2>${bean.dsbzf?number+bean.xgbzf?number+bean.zjdypwpbz?number}</td>
                <td class="" colspan=3 rowspan=5>被腾退人确认无误签字（按指纹）</td>
            </tr>   
            <tr>
                <td class="">1</td>
                <td class=""  colspan=2>滴水补助</td>
                <td class=""  colspan=2>90000元/产权院</td>
                <td class="" colspan=2>${bean.dsbzf?default("/")}</td>
            </tr> 
           	<tr>
                <td class="">2</td>
                <td class=""  colspan=2>信鸽补助</td>
                <td class=""  colspan=2>30000元/产权院</td>
                <td class="" colspan=2>${bean.xgbzf?default("/")}</td>
            </tr> 
            <tr>
                <td class="">3</td>
                <td class=""  colspan=2 >宅基地应批未批</td>
                <td class=""  colspan=2>350000元/产权院</td>
                <td class="" colspan=2>${bean.zjdypwpbz?default("/")}</td>
            </tr>                
        </table>
    </div>
</div>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js" ></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<script type = "text/javascript">
    //设置模态框高度和宽度  
    $("#myModal .modal-dialog").width(750);
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