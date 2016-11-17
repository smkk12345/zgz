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
            <h4 class="bold">签约顺序号台账</h4>
        </div>
        <div class="top-ation mb10 clearfix">
            <div class="fl">
<!--                <button class="btn btn-primary btn-xs glyphicon glyphicon-export">导出</button>-->
            </div>
            <div class="fl">
              <form  action="${BASE_PATH}sjfx/qysxhtz.action" accept-charset="UTF-8" method="post" >
              		<div class=' autoWidthGroup-2 fl '>
	                    <label class='fl control-label'>标段:</label>
	                    <input type='text' class='form-control input-sm  ' name='section' value="${section?default("")}"/>   
	                </div>
	            	<div class=' autoWidthGroup-2 fl '>
	                    <label class='fl control-label'>被腾退人:</label>
	                    <input type='text' class='form-control input-sm  ' name='names' value="${names?default("")}"/>   
	                </div>
	            	<div class='autoWidthGroup-2 fl '>
	                    <label class='fl control-label'>手机:</label>
	                    <input type='text' class='form-control input-sm  ' name='mobile' value="${mobile?default("")}"/>    
	                </div>
	            	<div class='autoWidthGroup-2 fl '>
	                    <label class='fl control-label'>身份证号:</label>
	                    <input type='text' class='form-control input-sm  ' name='idcard' value="${idcard?default("")}" />
	                </div>  
                  <div class='autoWidthGroup-2 fl '> <button type="submit" class="btn btn-primary btn-xs glyphicon glyphicon-search ">查询</button></div>
	               
	            </form>
            </div>
        </div>

        <table  class="table table-bordered table-hover">
            <tr>
                <th>编号</th>
                <th>标段</th>
                <th>档案编号</th>
                <th>被腾退人</th>
                <th>签约顺序号</th>
                <th>签约顺序号获取日期</th>
                <th>经办人</th>
                <th>IP地址</th>
            </tr>
            <@QysxhtzList list pageNo pageSize/>
        </table>
        <div id="yu-pager" class="fl mb20">
            <#import "../macro_ftl/pager.ftl" as p>
            <#if recordCount??>
            <@p.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="/sjfx/qysxhtz.action" 
            OtherParameter="section=${section?default('')},names=${names?default('')},mobile=${mobile?default('')},idcard=${idcard?default('')}"/>
            </#if>
        </div>
    </ul>
</div>
<script type="text/javascript">

</script>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">

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

</script>
