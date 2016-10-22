<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="ytfx_1_1 container-fluid">
    <ul class="nav nav-pills menu">
        <#include "ytfxMenu.ftl"/>
        <li role="presentation" class="pull-right"></li>
    </ul>
    <div class="jumbotron mt10">
        <#if STATUS == "noGrain">
        <h4 class="orange">${disSelectName?default("")} 仓内没有粮食！</h4>
        <#else>
        <#if RequestERR != "ok">
        <h4>${RequestERR}</h4>
        <p class="mt7"><a class="btn btn-warning btn-group-sm" href="${BASE_PATH}lqjc/ytfx_1.action" role="button">立即填写</a></p>
        <#elseif STATUS == "ortherPersonIsDoing">
        <h4><i class="red bold">操作冲突提示：</i></h4>
        <p class="mt7">亲，真是太巧了，您的同事此时正在进行该厫间的云图生成操作，请等他完成后，您再继续操作！<br>当然，您几分钟后也可直接查看他/她生成的云图哟！(^_^)</p>
        <#else>
        <#if STATUS == "nodata">
        <h4>根据您的条件，没有查询到粮情数据！</h4>
        <p class="mt7"><button class="btn btn-warning btn-group-sm" onclick="javascript:history.go(-1)" >返回重填</button></p>
        <#else>
        <p>共找到<i class="red bold"> ${YUInfo[0]+YUInfo[1]+YUInfo[2]} </i>个截面</h4>
            <br>本次成功生成云图<i class="red bold"> ${YUInfo[0]} </i>张，失败<i class="red bold"> ${YUInfo[1]} </i>张，<i class="red bold"> ${YUInfo[2]} </i>张云图已经存在</p>
        <p class="mt7"><a class="btn btn-success btn-group-sm" href="${BASE_PATH}lqjc/ytfx.action" role="button">查看生成云图</a></p>
        </#if>
        </#if>
        </#if>
    </div>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>
