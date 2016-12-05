<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">【${housebasic.names?default("/")}】房屋腾退补偿安置协议</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save" onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body center">
    <div class="content xy-print-con" id="xy-print">
        <p class="title2" style="">北京市宅基地房屋腾退补偿安置协议</p>
        <p class="contex-1" style="margin-top: 25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;腾退人：<u>&nbsp;北京市丰台区长辛店镇张郭庄村民委员会&nbsp;</u>（以下简称甲方）
        </p>
        <p class="contex-1" style="margin-top: 15px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;被腾退人：<u>${housebasic.names?default("/")}</u> &nbsp;身份证号：<u> ${housebasic.idcard?default("/")}</u>（以下简称乙方）
        </p>

        <p class="contex-1" style="margin-top: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;依据北京市丰台区长辛店镇人民政府、北京中建方程投资管理有限公司及北京市丰台区长辛店镇张郭庄村村民委员会三方签订的《长辛店镇张郭庄村棚户区改造及环境整治项目委托实施腾退协议》相关内容，长辛店镇人民政府是“长辛店镇张郭庄村棚户区改造和环境整治项目”（以下简称本项目）的责任主体，负责指导、协调本项目全面工作；北京中建方程投资管理有限公司是经丰台区人民政府授权，作为本项目的实施主体，负责本项目腾退补偿资金的筹措；北京市丰台区长辛店镇张郭庄村村民委员会，作为本项目腾退主体即“腾退人”，负责本项目集体土地腾退范围内涉及宅基地及非住宅的腾退工作；“被腾退人”
            是指本项目集体土地腾退范围内，持有宅基地批准文件，或宅基地腾退补偿安置工作组认定的宅基地使用权人及影响宅基地房屋腾退的其它构筑物的所有者，每宗宅基地为一产权院。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;为加快腾退范围内宅基地、非住宅房屋腾退补偿安置工作，本项目采取村民自主腾退方式，腾退方式参照拆迁方式进行实施。经甲、乙双方协商一致，同意按照“安置房补偿的方式”对于权属于乙方的宅基地、房屋及附属物进行房屋腾退补偿安置，达成如下协议：
        </p>
        <p class="leftTitle">第一条&nbsp;&nbsp;腾退依据</p>
        <p class="contex-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;依据《北京市集体土地房屋拆迁管理办法》（北京市人民政府令第124号）、《北京市人民政府关于加强农村村民建房用地管理若干规定》（北京市人民政府令1989年第39号）、《丰台区人民政府关于〈北京市集体土地房屋拆迁管理办法〉的实施意见》（丰政发[2009]54号）、《长辛店镇宅基地腾退补偿安置指导意见》（丰长发[2016]27号）、经北京市丰台区长辛店镇张郭庄村民代表大会通过的《张郭庄村宅基地腾退补偿安置方案》及《张郭庄村宅基地腾退补偿安置实施细则》等相关文件。
            甲方作为本项目腾退主体，需要对权属于乙方的在本项目腾退范围内坐落于<u>
               &nbsp;&nbsp;&nbsp${housebasic.location?default("/")}&nbsp;&nbsp;</u>的宅基地、房屋及附属物进行自主腾退。
        </p>
        <p class="leftTitle">第二条&nbsp;&nbsp;宅基地认定</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.1、经受托测绘公司现场实测，现状实测用地面积<u>
           <#if housebasic.zjdarea??>${housebasic.zjdarea?string("0.00")}<#else>0.00</#if></u>平方米；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.2、经张郭庄村宅基地面积和人口认定工作组认定，乙方宅基地合法批准认定年限为<u>
            <#if (bean.homesteadyear?default("-1"))=='1'>82年后<#else>82年前</#if></u>。认定宅基地面积<u>
            <#if bean.rdzjdallarea??>${(bean.rdzjdallarea?number)?string("0.##")}<#else>0.00</#if></u>平方米，补偿宅基地面积<u>
            <#if bean.bczjdmj??>${bean.bczjdmj?string("0.00")}<#else>0.00</#if></u>平方米。其中：<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;宅基地控制面积<u>
            <#if bean.conhomestarea??>${bean.conhomestarea?string("0.00")}<#else>0.00</#if></u>平方米；超出宅基地控制面积<u>
            <#if bean.overhomesteadarea??>${bean.overhomesteadarea?string("0.00")}<#else>0.00</#if></u>平方米。
        </p>
        <p class="leftTitle">第三条&nbsp;&nbsp;房屋补偿面积</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.1、经受托测绘公司现场实测，现状实测房屋建筑面积<u>
            <#if housebasic.fwarea??>${housebasic.fwarea?string("0.00")}<#else>0.00</#if> </u>平方米。其中：首层建筑面积<u>
            <#if housebasic.firstfloorarea??>${housebasic.firstfloorarea?string("0.00")}<#else>0.00</#if></u>平方米；二层及以上建筑面积<u>
            <#if housebasic.abovetwoarea??>${housebasic.abovetwoarea?string("0.00")}<#else>0.00</#if></u>平方米；地下室建筑面积<u>
            <#if housebasic.basement??>${housebasic.basement?string("0.00")}<#else>0.00</#if></u>平方米；棚<u>
            <#if housebasic.shed??>${housebasic.shed?string("0.00")}<#else>0.00</#if></u>平方米。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.2、经认定工作组认定，认定房屋补偿面积<u>
           	<#if bean.fwbcmj??>${bean.fwbcmj?string("0.00")}<#else>0.00</#if></u>平方米。
        </p>
        <p class="leftTitle">第四条&nbsp;&nbsp;被安置人口认定</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经张郭庄村宅基地面积和人口认定工作组认定，认定被安置人口共<u>${housebasic.peoplecount?default("/")}</u>人，分别是：
        <#if housebasic.vacatelist??>
            <p class="contex-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在册人员：</p>
            <#list housebasic.vacatelist as vacate>
            <p class="contex-1">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：<u>&nbsp;&nbsp;&nbsp;&nbsp;${vacate.name}&nbsp;&nbsp;&nbsp;&nbsp;</u>
                &nbsp;&nbsp;&nbsp;&nbsp;身份证：<u>&nbsp;&nbsp;&nbsp;&nbsp;${vacate.idcard}&nbsp;&nbsp;&nbsp;&nbsp;</u>
            </p>
            </#list>
        </#if>
        <#if housebasic.list??>
        	<#if housebasic.list?size gt 0>
            <p class="contex-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;非在册人员：</p>
            <#list housebasic.list as cate>
                <p class="contex-1">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：<u>&nbsp;&nbsp;&nbsp;&nbsp;${cate.name}&nbsp;&nbsp;&nbsp;&nbsp;</u>
                    &nbsp;&nbsp;&nbsp;&nbsp;身份证：<u>&nbsp;&nbsp;&nbsp;&nbsp;${cate.idcard}&nbsp;&nbsp;&nbsp;&nbsp;</u>
                </p>
            </#list>
            </#if>
        </#if>
        </p>
        <p class="leftTitle">第五条&nbsp;&nbsp;安置房补偿</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.1、依据《张郭庄村宅基地腾退补偿安置方案》及《张郭庄村宅基地腾退补偿安置实施细则》等相关文件规定，结合乙方的定向安置房选房意愿，乙方可以在本项目指定的      张郭庄村棚户区改造              定向安置房项目购买定向安置房。
                     乙方“实际选房面积”为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<#if bean.sjxfmj??>${bean.sjxfmj?string("0.00")}<#else>0.00</#if> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>平方米，其中一居室<u>
            &nbsp;&nbsp;${bean.yjs?c?default("/")}&nbsp;&nbsp;</u>套，二居室<u>&nbsp;&nbsp;${bean.ljs70?number+bean.ljs75?number+bean.ljs80?number+bean.ljs85?number}&nbsp;&nbsp;</u>套，三居室<u>
            &nbsp;&nbsp;${bean.sjs?c?default("/")}&nbsp;&nbsp;</u>套。
        </p>

        <p class="leftTitle">第六条&nbsp;&nbsp;宅基地腾退补偿总价</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.1、甲方应当向乙方支付宅基地腾退补偿总价人民币<u>
            &nbsp;&nbsp;${bean.zjdttzj?c?default("/")}&nbsp;&nbsp;</u>（大写人民币：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.dxzjdttzj?default("/")}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>），包含宅基地腾退补偿款、被腾退房屋重置成新价、及各项奖励费、补助费等。具体如下：<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.1.1、宅基地腾退补偿款<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经<u>&nbsp;&nbsp;${bean.pgjg?default("/")}&nbsp;&nbsp;</u>评估，宅基地腾退补偿款<u>
            &nbsp;&nbsp;${bean.zjdttbck?c?default("/")}&nbsp;&nbsp;</u>元。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其中包括：<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）控制宅基地区位补偿价<u>&nbsp;&nbsp;${bean.kzzjdqwbcj?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）超控宅基地区位补偿价<u>&nbsp;&nbsp;${bean.ckzjdqwbcj?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）被腾退房屋重置成新价<u>&nbsp;&nbsp;${bean.bttfwczcxj?c?default("/")}&nbsp;&nbsp;</u>元。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（4）装修、设备、附属物价款<u>&nbsp;&nbsp;${bean.zxsbfswjk?c?default("/")}&nbsp;&nbsp;</u>元。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.1.2、各项奖励费、补助各分项合计<u>
            &nbsp;&nbsp;${bean.jlfsum?c?default("/")}&nbsp;&nbsp;</u>元。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其中包括：<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）提前搬家奖（5000元/产权院）<u>&nbsp;&nbsp;${bean.tqbjl?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）工程配合奖（100000元/产权院）<u>
            &nbsp;&nbsp;${bean.gcphjl?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）腾退促进奖（50000院/产权院）<u>
            &nbsp;&nbsp;${bean.ttcjjl?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（4）无违章奖励费（500元/平方米）<u>&nbsp;&nbsp;${bean.wwzjl?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（5）未建二层及地下室奖励费（500元/平方米）<u>
            &nbsp;&nbsp;${bean.wjecjj?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（6）未经批准已建二层或地下室补助费（500元/平方米）<u>&nbsp;&nbsp;${bean.wjpzyjecbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（7）搬家及家电迁移补助费（12000元/产权院）<u>
            &nbsp;&nbsp;${bean.bjbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（8）期房补助费（安置房总房款的10%）<u>&nbsp;&nbsp;${bean.qfbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（9）大病补助费（50000元/人）<u>&nbsp;&nbsp;${bean.dbbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（10）残疾补助（30000元/证）<u>&nbsp;&nbsp;${bean.cjbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（11）低保户补助（30000元/证）<u>&nbsp;&nbsp;${bean.dbhbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（12）独生子女奖励费（30000元/父母光荣证）<u>
            &nbsp;&nbsp;${bean.dsznbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（13）一次性停产停业综合补助费（1000元/平方米）<u>
            &nbsp;&nbsp;${bean.tctdbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（14）周转补助费（1500元/人/月） <u>
            &nbsp;&nbsp;${bean.zzbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
            
            <#assign dsbzf = bean.dsbzf?c?default(0)>
		    <#assign xgbzf = bean.xgbzf?c?default(0)>
		    <#assign zjdypwpbz = bean.zjdypwpbz?c?default(0)>
		    <#assign yhzbwxmbc = bean.yhzbwxmbc?c?default(0)>
		    <#assign qtbzhj = dsbzf?number+xgbzf?number+zjdypwpbz?number+yhzbwxmbc?number>
		    
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（15）其他补助费<u>&nbsp;&nbsp;${qtbzhj?c}&nbsp;&nbsp;</u>元；<br/>
        </p>
        <p class="leftTitle">第七条&nbsp;&nbsp;乙方腾退期限及要求</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.1 乙方应在<u><#if year??>${year?c}</#if></u>年<u>
           ${month?default()}</u>月<u>${day?default()}</u>日前完成腾退。乙方应在腾退前结清所有资源欠费（含乙方使用的水、电等费用），确保房屋和附属物内无任何人员和财产（即房屋和附属物完全具备拆除条件），并将所有房屋及附属物的钥匙交给甲方，由拆除公司验收合格后，甲方认定乙方腾退完毕。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.2 乙方承诺：在向甲方交付被腾退房屋后，乙方不再对该被腾退房屋主张任何权利。
        </p>
        <p class="leftTitle">第八条&nbsp;&nbsp;付款结算方式</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.1 甲方应当向乙方支付被腾退宅基地腾退补偿总价人民币<u>
            &nbsp;&nbsp;${bean.zjdttzj?c?default("/")}&nbsp;&nbsp;</u>元（大写人民币：<u>
            &nbsp;&nbsp;${bean.dxzjdttzj?default("/")}&nbsp;&nbsp;</u>）。根据乙方签署的《北京市定向安置房认购协议》相关约定，乙方应向定向安置房建设主体支付定向安置房购房款共计<u>
            &nbsp;&nbsp;${bean.azfgfk?c?default("/")}&nbsp;&nbsp;</u>元（大写人民币<u>&nbsp;&nbsp;${bean.dxazfgfk?default("/")}&nbsp;&nbsp;</u>）。甲方在乙方完成交房验收后到指定银行办理宅基地腾退补偿总价和定向安置房购房款差价结算，根据结算实际情况，甲乙双方同意按以下第<u>
            &nbsp;<#if bean.jshk?default(0) gt 0>8.2<#else>8.3</#if>&nbsp;&nbsp;</u>种方式进行结算：<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.2 乙方宅基地腾退补偿总价足以支付定向安置房购房款的，由甲方在项目审计部门审核通过后<u>&nbsp;20
            &nbsp;</u>个工作日内向乙方开具领款凭证，一次性发放抵扣定向安置房购房款后的宅基地腾退补偿总价结算余额<u>
            &nbsp;&nbsp;&nbsp;${bean.jshk?c?default("/")}&nbsp;&nbsp;&nbsp;</u>元（大写人民币：<u>&nbsp;&nbsp;&nbsp;&nbsp;${bean.dxjshk?default("/")}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u> ）；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.3
            乙方宅基地腾退补偿总价不足以支付定向安置房购房款的，甲方将乙方宅基地腾退补偿总价直接支付给定向安置房建设主体，甲方不再向乙方支付宅基地腾退补偿总价。乙方应按其所签署的《北京市定向安置房认购协议》所约定的期限向定向安置房建设主体补交剩余定向安置房购房款;<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.4
            乙方同意在甲方指定银行为双方办理宅基地腾退补偿总价付款业务及定向安置房购房款收款业务的相关单据上签字（盖章）。如乙方在办理宅基地腾退补偿总价领取和定向安置房购房款的交付手续过程中拒绝在相关单据上签字，甲方和指定银行有权终止宅基地腾退补偿总价的发放。<br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.5
             甲方按照乙方签订本协议之日起至定向安置房交房后  4  个月计算周转补助费，被腾退安置人口享受周转补助费的标准为  1500元/人/月 ，甲方暂按周转期  40个月 （含安置房交房后4个月）向乙方支付周转补助费。若实际周转期短于暂定周转期，乙方按实际剩余期限向甲方退还剩余期限的周转补助费；若实际周转期超过暂定周转期，甲方按照《张郭庄村宅基地腾退补偿安置实施细则》的规定向乙方继续核发周转补助费，甲方无需因实际周转期超过暂定周转期而向乙方支付其它任何形式的补偿或费用。
        </p>
        <p class="leftTitle">第九条&nbsp;&nbsp;宅基地腾退补偿总价的支付主体</p>
        <p class="contex-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北京中建方程投资管理有限公司作为丰台区长辛店镇张郭庄村棚户区改造和环境整治项目实施主体，负责项目腾退补偿资金的筹措。甲乙双方同意由北京中建方程投资管理有限公司按照上述约定的方式向乙方发放各项腾退补偿款项。 </p>
        <p class="leftTitle">第十条&nbsp;&nbsp;定向安置房的建设主体</p>
        <p class="contex-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北京中建方程投资管理有限公司是作为丰台区长辛店镇张郭庄村棚户区改造和环境整治项目定向安置房的建设主体，甲乙双方同意由北京中建方程投资管理有限公司依照上述约定的方式向乙方收缴购房款。 </p>
        <p class="leftTitle">第十一条&nbsp;&nbsp;房地权属注销登记</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11.1
            甲、乙双方签订本协议前，乙方应将宅基地使用证或房屋权属证明原件原件交予甲方，由甲方统一办理注销登记手续。乙方保证上述权属证书合法、真实、有效并具有排他性。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11.2
            因乙方原因未能将宅基地使用证或房屋权属证明原件原件交予甲方的，或上述权属证书存在虚假、不合法、无效等情况的，致使甲方不能办理注销登记手续、不能办理定向安置房权属证明，导致甲方损失的，由乙方承担全部责任。<br/>
        </p>
        <p class="leftTitle">第十二条&nbsp;&nbsp;乙方的承诺和保证</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.1 乙方在“腾退公告”需要实施腾退范围内,无其他土地使用权或房产权利或任何腾退利益或拆迁利益；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.2 乙方向甲方提供的所有土地、房屋权属、身份关系证明材料及其他相关证照类材料，均合法、有效、真实、全面；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.3
            乙方保证其在签署本协议之前已取得所有必要的共有权人、亲属（包括父母、继父母、养父母、配偶、子女、继子女、养子女、兄弟姐妹等）及有利益关系的第三人的授权，确认乙方本人有权签署和履行本协议；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.4 乙方保证其作为被腾退人主体的合法性和唯一性。
        </p>
        <p class="leftTitle">第十三条&nbsp;&nbsp;违约责任及其它赔偿责任</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13.1 甲方未按本协议约定期限向乙方支付宅基地腾退补偿总价的，每延期一日，应按应付宅基地腾退补偿总价的万分之 伍
            向乙方支付违约金。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13.2 乙方未按本协议第七条规定的期限完成搬迁的，每延期一日，应按本协议第六条约定的宅基地腾退补偿总价的万分之 伍
            向甲方支付违约金。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13.3
            乙方未按本协议第八条规定的期限向定向安置房建设主体补交房款的，应按照其所签署的《北京市定向安置房购房协议》的相关约定承担违约责任；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13.4
            若乙方未能确保其作为被腾退人主体的合法性和唯一性，而与甲方签订本协议的，在本协议签署后宅基地上被腾退人发生变更的，乙方除退还宅基地腾退补偿总价及定向安置房外，还应向甲方赔偿宅基地腾退补偿总价的百分之一。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13.5
            本协议下的宅基地、房屋及附属物上产生的任何纠纷，包括但不限于任何第三人主张权利或引起诉讼、仲裁、纠纷，均与甲方无关，乙方应承担全部责任，由此给甲方造成损失的（包括经济损失和名誉损失），乙方应予以全额赔偿，甲方有权直接从宅基地腾退补偿总价中扣除赔偿金额，有权拒绝交付定向安置房，直至纠纷解决或甲方得到乙方的赔偿。
        </p>
        <p class="leftTitle">第十四条&nbsp;&nbsp;争议解决</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本协议生效后，在履行中如发生争议，甲、乙双方应争取协商解决；协商不成的，甲、乙双方同意按以下第<u>&nbsp;2&nbsp;</u>种方式解决：<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1)向北京仲裁委员会申请仲裁；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2)向被腾退房屋所在地的人民法院提起诉讼。
        </p>
        <p class="leftTitle">第十五条&nbsp;&nbsp;协议生效及其他事宜</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15.1本协议自甲方与乙方双方签字、盖章之日起生效。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15.2本协议未尽事宜由双方另行协商并签订补充协议。补充协议作为本协议的有效组成部分，与本协议有相同的法律效力。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15.3本协议一式陆份，甲乙双方各持壹份，其余肆份报政府相关部门备案。
        </p>
        <p class="leftTitle">（以下无正文）</p>
        <p class="pageBreak" style="margin-top: 570px;">&nbsp;</p>

        <p class="leftTitle">（签字页）</p>

        <p class="contex-1" style="margin-top: 20px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甲方：北京市丰台区长辛店镇张郭庄村民委员会
        </p>
        <p class="contex-1" style="margin-top: 50px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法定代表人或委托代理人（签字）：
        </p>
        <p class="contex-1" style="margin-top: 50px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签署时间：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日
        </p>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <p class="contex-1" style="margin-top: 50px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乙方（签字并按指纹）：
        </p>
        <p class="contex-1" style="margin-top: 50px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委托代理人(签字并按指纹)：
        </p>
        <p class="contex-1" style="margin-top: 50px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签署时间：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日
        </p>
    </div>
    <div style="clear:both; height:20px;"></div>
</div>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js"></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
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