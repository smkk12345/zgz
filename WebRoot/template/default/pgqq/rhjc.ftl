<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
<div class="container-fluid rhjc">
    <ul class="nav nav-pills menu mb5 clearfix">
        <table id='yu-print-show' class="table table-condensed table-bordered mt10">
        <thead>
            <tr>
                <th fontsize="26" colspan="6" class="danger textalign-vc" style="line-height: 29px">
                    <i class="bold">入户基础信息管理列表22</i> 
                    <button type="button" class="btn btn-sm btn-default pull-right bold" onclick='yu_print()'>打 印</button>
                    <button type="button" class="btn btn-sm btn-default pull-right bold" onclick='yu_print1()'>导Excel</button>
                </th> 
            </tr>
            <tr>
            	<th>被腾退人姓名</th>
            	<th>所属标段</th>
            	<th>联系固话</th>
            	<th>身份证号</th>
            	<th>通信地址</th>
            	<th>操作</th>
            </tr>
        </thead>
        
        <tbody>
            <@HousebasicList list/>
        </tbody>
    </table>
        <hr size='0.5' width='100%'  align='center' color='#999999;'>
        <#if role.roleAuthority[7]=="2">
         <a class="btn btn-info btn-group-sm pull-left dropdown-toggle YL-ModalClick" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-url='${BASE_PATH}/pgqq/rhjc_add_Modal.action'  title="点击登记信息"><span class="glyphicon glyphicon-plus white"></span> 登记</a>
        <a class="btn btn-info btn-group-sm pull-left ml10" href="#" onclick='yu_print1()' title="点击导出信息"><span class="glyphicon glyphicon-export white"></span> 导出</a>
        </#if>
    </ul>
    <form class="cang-qu form-horizontal" >
        <div class="container-fluid mt7">
            <div class="aojian" id="barnCont" aaab="aaaaab">

            </div>
        </div>
    </form>
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
