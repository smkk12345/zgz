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
            <h4 class="bold">数据锁定与解锁</h4>
        </div>
        <div class="top-ation mb10 clearfix">
            <div class="fl">
<!--                <button class="btn btn-primary btn-xs glyphicon glyphicon-export">导出</button>-->
            </div>
            <#if role.roleAuthority[6]=="2">
            <div class="fl">
              <form  action="${BASE_PATH}pgzq/sdjs.action" accept-charset="UTF-8" method="post" >
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
	                    <select id='atypeChange' class='form-control input-sm fl' style='width:120px;' name='atype' >  
	                        <option  <#if (atype?default("-1"))=='-1'>selected='selected'</#if> value="-1">请选择</option>  
	                        <option  <#if (atype?default("-1"))=='0'>selected='selected'</#if>  value="0">房屋安置</option>  
	                        <option  <#if (atype?default("-1"))=='1'>selected='selected'</#if> value="1">货币补偿</option> 
                    	</select>
	                </div>  
                  <div class='autoWidthGroup-2 fl '> <button type="submit" class="btn btn-primary btn-xs glyphicon glyphicon-search ">查询</button></div>
	               
	            </form>
            </div>
            </#if>
        </div>

        <table  class="table table-bordered table-hover">
            <tr>
                <th>编号</th>
                <th>标段</th>
                <th>被腾退人</th>
                <th>安置方式</th>
                <th>认定面积</th>
                <th>认定人口</th>
                <th>锁定/解锁</th>
                <th>废除签约号</th>
            </tr>
        <#if list?size gt 0>
	        <#list list as ROW>
	        <tr id="${ROW.id}">
	            <td>${ROW.sectionindex}</td>
	            <td>${ROW.section?default("")}</td>
	            <td>${ROW.names?default("")}</td>
	            <td>
	                <#if (ROW.atype)??>
	                    <#if ROW.atype?default("0")=="0">
	                        房屋安置
	                    <#else>
	                        货币补偿
	                    </#if>
	                <#else>
	                    未录入
	                </#if>
	            </td>
	            <td class="td_azfghk">${ROW.azfgfk?default("")}</td>
	            <td class="td_jshk">${ROW.jshk?default("")}</td>
	            <td>
	            <#if ROW.islock??> 
	            	<#if ROW.islock=="1">
	                    <button type="button" class="btn btn-warning btn-xs ml10" onclick="lock('${ROW.housebasicid}','0')"
	                    title='解锁'
	                    >解锁</button>
	                <#else>
	            	    <button type="button" class="btn btn-success btn-xs ml10   " onclick="lock('${ROW.housebasicid}','1')"
	                    title='锁定'
	                   >锁定</button>
		           	</#if>
	            <#else>
            		<button type="button" class="btn btn-success btn-xs ml10   " onclick="lock('${ROW.housebasicid}','1')"
                    title='锁定'
                    >锁定</button>
	           	</#if>
	            </td>
	            <td class="td_jshk">
	                <button type="button" class="btn btn-success btn-xs ml10   " onclick="unSign('${ROW.housebasicid}')"
                    title='解除签约'
                    >解除签约</button>
	            </td>
	        </tr>
	        </#list>
    	</#if>
        </table>
        <div id="yu-pager" class="fl mb20">
            <#import "../macro_ftl/pager.ftl" as p>
            <#if recordCount??>
            <@p.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="/pgzq/sdjs.action" 
            OtherParameter="location=${location?default('')},atype=${atype?default('')},names=${names?default('')},mobile=${mobile?default('')},idcard=${idcard?default('')}"/>
            </#if>
        </div>
    </ul>
</div>
<script type="text/javascript">

</script>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">
	
	
	function lock(housebasicid,islock){
     //   var p = $(btn).attr("data-url");
        var url = '${BASE_PATH}'+"pgqq/lockornot.action?housebasicid="+housebasicid+"&"+"islock="+islock;
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
               alert("操作失败！");
            },
            success: function (response) {
               alert("操作成功！");
               window.location.reload();//刷新当前页面
            }
        })
	}
	
	function unSign(housebasicid){
     //   var p = $(btn).attr("data-url");
        var url = '${BASE_PATH}'+"/pgzq/unSign.action?housebasicid="+housebasicid;
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
               alert("操作失败！");
            },
            success: function (response) {
               alert("操作成功！");
               window.location.reload();//刷新当前页面
            }
        })
	}
	
	$(function(){ 
		$("#atypeChange").change(function(){
			var selvalue = $(this).val();
			if(selvalue == '1'){
				$("#th_xf").hide();
				$("#th_jsfh").hide();
				$(".td_azfghk").hide();
				$(".td_jshk").hide();
			}else{
				$("#th_xf").show();
				$("#th_jsfh").show();
				$(".td_azfghk").show();
				$(".td_jshk").show();
			}
		})
		
		var atype = '${atype}';
		if(atype == '1'){
				$("#th_xf").hide();
				$("#th_jsfh").hide();
				$(".td_azfghk").hide();
				$(".td_jshk").hide();
			}else{
				$("#th_xf").show();
				$("#th_jsfh").show();
				$(".td_azfghk").show();
				$(".td_jshk").show();
			}
		
	}) 
	
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

	
	
</script>
