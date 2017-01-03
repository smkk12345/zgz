<form  action="${BASE_PATH}pgqq/checkresult.action?housebasicid=${housebasic.id}" accept-charset="UTF-8" method="post">
    <div class="modal-header clearfix">
        <h4 class="modal-title pull-left m0">用户方案审核审计(共5项)</h4>
        <button type="submit" class="btn btn-primary btn-save fr ml15">确定</button>
        <button type="button" class="btn btn-default fr" data-dismiss="modal">关闭</button>
    </div>
    <div class="modal-body rhjc-add-con rhjc-check" id="rhjc-add-con">


        <input type="hidden" class='form-control input-sm ' name='id' value="${bean.id?default("")}" style="width: 0px;"/>
        <div class='container-fluid con-bg mb10'>	
            <div class='checkbox-2'>      
                <label class='fl control-label'>复核状态: &nbsp;&nbsp;</label>
                <input class="ml10"  type="radio" name="checkresult" id="optionsRadios3" value="1" <#if (bean.checkresult?default("0"))=='1'>checked</#if>> 通过&nbsp;&nbsp;
                       <input class="ml10" type="radio" name="checkresult" id="optionsRadios4" value="0" <#if (bean.checkresult?default("0"))=='0'>checked</#if>> 退回   

            </div>
            <div class='mt10'>      
                <label class='fl control-label pr10'>复核人员: </label>
                <input type='text' class='form-control input-sm  width-150px' name='checkname' value="${bean.checkname?default("")}" />  
            </div>
            <div class='mt10'>  
                <label class='fl control-label pr10'>复核日期: </label>
                <input type='text' class='form-control input-sm  width-150px' name='checkDate' value="${bean.checkDate?default("")}"/>    
            </div>
            <div class='mt10'>
                <label class='fl control-label'>备注:</label>
                <textarea class="form-control fr" rows="5" name="checkremark" placeholder="备注(选填，限1500字)" >${bean.checkremark?default("")}</textarea>
            </div>
        </div>


       <!-- <div >
            <h4><span class="label label-default">一.基本数据录入：</span></h4>
            <div class='container-fluid con-bg mb10'>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>被腾退人姓名:${bean.names?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>房屋坐落:${bean.location}</label>
                </div>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>联系固话: ${bean.telephone?default("/")}</label>      
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>手机: ${bean.mobile?default("/")}</label>     
                </div>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>被腾退人身份证号:${bean.idcard?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>安置意向:
                    	<#if  (bean.atype?default("-1"))=='1'>
                    		货币补偿
                    	<#elseif (bean.atype?default("-1"))=='0'>
                    		安置补偿
                    	<#else>
                    		未选择补偿方式
                    	</#if>
                    </label>
                </div>

            </div>
            <h4><span class="label label-default">二.宅基地，房屋信息：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>宅基地实测用地面积:${bean.scydmj?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>宅基地认定年限:${bean.homesteadyear}</label>
                </div>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>宅基地控制面积:${bean.conhomestarea?default("/")}</label>      
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>超出宅基地控制面积:${bean.overhomesteadarea?default("/")}</label>     
                </div>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>现状实测房屋建筑面积:${bean.wfhbz?default("/")}</label>
                </div>
               <div class=' chkstyle fl'>
                    <label class='fl control-label'>首层建筑面积:${bean.firstfloorarea?default("/")}</label>      
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>二层及以上建筑面积:${bean.abovetwoarea?default("/")}</label>     
                </div>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>地下室建筑面积:${bean.basement?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>棚面积:${bean.shed?default("/")}</label>     
                </div>
                <div class=' chkstyle fl'>
                    <label class='fl control-label'>认定房屋补偿面积:${bean.fwbcmj?default("/")}</label>
                </div>
            </div>
            <h4><span class="label label-default">三.认定人口信息：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>认定人口数量:${bean.rdbazrk?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>认定人口信息:${bean.rdbazrkxx?default("/")}</label>
                </div>
                
            </div>
            <h4><span class="label label-default">四.宅基地腾退补偿款：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>评估方:${bean.pgjg?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>控制宅基地区位补偿价:${bean.kzzjdqwbcj?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>超控宅基地区位补偿价:${bean.ckzjdqwbcj?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>被腾退房屋重置成新价:${bean.bttfwczcxj?default("/")}</label>
                </div>
                
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>宅基地腾退补偿款(合计):${bean.zjdttbck?default("/")}</label>
                </div>
            </div>
            <h4><span class="label label-default">五.奖励费 补助费：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>提前搬家奖:${bean.tqbjl?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>工程配合奖:${bean.gcphjl?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>腾退促进奖:${bean.ttcjjl?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>无违章奖励费:${bean.wwzjl?default("/")}</label>
                </div>
                
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>未建二层奖励费:${bean.wjecjj?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>搬家及家电迁移补助:${bean.bjbz?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>期房补助费:${bean.qfbz?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>大病补助:${bean.dbbz?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>残疾补助:${bean.cjbz?default("/")}</label>
                </div>
                
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>独生子女奖励费:${bean.dsznbz?default("/")}</label>
                </div>  
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>一次性停产停业补助费:${bean.tctdbz?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>其他补助费:${bean.otherbz?default("/")}</label>
                </div>
                
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>合计:${bean.jlfsum?default("/")}</label>
                </div>                
            </div>
            <h4><span class="label label-default">六.安置选房信息：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>安置房源:${bean.fyxx?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>一居室:${bean.yjs?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>二居室（70）:${bean.ljs70?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>二居室（75）:${bean.ljs75?default("/")}</label>
                </div>
                
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>二居室（80）:${bean.ljs80?default("/")}</label>
                </div>
                
                 <div class=' chkstyle fl'>      
                    <label class='fl control-label'>二居室（85）:${bean.ljs85?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>三居室:${bean.sjs?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>实际选房面积:${bean.sjxfmj?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>购房款:${bean.azfgfk?default("/")}</label>
                </div>
                
            </div>
            <h4><span class="label label-default div_seven">七.其他：</span></h4>
            <div class='container-fluid con-bg mb10'>	
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>腾退时间:${bean.ttrq?default("/")}</label>
                </div>
            </div>
          	<h4><span class="label label-default div_eight">八.评估款，补偿补助及奖励费合计：</span></h4>
            <div class='container-fluid con-bg mb10'>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>总补偿款:${bean.zjdttzj?default("/")}</label>
                </div>
                <div class=' chkstyle fl'>      
                    <label class='fl control-label'>结算后款:${bean.wwzjlf?default("/")}</label>
                </div>
            </div>  
        </div>	 -->
    </div>
</from>
<script type = "text/javascript">

	$(document).ready(function () {
        var b = '${bean.atype!''}';
        if (b.length == 0) {

        } else {
            if (b == '1') {
                $(".azxy").hide();
                $(".div_seven").html("六.其他：");
                $(".div_eight").html("七.评估款，补偿补助及奖励费合计：");
            }
            else {
                $(".azxy").show();
                $(".div_seven").html("七.其他：");
                $(".div_eight").html("八.评估款，补偿补助及奖励费合计：");
            }
        }
    });
    
    //设置模态框高度和宽度  
    $("#rhjc-add-con").css("height", ($(window).height() - 250) + "px");
    $("#rhjc-add-con").css("overflow-y", "scroll");

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

    function addlist(a, c) {
        var b = $(a + "").prev();
        var h = b.html();
        b.after("<tr class=" + c + "" + ">" + h + "</tr>" + "");
    }

    function delthis(f, c) {
        var num = $(f).parent().parent().parent().children('.' + c).length;
        if (num > 1) {
            $(f).parent().parent().remove();
        } else {
            alert("至少保留一行！");
        }


    }
</script>