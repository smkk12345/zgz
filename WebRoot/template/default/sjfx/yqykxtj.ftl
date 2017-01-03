<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<#setting number_format="0.##">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
            
<div class="container-fluid rhjc">
    <ul class="nav nav-pills menu mb5 clearfix">
        <div class="page-title">
            <h4 class="bold">已签约款项统计</h4>
        </div>

        <table  class="table table-bordered table-hover">
            <tr>
                <th>总签约户数</th>
                <th>房屋安置签约户数</th>
                <th>货币补偿签约户数</th>
                <th>腾退补偿款总价(元)</th>
                <th>房屋安置腾退补偿款总价(元)</th>
                <th>货币补偿退补偿款总价(元)</th>
                <th>购房款(元)</th>
                <th>结算后款(元)</th>
                <th>认定宅基地面积(平米)</th>
            </tr>
            <#if list?size gt 0>
				<#list list as ROW >
					<tr>
						<td>${ROW['zqyhs']}</td>
						<td>${ROW['fwazqyhs']}</td>
						<td>${ROW['hbazqyhs']}</td>
						<td>${ROW['ttbczj']?number}</td>
						<td>${ROW['fwazttbczj']?number}</td>
						<td>${ROW['hbazttbczj']?number}</td>
						<td>${ROW['gfk']?number}</td>
						<td>${ROW['jshk']?number}</td>
						<td> ${(ROW['rdzjdallarea']?number)?string("0.00")}</td>
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
