<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="ytfx container-fluid">
 <#if STATUS == "noGrain">
        <div class="alert alert-danger">${disSelectName?default("")} 仓内没有粮食！</div>
    <#else>
    <ul class="nav nav-pills menu">
        <#include "ytfxMenu.ftl"/>
        <li role="presentation" class="pull-right"></li>
    </ul>
    <#if Data?? && dataNum!=0>
    <ul class="cloudPic clearfix">
        <#list Data as vo>
        <li class="thumbnail">
            <a class="YL-ModalClick" href="javascript:showCloudPic(this);" data-url='${BASE_PATH}lqjc/ytfxModal.action?lqId=${vo.lqId}' onclick='showCloudPic(this)' title="点击查看温度云图"><div class="img-cloud" style="background-image: url('${vo.image}')"></div></a>
            <div class="caption">
                <h5>${vo.startDate}粮情</h5>
                <p class="con-text">
                    平均温度：${vo.jwz}<br>
                    平均湿度：${vo.jsz}<br>
                    平均水分：${vo.jsf}<br>
                </p>
                <p class="mt10">
                    <a class="btn btn-warning btn-sm YL-ModalClick mr10" href="javascript:showCloudPic(this);" data-url='${BASE_PATH}lqjc/ytfxModal.action?lqId=${vo.lqId}&ytType=1'  role="button" title="点击查看云图">温度</a> 
                     <a class="btn btn-primary btn-sm YL-ModalClick mr10" href="javascript:showCloudPic(this);" data-url='${BASE_PATH}lqjc/ytfxModal.action?lqId=${vo.lqId}&ytType=2'  role="button" title="点击查看云图">湿度</a>
                    <a href="#" class="btn btn-default btn-sm delCloudPic" role="button" data='${vo.lqId}' title="删除云图">删除</a>
                </p>
            </div>
        </li>
        </#list>
    </ul>
    <div id="yu-pager">
        <#import "../macro_ftl/pager.ftl" as p>
        <#if recordCount??>
        <@p.pager pageNo=pageNo pageSize=10 recordCount=recordCount toURL="/lqjc/ytfx.action" OtherParameter=""/>
        </#if>
    </div>
    <#else>
    <div class="jumbotron mt10">
        <h4>还没有云图，点击添加云图！</h4>
        <p class="mt7"><a class="btn btn-success btn-group-sm" href="${BASE_PATH}lqjc/ytfx_1.action" role="button" disabled="disabled">添加云图</a></p>
    </div>
    </#if>
 </#if>
</div>
<script type="text/javascript">
    //展示云图
    function showCloudPic(btn) {
        $('#myModal').modal({
            keyboard: false
        });
        $(".modal-content").load(
                $(btn).attr("data-url"), {name: "yl", title: "ly"},
        //Modal
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').focus();
        }));
    }
    //删除云图
    $(".delCloudPic").click(function () {
        if (yu_confirm("您确认要删除该粮情的所有云图吗？")) {
            var lqId = $(this).attr("data");
            var url = '${BASE_PATH}lqjc/delCloudPic.action';
            var thisDom = $(this);
            $.ajax({
                cache: true,
                type: "POST",
                url: url,
                data: {lqId: lqId},
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("出错");
                },
                success: function (response) {
                    alert("成功删除" + response + "张云图！");
                    thisDom.parent().parent().parent().remove();
                    if ($(".cloudPic").find("li").size() < 1) {
                        window.location.reload();
                    }
                }
            });

        }
    });
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
