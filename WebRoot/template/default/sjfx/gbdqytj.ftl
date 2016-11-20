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
            <h4 class="bold">各标段签约统计</h4>
        </div>
        <div class="top-ation mb10 clearfix">
            <div class="fl">
<!--                <button class="btn btn-primary btn-xs glyphicon glyphicon-export">导出</button>-->
            </div>
        </div>
        <table  class="table table-bordered table-hover">
            <tr>
                <th rowspan=2>编号</th>
                <th colspan=3>全部(户)</th>
                <th colspan=3>当日签约(户)</th>
                <th colspan=3>累计签约(户)</th>
            </tr>
            <tr>
                <th >合计</th>
                <th >安置</th>
                <th >货币</th>
                <th >合计</th>
                <th >安置</th>
                <th >货币</th>
                <th >合计</th>
                <th >安置</th>
                <th >货币</th>
            </tr>
            <#if list?size gt 0>
				<#list list as ROW >
					<tr>
						<td>${ROW.displaysection}</td>
						<td>${ROW.hjaz?number + ROW.hjhb?number}</td>
						<td>${ROW.hjaz}</td>
						<td>${ROW.hjhb}</td>
						
						<td>${ROW.dtaz?number + ROW.dthb?number}</td>
						<td>${ROW.dtaz}</td>
						<td>${ROW.dthb}</td>
						
						<td>${ROW.ljaz?number + ROW.ljhb?number}</td>
						<td>${ROW.ljaz}</td>
						<td>${ROW.ljhb}</td>
					</tr>
				</#list>
			</#if>
        </table>
      
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
</script>
