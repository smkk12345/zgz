<#include "leftMenu.ftl"/>
<@override name="main_right">
<ul class="row groupMenue">
    <a href="${BASE_PATH}pgzq/export.action?viewName=all" target="_blank"><li class="col-sm-6 group bgG group_A">所有标段全信息表</li></a>
    <a href="${BASE_PATH}pgzq/export.action?viewName=people" target="_blank"><li class="col-sm-6 group bgG group_A">所有标段人口信息表</li></a>
    <a href="${BASE_PATH}pgzq/export.action?viewName=area" target="_blank"><li class="col-sm-6 group bgG group_A">所有标段面积信息表</li></a>
    <a href="${BASE_PATH}pgzq/export.action?viewName=qianyue" target="_blank"><li class="col-sm-6 group bgG group_A">签约人口统计表</li></a>
</ul>
</@override>
<@extends name = "../base/layout.ftl"/>
