<!DOCTYPE html>
<html>
    <head>
        <title>长辛店镇张郭庄村棚改项目签约选房管理系统</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Access-Control-Allow-Origin" content="*">
        <!--CSS文件-->
        <link href="${BASE_ASSETS_PATH}libs/bootstrap-3.3.4/css/bootstrap.min.css" rel="stylesheet">
        <link href="${BASE_ASSETS_PATH}libs/bootstrap-3.3.4/css/bootstrap-switch.min.css" rel="stylesheet">
        <link href="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" >
        <link href="${BASE_ASSETS_PATH}libs/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" >
        <link href="${BASE_ASSETS_PATH}css/common.css" rel="stylesheet">
        <link href="${BASE_ASSETS_PATH}css/lqt-v1.css" rel="stylesheet">
        <link href="${BASE_ASSETS_PATH}css/style-1.css" rel="stylesheet" id="theme" >
        <!--JS文件-->
        <script src="${BASE_ASSETS_PATH}libs/jquery-2.1.4.min.js"></script>
        <script src="${BASE_ASSETS_PATH}libs/bootstrap-3.3.4/js/bootstrap.min.js"></script>
        <script src="${BASE_ASSETS_PATH}libs/bootstrap-3.3.4/js/bootstrap-switch.js"></script>
        <script src="${BASE_ASSETS_PATH}libs/bootstrap-progressbar/js/bootstrap-progressbar.min.js"></script>
        <script src="/Lodop/LodopFuncs.js"></script>

        <script>
            function doPrint() {
                $("#print").hide();
                // $("#title").hide();
                LODOP = getLodop();
                LODOP.ADD_PRINT_HTM(80, 80, "80%", "83%", document.body.innerHTML);
                LODOP.ADD_PRINT_HTM("97%", "85%", 0, "45%", "<span tdata='pageNO'>第#页</span>&nbsp;共<span tdata='pageCount'>#</span>页");
                LODOP.SET_PRINT_STYLEA(0, "ItemType", 1);//循环上一命令（页码）
                LODOP.PRINTA();
                $("#print").show();
                //$("#title").show();

            }
        </script>



    </head>


    <body>

                <style>

            .xy-print-con {
                padding: 20px;
                font-size: 16px;
                text-align: center;
                margin: 0 auto;
                width: 650px;
            }

            .xy-print-con .title {
                font-size: 22.0pt;
                line-height: 150%;
                font-family: 宋体;
                mso-ascii-font-family: "Times New Roman";
                mso-hansi-font-family: "Times New Roman";
                color: black;
            }


            .xy-print-con .title1 {
                text-align: left;
                margin-left: 100px;
                font-size: 14.0pt;
                mso-bidi-font-size: 10.0pt;
                line-height: 150%;
                color: black;
            }

            .xy-print-con .title2 {
                font-size: 18.0pt;
                line-height: 150%;
                font-family: 宋体;
                color: black;
            }

            .xy-print-con .title3 {
                text-align: left;
                margin-left: 0px;
                font-size: 14.0pt;
                mso-bidi-font-size: 10.0pt;
                line-height: 130%;
                color: black;
            }
            .xy-print-con .left-title {
                text-align: left;
                font-size: 12.0pt;
                text-indent: 2em;
                line-height: 20.0pt;
                font-family: 宋体;
                font-weight: bold;
                color: #000;
            }

            .xy-print-con table td {
                text-align: center;
                vertical-align: middle
            }

            .xy-print-con .contex-1 {
                text-align: left;
                font-size: 12.0pt;
                mso-bidi-font-size: 10.0pt;
                line-height: 25.0pt;
                font-family: 宋体;
                color: #000;
            }

            .xy-print-con .contex-2 {
                text-align: left;
                margin-left: 350px;
                font-size: 14.0pt;
                mso-bidi-font-size: 10.0pt;
                line-height: 25.0pt;
                font-family: 宋体;
                color: #000;
            }
            .xy-print-con .xy-num {
                text-align: right;
                text-indent: 2em;
                margin-right: 20px;
                font-size: 12.0pt;
                line-height: 150%;
                font-family: 宋体;
                mso-ascii-font-family: "Times New Roman";
                mso-hansi-font-family: "Times New Roman";
                color: black;
            }


            .xy-print-con .check-box {
                font-size: 12px !important
            }

            .xy-print-con .pageBreak {
                margin-bottom: 10px
            }
        </style>

        <div class="modal-header clearfix" id="print">
            <h4 class="modal-title pull-left m0">【${housebasic.names?default("/")}】房屋腾退货币补偿</h4>
            <div class="fr" >
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary btn-save" onclick="doPrint()">打印</button>
            </div>
        </div>
        <div class="modal-body center">
              <div class="content xy-print-con" id="xy-print">

                <p class="title2" style="">北京市宅基地房屋腾退货币补偿协议</p>
                <p class="contex-1" style="margin-top: 0px;">&nbsp;&nbsp;&nbsp;&nbsp;腾退人：<u>&nbsp;北京市丰台区长辛店镇张郭庄村民委员会&nbsp;</u>（以下简称甲方）</p>
                <p class="contex-1" style="margin-top: 0px;">&nbsp;&nbsp;&nbsp;&nbsp;被腾退人：<u>${housebasic.names?default("/")}</u> &nbsp;身份证号：<u>${housebasic.idcard?default("/")}</u>（以下简称乙方）</p>

                <p class="contex-1" style="margin-top: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;依据北京市丰台区长辛店镇人民政府、北京中建方程投资管理有限公司及北京市丰台区长辛店镇张郭庄村村民委员会三方签订的《长辛店镇张郭庄村棚户区改造及环境整治项目委托实施腾退协议》相关内容，长辛店镇人民政府是“长辛店镇张郭庄村棚户区改造和环境整治项目”（以下简称本项目）的责任主体，负责指导、协调本项目全面工作；北京中建方程投资管理有限公司是经丰台区人民政府授权，作为本项目的实施主体，负责本项目腾退补偿资金的筹措；北京市丰台区长辛店镇张郭庄村村民委员会，作为本项目腾退主体即“腾退人”，负责本项目集体土地腾退范围内涉及宅基地及非住宅的腾退工作；“被腾退人” 是指本项目集体土地腾退范围内，持有宅基地批准文件，或宅基地腾退补偿安置工作组认定的宅基地使用权人及影响宅基地房屋腾退的其它构筑物的所有者，每宗宅基地为一产权院。<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;为加快腾退范围内宅基地、非住宅房屋腾退补偿安置工作，本项目采取村民自主腾退方式，腾退方式参照拆迁方式进行实施。经甲、乙双方协商一致，同意按照“安置房补偿的方式”对于权属于乙方的宅基地、房屋及附属物进行房屋腾退补偿安置，达成如下协议：
                </p>
                <p class="left-title">第一条&nbsp;&nbsp;腾退依据</p>
                <p class="contex-1" >&nbsp;&nbsp;&nbsp;&nbsp;依据《北京市集体土地房屋拆迁管理办法》（北京市人民政府令第124号）
                    、《北京市人民政府关于加强农村村民建房用地管理若干规定》（北京市人民政府令1989年第39号）、《丰台区人民政府关于〈北京市集体土地房屋拆迁管理办法〉的实施意见》
                    （丰政发[2009]54号）、《长辛店镇宅基地腾退补偿安置指导意见》（丰长发[2016]27号）、经北京市丰台区长辛店镇张郭庄村民代表大会通过的《张郭庄村宅基地腾退补偿安置方案》及《张郭庄村宅基地腾退补偿安置实施细则》等相关文件。
                    甲方作为本项目腾退主体，需要对权属于乙方的在本项目腾退范围内坐落于<u>&nbsp;&nbsp;${housebasic.location?default("/")}&nbsp;&nbsp;</u>的宅基地、房屋及附属物进行自主腾退。</p>
                <p class="left-title">第二条&nbsp;&nbsp;宅基地认定</p>
                <p class="contex-1" >
                    &nbsp;&nbsp;&nbsp;&nbsp;2.1、经受托测绘公司现场实测，现状实测用地面积<u><#if housebasic.zjdarea??>${housebasic.zjdarea?string("0.00")}<#else>0.00</#if></u>平方米；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;2.2、经张郭庄村宅基地面积和人口认定工作组认定，乙方宅基地合法批准认定年限为
                        <u><#if (bean.homesteadyear?default("-1"))=='1'>82年后<#else>82年前</#if></u>。认定宅基地面积<u>
                        <#if bean.rdzjdallarea??>${(bean.rdzjdallarea?number)?string("0.00")}<#else>0.00</#if></u>平方米，补偿宅基地面积
                        <u style="background-color:#F2F2F2;"><#if bean.bczjdmj??>${bean.bczjdmj?string("0.00")}<#else>0.00</#if></u>平方米。其中：<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;宅基地控制面积<u><#if bean.conhomestarea??>${bean.conhomestarea?string("0.00")}<#else>0.00</#if></u>平方米；超出宅基地控制面积<u><#if bean.overhomesteadarea??>${bean.overhomesteadarea?string("0.00")}<#else>0.00</#if></u>平方米。
                </p>
                <p class="left-title">第三条&nbsp;&nbsp;房屋补偿面积</p>
                <p class="contex-1" >
                    &nbsp;&nbsp;&nbsp;&nbsp;3.1、经受托测绘公司现场实测，现状实测房屋建筑面积  <u><#if housebasic.fwarea??>${housebasic.fwarea?string("0.00")}<#else>0.00</#if></u>平方米。其中：首层建筑面积<u>
                        <#if housebasic.firstfloorarea??>${housebasic.firstfloorarea?string("0.00")}<#else>0.00</#if> </u>平方米；二层及以上建筑面积<u>
                        <#if housebasic.abovetwoarea??>${housebasic.abovetwoarea?string("0.00")}<#else>0.00</#if> </u>平方米；地下室建筑面积<u>
                        <#if housebasic.basement??>${housebasic.basement?string("0.00")}<#else>0.00</#if> </u>平方米；棚<u>
                        <#if housebasic.shed??>${housebasic.shed?string("0.00")}<#else>0.00</#if> </u>平方米。<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;3.2、经认定工作组认定，认定房屋补偿面积
                        <u style="background-color:#F2F2F2;"><#if bean.fwbcmj??>${bean.fwbcmj?string("0.00")}<#else>0.00</#if></u>平方米。
                </p>
                <p class="left-title">第四条&nbsp;&nbsp;被安置人口认定</p>
                <p class="contex-1" >
                    &nbsp;&nbsp;&nbsp;&nbsp;经工作组认定，认定被安置人口共<u style="background-color:#F2F2F2;">&nbsp;&nbsp;${housebasic.peoplecount?default("/")}&nbsp;&nbsp;</u>人，分别是：
                    <#if housebasic.vacatelist??>
                <p class="contex-1">&nbsp;&nbsp;&nbsp;&nbsp;在册人员：</p>
                <#list housebasic.vacatelist as vacate>
                <p class="contex-1" style="line-height:26px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;姓名：<u>&nbsp;&nbsp;${vacate.name}&nbsp;&nbsp;</u>
                    &nbsp;&nbsp;产关：<u>&nbsp;&nbsp;${vacate.changrelate}&nbsp;&nbsp;</u>
                    &nbsp;&nbsp;身份证：<u>&nbsp;&nbsp;${vacate.idcard}&nbsp;&nbsp;</u>
                </p>
                </#list>
                </#if>
                <#if housebasic.list??>
                <#if housebasic.list?size gt 0>
                <p class="contex-1">&nbsp;&nbsp;&nbsp;&nbsp;非在册人员：</p>
                <#list housebasic.list as cate>
                <p class="contex-1" style="line-height:26px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;姓名：<u>&nbsp;&nbsp;${cate.name}&nbsp;&nbsp;</u>
                    &nbsp;&nbsp;产关：<u>&nbsp;&nbsp;${cate.changrelate}&nbsp;&nbsp;</u>
                    &nbsp;&nbsp;身份证：<u>&nbsp;&nbsp;${cate.idcard}&nbsp;&nbsp;</u>
                </p>
                </#list>
                </#if>
                </#if>
               

                <p class="left-title">第五条&nbsp;&nbsp;宅基地腾退补偿总价</p>
                <p class="contex-1" >
                    &nbsp;&nbsp;&nbsp;&nbsp;5.1、甲方应当向乙方支付宅基地腾退补偿总价人民币<u style="background-color:#F2F2F2;">&nbsp;${bean.zjdttzj?c?default("/")}&nbsp;</u>（大写人民币：<u>&nbsp;${bean.dxzjdttzj?default("/")}&nbsp;</u>），包含宅基地腾退补偿款、被腾退房屋重置成新价、及各项奖励费、补助费等。具体如下：<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;5.1.1、宅基地腾退补偿款<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;经<u>&nbsp;&nbsp;${bean.pgjg?default("/")}&nbsp;&nbsp;</u>评估，宅基地宅基地腾退补偿款<u>&nbsp;&nbsp;${bean.zjdttbck?c?default("/")}&nbsp;&nbsp;</u>元。<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;其中包括：<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）控制宅基地区位补偿价<u>&nbsp;&nbsp;${bean.kzzjdqwbcj?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）超控宅基地区位补偿价<u>&nbsp;&nbsp;${bean.ckzjdqwbcj?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）房屋价款&nbsp;<u>&nbsp;&nbsp;${bean.bttfwczcxj?c?default("/")}&nbsp;&nbsp;</u>元。<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（4）装修、设备、附属物价款<u>&nbsp;&nbsp;${bean.zxsbfswjk?c?default("/")}&nbsp;&nbsp;</u>元。<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;5.1.2、各项奖励费、补助各分项合计<u>&nbsp;&nbsp;${bean.jlfsum?c?default("/")}&nbsp;&nbsp;</u>元。<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;其中包括：<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（1）提前搬家奖（5000元/产权院）<u>&nbsp;&nbsp;${bean.tqbjl?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（2）工程配合奖（100000元/产权院）
                        <u>&nbsp;&nbsp;${bean.gcphjl?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（3）腾退促进奖（50000院/产权院）
                        <u>&nbsp;&nbsp;${bean.ttcjjl?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（4）无违章奖励费（500元/平方米）<u>&nbsp;&nbsp;${bean.wwzjl?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（5）未建二层及地下室奖励费（500元/平方米）
                       <u> &nbsp;&nbsp;${bean.wjecjj?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（6）未经批准已建二层或地下室补助费（500元/平方米）<u>&nbsp;&nbsp;${bean.wjpzyjecbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（7）搬家及家电迁移补助费（12000元/产权院）
                        <u>&nbsp;&nbsp;${bean.bjbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（8）大病补助费（50000元/人）<u>&nbsp;&nbsp;${bean.dbbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（9）残疾补助（30000元/证）<u>&nbsp;&nbsp;${bean.cjbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（10）低保户补助（30000元/证）<u>&nbsp;&nbsp;${bean.dbhbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（11）独生子女奖励费（30000元/父母光荣证）
                        <u>&nbsp;&nbsp;${bean.dsznbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（12）一次性停产停业综合补助费（1000元/平方米）
                        <u>&nbsp;&nbsp;${bean.tctdbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（13）周转补助费（1500元/人/月） 
                        <u>&nbsp;&nbsp;${bean.zzbz?c?default("/")}&nbsp;&nbsp;</u>元；<br/>
                    <#assign dsbzf = bean.dsbzf?c?default(0)>
                    <#assign xgbzf = bean.xgbzf?c?default(0)>
                    <#assign zjdypwpbz = bean.zjdypwpbz?c?default(0)>
                    <#assign qtbzhj =dsbzf?number+xgbzf?number+zjdypwpbz?number>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（14）其他补助费<u>&nbsp;&nbsp;${qtbzhj?c}&nbsp;&nbsp;</u>元；<br/>
                </p>
                <p class="left-title">第六条&nbsp;&nbsp;乙方腾退期限及要求</p>
                <p class="contex-1" >
                    &nbsp;&nbsp;&nbsp;&nbsp;6.1  乙方应在<span style="background-color:#F2F2F2;"><u><#if year??>${year?c}</#if></u>年<u>
                    ${month?default()}</u>月<u>${day?default()}</u>日</span>前完成腾退。乙方应在腾退前结清所有资源欠费（含乙方使用的水、电等费用），确保房屋和附属物内无任何人员和财产（即房屋和附属物完全具备拆除条件），并将所有房屋及附属物的钥匙交给甲方，由拆除公司验收合格后，甲方认定乙方腾退完毕。<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;6.2  乙方承诺：在向甲方交付被腾退房屋后，乙方不再对该被腾退房屋主张任何权利。
                </p>
                <p class="left-title">第七条&nbsp;&nbsp;宅基地腾退补偿总价支付主体</p>
                <p class="contex-1" >&nbsp;&nbsp;&nbsp;&nbsp;北京中建方程投资管理有限公司作为丰台区长辛店镇张郭庄村棚户区改造和环境整治项目实施主体，负责项目腾退补偿资金的筹措。甲乙双方同意由北京中建方程投资管理有限公司按照上述约定的方式向乙方发放各项腾退补偿款项。 </p> 
                <p class="left-title">第八条&nbsp;&nbsp;付款方式</p>
                <p class="contex-1" >
                    &nbsp;&nbsp;&nbsp;&nbsp;8.1 甲乙双方签订本协议，项目审计部门审核通过后，甲方及时通知乙方在约定期限内进行搬迁，搬迁完毕并经拆除公司验收合格后，房屋交甲方拆除。 <br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;8.2 甲方在乙方完成交房验收后 20 个工作日内，向乙方开具领款凭证。  <br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;8.3 乙方按照有关规定，持甲方开具的领款凭证到甲方指定地点一次性领取宅基地腾退补偿总价。 <br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;8.4 甲方向乙方一次性支付 4 个月周转补助费，被腾退安置人口享受周转补助费的标准为  1500元/人/月。 <br/> 
                </p>
                <p class="left-title">第九条&nbsp;&nbsp;乙方的承诺和保证</p>
                <p class="contex-1" > 
                    &nbsp;&nbsp;&nbsp;&nbsp;9.1  乙方在“腾退公告”需要实施腾退范围内,无其他土地使用权或房产权利或任何腾退利益或拆迁利益；<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;9.2  乙方向甲方提供的所有土地、房屋权属、身份关系证明材料及其他相关证照类材料，均合法、有效、真实、全面；<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;9.3  乙方保证其在签署本协议之前已取得所有必要的共有权人、亲属（包括父母、继父母、养父母、配偶、子女、继子女、养子女、兄弟姐妹等）及有利益关系的第三人的授权，确认乙方本人有权签署和履行本协议；<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;9.4  乙方保证其作为被腾退人主体的合法性和唯一性。
                </p> 
                <p class="left-title">第十条&nbsp;&nbsp;违约责任及其它赔偿责任</p>
                <p class="contex-1" > 
                    &nbsp;&nbsp;&nbsp;&nbsp;10.1 乙方未按本协议第六条约定的期限完成搬迁的，每延期一日，应按本协议第五条约定的宅基地腾退补偿总价的万分之 五 向甲方支付违约金。<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;10.2 甲方未按本协议第八条约定期限向乙方开具领款凭证的，每延期一日，应按本协议第五条约定的宅基地腾退补偿总价的万分之 五 向乙方支付违约金。<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;10.3 若乙方未能确保其作为被腾退人主体的合法性和唯一性，而与甲方签订本协议的，在本协议签署后被腾退房屋上被腾退人发生变更的，乙方除退还宅基地腾退补偿总价外，还应向甲方赔偿宅基地腾退补偿总价的百分之 一 。<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;10.4 本协议下的宅基地、房屋及附属物上产生的任何纠纷，包括但不限于任何第三人主张权利或引起诉讼、仲裁、纠纷，均与甲方无关，乙方应承担全部责任，由此给甲方造成损失的（包括经济损失和名誉损失），乙方应予以全额赔偿，甲方有权直接从腾退补偿款中扣除赔偿金额，直至纠纷解决或甲方得到乙方的赔偿。
                </p> 
                <p class="left-title">第十一条&nbsp;&nbsp;争议解决</p>
                <p class="contex-1" > 
                    &nbsp;&nbsp;&nbsp;&nbsp;本协议生效后，在履行中如发生争议，甲、乙双方应争取协商解决；协商不成的，甲、乙双方同意按以下第<u>&nbsp;2&nbsp;</u>种方式解决：<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1)向北京仲裁委员会申请仲裁；<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2)向被腾退房屋所在地的人民法院提起诉讼。
                </p> 
                <p class="left-title">第十二条&nbsp;&nbsp;协议生效及其他事宜</p>
                <p class="contex-1" > 
                    &nbsp;&nbsp;&nbsp;&nbsp;12.1本协议自甲方与乙方双方签字、盖章之日起生效。<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;12.2本协议未尽事宜由双方另行协商并签订补充协议。补充协议作为本协议的有效组成部分，与本协议有相同的法律效力。<br/> 
                    &nbsp;&nbsp;&nbsp;&nbsp;12.3本协议一式陆份，甲乙双方各持壹份，其余肆份报政府相关部门备案。
                </p> 
                <p class="left-title">（以下无正文）</p>
                <p style="page-break-before: always">&nbsp;</p>
                <br>
                <br>
               

            <p class="pageBreak" style="margin-top: 20px;"></p>
            <p class="left-title">（签字页）</p>

            <p class="contex-1" style="margin-top: 20px;">
                &nbsp;&nbsp;&nbsp;&nbsp;甲方：北京市丰台区长辛店镇张郭庄村民委员会
            </p>
            <br>
            <p class="contex-1" style="margin-top: 20px;">
                &nbsp;&nbsp;&nbsp;&nbsp;法定代表人或委托代理人（签字）：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
            </p>
            <br>            
            <p class="contex-1" style="margin-top: 20px;">
                &nbsp;&nbsp;&nbsp;&nbsp;签署时间：<u>&nbsp;${sysyear?c}&nbsp;</u>年
                    <u>&nbsp;${sysmonth}&nbsp;</u>月
                    <u>&nbsp;${sysday}&nbsp;</u>日
            </p>
            <br>
            <br>
            <br>
            <p class="contex-1" style="margin-top: 50px;">
                &nbsp;&nbsp;&nbsp;&nbsp;乙方（签字并按指纹）：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
            </p>
            <br>
            <p class="contex-1" style="margin-top: 20px;">
                &nbsp;&nbsp;&nbsp;&nbsp;委托代理人(签字并按指纹)：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>
            </p>
            <br>
            <p class="contex-1" style="margin-top: 20px;">
                &nbsp;&nbsp;&nbsp;&nbsp;签署时间：<u>&nbsp;${sysyear?c}&nbsp;</u>年
                    <u>&nbsp;${sysmonth}&nbsp;</u>月
                    <u>&nbsp;${sysday}&nbsp;</u>日
            </p>

            </div>
            <div style="clear:both; height:20px;"></div>
        </div>

    </body>
</html>