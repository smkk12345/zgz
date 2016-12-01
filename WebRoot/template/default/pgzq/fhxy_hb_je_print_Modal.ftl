<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">【${bean.names}】完全货币补偿方式金额审查表</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save"   >打印</button>
    </div>
</div>
<div class="modal-body center">
    <div class="content xy-print-con"  id="xy-print" style="font-size: 13px">
     <span class="title">完全货币补偿方式金额审查表</span>
        <div class="content" style="float:left;">
         <table class="table1" cellpadding="0" cellspacing="0" width="650px;"  border="1">
                <tr>
                	<td class="td_content_1"colspan="10">（张郭庄）村宅基地房屋“完全货币补偿”方式金额审查表（ ${bean.section?default("")} ）标段</td>
                </tr>
                <tr>
                    <td class="td_content_1">被腾退人</td>
                    <td class="td_content_1">${bean.names?default("")} </td>
                    <td class="td_content_1">坐落</td>
                    <td class="td_content_1"colspan="4">${bean.location?default("")}</td>
                    <td class="td_content_1">签约时间</td>
                    <td class="td_content_1"colspan="2">/</td>
                </tr>
                <tr>
                    <td class="td_content_1">宅基地实测</td>
                    <td class="td_content_1">${bean.zjdarea?default("")}</td>
 					<td class="td_content_1">身份证</td>
 					<td class="td_content_1" colspan=3>${bean.idcard?default("")}</td>
                    <td class="td_content_1">认定年限</td>
                    <td class="td_content_1" colspan="3">
                        <#if bean.homesteadyear??>
                            <#if bean.homesteadyear=="0">
                               82年前
                            <#else>
                               82年后
                            </#if>
                        </#if>
                    </td>
                </tr>
                <tr>
                    <td class="td_content_1">协议编号</td>
                    <td class="td_content_1" colspan="9">${bean.protocolnumber?default("/")}</td>
                </tr>
                <tr>
	                <td class="td_content_1">实测建面</td>
	                <td class="td_content_1">${bean.fwarea?default("")}</td>
	                <td class="td_content_1">首层</td>
	                <td class="td_content_1" >${bean.firstfloorarea?default(0)}</td>
	                <td class="td_content_1">二层及以上</td>
	                <td class="td_content_1">${bean.abovetwoarea?default(0)}</td>
	                <td class="td_content_1">地下室</td>
	                <td class="td_content_1">${bean.basement?default(0)}</td>
	                <td class="td_content_1">棚</td>
	                <td class="td_content_1">${bean.shed?default(0)}</td>
                </tr>
                
	             <tr>
				    <td class="td_content_1" colspan=2>认定宅基地面积</td>
	                <td class="td_content_1" colspan=3>${bean.rdzjdallarea?default(0)}</td>
	                <td class="td_content_1" colspan=2>补偿宅基地面积</td>
	                <td class="td_content_1" colspan=3>${bean.bczjdmj?default(0)}</td>
				</tr>
	            <tr>
	                <td class="td_content_1" colspan=1>控制面积</td>
	                <td class="td_content_1" colspan=1>${bean.conhomestarea?default(0)}</td>
	                <td class="td_content_1" >区位单价</td>
	<!--                <td class="td_content_1">${bean.kzzjdqwbcj?default(0)}</td>-->
	                <td class="td_content_1" >6000</td>
	                <td class="td_content_1" >超控面积</td>
	                <td class="td_content_1" >${bean.overhomesteadarea?default(0)}</td>
	                <td class="td_content_1" >区位单价</td>
	                <td class="td_content_1" colspan=3><#if (bean.homesteadyear?default("-1"))=='0'>3000<#else>1800</#if></td>
	            </tr>
	            
                <tr>
	                <td class="td_content_1">认定房屋补偿面积</td>
	                <td class="td_content_1">${bean.fwbcmj?default(0)}</td>
	                <td class="td_content_1">经营面积</td>
	                <td class="td_content_1" >${bean.operatearea?default(0)}</td>
	                <td class="td_content_1">本址在册户籍人数</td>
	                <td class="td_content_1">${bean.localpeoplecount?default(0)}</td>
	                <td class="td_content_1">非本址在册户籍人数</td>
	                <td class="td_content_1">${bean.notlocalpeoplecount?default(0)}</td>
	                <td class="td_content_1">认定人数总和</td>
	                <td class="td_content_1">${bean.localpeoplecount?number+bean.notlocalpeoplecount?number}</td>
                </tr>
                <tr>
                    <td class="td_content_1">被认定全体人员姓名（注明代际关系）</td>
                    <td class="td_content_1" colspan=9>
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
                    <td class="td_content_1" colspan=3>宅基地腾退补偿总价</td>
                    <td class="td_content_1" colspan=7>${bean.zjdttzj?default("")}</td>
                </tr>
                <tr>
                    <td class="td_content_1" colspan=3>一，宅基地补偿款合计</td>
                    <td class="td_content_1" colspan=2>${bean.zjdttbck?default("")}</td>
                    <td class="td_content_1" colspan=5>结算及领款内容</td>
                </tr>
                <tr>
                    <td class="td_content_1">1</td>
                    <td class="td_content_1">控制区位补偿价</td>
                    <td class="td_content_1" colspan=3>${bean.kzzjdqwbcj?default("")}</td>
                    <td class="td_content_1" colspan=5 rowspan=4>项目审计部门审核通过后，及时通知被腾退人在约定期限内进行搬迁，搬迁完毕并经拆除公司验收合格后，房屋交甲方拆除。在被腾退人完成交房验收后 20 个工作日内，开具领款凭证。</td>
                </tr>
                <tr>
                    <td class="td_content_1">2</td>
                    <td class="td_content_1">超控制区位补偿价</td>
                    <td class="td_content_1" colspan=3>${bean.ckzjdqwbcj?default("")}</td>
                </tr>
                <tr>
                    <td class="td_content_1">3</td>
                    <td class="td_content_1">房屋价款</td>
                    <td class="td_content_1" colspan=3>${bean.bttfwczcxj?default("")}</td>
                </tr>
                <tr>
                    <td class="td_content_1">4</td>
                    <td class="td_content_1">装修、设备附属物价款</td>
                    <td class="td_content_1" colspan=3>${bean.zxsbfswjk?default("")}</td>
                    
                </tr>
                <tr>
                    <td class="td_content_1" colspan=3>二、各项奖励、补助、周转合计</td>
                    <td class="td_content_1" colspan=2>${bean.jlfsum?default("/")}</td>
                    <td class="td_content_1" colspan=5 rowspan=4>腾退服务公司经手人签字</td>
                </tr>
                
				<tr>
                    <td class="td_content_1">1</td>
                    <td class="td_content_1">提前搬家奖</td>
                    <td class="td_content_1">（5000元/院）</td>
                    <td class="td_content_1" colspan=2>${bean.tqbjl?default("/")}</td>
                </tr>
				<tr>
                    <td class="td_content_1">2</td>
                    <td class="td_content_1">工程配合奖</td>
                    <td class="td_content_1">（100000元/院）</td>
                    <td class="td_content_1" colspan=2>${bean.gcphjl?default("")}</td>
                </tr>
				<tr>
                    <td class="td_content_1">3</td>
                    <td class="td_content_1">腾退促进奖</td>
                    <td class="td_content_1">（50000元/院）</td>
                    <td class="td_content_1" colspan=2>${bean.ttcjjl?default("/")}</td>
                </tr>
                <tr>
                    <td class="td_content_1">4</td>
                    <td class="td_content_1">无违章奖励</td>
                    <td class="td_content_1">（500元㎡）</td>
                    <td class="td_content_1" colspan=2>${bean.wwzjl?default("/")}</td>
                    <td class="td_content_1" colspan=5 rowspan=5>实施主体内审经手人签字</td>
                </tr>
                <tr>
                    <td class="td_content_1">5</td>
                    <td class="td_content_1">未建二层奖</td>
                    <td class="td_content_1">（500元㎡）</td>
                    <td class="td_content_1" colspan=2>${bean.wjecjj?default("/")}</td>
                </tr>
                <tr>
                    <td class="td_content_1">6</td>
                    <td class="td_content_1">已建二层补助</td>
                    <td class="td_content_1">（500元㎡）</td>
                    <td class="td_content_1" colspan=2>${bean.wjpzyjecbz?default("/")}</td>
                </tr> 
                 <tr>
                    <td class="td_content_1">7</td>
                    <td class="td_content_1">家电迁移补助</td>
                    <td class="td_content_1">（12000元/院）</td>
                    <td class="td_content_1" colspan=2>${bean.bjbz?default("/")}</td>
                </tr> 
                 <tr>
                    <td class="td_content_1">8</td>
                    <td class="td_content_1">大病补助</td>
                    <td class="td_content_1">（50000元/人）</td>
                    <td class="td_content_1" colspan=2>${bean.dbbz?default("/")}</td>
                </tr> 
                 <tr>
                    <td class="td_content_1">9</td>
                    <td class="td_content_1">残疾补助</td>
                    <td class="td_content_1">（30000元/人）</td>
                    <td class="td_content_1" colspan=2>${bean.cjbz?default("/")}</td>
                    <td class="td_content_1" colspan=5 rowspan=6>备注：</td>
                </tr> 
                 <tr>
                    <td class="td_content_1">10</td>
                    <td class="td_content_1">低保补助</td>
                    <td class="td_content_1">（30000元/人）</td>
                    <td class="td_content_1" colspan=2>${bean.dbhbz?default("/")}</td>
                </tr>
                <tr>
                    <td class="td_content_1">11</td>
                    <td class="td_content_1">独生子女</td>
                    <td class="td_content_1">（30000元/人）</td>
                    <td class="td_content_1" colspan=2>${bean.dsznbz?default("/")}</td>
                </tr>  
                <tr>
                    <td class="td_content_1">12</td>
                    <td class="td_content_1">停产停业补助</td>
                    <td class="td_content_1">（800元㎡）</td>
                    <td class="td_content_1" colspan=2>${bean.tctdbz?default("/")}</td>
                </tr>  
                <tr>
                    <td class="td_content_1">13</td>
                    <td class="td_content_1">周转补助费</td>
                    <td class="td_content_1">（1200元/人/月）</td>
                    <td class="td_content_1" colspan=2>${bean.zzbz?default("/")}</td>
                </tr> 
                <tr>
                    <td class="td_content_1">14</td>
                    <td class="td_content_1">其他补助</td>
                    <td class="td_content_1">35万、信鸽补助、滴水补助</td>
                    <td class="td_content_1" colspan=2>${bean.dsbzf?number+bean.xgbzf?number+bean.zjdypwpbz?number}</td>
                </tr>                   
            </table>
        </div>
        <div style="clear:both; height:20px;"></div>
    </div>
</div>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js" ></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<script type = "text/javascript">
    //设置模态框高度和宽度  
    $("#myModal .modal-dialog").width(750);
    $("#xy-print").css("height",($(window).height()-150)+"px");
    $("#xy-print").css("overflow-y","scroll");

    function yu_print1() {
        alert(1231);
        toExcel("yu-print-show", null);
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