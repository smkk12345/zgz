<div class="modal-header clearfix">
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save" onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body center">
    <div class="content xy-print-con" id="xy-print">
        <p class="xy-num" style="margin-top: 50px;">协议编号：<u>&nbsp;&nbsp;&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="title" style="margin-top: 25px;">定向安置房认购协议</p>
        <p class="title1" style="margin-top: 35px;">&nbsp;甲&nbsp;&nbsp;方：&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北京中建方程投资管理有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="title1" style="margin-top: 20px;">通讯地址：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="title1" style="margin-top: 20px;">邮政编码： <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>联系电话：
            <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="title1" style="margin-top: 50px;">&nbsp;乙&nbsp;&nbsp;方：&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.names?default("/")}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="title1" style="margin-top: 20px;">身份证号：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.idcard?default("/")}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="title1" style="margin-top: 20px;">通讯地址：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="title1" style="margin-top: 20px;">邮政编码： <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>联系电话：
            <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="contex-1" style="margin-top: 38px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;根据《中华人民共和国城市房地产管理法》、《丰台区人民政府关于〈北京市集体土地房屋拆迁管理办法〉的实施意见》（丰政发[2009]54号）、《长辛店镇宅基地腾退补偿安置指导意见》（丰长发〔2016〕27号）、《张郭庄村宅基地腾退补偿安置方案》及《张郭庄村宅基地腾退补偿安置实施细则》等相关文件，甲、乙双方在平等、自愿、公平、协商一致的基础上，就定向安置房认购事宜达成如下协议：
        </p>
        <p class="leftTitle">第一条&nbsp;&nbsp;房屋基本情况</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.1、依据乙方与腾退人签订的《北京市宅基地房屋腾退补偿安置协议》（协议编号为<u>&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;&nbsp;&nbsp;</u>）的约定，乙方自愿认购定向安置房共<u>
            &nbsp;&nbsp;&nbsp;&nbsp;${bean.xfts?default("")}&nbsp;&nbsp;&nbsp;&nbsp;</u>套，总面积为<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${bean.sjxfmj?default("")}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>平方米。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其中:<u>&nbsp;&nbsp;&nbsp;&nbsp;55&nbsp;&nbsp;&nbsp;</u>平方米一居室<u>
            &nbsp;&nbsp;&nbsp;&nbsp;${bean.yjs?default("")}&nbsp;&nbsp;</u>套，合计面积<u>&nbsp;&nbsp;&nbsp;
            <#if bean.yjs?default(0) gt 0>${bean.yjs?number*55}<#else></#if>&nbsp;&nbsp;&nbsp;</u>平方米；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;70&nbsp;&nbsp;&nbsp;</u>平方米两居室<u>
            &nbsp;&nbsp;&nbsp;${bean.ljs70?default("")}&nbsp;&nbsp;&nbsp;</u>套，合计面积<u>&nbsp;&nbsp;&nbsp;<#if bean.ljs70?default(0) gt 0>${bean.ljs70?number*55}<#else></#if>&nbsp;&nbsp;&nbsp;&nbsp;</u>平方米；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;75&nbsp;&nbsp;&nbsp;</u>平方米两居室<u>
            &nbsp;&nbsp;&nbsp;${bean.ljs75?default("")}&nbsp;&nbsp;&nbsp;</u>套，合计面积<u>&nbsp;&nbsp;&nbsp;<#if bean.ljs75?default(0) gt 0>${bean.ljs75?number*55}<#else></#if>&nbsp;&nbsp;&nbsp;&nbsp;</u>平方米；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;80&nbsp;&nbsp;&nbsp;</u>平方米两居室<u>
            &nbsp;&nbsp;&nbsp;${bean.ljs80?default("")}&nbsp;&nbsp;&nbsp;</u>套，合计面积<u>&nbsp;&nbsp;&nbsp;<#if bean.ljs80?default(0) gt 0>${bean.ljs80?number*55}<#else></#if>&nbsp;&nbsp;&nbsp;&nbsp;</u>平方米；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;85&nbsp;&nbsp;&nbsp;</u>平方米两居室<u>
            &nbsp;&nbsp;&nbsp;${bean.ljs85?default("")}&nbsp;&nbsp;&nbsp;</u>套，合计面积<u>&nbsp;&nbsp;&nbsp;<#if bean.ljs85?default(0) gt 0>${bean.ljs85?number*55}<#else></#if>&nbsp;&nbsp;&nbsp;&nbsp;</u>平方米；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<u>&nbsp;&nbsp;&nbsp;&nbsp;110&nbsp;&nbsp;&nbsp;</u>平方米三居室<u>
            &nbsp;&nbsp;&nbsp;${bean.sjs?default("")}&nbsp;&nbsp;&nbsp;</u>套，合计面积<u>&nbsp;&nbsp;&nbsp;<#if bean.sjs?default(0) gt 0>${bean.sjs?number*55}<#else></#if>&nbsp;&nbsp;&nbsp;&nbsp;</u>平方米；<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定向安置房建设地点位于张郭庄村棚户区改造和环境整治项目所指定的定向安置房建设区域（最终以政府相关主管部门审批文件为准）。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.2、本协议下有关面积最终以政府主管部门备案的实测建筑面积为准。
        </p>
        <p class="leftTitle">第二条&nbsp;&nbsp;购房标准及售价</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.1、根据《长辛店镇宅基地腾退补偿安置指导意见》（丰长发〔2016〕27号）、《张郭庄村宅基地腾退补偿安置方案》及《张郭庄村宅基地腾退补偿安置实施细则》等文件规定的购房标准为：经腾退补偿安置工作组认定的被安置人口，按人均50平方米确定购房指标；违反国家计划生育政策生育二胎及以上的，父母及其超生的子女按人均45平方米确定购房指标。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.2、由于安置房户型设计原因，实际购房面积超过购房指标，每宗宅基地不得超过30平方米；违反计划生育政策的被腾退人，实际购房面积不得超过购房指标20平方米。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.3、依据《张郭庄村棚户区改造和环境整治项目宅基地权属、认定人口确认结果一览表》的认定结果，乙方购买定向安置房指标内面积为<u>
            &nbsp;&nbsp;&nbsp;${bean.zbnmj?default("")}&nbsp;&nbsp;&nbsp;</u>平方米，实际购房面积不得超过购房指标<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>平方米。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.4、定向安置房售价为4000元/平方米；超过购房指标15平方米以内按照安置售房价即4000元/平方米计算；超过购房指标15—30平方米购房指标的，在安置售房价的基础上上浮50%即6000元/平方米。
        </p>
        <p class="leftTitle">第三条&nbsp;&nbsp;房屋价款</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.1、根据本协议第一条、第二条，乙方购买定向安置房<u>&nbsp;&nbsp;&nbsp;${bean.xfts?default("")}&nbsp;&nbsp;&nbsp;</u>套，总面积为<u>
            &nbsp;&nbsp;&nbsp;${bean.sjxfmj?default("")}&nbsp;&nbsp;&nbsp;</u>平方米，其中：购房指标内为<u>&nbsp;&nbsp;&nbsp;${bean.zbnmj?default("")}&nbsp;&nbsp;&nbsp;</u>
            平方米，超过购房指标面积为<u>&nbsp;&nbsp;${bean.czbmj?default("/")}&nbsp;&nbsp;&nbsp;</u>平方米。购房款总价暂定为<u>&nbsp;&nbsp;&nbsp;${bean.azfgfk?default("")}&nbsp;&nbsp;&nbsp;</u>元（大写人民币：<u>
            &nbsp;&nbsp;&nbsp;${bean.dxazfgfk?default("")}&nbsp;&nbsp;&nbsp;</u>），其中：购房指标内的购房款为<u>&nbsp;&nbsp;&nbsp;${bean.zbngfk?default()}&nbsp;&nbsp;&nbsp;</u>元（大写人民币：<u>
            &nbsp;&nbsp;&nbsp;${bean.dxzbngfk?default()}&nbsp;&nbsp;&nbsp;</u>），超过购房指标的购房款为<u>&nbsp;&nbsp;&nbsp;${bean.zbwgfk?default()}&nbsp;&nbsp;&nbsp;</u>元（大写人民币：<u>
            &nbsp;&nbsp;&nbsp;${bean.dxzbwgfk?default()}&nbsp;&nbsp;&nbsp;</u>）。购房款的最终结算根据本协议第八条“房款结算及相关费用缴纳”中的约定来确定。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.2、本协议第三条第1款中的购房款不包括购买该房屋所应缴纳的物业费、供暖费、公共维修基金、契税及其他按照国家相应法律法规及政策所需缴纳的相关费用，上述费用的收费标准根据国家法律法规及政府相关政策执行。
        </p>
        <p class="leftTitle">第四条&nbsp;&nbsp;付款方式</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.1、根据相关政策规定以及乙方签署的《北京市宅基地房屋腾退补偿安置协议》（协议编号为<u>&nbsp;&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;&nbsp;</u>），乙方在领取腾退补偿总价款的同时，向甲方一次性支付本协议第三条第1款中暂定的购房款<u>
            &nbsp;&nbsp;&nbsp;${bean.azfgfk?default("/")}&nbsp;&nbsp;&nbsp;</u>元（大写人民币：<u>&nbsp;&nbsp;&nbsp;${bean.dxazfgfk?default("/")}&nbsp;&nbsp;&nbsp;</u>）。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.2、若乙方的腾退补偿总价款足以支付定向安置房购房款，乙方同意由甲方指定的银行从乙方腾退补偿总价款中扣除定向安置房购房款，并将该款项支付给甲方。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.3、若乙方的腾退补偿总价款不足以支付定向安置房购房款，乙方同意由甲方指定的银行将乙方的腾退补偿总价款全部支付给甲方；同时，乙方根据本协议第四条第1款的约定，将定向安置房购房款差额部分向甲方一次性付清。
        </p>
        <p class="leftTitle">第五条&nbsp;&nbsp;逾期付款责任</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乙方未按照本协议第四条所约定的时间和方式付款的，按逾期时间分别处理：<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.1、逾期付款在 30 日之内的，每逾期一日，乙方应在支付应付款的同时，向甲方支付逾期应付款万分之
            0.5的违约金，协议继续履行。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.2、逾期超过 30 日的，甲方有权解除本协议。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.2.1、若甲方解除本协议的，乙方应当自解除协议通知送达之日起 15日内，按照逾期应付款的 1
            %向甲方支付违约金，并由甲方退还乙方全部已付款，已付款不计息，且视为乙方自动放弃定向安置房补偿方式。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.2.2、若乙方愿意继续履行协议的，经甲方同意后，协议继续履行；每逾期一日，乙方应在支付应付款的同时，向甲方支付逾期应付款万分之
            1的违约金。
        </p>
        <p class="leftTitle">第六条&nbsp;&nbsp;选房顺序及要求</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.1、根据“以签订房屋腾退补偿安置协议日期为准，先签订腾退补偿安置协议的先选房”的定向安置房选房原则，甲方依据腾退人与乙方签订《北京市宅基地房屋腾退补偿安置协议》（协议编号为<u>
            &nbsp;&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;&nbsp;</u>）时确定的顺序号，作为选房顺序的唯一依据。选房工作的具体时间安排由属地政府、腾退主体及甲方根据实际情况决定。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.2、乙方于<u>&nbsp;${year}&nbsp;</u>年<u>&nbsp;${month}&nbsp;</u>月<u>
            &nbsp;${day}&nbsp;</u>日<u>&nbsp;${hour}&nbsp;</u>时<u>
            &nbsp;${minute}&nbsp;</u>分<u>&nbsp;${second}&nbsp;</u>秒签署了《北京市宅基地房屋腾退补偿安置协议》（协议编号：<u>
            &nbsp;&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;&nbsp;</u>），乙方可根据上述时点的具体排序进行选房。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.3、甲方在选房工作开始之日的<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日前，根据乙方签订《北京市宅基地房屋腾退补偿安置协议》（协议编号：<u>
            &nbsp;&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;&nbsp;</u>）的时点排定次序，书面（或电话）通知乙方到指定地点进行选房。乙方应根据确定后的选房顺序在规定的时间及地点进行选房，非因甲方原因造成乙方未能在规定的时间内到达指定地点选房导致其选房顺序号后延的，由此引起的一切责任及后果由乙方自行承担。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.4、乙方在进行选房的同时，必须在本协议附件所列认定安置人口清单范围内，选定所购定向安置房的实际产权人。实际产权人经政府主管部门和审计机构认定无误后，按照甲方书面（或电话）通知的时间、地点与甲方签订安置房买卖合同。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.5、本协议第六条第4款所述实际产权人的姓名、身份证号码和选定的具体房号，经政府主管部门和审计机构认定无误后不得更改。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.6、本协议第六条第4款所述实际产权人在接到甲方签订安置房买卖合同通知<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日内，未与甲方签订合同的，甲方有权拒绝签订安置房买卖合同，同时本协议自行终止。乙方已付的定向安置房购房款由甲方退还乙方，购房款不计息，甲乙双方互不追究相关责任。
        </p>
        <p class="leftTitle">第七条&nbsp;&nbsp;房屋交付</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乙方同意甲方按照本协议第六条第4款所述安置房买卖合同中的相关约定，向实际产权人交付定向安置房。
        </p>
        <p class="leftTitle">第八条&nbsp;&nbsp;购房款结算及相关费用缴纳</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.1、本协议下乙方所认购的定向安置房面积与实测建筑面积不一致的，甲乙双方同意，按照实测建筑面积据实结算购房款。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.2、甲乙双方同意按照本协议第六条第4款所述安置房买卖合同中的相关约定，对定向安置房购房款进行结算，实行多退少补，并向甲方缴纳相关费用包括但不仅限于公共维修基金、契税等。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.3、因购房款结算，涉及乙方与腾退人签订的《北京市宅基地房屋腾退补偿安置协议》（协议编号为<u>&nbsp;&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;&nbsp;</u>）中的腾退补偿总价不做调整。
        </p>
        <p class="leftTitle">第九条&nbsp;&nbsp;争议解决方式</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本合同在履行过程中发生争议，由双方当事人协商解决；协商不成的，可依法向北京市丰台区人民法院起诉。
        </p>
        <p class="leftTitle">第十条&nbsp;&nbsp;协议生效及其他</p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10.1、本协议由甲、乙双方签字或者盖章后生效。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10.2、乙方应确保联系电话、地址准确无误。本协议项下甲方发出或者提供的所有通知、文件、资料，均以本协议乙方所列明的地址和电话送达。如有变更，乙方应及时书面通知甲方。甲方以邮寄方式发出的所有通知、文件、资料，快件寄出或者投邮当日视为送达。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10.3、甲、乙双方就未尽事宜签订的补充协议，与本协议具有同等法律效力。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10.4、本协议一式陆份，甲乙双方各持壹份，其余肆份报政府相关部门备案。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10.5、本协议附件：<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10.5.1、认定被安置人口明细表。<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10.5.2、选房顺序号结果通知单。<br/>
        </p>
        <p class="leftTitle">（以下无正文）</p>

        <p class="pageBreak" style="margin-top: 200px;">&nbsp;</p>

        <p class="leftTitle">（签字页）</p>
        <p class="contex-1" style="margin-top: 50px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;甲方（盖章）：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北京中建方程投资管理有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="contex-1" style="margin-top: 20px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法定代表人或委托代理人（签字）：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="contex-1" style="margin-top: 20px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签署时间：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日
        </p>
        <p class="contex-1" style="margin-top: 50px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乙方（签字并按指纹）：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="contex-1" style="margin-top: 20px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;委托代理人(签字并按指纹)：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>
        <p class="contex-1" style="margin-top: 20px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;签署时间：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年
            <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月
            <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日
            <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;</u>时
            <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>分
            <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>秒
            <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>毫秒
        </p>

        <p class="pageBreak" style="margin-top: 200px;">&nbsp;</p>

        <p class="leftTitle">附件：认定被安置人口明细表</p>
        <p class="contex-1" style="margin-top: 10px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;依据《北京市宅基地房屋腾退补偿安置协议》（协议编号：<u>&nbsp;&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;&nbsp;</u>）第二条，被腾退房屋中认定的安置人口数为<u>
            &nbsp;&nbsp;&nbsp;${bean.peoplecount?default("/")}&nbsp;&nbsp;&nbsp;</u>人，具体情况见下表：
        </p>
        在册人员
        <table class="table table-bordered contex-1">
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>身份证号码</th>
            </tr>

        <#if bean.vacatelist?size gt 0>
	        <#list bean.vacatelist as vo>
	        <tr id="${vo.id}">
	           	<td>${vo_index+1}</td>
	            <td>${vo.name?default("")}</td>
	            <td>${vo.idcard?default("")}</td>
	        </tr>
	        </#list>
    	</#if>
    	</table>
    	   非在册人员
    	<table class="table table-bordered contex-1">
            <tr>
                <th>序号</th>
                <th>姓名</th>
                <th>身份证号码</th>
            </tr>
    	
        <#if bean.list?size gt 0>
	        <#list bean.list as vo>
	        <tr id="${vo.id}">
	           	<td><#if bean.vacatelist?size gt 0 > ${bean.vacatelist?size+vo_index+1}<#else>${vo_index+1}</#if></td>
	            <td>${vo.name?default("")}</td>
	            <td>${vo.idcard?default("")}</td>
	        </tr>
	        </#list>
    	</#if>
    	
        
        </table>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本附件为本协议的有效组成部分，与本协议具有同等的法律效力。
        </p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;被腾退人（乙方）保证以上信息经确认无误，真实、合法、全面、有效，不存在伪造、欺瞒、误导、过失的任何情形。否则，因此产生的一切责任由被腾退人（乙方）承担。
        </p>
        <p class="contex-1">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;被腾退人（乙方）按指纹：
        </p>
        <p class="contex-2">
            签字：
        </p>
        <p class="contex-2">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
        </p>

        <p class="pageBreak" style="margin-top: 200px;">&nbsp;</p>

        <p class="leftTitle">附件：</p>
        <span class="title">选房顺序通知单</span>
        <p class="xy-num" style="margin-top: 50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;认购协议编号：<u>
            &nbsp;&nbsp;&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
        </p>

        <p class="contex-1" style="margin-top:50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;被腾退人：<u>&nbsp;&nbsp;${bean.names?default("/")}&nbsp;&nbsp;</u>（身份证号码为：<u>
            &nbsp;&nbsp;${bean.idcard?default("/")}&nbsp;&nbsp;</u>） </p>

        <p class="contex-1" style="margin-top:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您与北京市丰台区长辛店镇张郭庄村民委员会签订了《北京市宅基地房屋腾退补偿安置协议》，并于（具体时间）<u>
            &nbsp;&nbsp;${bean.displaydate?default("/")}&nbsp;&nbsp;</u>获取到选房顺序号，您的选房顺序号为
            &nbsp;&nbsp;${bean.indexNumStr?default("/")}&nbsp;&nbsp;</u>号，您是本村第&nbsp;&nbsp;${bean.indexnum?default("/")}&nbsp;&nbsp;</u>
            个签约的家庭。
        </p>
        <p class="contex-1" style="margin-top:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;被腾退人及全体家庭成员已完全知悉并同意《丰台区长辛店镇张郭庄村宅基地腾退补偿实施细则》等相关规定，“以签订腾退补偿安置协议日期为准，先签订腾退补偿安置协议的先选房”的选房原则。</p>

        <p class="contex-1" style="margin-top:30px; text-align: right">被腾退人确认签字（按指纹）：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></p>
        <p class="contex-1" style="margin-top:30px; text-align: right">身份证号：  <u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></p>
        <p class="contex-1" style="margin-top:30px; text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</p>
        <p class="pageBreak" style="margin-top: 200px;">&nbsp;</p>
        <div style="clear:both; height:20px;"></div>
    </div>
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