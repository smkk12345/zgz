<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">【${bean.names}】安置补偿方式金额审查表</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save"   onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body center">
    <div class=""  id="xy-print" style="font-size: 9px">
        <span class="title">安置补偿方式金额审查表</span>

        <table class="table1" cellpadding="0" cellspacing="0" width="650px;"  border="1">
            <tr>
                <td class=""colspan="10">（   张郭庄村 ）村宅基地房屋“安置房补偿”方式金额审查表（ ${bean.section}  ）标段</td>
            </tr>
            <tr>
                <td class="">被腾退人</td>
                <td class="">${bean.names?default("")} </td>
                <td class="">坐落</td>
                <td class=""colspan="4">${bean.location?default("")}</td>
                <td class="">签约时间</td>
                <td class=""colspan="2">${bean.operatedate?default("")}</td>
            </tr>
            <tr>
                <td class="">宅基地实测</td>
                <td class="">${bean.zjdarea?default("")}</td>
                <td class="">身份证</td>
                <td class="" colspan=3>${bean.idcard?default("")}</td>
                <td class="">认定年限</td>
                <td class=""><#if (bean.homesteadyear?default("-1"))=='0'>82年前<#elseif bean.homesteadyear?default("-1")=='1'>82年后<#else>/</#if></td>
                <td class="">签约顺序号</td>
                <td class="">${bean.indexNumStr?default("/")}</td>
            </tr>
            <tr>
                <td class="">实测建面</td>
                <td class="">${bean.fwarea?default("")}</td>
                <td class="">首层</td>
                <td class="" >${bean.firstfloorarea?default(0)}</td>
                <td class="">二层及以上</td>
                <td class="">${bean.abovetwoarea?default(0)}</td>
                <td class="">地下室</td>
                <td class="">${bean.basement?default(0)}</td>
                <td class="">棚</td>
                <td class="">${bean.shed?default(0)}</td>
            </tr>
			<tr>
			    <td class="" colspan=2>认定宅基地面积</td>
                <td class="" colspan=3>${bean.rdzjdallarea?default(0)}</td>
                <td class="" colspan=2>补偿宅基地面积</td>
                <td class="" colspan=3>${bean.bczjdmj?default(0)}</td>
			</tr>
            <tr>
                <td class="" colspan=1>控制面积</td>
                <td class="" colspan=1>${bean.conhomestarea?default(0)}</td>
                <td class="" >区位单价</td>
<!--                <td class="">${bean.kzzjdqwbcj?default(0)}</td>-->
                <td class="" >6000</td>
                <td class="" >超控面积</td>
                <td class="" >${bean.overhomesteadarea?default(0)}</td>
                <td class="" >区位单价</td>
                <td class="" colspan=3><#if (bean.homesteadyear?default("-1"))=='0'>3000<#else>1800</#if></td>
            </tr>
            <tr>
                <td class="">认定房屋补偿面积</td>
                <td class="">${bean.fwbcmj?default(0)}</td>
                <td class="">经营面积</td>
                <td class="" >${bean.operatearea?default(0)}</td>
                <td class="">本址在册户籍人数</td>
                <td class="">${bean.localpeoplecount?default(0)}</td>
                <td class="">非本址在册户籍人数</td>
                <td class="">${bean.notlocalpeoplecount?default(0)}</td>
                <td class="">认定人数总和</td>
                <td class="">${bean.localpeoplecount?number+bean.notlocalpeoplecount?number}</td>
            </tr>
            <tr>
                <td class="">被认定全体人员姓名（注明代际关系）</td>
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
                <td class="">应选面积</td>
                <td>${bean.yxmj?default("")}</td>
                <td colspan=2>实际选房面积</td>
                <td colspan=1>${bean.sjxfmj?default("")}</td>
                <td colspan=3>选房总套数</td>
                <td >${bean.xfts?default("")}</td>
                <td >套</td>
            </tr>
            <tr>
                <td class="">一居（55）</td>
                <td class="">${bean.yjs?default("")}</td>
                <td class="">二居（70）</td>
                <td class="" >${bean.ljs70?default("")}</td>
                <td class="">二居（75）</td>
                <td class="">${bean.ljs75?default("")}</td>
                <td class="">二居（80）</td>
                <td class="">${bean.ljs80?default("")}</td>
                <td class="">二居（85）</td>
                <td class="">${bean.ljs85?default("")}</td>
            </tr>
            <tr>
                <td class="">三居</td>
                <td class="">${bean.sjs?default("")}</td>
                <td class="">指标内购房款（4000元㎡）</td>
                <td class="" colspan=2>${bean.zbngfk?default("/")}</td>
                <td>指标外房款（6000元/</td>
                <td>${bean.zbwgfk?default("/")}</td>
                <td>总购房款</td>
                <td colspan=2>${bean.azfgfk?default("")}</td>
            </tr>

            <tr>
                <td class="" colspan=3>宅基地腾退补偿总价</td>
                <td class="" colspan=2>${bean.zjdttzj?default("")}</td>
                <td class="" colspan=3>宅基地腾退补偿总价抵扣购房款余额</td>
                <td class="" colspan=2>${bean.jshk?default("")}</td>
            </tr>
            <tr>	
                <td class="" colspan=3>一，宅基地补偿款合计</td>
                <td class="" colspan=2>${bean.zjdttbck?default("")}</td>
                <td class="" colspan=5>结算方式相关</td>
            </tr>
            <tr>
                <td class="">1</td>
                <td class="">控制区位补偿价</td>
                <td class="" colspan=3>${bean.kzzjdqwbcj?default("")}</td>
                <td class="" colspan=5 >方式一（抵扣有余额）</td>
            </tr>
            <tr>
                <td class="">2</td>
                <td class="">超控制区位补偿价</td>
                <td class="" colspan=3>${bean.ckzjdqwbcj?default("")}</td>
                <td class="" colspan=2>宅基地腾退补偿总价</td>   
                <td class="" colspan=2><#if bean.jshk?default(0) gt 0>${bean.zjdttzj?default("")}<#else></#if></td>
                <td class="" colspan=1>元</td>
            </tr>
            <tr>
                <td class="">3</td>
                <td class="">房屋价款</td>
                <td class="" colspan=3>${bean.bttfwczcxj?default("")}</td>

                <td class="" colspan=2>总购房款</td>
                <td class="" colspan=2><#if bean.jshk?default(0) gt 0>${bean.azfgfk?default("")}<#else></#if></td>
                <td class="" colspan=1>元</td>
            </tr>
            <tr>
                <td class="">4</td>
                <td class="">装修、设备附属物价款</td>
                <td class="" colspan=3>${bean.zxsbfswjk?default("")}</td>
                <td class="" colspan=2>补偿总价抵扣购房款余额</td>
                <td class="" colspan=2><#if bean.jshk?default(0) gt 0>${bean.jshk?default("")}<#else></#if></td>
                <td class="" colspan=1>元</td>
            </tr>
            <tr>
                <td class="" colspan=3>二、各项奖励、补助、周转合计</td>
                <td class="" colspan=2>${bean.jlfsum?default("/")}</td>
                <td class="" colspan=5 >方式二（补偿总价不足以抵扣购房款）（倒挂需补交）</td>
            </tr>

            <tr>
                <td class="">1</td>
                <td class="">提前搬家奖</td>
                <td class="">（5000元/院）</td>
                <td class="" colspan=2>${bean.tqbjl?default("/")}</td>

                <td class="" colspan=2>宅基地腾退补偿总价</td>
                <td class="" colspan=2> <#if bean.jshk?default(0) gt 0><#else>${bean.zjdttzj?default("")}</#if></td>
                <td class="" colspan=1>元</td>
            </tr>
            <tr>
                <td class="">2</td>
                <td class="">工程配合奖</td>
                <td class="">（100000元/院）</td>
                <td class="" colspan=2>${bean.gcphjl?default("")}</td>

                <td class="" colspan=2>总购房款</td>
                <td class="" colspan=2><#if bean.jshk?default(0) gt 0><#else>${bean.azfgfk?default("")}</#if></td>
                <td class="" colspan=1>元</td>
            </tr>
            <tr>
                <td class="">3</td>
                <td class="">腾退促进奖</td>
                <td class="">（50000元/院）</td>
                <td class="" colspan=2>${bean.ttcjjl?default("/")}</td>

                <td class="" colspan=2>补偿总价抵扣购房款余额</td>
                <td class="" colspan=2><#if bean.jshk?default(0) gt 0><#else>${bean.jshk?default("")}</#if></td>
                <td class="" colspan=1>元</td>
            </tr>
            <tr>
                <td class="">4</td>
                <td class="">无违章奖励</td>
                <td class="">（500元㎡）</td>
                <td class="" colspan=2>${bean.wwzjl?default("/")}</td>

                <td class="" colspan=2 rowspan=3>腾退服务公司经手人签字</td>
                <td class="" colspan=3 rowspan=3></td>

            </tr>
            <tr>
                <td class="">5</td>
                <td class="">未建二层奖</td>
                <td class="">（500元㎡）</td>
                <td class="" colspan=2>${bean.wjecjj?default("/")}</td>
            </tr>
            <tr>
                <td class="">6</td>
                <td class="">已建二层补助</td>
                <td class="">（500元㎡）</td>
                <td class="" colspan=2>${bean.wjpzyjecbz?default("/")}</td>
            </tr> 
            <tr>
                <td class="">7</td>
                <td class="">家电迁移补助</td>
                <td class="">（12000元/院）</td>
                <td class="" colspan=2>${bean.bjbz?default("/")}</td>

                <td class="" colspan=5>实施主体意见</td>
            </tr> 
            <tr>
                <td class="">8</td>
                <td class="">期房补助费</td>
                <td class="">（总购房款10%）</td>
                <td class="" colspan=2>${bean.qfbz?default("/")}</td>

                <td class="" colspan=2 rowspan=4>内审组经手人签字</td>
                <td class="" colspan=3 rowspan=4></td>
            </tr> 
            <tr>
                <td class="">9</td>
                <td class="">大病补助</td>
                <td class="">（50000元/人）</td>
                <td class="" colspan=2>${bean.dbbz?default("/")}</td>
            </tr> 
            <tr>
                <td class="">10</td>
                <td class="">残疾补助</td>
                <td class="">（30000元/人）</td>
                <td class="" colspan=2>${bean.cjbz?default("/")}</td>

                <td class="" colspan=3 rowspan=2></td>

            </tr> 
            <tr>
                <td class="">11</td>
                <td class="">低保补助</td>
                <td class="">（30000元/人）</td>
                <td class="" colspan=2>${bean.dbhbz?default("/")}</td>
            </tr>
            <tr>
                <td class="">12</td>
                <td class="">独生子女</td>
                <td class="">（30000元/人）</td>
                <td class="" colspan=2>${bean.dsznbz?default("/")}</td>
                <td class="" colspan=2 rowspan=4>备注</td>
                <td class="" colspan=3 rowspan=4></td>
            </tr>  
            <tr>
                <td class="">13</td>
                <td class="">停产停业补助</td>
                <td class="">（800元㎡）</td>
                <td class="" colspan=2>${bean.tctdbz?default("/")}</td>
            </tr>  
            <tr>
                <td class="">14</td>
                <td class="">周转补助费</td>
                <td class="">（1200元/人/月）</td>
                <td class="" colspan=2>${bean.zzbz?default("/")}</td>
            </tr> 
            <tr>
                <td class="">15</td>
                <td class="">其他补助</td>
                <td class="">35万、信鸽补助、滴水补助</td>
                <td class="" colspan=2>${bean.dsbzf?number+bean.xgbzf?number+bean.zjdypwpbz?number+bean.yhzbwxmbc?number}</td>
            </tr>                   
        </table>
        <div style="clear:both; height:20px;"></div>
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