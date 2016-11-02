<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">【张三】房屋腾退补偿安置协议</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save"   onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body center">
    <div class="content xy-print-con"  id="xy-print">
        <span class="title">房屋征收补偿协议</span>

        <table class="table1" cellpadding="0" cellspacing="0" width="650px;"  border="1">
            <tr>
                <td class="td_content_1"colspan="10">（        ）村宅基地房屋“安置房补偿”方式金额审查表（   ）标段</td>
            </tr>
            <tr>
                <td class="td_content_1">被腾退人</td>
                <td class="td_content_1">${housebasic.names?default("")} </td>
                <td class="td_content_1">坐落</td>
                <td class="td_content_1"colspan="4">${housebasic.location?default("")}</td>
                <td class="td_content_1">签约时间</td>
                <td class="td_content_1"colspan="2">／</td>
            </tr>
            <tr>
                <td class="td_content_1">宅基地实测</td>
                <td class="td_content_1">${bean.scydmj?default("")}</td>
                <td class="td_content_1">身份证</td>
                <td class="td_content_1" colspan=3>${housebasic.idcard?default("")}</td>
                <td class="td_content_1">认定年限</td>
                <td class="td_content_1">${bean.homesteadyear?default("／")}</td>
                <td class="td_content_1">签约顺序号</td>
                <td class="td_content_1">／</td>
            </tr>

            <tr>
                <td class="td_content_1">实建面</td>
                <td class="td_content_1">${housebasic.firstfloorarea?default(0)}+${housebasic.abovetwoarea?default(0)}+${housebasic.basement?default(0)}+${bean.shed?default(0)}</td>
                <td class="td_content_1">首层</td>
                <td class="td_content_1" >${housebasic.firstfloorarea?default(0)}</td>
                <td class="td_content_1">二层及以上</td>
                <td class="td_content_1">${housebasic.abovetwoarea?default(0)}</td>
                <td class="td_content_1">地下室</td>
                <td class="td_content_1">${housebasic.basement?default(0)}</td>
                <td class="td_content_1">棚</td>
                <td class="td_content_1">${bean.shed?default(0)}</td>
            </tr>

            <tr>
                <td class="td_content_1">认定宅基地面积</td>
                <td class="td_content_1">${bean.homesteadyear?default(0)}+${bean.overhomesteadarea?default(0)}</td>
                <td class="td_content_1">控制面积</td>
                <td class="td_content_1" >${bean.homesteadyear?default(0)}</td>
                <td class="td_content_1">区位单价</td>
                <td class="td_content_1">${bean.kzzjdqwbcj?default(0)}</td>
                <td class="td_content_1">超控面积</td>
                <td class="td_content_1">${bean.overhomesteadarea?default(0)}</td>
                <td class="td_content_1">区位单价</td>
                <td class="td_content_1">${bean.ckzjdqwbcj?default(0)}</td>
            </tr>
            <tr>
                <td class="td_content_1">认定房屋补偿面积</td>
                <td class="td_content_1">${bean.fwbcmj?default(0)}</td>
                <td class="td_content_1">经营面积</td>
                <td class="td_content_1" >${housebasic.operatearea?default(0)}</td>
                <td class="td_content_1">本址在册户籍人数</td>
                <td class="td_content_1">3</td>
                <td class="td_content_1">非本址在册户籍人数</td>
                <td class="td_content_1">3</td>
                <td class="td_content_1">认定人数总和</td>
                <td class="td_content_1">3</td>
            </tr>
            <tr>
                <td class="td_content_1">被认定全体人员姓名（注明代际关系）</td>
                <td class="td_content_1" colspan=9>${bean.rdbazrkxx?default("")}</td>
            </tr>

            <tr>
                <td class="td_content_1">应选面积</td>
                <td>／</td>
                <td colspan=3>实际选房面积</td>
                <td colspan＝2>／</td>
                <td >选房总套数</td>
                <td >1</td>
                <td >套</td>
            </tr>
            <tr>
                <td class="td_content_1">一居（55）</td>
                <td class="td_content_1">${bean.yjs?default("")}</td>
                <td class="td_content_1">二居（70）</td>
                <td class="td_content_1" >${bean.ljs70?default("")}</td>
                <td class="td_content_1">二居（75）</td>
                <td class="td_content_1">${bean.rdljs75bazrkxx?default("")}</td>
                <td class="td_content_1">二居（80）</td>
                <td class="td_content_1">${bean.ljs80?default("")}</td>
                <td class="td_content_1">二居（85）</td>
                <td class="td_content_1">${bean.ljs85?default("")}</td>
            </tr>
            <tr>
                <td class="td_content_1">三居</td>
                <td class="td_content_1">${bean.sjs?default("")}</td>
                <td class="td_content_1">指标内购房款（4000元㎡）</td>
                <td class="td_content_1" colspan=2>2</td>
                <td>指标外房款（6000元/</td>
                <td>需要计算</td>
                <td>总购房款</td>
                <td colspan=2>${bean.azfgfk?default("")}</td>
            </tr>

            <tr>
                <td class="td_content_1" colspan=3>宅基地腾退补偿总价</td>
                <td class="td_content_1" colspan=2>${bean.zjdttzj?default("")}</td>
                <td class="td_content_1" colspan=3>宅基地腾退补偿总价抵扣购房款余额</td>
                <td class="td_content_1" colspan=2>需要计算</td>
            </tr>
            <tr>	
                <td class="td_content_1" colspan=3>一，宅基地补偿款合计</td>
                <td class="td_content_1" colspan=2>${bean.zjdttbck?default("")}</td>
                <td class="td_content_1" colspan=5>结算方式相关</td>
            </tr>
            <tr>
                <td class="td_content_1">1</td>
                <td class="td_content_1">控制区位补偿价</td>
                <td class="td_content_1" colspan=3>${bean.kzzjdqwbcj?default("")}</td>
                <td class="td_content_1" colspan=5 >方式一（抵扣有余额）</td>
            </tr>
            <tr>
                <td class="td_content_1">2</td>
                <td class="td_content_1">超控制区位补偿价</td>
                <td class="td_content_1" colspan=3>${bean.ckzjdqwbcj?default("")}</td>
                <td class="td_content_1" colspan=2>宅基地腾退补偿总价</td>
                <td class="td_content_1" colspan=2>${bean.zjdttbck?default("")}</td>
                <td class="td_content_1" colspan=1>元</td>
            </tr>
            <tr>
                <td class="td_content_1">3</td>
                <td class="td_content_1">房屋价款</td>
                <td class="td_content_1" colspan=2>${bean.bttfwczcxj?default("")}</td>
                <td class="td_content_1" rowspan=2>4</td>

                <td class="td_content_1" colspan=2>总购房款</td>
                <td class="td_content_1" colspan=2>${bean.azfgfk?default("")}</td>
                <td class="td_content_1" colspan=1>元</td>
            </tr>
            <tr>
                <td class="td_content_1">4</td>
                <td class="td_content_1">装修、设备附属物价款</td>
                <td class="td_content_1" colspan=2>5</td>
                <td class="td_content_1" colspan=2>补偿总价抵扣购房款余额</td>
                <td class="td_content_1" colspan=2>需要计算</td>
                <td class="td_content_1" colspan=1>元</td>
            </tr>
            <tr>
                <td class="td_content_1" colspan=3>二、各项奖励、补助、周转合计</td>
                <td class="td_content_1" colspan=2>${bean.jlfsum?default("/")}</td>
                <td class="td_content_1" colspan=5 >方式二（补偿总价不足以抵扣购房款）（倒挂需补交）</td>
            </tr>

            <tr>
                <td class="td_content_1">1</td>
                <td class="td_content_1">提前搬家奖</td>
                <td class="td_content_1">（5000元/院）</td>
                <td class="td_content_1" colspan=2>${bean.tqbjl?default("/")}</td>

                <td class="td_content_1" colspan=2>宅基地腾退补偿总价</td>
                <td class="td_content_1" colspan=2>4</td>
                <td class="td_content_1" colspan=1>元</td>
            </tr>
            <tr>
                <td class="td_content_1">2</td>
                <td class="td_content_1">工程配合奖</td>
                <td class="td_content_1">（100000元/院）</td>
                <td class="td_content_1" colspan=2>${bean.gcphjl?default("")}</td>

                <td class="td_content_1" colspan=2>总购房款</td>
                <td class="td_content_1" colspan=2>4</td>
                <td class="td_content_1" colspan=1>元</td>
            </tr>
            <tr>
                <td class="td_content_1">3</td>
                <td class="td_content_1">腾退促进奖</td>
                <td class="td_content_1">（50000元/院）</td>
                <td class="td_content_1" colspan=2>${bean.ttcjjl?default("/")}</td>

                <td class="td_content_1" colspan=2>补偿总价抵扣购房款余额</td>
                <td class="td_content_1" colspan=2>4</td>
                <td class="td_content_1" colspan=1>元</td>
            </tr>
            <tr>
                <td class="td_content_1">4</td>
                <td class="td_content_1">无违章奖励</td>
                <td class="td_content_1">（500元㎡）</td>
                <td class="td_content_1" colspan=2>${bean.wwzjl?default("/")}</td>

                <td class="td_content_1" colspan=2 rowspan=3>腾退服务公司经手人签字</td>
                <td class="td_content_1" colspan=3 rowspan=3>5</td>

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
                <td class="td_content_1" colspan=2>5</td>
            </tr> 
            <tr>
                <td class="td_content_1">7</td>
                <td class="td_content_1">家电迁移补助</td>
                <td class="td_content_1">（12000元/院）</td>
                <td class="td_content_1" colspan=2>${bean.bjbz?default("/")}</td>

                <td class="td_content_1" colspan=5>实施主体意见</td>
            </tr> 
            <tr>
                <td class="td_content_1">8</td>
                <td class="td_content_1">期房补助费</td>
                <td class="td_content_1">（总购房款10%）</td>
                <td class="td_content_1" colspan=2>${bean.qfbz?default("/")}</td>

                <td class="td_content_1" colspan=2 rowspan=4>腾退服务公司经手人签字</td>
                <td class="td_content_1" colspan=3 rowspan=2>5</td>
            </tr> 
            <tr>
                <td class="td_content_1">9</td>
                <td class="td_content_1">大病补助</td>
                <td class="td_content_1">（50000元/人）</td>
                <td class="td_content_1" colspan=2>${bean.dbbz?default("/")}</td>
            </tr> 
            <tr>
                <td class="td_content_1">10</td>
                <td class="td_content_1">残疾补助</td>
                <td class="td_content_1">（30000元/人）</td>
                <td class="td_content_1" colspan=2>${bean.cjbz?default("/")}</td>

                <td class="td_content_1" colspan=3 rowspan=2>5</td>

            </tr> 
            <tr>
                <td class="td_content_1">11</td>
                <td class="td_content_1">低保补助</td>
                <td class="td_content_1">（30000元/人）</td>
                <td class="td_content_1" colspan=2>${bean.dbbz?default("/")}</td>
            </tr>
            <tr>
                <td class="td_content_1">12</td>
                <td class="td_content_1">独生子女</td>
                <td class="td_content_1">（30000元/人）</td>
                <td class="td_content_1" colspan=2>${bean.dsznbz?default("/")}</td>
                <td class="td_content_1" colspan=2 rowspan=4>备注</td>
                <td class="td_content_1" colspan=3 rowspan=4>备注内容</td>
            </tr>  
            <tr>
                <td class="td_content_1">13</td>
                <td class="td_content_1">停产停业补助</td>
                <td class="td_content_1">（800元㎡）</td>
                <td class="td_content_1" colspan=2>${bean.tctdbz?default("/")}</td>
            </tr>  
            <tr>
                <td class="td_content_1">14</td>
                <td class="td_content_1">周转补助费</td>
                <td class="td_content_1">（1200元/人/月）</td>
                <td class="td_content_1" colspan=2>${bean.jlfsum?default("/")}</td>
            </tr> 
            <tr>
                <td class="td_content_1">15</td>
                <td class="td_content_1">其他补助</td>
                <td class="td_content_1">－－</td>
                <td class="td_content_1" colspan=2>${bean.otherbz?default("/")}</td>
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