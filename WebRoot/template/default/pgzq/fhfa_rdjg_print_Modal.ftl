<style>
	checkbox{
	width:8px;
	height:8px;
	margin:0 auto;
}
</style>
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">查看认定结果确认一览表</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary btn-save" onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body">
    <div class="container-fluid fhfa-rdjg-print-con" id="xy-print">
              <table class="table table-bordered" style="margin-bottom:0px;">
            <tr>
                <td colspan="10" class="center">
                
                    <div class="title">张郭庄村棚户区改造项目(李家峪村)第${bean.section}标段宅基地权属、安置人口认定结果一览表</div>
                </td>
            </tr>
            <tr>
                <td rowspan="4">基本数据</td>
                <td colspan="2">被腾退人姓名</td>
                <td>${bean.names?default("")}</td>
                <td>被腾宅基地坐落</td>
                <td colspan="3">${bean.location?default("")}</td>
                <td>认定日期</td>
                <td><u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日
                </td>
            </tr>
            <tr>
                <td colspan="2">身份证号</td>
                <td>${bean.idcard?default("")}</td>
                <td>被腾退家庭购房标准</td>
                <td style="text-align: left;width:60px;">
                    50㎡( ${agreenment.gfbz50?default("")})人<br>
                    45㎡( ${agreenment.gfbz45?default("")})人
                </td>
                <td colspan="2">父母及超生子女姓名</td>
                <td colspan="2">${bean.fmjcsznxm?default("")}</td>
            </tr>
            <tr>
                <td colspan="2">实测现状宅基地面积</td>
                <td class=""><#if bean.zjdarea??>${bean.zjdarea?string("0.00")}m<sup>2</sup><#else>0.00m<sup>2</sup></#if></td>
                <td>实测房屋建筑面积</td>
                <td class="textalign-r"><#if bean.zjdarea??>${bean.fwarea?string("0.00")}m<sup>2</sup><#else>0.00m<sup>2</sup></#if></td>
                <td colspan="3">
                <label class="" style=" font-weight:normal"><input class="check-box" type="checkbox"> 单宗经营控制面积 </label>
            <label class="" style=" font-weight:normal"><input class="check-box" type="checkbox"> 分签单元经营认定面积</label></td>
                <td colspan="2" class="textalign-c" ><#if bean.operatearea??>${bean.operatearea?string("0.00")}m<sup>2</sup><#else>0.00m<sup>2</sup></#if></td>
            </tr>
            <tr>
                <td colspan="2">被腾退人拟选择补偿方式</td>
                <td style="">
                <#if agreenment.atype=='0'>
                    &nbsp;&nbsp;安置房补偿方式&nbsp;&nbsp;
                <#else>
                    &nbsp;&nbsp;货币&nbsp;&nbsp;
                </#if>
                </td>
                <td>宅基地认定年限</td>
                <td style="">
                <#if agreenment.homesteadyear??>
                    <#if  agreenment.homesteadyear?default("-1") == '-1'>
                        数据未录入
                    <#elseif agreenment.homesteadyear?default("-1") == '0'>
                        82年前
                    <#elseif agreenment.homesteadyear?default("-1") == '1'>
                        82年后
                    </#if>
                <#else>
                    数据未录入
                </#if>
                </td>
                <td colspan="2">认定安置人数</td>
                <td colspan="2" class=""> ${bean.peoplecount}人</td>
            </tr>
            </table>
          <table class="table table-bordered" style="margin-bottom:0px;">
            <tr>
                <td colspan="10">认定宅基地及房屋面积相关</td>
            </tr>
            <tr>
                <td colspan="4">认定宅基地面积</td>
               
                <td colspan="2" class=""> 	
                <#if agreenment.rdzjdallarea??>${agreenment.rdzjdallarea?number?string("0.00")}m<sup>2</sup><#else>0.00m<sup>2</sup></#if>
                </td>
                <td colspan="2">认定房屋补偿建面</td>
                <td colspan="2" class=""><#if agreenment.fwbcmj??>${agreenment.fwbcmj?string("0.00")}m<sup>2</sup><#else>0.00m<sup>2</sup></#if></td>
            </tr>
            <tr>
                <td rowspan="5" style="text-align: justify">其中</td>
                <td rowspan="2" colspan="2">认定82年前（0.4亩）</td>
                <td>控制面积267m<sup>2</sup>以内<br>
                (单宗不足0.3亩补足0.3亩，<br>0.3亩至0.4亩之间及分签据实)</td>
                <td colspan="2" class="">
                <#if agreenment.homesteadyear?default("-1") == '0'>
                <#if agreenment.conhomestarea??>${agreenment.conhomestarea?string("0.00")}<#else>0.00</#if>
                <#else>

                </#if>
                   m<sup>2</sup> </td>
                <td>比例</td>
                <td>100%</td>
                <td colspan="2">宅基地区位补偿价<#if agreenment.atype=='0'>
                								6000
                							<#else>
                								26588
                							</#if>元/m<sup>2</sup></td>
            </tr>
            <tr>
                <td>超出控制标准面积</td>
                <td colspan="2" class="">
                <#if agreenment.homesteadyear?default("-1") == '0'>
                <#if agreenment.overhomesteadarea??>${agreenment.overhomesteadarea?string("0.00")} <#else>0.00 </#if>
                <#else>
					
                </#if>
                  m<sup>2</sup> </td>
                <td>比例</td>
                <td>50%</td>
                <td colspan="2">折合区位补偿价<#if agreenment.atype=='0'>
                								3000
                							<#else>
                								13294
                							</#if>元/m<sup>2</sup></td>
            </tr>
            <tr>
                <td rowspan="2" colspan="2">认定82年后（0.3亩）</td>
                <td>不足0.3亩补足0.3亩控制面积<br>或分签据实</td>
                <td colspan="2" class="">
                <#if agreenment.homesteadyear?default("-1") == '1'>
                <#if agreenment.conhomestarea??>${agreenment.conhomestarea?string("0.00")}<#else>0.00</#if>
                <#else>
					
                </#if>
                  m<sup>2</sup></td>  
                <td>比例</td>               
                <td>100%</td>               
                <td colspan="2">宅基地区位补偿价<#if agreenment.atype=='0'>
                								6000
                							<#else>
                								26588
                							</#if>元/m<sup>2</sup></td>
            </tr>
            <tr>
                <td>超出控制宅基地面积</td>
                <td colspan="2" class="">
                <#if agreenment.homesteadyear?default("-1") == '1'>
                <#if agreenment.overhomesteadarea??>${agreenment.overhomesteadarea?string("0.00")}<#else>0.00</#if>
                <#else>
                
                </#if>
                    m<sup>2</sup></td>
                <td>比例</td>
                <td>30%</td>
                <td colspan="2">折合区位补偿价 <#if agreenment.atype=='0'>
                								1800
                							<#else>
                								7976.4
                							</#if>元/m<sup>2</sup></td>
            </tr>
            <tr>
                <td colspan="2">住房困难户</td>
                <td>补偿方案、细则</td>
                <td colspan="2" class="">
                <#if agreenment.zfknhbcfa??>
                	${agreenment.zfknhbcfa?string("0.00")}
                <#else>
                </#if>
                 m<sup>2</sup></td>
                <td>比例</td>
                <td>100%</td>
                <td colspan="2">宅基地区位补偿价6000元/m<sup>2</sup></td>
            </tr>
          </table>
          <table class="table table-bordered" style="margin-bottom:0px;">
            <tr>
                <td colspan="3">认定序号</td>
                <td>认定安置<br>人员姓名</td>
                <td colspan="1">产关</td>
                <td colspan="3">安置状况</td>
                <td colspan="4">村腾退认定工作小组确认签字（盖章）</td>
            </tr>
     <#if bean.vacatelist??>
        <#if bean.vacatelist?size lt 13>
            <#if bean.vacatelist?size lt 1>
                    <tr>
                        <td colspan="3">本址1</td>
                        <td></td>
                        <td colspan="1"></td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                        <td colspan="1"></td>
                        <td colspan="4" rowspan="12"></td>
                    </tr>

            <#else>
                <#list bean.vacatelist as vacate>
                    <#if vacate_index == 0>
                        <tr>
                            <td colspan="3">本址${vacate_index+1}</td>
                            <td>${vacate.name?default("")}</td>
                            <td colspan="1">${vacate.changrelate?default("")}</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;"  type="checkbox">未安置</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                        <td colspan="1"></td>                         
                            <td colspan="4" rowspan="12"></td>
                        </tr>
                    <#else>
                        <tr>
                            <td colspan="3">本址${vacate_index+1}</td>
                            <td>${vacate.name?default("")}</td>
                            <td colspan="1">${vacate.changrelate?default("")}</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                        <td colspan="1"></td>
                        </tr>
                    </#if>
                </#list>
            </#if>
            <#list 1..(12-bean.vacatelist?size) as t>
                <tr>
                    <td colspan="3">本址${bean.vacatelist?size+t_index+1}</td>
                    <td></td>
                    <td colspan="1"></td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                        <td colspan="1"></td>
                </tr>
            </#list>
        <#else>
            <#list bean.vacatelist as vacate>
                <#if vacate_index == 0>
                    <tr>
                        <td colspan="3">本址${vacate_index+1}</td>
                        <td>${vacate.name?default("")}</td>
                        <td colspan="1">${vacate.changrelate?default("")}</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                        <td colspan="1"></td>
                        <td colspan="4" rowspan="${bean.vacatelist?size}"></td>
                    </tr>
                <#else>
                    <tr>
                        <td colspan="3">本址${vacate_index+1}</td>
                        <td>${vacate.name?default("")}</td>
                        <td colspan="1">${vacate.changrelate?default("")}</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                        <td colspan="1"></td>
                    </tr>
                </#if>
            </#list>
        </#if>


     <#else>
         <#list 1..12 as t>
             <#if t_index == 1>
                 <tr>
                     <td colspan="3">本址${t_index+1}</td>
                     <td></td>
                     <td colspan="1"></td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                        <td colspan="1"></td>
                     <td colspan="4" rowspan="12"></td>
                 </tr>
             <#else>
                 <tr>
                     <td colspan="3">本址${t_index+1}</td>
                     <td>${vacate.name?default("")}</td>
                     <td colspan="1"></td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                        <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                        <td colspan="1"></td>
                 </tr>
             </#if>
         </#list>
     </#if>
            <tr>
                <td colspan="3">非本址1</td>
                <td>
                <#if bean.list?size gt 0>${bean.list[0].name?default("")}</#if>
                </td>
                <td colspan="1">
                <#if bean.list?size gt 0>${bean.list[0].changrelate?default("")}</#if>
                </td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">腾内</td>
                <td rowspan="2" colspan="4">
                    被腾退人特别保证如下：<br>
                    我本人完全知悉补偿方案和认定程序，对上述确认各项结果均无异议。
                </td>
            </tr>
            <tr>
                <td colspan="3">非本址2</td>
                <td>
                <#if bean.list?size gt 1> ${bean.list[1].name?default("")}</#if>
                </td>
                <td colspan="1">
                <#if bean.list?size gt 1>${bean.list[1].changrelate?default("")}</#if>
                </td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">腾内</td>
            </tr>
            <tr>
                <td colspan="3">非本址3</td>
                <td>
                <#if bean.list?size gt 2>${bean.list[2].name?default("")}</#if>
                </td>
                <td colspan="1">
                <#if bean.list?size gt 2>${bean.list[2].changrelate?default("")}</#if>
                </td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">腾内</td>
                <td rowspan="2" colspan="4" style="text-align: left;">签字（按指纹）</td>
            </tr>
            <tr>
                <td colspan="3">非本址4</td>
                <td>
                <#if bean.list?size gt 3>${bean.list[3].name?default("")}</#if>
                </td>
                <td colspan="1">
                <#if bean.list?size gt 3> ${bean.list[3].changrelate?default("")}</#if>
                </td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">腾内</td>
            </tr>
            <tr>
                <td colspan="3">非本址5</td>
                <td>
                <#if bean.list?size gt 4> ${bean.list[4].name?default("")}</#if>
                </td>
                <td colspan="1">
                <#if bean.list?size gt 4> ${bean.list[4].changrelate?default("")}</#if>
                </td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">腾内</td>
                <td colspan="4">签字日期：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日</td>
            </tr>
            <tr>
                <td colspan="3">非本址6</td>
                <td>
                <#if bean.list?size gt 5> ${bean.list[5].name?default("")}</#if>
                </td>
                <td colspan="1">
                <#if bean.list?size gt 5> ${bean.list[5].changrelate?default("")}</#if>
                </td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">腾内</td>
                <td colspan="4">签字日期：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日</td>
            </tr>
            <tr>
                <td colspan="3">非本址7</td>
                <td>
                <#if bean.list?size gt 6> ${bean.list[6].name?default("")}</#if>
                </td>
                <td colspan="1">
                <#if bean.list?size gt 6> ${bean.list[6].changrelate?default("")}</#if>
                </td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">腾内</td>
                <td colspan="4">签字日期：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日</td>
            </tr>
            <tr>
                <td colspan="3">非本址8</td>
                <td>
                <#if bean.list?size gt 7> ${bean.list[7].name?default("")}</#if>
                </td>
                <td colspan="1">
                <#if bean.list?size gt 7> ${bean.list[7].changrelate?default("")}</#if>
                </td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">未安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">已安置</td>
                <td colspan="1"><input style="margin-top:1px;height:8px;width:8px;" type="checkbox">腾内</td>
                <td colspan="4">签字日期：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日</td>
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