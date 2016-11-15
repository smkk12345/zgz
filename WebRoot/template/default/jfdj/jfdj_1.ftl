<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>

<div class="container-fluid rhjc">
    <div class="page-title">
        <ul class="nav nav-pills menu mb10">
            <li role="presentation" class="active"><a href="${BASE_PATH}jfdj/jfdj_1.action">已交房</a></li>
            <li role="presentation" ><a href="${BASE_PATH}jfdj/jfdj_0.action">未交房</a></li>
        </ul>
    </div>
    <div class="top-ation mb10 clearfix">
        <div class="fl">
            <!--                <button class="btn btn-primary btn-xs glyphicon glyphicon-export">导出</button>-->
        </div>
        <div class="fl">
            <form  action="${BASE_PATH}/jfdj_1.action" accept-charset="UTF-8" method="post" >
                <div class=' autoWidthGroup-2 fl '>
                    <label class='fl control-label'>被腾退人姓名:</label>
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
            <th>被腾退人</th>
            <th>手机</th>
            <th>身份证</th>
            <th>安置方式</th>
            <th>房屋坐落</th>
            <th>房屋间数</th>

            <th>操作</th>
        </tr>
        <@JfdjList list pageNo pageSize/>
    </table>
    <div id="yu-pager" class="fl mb20">
        <#import "../macro_ftl/pager.ftl" as p>
        <#if recordCount??>
        <@p.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="/jfdj_1.action" OtherParameter=""/>
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
                    location.href = "${BASE_PATH}" + "/index.action";
                },
                success: function (response) {
                    location.href = "${BASE_PATH}" + "/index.action";
                }
            })
        }
    }

    function confirmOthers(btn) {
        if (yu_confirm("您确认已经交房？")) {
            var url = $(btn).attr("data-url");
            //var par = $("#"+pname);
            $.ajax({
                cache: true,
                type: "POST",
                url: url,
                dataType: "json",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    location.href = "${BASE_PATH}" + "/jfdj_1.action";
                },
                success: function (response) {
                    location.href = "${BASE_PATH}" + "/jfdj_1.action";
                }
            })
        }
    }


</script>
