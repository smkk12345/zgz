<#include "leftMenu.ftl"/>
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
<div class="container-fluid rhjc">
    <ul class="nav nav-pills menu mb5 clearfix">
        <li role="presentation" class="pull-left">入户基础信息管理列表</li>
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
</script>
