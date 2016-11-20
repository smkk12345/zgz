<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
            
<div class="container-fluid rhjc">
    <ul class="nav nav-pills menu mb5 clearfix">
        <div class="page-title">
            <h4 class="bold">协议签订管理</h4>
        </div>
        <div class="top-ation mb10 clearfix">
            <div class="fl">
              <form  action="${BASE_PATH}pgzq/fhxy.action" accept-charset="UTF-8" method="post" >
	            	<div class=' autoWidthGroup-2 fl '>
	                    <label class='fl control-label'>被腾退人:</label>
	                    <input type='text' class='form-control input-sm  ' name='names' value="${names?default("")}"/>   
	                </div>
	            	<div class='autoWidthGroup-2 fl '>
	                    <label class='fl control-label'>手机:</label>
	                    <input type='text' class='form-control input-sm  ' name='mobile' value="${mobile?default("")}"/>    
	                </div>
	                <div class='autoWidthGroup-2 fl '>
	                    <label class='fl control-label'>房屋坐落:</label>
	                    <input type='text' class='form-control input-sm  ' name='location' value="${location?default("")}" />
	                </div>  
	            	<div class='autoWidthGroup-2 fl '>
	                    <label class='fl control-label'>身份证号:</label>
	                    <input type='text' class='form-control input-sm  ' name='idcard' value="${idcard?default("")}" />
	                </div>  
	                <div class='autoWidthGroup-2 fl '>
	                    <label class='fl control-label'>安置方式:</label>
	                    <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='atype' >  
	                        <option  <#if (atype?default("-1"))=='-1'>selected='selected'</#if> value="-1">请选择</option>  
	                        <option  <#if (atype?default("-1"))=='0'>selected='selected'</#if>  value="0">房屋安置</option>  
	                        <option  <#if (atype?default("-1"))=='1'>selected='selected'</#if> value="1">货币补偿</option> 
                    	</select>
	                </div>
	                <div class='autoWidthGroup-2 fl '>
	                    <label class='fl control-label'>签约状态:</label>
	                    <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='qianyue' >  
	                        <option  <#if (qianyue?default("-1"))=='-1'>selected='selected'</#if> value="-1">请选择</option>  
	                        <option  <#if (qianyue?default("-1"))=='0'>selected='selected'</#if>  value="0">已签约</option>  
	                        <option  <#if (qianyue?default("-1"))=='1'>selected='selected'</#if> value="1">未签约</option> 
                    	</select>
	                </div>    
                  <div class='autoWidthGroup-2 fl '> <button type="submit" class="btn btn-primary btn-xs glyphicon glyphicon-search ">查询</button></div>
	               
	            </form>
            </div>
        </div>

        <table  class="table table-bordered table-hover">
            <tr>
                <th>编号</th>
                <th>标段</th>
                <th>被腾退人</th>
                <th>安置方式</th>
                <th>认定面积</th>
                <th>认定人口</th>
                <th>选房购房款</th>
                <th>奖励费补助费合计</th>
                <th>打 印</th>
                <th>确认签约</th>
                <th>协议编号</th> 
                <th>协议首页打印</th>
                <th>选房顺序号</th>
                <th>告知单</th>
            </tr>
            <@FhxyList list pageNo pageSize/>
        </table>
        <div id="yu-pager" class="fl mb20">
            <#import "../macro_ftl/pager.ftl" as p>
            <#if recordCount??>
            <@p.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="/pgzq/fhxy.action" 
		 OtherParameter="atype=${atype?default('')},names=${names?default('')},mobile=${mobile?default('')},idcard=${idcard?default('')}"/>
            </#if>
        </div>
    </ul>
</div>
<script type="text/javascript">

</script>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">
    $(".modal-dialog").attr("style", "width:95%;");
    function toExcel(inTblId, inWindow) {
        var fileName = '${CommenData.time_jc}' + ".xls";
        name.split(" ").join("");
        fileName = fileName.replace(" ", "-");
        fileName = fileName.split(":").join("-");
        fileName = fileName.split("-").join("");
        $("#yu-print-show").tableExport({type: 'excel', separator: ';', escape: 'false'}, fileName);
        e.preventDefault();
    }

    function doFileExport(inName, inStr) {
        var xlsWin = null;
        if (!!document.all("glbHideFrm")) {
            xlsWin = glbHideFrm;
        } else {
            var width = 1;
            var height = 1;
            var openPara = "left=" + (window.screen.width / 2 + width / 2) + ",top=" + (window.screen.height + height / 2) + ",scrollbars=no,width=" + width + ",height=" + height;
            xlsWin = window.open("", "_blank", openPara);
        }
        xlsWin.document.write(inStr);
        xlsWin.document.close();
        xlsWin.document.execCommand('Saveas', true, inName);
        xlsWin.close();
    }

    function yu_print1() {
        alert(1231);
        toExcel("yu-print-show", null);
    }

    function delBtnClick(btn) {
        if (yu_confirm("确认删除该数据？")) {
            var curDataId = $(btn).attr("pname");
            var p = $(btn).attr("data-url");
            var par = $(btn).parent().parent();
            //var par = $("#"+pname);
            $.ajax({
                cache: true,
                type: "POST",
                url: p,
                dataType: "json",
                data: {housebasicid: curDataId},
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                   location.href="${BASE_PATH}"+"/index.action";
                },
                success: function (response) {
                   location.href="${BASE_PATH}"+"/index.action";
                }
            })
        }
    }
    
	 function confirmSign(btn) {
	        if (yu_confirm("确定签约？")) {
	            var url = $(btn).attr("data-url");
	            //var par = $("#"+pname);
	            $.ajax({
	                cache: true,
	                type: "POST",
	                url: url,
	                dataType: "json",
	                error: function (XMLHttpRequest, textStatus, errorThrown) {
                   		location.href="${BASE_PATH}"+"pgzq/fhxy.action";
                	},
	                success: function (response) {
	                	var protocolumnber = response.protocolumnber;
	                	var displaydate = response.displaydate;
	                	location.href="${BASE_PATH}"+"pgzq/fhxy.action";
	                }
	            })
	        }
	    }

</script>
