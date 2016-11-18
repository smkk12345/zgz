<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">查看认定结果确认一览表</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="supmit" class="btn btn-primary btn-save" onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body ">
    <div class="container-fluid fhfa-rdjg-print-con" id="xy-print">
        <table class="table table-bordered">
            <tr>
                <td colspan="10" class="center"> 
                    <div class="title">张郭庄村棚户区改造项目宅基地权属、安置人口认定结果一览表</div>
                </td>
            </tr>
            <tr>
                <td rowspan="4" style="">基本信息</td>
                <td colspan="2">被腾退人姓名</td>
				<td>${bean.names?default("/")}</td>
                <td>被腾宅基地坐落</td>
				<td colspan="3">${bean.location?default("/")}</td>
                <td>认定日期</td>
                <td>2016年<u>&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;</u>日</td>
            </tr>
            <tr>
                <td colspan="2">身份证号</td>
                <td>${bean.idcard?default("/")}</td>
                <td>被腾退家庭购房标准</td>
                <td>
                    <label class="title1"><input class="check-box" type="checkbox">50m<sup>2</sup>（）人 &nbsp;&nbsp;</label><br>
                    <label class="title1"><input class="check-box" type="checkbox">45m<sup>2</sup>（部分人员）&nbsp;&nbsp;</label>
                </td>
                <td colspan="2">父母及超生子女姓名</td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">实测现状宅基地面积</td>
                <td class="textalign-r">m<sup>2</sup></td>
                <td>实测房屋建筑面积</td>
                <td class="textalign-r">m<sup>2</sup></td>
                <td colspan="2">认定住房困难</td>
                <td colspan="2">
                    <label class="title1"><input class="check-box" type="checkbox">是 &nbsp;&nbsp;</label>
                    <label class="title1"><input class="check-box" type="checkbox">否 &nbsp;&nbsp;</label>
                </td>
            </tr>
            <tr>
                <td colspan="2">被腾退人拟选择补偿方式</td>
                <td>
                    <label class="title1"><input class="check-box" type="checkbox">房屋&nbsp;&nbsp;</label><br>
                    <label class="title1"><input class="check-box" type="checkbox">货币&nbsp;&nbsp;</label>
                </td>
                <td>宅基地认定年限</td>
                <td>
                    <label class="title1"><input class="check-box" type="checkbox">82年前&nbsp;&nbsp;</label>
                    <label class="title1"><input class="check-box" type="checkbox">82年后&nbsp;&nbsp;</label>
                </td>
                <td colspan="2">认定安置人数</td>
                <td colspan="2" class="textalign-r"> 人</td>
            </tr>
            <tr>
                <td colspan="10">认定宅基地及房屋面积相关 </td>
            </tr>
            <tr>
                <td colspan="4">认定宅基地总补偿面积</td>
                <td colspan="2" class="textalign-r">m<sup>2</sup></td>
                <td colspan="2">认定房屋补偿建面</td>
                <td colspan="2" class="textalign-r">m<sup>2</sup></td>
            </tr>
            <tr>
                <td rowspan="5" style="text-align: justify">其中</td>
                <td rowspan="2" colspan="2">认定82年前（0.4亩）</td>
                <td>控制面积267m<sup>2</sup>以内</td>
                <td colspan="2" class="textalign-r">m<sup>2</sup></td>
                <td>比例</td>
                <td>100%</td>
                <td colspan="2">宅基地区位补偿价6000元/m<sup>2</sup></td>
            </tr>
            <tr>
                <td>超出控制标准面积</td>
                <td colspan="2" class="textalign-r">m<sup>2</sup></td>
                <td>比例</td>
                <td>50%</td>
                <td colspan="2">折合区位补偿价3000元/m<sup>2</sup></td>
            </tr>
            <tr>
                <td rowspan="2" colspan="2">认定82年后（0.3亩）</td>
                <td>不足0.3亩补足0.3亩控制面积</td>
                <td colspan="2" class="textalign-r"><u>&nbsp;&nbsp;&nbsp;200&nbsp;&nbsp;&nbsp;</u>m<sup>2</sup></td>
                <td>比例</td>
                <td>100%</td>
                <td colspan="2">宅基地区位补偿价6000元/m<sup>2</sup></td>
            </tr>
            <tr>
                <td>超出控制宅基地面积</td>
                <td colspan="2" class="textalign-r">m<sup>2</sup></td>
                <td>比例</td>
                <td>50%</td>
                <td colspan="2">折合区位补偿价1800元/m<sup>2</sup></td>
            </tr>
            <tr>
                <td colspan="2">住房困难户</td>
                <td>补偿方案、细则</td>
                <td colspan="2" class="textalign-r">m<sup>2</sup></td>
                <td>比例</td>
                <td>100%</td>
                <td colspan="2">宅基地区位补偿价6000元/m<sup>2</sup></td>
            </tr>
            <tr>
                <td colspan="10" style="height:5px;"></td>
            </tr>
            <tr>
                <td colspan="3">认定序号</td>
                <td >认定安置<br>人员姓名</td>
                <td colspan="2">与被腾退人关系</td>
                <td colspan="4">村腾退认定工作小组确认签字（盖章）</td>
            </tr>
            <tr>
                <td colspan="3">本址①</td>
                <td></td>
                <td colspan="2"></td>
                <td rowspan="9">认定工作小组成员签字</td>
                <td colspan="3" rowspan="9"></td>
            </tr>
            <tr>
                <td colspan="3">本址②</td>
                <td></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">本址③</td>
                <td></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">本址④</td>
                <td></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">本址⑤</td>
                <td></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">本址⑥</td>
                <td></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">本址⑦</td>
                <td></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">本址⑧</td>
                <td></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">本址⑨</td>
                <td></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">本址⑩</td>
                <td></td>
                <td colspan="2"></td>
                <td colspan="4">被腾退人特别保证如下：</td>
            </tr>
            <tr>
                <td colspan="3">非本址①</td>
                <td></td>
                <td colspan="2"></td>
                <td rowspan="2" colspan="4">我本人完全知悉补偿方案和认定程序，对上述确认各项结果均无异议。</td>
            </tr>
            <tr>
                <td colspan="3">非本址②</td>
                <td></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">非本址③</td>
                <td></td>
                <td colspan="2"></td>
                <td rowspan="2" colspan="4">签字（按指纹）</td>
            </tr>
            <tr>
                <td colspan="3">非本址④</td>
                <td></td>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="3">非本址⑤</td>
                <td></td>
                <td colspan="2"></td>
                <td colspan="4">签字日期：2016年    月     日</td>
            </tr>
        </table>
    </div>
</div>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js"></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
    //设置模态框高度和宽度
    //设置模态框高度和宽度
    $("#myModal .modal-dialog").width(750);
    $(".modal-body").css("height", ($(window).height() - 150) + "px");
    $(".modal-body").css("overflow-y", "scroll");

    function yu_print() {
        $("#xy-print").jqprint();
    }
</script>