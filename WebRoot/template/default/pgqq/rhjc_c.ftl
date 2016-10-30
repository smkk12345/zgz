<#include "leftMenu.ftl"/>
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
<script src="${BASE_ASSETS_PATH}js/ssjcyu3d.js"></script>
<script src="${BASE_ASSETS_PATH}js/ssjc0.js"></script>
<div class="container-fluid rhjc">
    <ul class="nav nav-pills menu mb5 clearfix">
        <div class="page-title">
            <h4 class="bold">入户基础信息查看</h4>
        </div>
        <div class="top-ation mb10 clearfix">
            <div class="fl">
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
                <th>序号</th>
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
            </tr>
            <@HousebasicList list pageNo pageSize/>
        </table>
        <div id="yu-pager" class="fl mb20">
            <#import "../macro_ftl/pager.ftl" as p>
            <#if recordCount??>
            <@p.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="/pgqq/rhjc_c.action" OtherParameter=""/>
            </#if>
        </div>
    </ul>
</div>
<script type="text/javascript">
   
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
