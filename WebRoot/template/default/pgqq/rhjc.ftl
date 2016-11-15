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
            <h4 class="bold">入户基础信息管理</h4>
        </div>
        <div class="top-ation mb10 clearfix">
            <div class="fl">
                <#if role.roleAuthority[11]=="2">
                <button class="btn btn-primary btn-xs glyphicon glyphicon-plus pull-left dropdown-toggle YL-ModalClick mr10" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-url='${BASE_PATH}/pgqq/rhjc_add_Modal.action' title="点击登记信息">登记</button>
               	</#if>
<!--                <button class="btn btn-primary btn-xs glyphicon glyphicon-export">导出</button>-->
            </div>

            <div class="fr">
                <form  action="${BASE_PATH}/index.action" accept-charset="UTF-8" method="post" >
                    <div class=' autoWidthGroup-2 fl'>
                        <label class='fl control-label'>房屋坐落:</label>
                        <input type='text' class='form-control input-sm  ' name='location' value="${location?default("")}" />   
                    </div>
                    <div class=' autoWidthGroup-2 fl '>
                        <label class='fl control-label'>被腾退人姓名:</label>
                        <input type='text' class='form-control input-sm ' name='names' value="${names?default("")}"/>   
                    </div>
                    <div class='autoWidthGroup-2 fl '>
                        <label class='fl control-label'>手机:</label>
                        <input type='text' class='form-control input-sm  ' name='mobile' value="${mobile?default("")}"/>    
                    </div>
                    <div class='autoWidthGroup-2 fl'>
                        <label class='fl control-label'>身份证号:</label>
                        <input type='text' class='form-control input-sm  ' name='idcard' value="${idcard?default("")}" />
                    </div>  
                    <div class='autoWidthGroup-2 fl'><button type="submit" class="btn btn-primary btn-xs glyphicon glyphicon-search ">查询</button></div>                   
                </form>
            </div>
        </div>

        <table  class="table table-bordered table-hover">
            <tr>
                <th>编号</th>
                <th>标段</th>
                <th>被腾退人</th>
                <th>身份证</th>
                <th>房屋坐落</th>
                <th>房屋间数</th>
                <th>拟被安置人口</th>
                <th>宅基地测绘</th>
                <th>建筑测绘</th>
                <th>手机</th>
                <th>操作</th>
                <th>分户</th>
            </tr>
            <@HousebasicList list pageNo pageSize/>
        </table>
        <div id="yu-pager" class="fl mb20">
            <#import "../macro_ftl/pager.ftl" as p>
            <#if recordCount??>
            <@p.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="/pgqq/rhjc.action" OtherParameter=""/>
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


</script>
