<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="com.app.lzcq.model.ResettlementAgreement" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.sqds.utils.MoneyUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>搬迁补偿安置协议信息</title>
    <link rel="stylesheet" href="/new/css/bootstrap.css">
    <script src="/new/js/jquery1.9.0.min.js"></script>
    <script src="/plugins/LodopFuncs/LodopFuncs.js"></script>
    <script type="text/javascript">
        var LODOP; //声明为全局变量
        function toprint() {
            document.getElementById("myTab").style.display = 'none';
            document.getElementById("printBtn").style.display = 'none';
            window.print();
//            LODOP = getLodop();
//            LODOP.ADD_PRINT_HTM(35, 20, "94%", "92%", document.body.innerHTML);
//            LODOP.ADD_PRINT_HTM("97%", "47%", 0, "45%", "第<span tdata='pageNO'>#</span>/<span tdata='pageCount'>#</span>页");
//            LODOP.SET_PRINT_STYLEA(0, "ItemType", 1);//循环上一命令（页码）
//            LODOP.PREVIEW();
            document.getElementById("myTab").style.display = '';
            document.getElementById("printBtn").style.display = '';
        }
    </script>
</head>
<body style="clear: both;">
<c:set scope="request" var="pageName" value="print"/>
<c:set scope="request" var="agreement" value="${agreement}"/>
<%@include file="tabPage.jsp" %>
<div id="printBtn" style="position: absolute;right: 20px;top: 0px;">
    <span style="color: red;">建议使用【360浏览器急速模式】打印</span>
    <input type="button" value="打印" class="btn btn-info" style="width:80px;" onclick="toprint();"/>
    <input type="button" value="返回列表" class="btn btn-info" style="width:100px;" onclick="location.href='manager.do';"/>
</div>
<style>
    body, html {
        padding: 0px;
        margin: 0px;
        font-family: 宋体;
        clear: both;
    }

    #printContent {
        clear: both;
        width: 650px;
        font-size: 16px;
    }

    #printContent p {
        margin:8px 0;
        line-height: 23px;
        text-indent: 2em;
        text-align: left;
    }
    #printContent .firstTable{
        width: 100%;
        font-size: 16px;
    }
    #printContent .firstTable tr{
        line-height: 22px;
        height: 22px;
    }
    #printContent .firstTable tr td{
        text-align: left;
        padding-left: 0px;
    }
    #printContent .firstTable tr .bottom{
        border-bottom: 1px solid #000000;
        text-align: left;
        font-size: 16px;
    }
    #printContent .pageBreak{
        page-break-before: always;
    }
    #printContent .dataTable {
        width: 100%;
        /*border: 1pt ridge #535252;*/
        border-color: #000000;
        border-collapse: collapse;
        background-color: #ffffff;
    }
    #printContent .dataTable tr td {
        /*border: 1pt ridge #535252;*/
        line-height: 25px;
        height: 25px;
        text-align: center;
        /*margin: 5px;*/
    }
    #printContent .bold{
        font-weight: bold;
    }
</style>
<center>
    <div id="printContent">
        <p style="font-size: 25px;font-weight: bold;text-align: center;line-height: 28px;">大康鞋城棚户区改造项目<br/>&nbsp;&nbsp;&nbsp;&nbsp;搬迁补偿安置协议</p>
        <p style="margin-top: 20px;font-weight: bold;text-indent: 0em;">搬迁人（以下简称甲方）：</p>
        <table class="firstTable">
            <tr>
                <td style="font-weight: bold;width: 28%;text-indent: 0em;">被搬迁人（以下简称乙方）：</td>
                <td class="bottom" style="width: 12%;">${agreement.name}</td>
                <td style="width: 11%;">身份证号码：</td>
                <td class="bottom" style="width: 16%;">${not empty agreement.idCard ? agreement.idCard : '/'}</td>
            </tr>
        </table>
        <table class="firstTable">
            <tr>
                <td style="width: 8%;text-indent: 0em;">通讯地址：</td>
                <td class="bottom" style="width: 20%;">${empty agreement.connAddress ? '/':agreement.connAddress}</td>
                <td style="width: 6%;">邮政编码：</td>
                <td class="bottom" style="width: 10%;">${empty agreement.postalCode ? '/':agreement.postalCode}</td>
            </tr>
        </table>
        <table class="firstTable">
            <tr>
                <td style="width: 11%;text-indent: 0em;">联系电话1：</td>
                <td class="bottom" style="width: 17%;">${empty agreement.phoneNumberOne ? '/':agreement.phoneNumberOne}</td>
                <td style="width: 8%;">联系电话2：</td>
                <td class="bottom" style="width: 17%;">${empty agreement.phoneNumberTwo ? '/':agreement.phoneNumberTwo}</td>
            </tr>
        </table>
        <table class="firstTable">
            <tr>
                <td style="width: 11%;text-indent: 0em;">乙方代理人：</td>
                <td class="bottom" style="width: 15%;">${empty agreement.nameWt ? '/' : agreement.nameWt}</td>
                <td style="width: 8%;">身份证号码：</td>
                <td class="bottom" style="width: 16%;">${not empty agreement.idCardWt ? agreement.idCardWt : '/'}</td>
            </tr>
        </table>
        <table class="firstTable">
            <tr>
                <td style="width: 8%;text-indent: 0em;">通讯地址：</td>
                <td class="bottom" style="width: 20%;">${empty agreement.connAddressWt ? '/':agreement.connAddressWt}</td>
                <td style="width: 6%;">邮政编码：</td>
                <td class="bottom" style="width: 10%;">${empty agreement.postalCodeWt ? '/':agreement.postalCodeWt}</td>
            </tr>
        </table>
        <table class="firstTable">
            <tr>
                <td style="width: 11%;text-indent: 0em;">联系电话1：</td>
                <td class="bottom" style="width: 17%;">${empty agreement.phoneNumberOneWt ? '/':agreement.phoneNumberOneWt}</td>
                <td style="width: 8%;">联系电话2：</td>
                <td class="bottom" style="width: 17%;">${empty agreement.phoneNumberTwoWt ? '/':agreement.phoneNumberTwoWt}</td>
            </tr>
        </table>
        <p>依据《大康鞋城棚户区改造项目宅基地搬迁补偿安置办法》相关规定，甲、乙双方在自愿、平等的基础上经协商一致，就乙方宅基地及地上房屋搬迁补偿安置事宜达成如下协议：</p>
        <p class="bold">1.乙方承诺</p>
        <p>1.1乙方已认真阅读并理解本协议附件《大康鞋城棚户区改造项目宅基地搬迁宣传手册》及《房屋搬迁评估报告》，对前述文件内容无异议。</p>
        <p>1.2乙方合法拥有本协议项下被搬迁房屋所有权及其土地使用权，该房屋及其土地权属清晰无争议，且乙方拥有完全的权利签订及履行本协议。否则，由此给甲方或第三方造成的一切损失，由乙方承担。</p>
        <p>1.3乙方保证被搬迁房屋于本协议签署时不存在出租情形，或乙方已与承租人达成解除租赁协议，或已对承租人进行妥善安置。</p>
        <p>1.4乙方保证提供给甲方的所有与搬迁补偿安置相关的证明材料均真实、合法、有效。如本协议签订后，甲方发现或任何第三方举报证明材料为虚假材料，甲方有权停止办理一切手续（包括但不限于结算、网上签约、安置房屋入住、产权登记手续等）并停止支付补偿款及奖励、补助费，由此造成的一切后果由乙方自行承担。如乙方已取得部分或全部补偿（包括货币和房屋安置补偿），乙方须全部退还。与此同时，乙方返还安置房屋时应按同等地段同等面积的市场租赁价格向甲方支付房屋使用费，房屋使用费自乙方办理入住手续之日起至该房屋实际返还之日止；退还补偿款及奖励、补助费时应按中国人民银行同期贷款利率的4倍向甲方支付利息，计息时间自该款项发放日至甲方收到乙方全部退还款项之日止；如产生物业费、供暖费等与安置房屋使用相关的费用，乙方应一并支付。</p>
        <p>1.5乙方知晓国家和北京市关于保障性住房的相关政策，保证己方及其家庭成员遵守现行及今后国家和北京市颁布的保障性住房相关规定及政策，并自愿接受相关部门的核查。如本协议签订后，甲方发现或任何第三方举报乙方及其家庭成员不符合保障性住房有关规定及政策、大康鞋城棚户区改造政策，乙方自行承担本协议项下安置房屋无法办理网上签约、房屋产权登记等手续的一切责任及损失。</p>
        <p class="bold">2.被搬迁房屋及被安置人口情况</p>
        <p>2.1乙方被搬迁房屋地址：<u>&nbsp;${agreement.houseAddress}&nbsp;</u></p>
        <p>2.2乙方宅基地面积为<u>&nbsp;${agreement.originalLandArea > 0 ? agreement.originalLandArea : '/'}&nbsp;</u>平方米，房屋建筑面积为<u>&nbsp;${agreement.houseConstructionArea > 0 ? agreement.houseConstructionArea : '/'}&nbsp;</u>平方米，其中用于经营的建筑面积为<u>&nbsp;${agreement.bussinessConstructionArea > 0 ? agreement.bussinessConstructionArea : '/'}&nbsp;</u>平方米。</p>
        <p>2.3本协议项下户籍户<u>&nbsp;${empty agreement.hjhs ? '/':agreement.hjhs}&nbsp;</u>户，被安置人口共<u>&nbsp;${ fn:length(agreementPersonList) > 0 ? fn:length(agreementPersonList) : '/' }&nbsp;</u>人，被安置人分别如下：</p>
        <table class="dataTable" border=1 cellSpacing=0 cellPadding=1>
            <tr>
                <td style="width: 10%;">序号</td>
                <td style="width: 30%;">姓名</td>
                <td style="width: 45%;">身份号码</td>
            </tr>
            <c:forEach items="${agreementPersonList}" var="person" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${person.name}</td>
                    <td>${person.cardID}</td>
                </tr>
            </c:forEach>
        </table>
        <p class="bold">3.搬迁补偿</p>
        <p>乙方选择的搬迁补偿方式：${agreement.compensationMethod eq 1 ?'☑':'□'}货币补偿方式&nbsp;&nbsp;${agreement.compensationMethod eq 2 ?'☑':'□'}房屋安置方式</p>
        <p class="bold">3.1货币补偿方式</p>
        <p>甲乙双方一致同意按照本协议附件所列《房屋搬迁评估报告》载明的宅基地及其地上房屋评估价格确定评估价款。</p>
        <%
            ResettlementAgreement agreement = (ResettlementAgreement) request.getAttribute("agreement");
            String rmb = "/";
            BigDecimal totalMoney = agreement.getTotalMoney();
            if(totalMoney!=null&&totalMoney.compareTo(new BigDecimal(0))>0){
            rmb = MoneyUtils.NumToRMBStr(totalMoney.doubleValue());
            }
         %>
        <p>乙方可获得的宅基地及其地上房屋货币补偿款为人民币（以下涉及币种均为人民币）<u>&nbsp;${agreement.compensationMethod eq 1 && agreement.houseAssessdecimal > 0 ? agreement.houseAssessdecimal : '/'}&nbsp;</u>元，乙方可获得的搬迁奖励及补助费为<u>&nbsp;${agreement.compensationMethod eq 1 && agreement.conpensationRewardAndGrantsSum > 0 ? agreement.conpensationRewardAndGrantsSum : '/'}&nbsp;</u>元,以上共计<u>&nbsp;${agreement.compensationMethod eq 1 && agreement.totalMoney > 0 ? agreement.totalMoney : '/'}&nbsp;</u>元（大写：<u>&nbsp;<%=agreement.getCompensationMethod().intValue()==1? rmb : "/" %>&nbsp;</u>）。</p>
        <p class="bold">3.2房屋安置方式</p>
        <p class="bold">3.2.1房屋评估价款</p>
        <p>甲乙双方一致同意按照本协议附件所列《房屋搬迁评估报告》载明的宅基地及其地上房屋评估价格确定评估价款。乙方可获得的宅基地及其地上房屋评估价款共计<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.houseAssessdecimal > 0 ? agreement.houseAssessdecimal : '/'}&nbsp;</u>元。</p>
        <p class="bold">3.2.2搬迁奖励及补助</p>
        <p>乙方可获得的搬迁奖励及补助费共计<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.conpensationRewardAndGrantsSum > 0 ? agreement.conpensationRewardAndGrantsSum : '/'}&nbsp;</u>元，其中包括：</p>
        <p>1、提前搬家奖：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.tqbjReward > 0 ? agreement.tqbjReward : '/'}&nbsp;</u>元；   2、工程配合奖：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.gcphReward > 0 ? agreement.gcphReward : '/'}&nbsp;</u>元；</p>
        <p>3、环境整治奖：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.hjzzReward > 0 ? agreement.hjzzReward : '/'}&nbsp;</u>元；  4、综合补助费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.zhbzReward > 0 ? agreement.zhbzReward : '/'}&nbsp;</u>元；</p>
        <p>5、搬家补助费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.bjbzReward > 0 ? agreement.bjbzReward : '/'}&nbsp;</u>元；  6、周转补助费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.zzbzReward > 0 ? agreement.zzbzReward : '/'}&nbsp;</u>元；</p>
        <p>7、电话移机费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.dhyjReward > 0 ? agreement.dhyjReward : '/'}&nbsp;</u>元；  8、空调移机费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.ktyjReward > 0 ? agreement.ktyjReward : '/'}&nbsp;</u>元；</p>
        <p>9、有线电视迁移费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.yxdsqyReward > 0 ? agreement.yxdsqyReward : '/'}&nbsp;</u>元；  10、宽带移机费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.kdyjReward > 0 ? agreement.kdyjReward : '/'}&nbsp;</u> 元；</p>
        <p>11、热水器改装费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.rsqgzReward > 0 ? agreement.rsqgzReward : '/'}&nbsp;</u>元；  12、残疾人员补助费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.cjrybzReward > 0 ? agreement.cjrybzReward : '/'}&nbsp;</u>元；</p>
        <p>13、低保户补助费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.dbhbzReward > 0 ? agreement.dbhbzReward : '/'}&nbsp;</u>元；  14、大病人员补助费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.dbrybzReward > 0 ? agreement.dbrybzReward : '/'}&nbsp;</u>元；</p>
        <p>15、停产停业损失补偿费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.tctyssbcReward > 0 ? agreement.tctyssbcReward : '/'}&nbsp;</u>元；  16、外迁补助费：<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.wqbzReward > 0 ? agreement.wqbzReward : '/'}&nbsp;</u>元；</p>
        <p class="bold">3.2.3本协议第3.2.1项和3.2.2项所列款项为搬迁补偿总款，合计为<u>&nbsp;${agreement.compensationMethod eq 2 && agreement.totalMoney > 0 ? agreement.totalMoney : '/'}&nbsp;</u>元（大写：<u>&nbsp;<%=agreement.getCompensationMethod().intValue()==2? rmb : "/" %>&nbsp;</u>）</p>
        <p class="bold">3.2.4购房指标 </p>
        <p>乙方同意按照4980元/平方米的价格购买定向安置房屋，购房指标为<u>&nbsp;${agreement.buyHouseIndicator > 0 ? agreement.buyHouseIndicator : '/'}&nbsp;</u>平方米（无论乙方是否指定第三人购买，均由乙方向房屋建设单位承担支付义务）。</p>
        <p class="bold">3.2.5定向安置房屋</p>
        <p>乙方可以挑选南庭新苑项目及阳光星苑项目的安置房屋（具体位置及户型图见选房现场示意图，如上述安置房屋售罄后，乙方同意甲方另行安排其他安置房屋房源），安置房屋产权按照经济适用房产权管理。安置房屋详情见本协议附件5《选房结果确认单》。</p>
        <p>安置房屋建设单位负责为乙方办理房屋转移登记、权属证明等手续。除本协议约定条件外，凡与购买安置房屋有关的事项均由乙方与房屋建设单位进行协商，如发生争议，由乙方与建设单位沟通解决。</p>
        <p class="bold">3.2.6差价结算</p>
        <p>甲、乙双方一致同意将本协议第3.2.3项所列款项与附件5《选房结果确认单》所记载的定向安置房购房款进行抵扣，并同意按照《大康鞋城棚户区改造项目宅基地搬迁补偿安置办法》第十二条第二款第（五）项约定进行结算。</p>
        <p class="bold">4.搬迁交房</p>
        <p>4.1乙方应于本协议签订并生效后7日内将被搬迁房屋腾空并通知甲方验收、交付甲方拆除。乙方向甲方交付被搬迁房屋前应结清水、电、燃气、通讯等与被搬迁房屋相关的各项费用，否则甲方有权从乙方搬迁补偿款及奖励、补助费中予以扣除。</p>
        <p>4.2乙方向甲方交付被搬迁房屋钥匙之日为乙方交房之日。</p>
        <p>4.3乙方交房时留存于房屋内的全部设施、设备及财产均视为乙方已经放弃该财产的全部权利且同意由甲方自行处置。甲方不对上述设施、设备及财产履行任何保管义务。被搬迁房屋内设施设备已经给予作价补偿的部分,乙方不得私自拆除， 对于私自拆除的部分从搬迁补偿款及奖励、补助费中予以扣除。</p>
        <p>4.4若乙方未能于上述规定期限内交房，则甲方有权按照《大康鞋城棚户区改造项目宅基地搬迁补偿安置办法》规定执行。</p>
        <p class="bold">5.证明文件的交付</p>
        <p>乙方应于本协议签署当日向甲方交付全部与宅基地、被搬迁房屋有关的权属证明及相关证明文件。</p>
        <p class="bold">6.通知与送达</p>
        <p>6.1本协议签订后，所有文件均可采用面呈、传真、邮寄方式送达至本协议所列各方通讯地址，乙方承诺该地址（包括乙方受托人地址）均为有效联络方式。采用面呈方式的，一方代表签收后即视为送达；采用传真方式的，文件进入对方系统后即视为送达；采用邮寄方式的，向联系地址投邮后48小时即视为送达（须提供邮寄凭证）。另外，甲方可以通过在搬迁范围张贴公告发布通知的方式送达，乙方不持异议。</p>
        <p>6.2乙方指定本协议所列乙方受托人作为甲方向乙方送达相关文件的联络人。乙方同意甲方仅以该受托人作为唯一联络人，甲方向该受托人送达相关文件视为已经向乙方送达。</p>
        <p>6.3本协议签署后，一方变更通讯地址的应于变更后24小时内主动按本协议约定的通知方式通知对方。否则，对方按原址送达仍然有效，变化方应当承担因此产生的一切法律后果。</p>
        <p class="bold">7.协议生效及其他</p>
        <p>7.1    年   月   日至   月   日为预签期，在预签期限内签约比例达到95%后，本协议生效，甲方将在搬迁范围内发布协议生效公告。本协议生效前，甲方不实际支付补偿款，也不实际提供房源。如预签期内未达到前述生效比例，本协议不生效，搬迁工作终止。</p>
        <p>7.2预签期后签订本协议，不受本条第1款条件限制，本协议自双方签字盖章之日起生效。</p>
        <p>7.3本协议附件为本协议不可分割的组成部分，与本协议具体同等法律效力。本协议有以下附件：</p>
        <p>附件1：被搬迁人及被安置人口的身份证复印件</p>
        <p>附件2：被搬迁房屋《房屋搬迁评估报告》</p>
        <p>附件3：《大康鞋城棚户区改造项目宅基地搬迁补偿安置办法》（本附件已于搬迁范围内公告）</p>
        <p>附件4：《大康鞋城棚户区改造项目宅基地搬迁宣传手册》（本附件已由甲方提供给乙方）</p>
        <p>附件5：《选房结果确认单》</p>
        <p>7.4本协议一式叁份，甲方持贰份，乙方持壹份，具有同等法律效力。</p>
        <p class="bold">8.争议解决</p>
        <p>因本协议的签订及履行而发生的一切争议，双方首先应当通过友好协商解决。协商不成时，任何一方有权向被搬迁房屋所在地人民法院提起民事诉讼。</p>
        <p>（本页以下无正文）</p>
        <p class="pageBreak">（本页为签署页）</p>
        <p style="margin-top: 35px;">甲方：</p>
        <p style="margin-top: 35px;">甲方法定代表人或委托人（签章）：</p>
        <p style="margin-top: 35px;">甲方经办人（签字）：</p>
        <p style="margin-top: 35px;">甲方签署日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</p>
        <p style="margin-top: 60px;">乙方（签字并按手印）：</p>
        <p style="margin-top: 35px;">乙方委托代理人（签字并按手印）：</p>
        <p style="margin-top: 35px;">代理人身份证明文件名称及号码：</p>
        <p style="margin-top: 35px;">代理人通讯地址：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮政编码：</p>
        <p style="margin-top: 35px;">联系电话1：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系电话2： </p>
        <p style="margin-top: 35px;">乙方签署日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;日</p>
    </div>
</center>
</body>
</html>