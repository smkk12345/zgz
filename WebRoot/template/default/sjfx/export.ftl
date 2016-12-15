<#include "leftMenu.ftl"/>
<@override name="main_right">
<ul class="row groupMenue">
    <a href="${BASE_PATH}pgzq/export.action?viewName=all" target="_blank"><li class="col-sm-6 group bgG group_A">导出所有数据</li></a>
    <a href="${BASE_PATH}pgzq/export.action?viewName=print_idcard" target="_blank"><li class="col-sm-6 group bgG group_A">导出身份证信息</li></a>
    <a href="${BASE_PATH}pgzq/export.action" target="_blank"><li class="col-sm-6 group bgG group_A">导出用户成员信息</li></a>
    <a href="${BASE_PATH}pgzq/export.action" target="_blank"><li class="col-sm-6 group bgG group_A">导出签约信息</li></a>
    <a href="${BASE_PATH}pgzq/export.action" target="_blank"><li class="col-sm-6 group bgG group_A">导出选房情况</li></a>
</ul>
</@override>
<@extends name = "../base/layout.ftl"/>
