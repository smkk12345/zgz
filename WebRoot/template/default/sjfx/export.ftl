<#include "leftMenu.ftl"/>
<@override name="main_right">
<ul class="row groupMenue">
    <li><a href="${BASE_PATH}pgzq/export.action?viewName=all" target="_blank"><li class="col-sm-6 group bgG group_A">所有标段全信息表</li></a>
    <a href="${BASE_PATH}pgzq/export.action?viewName=people" target="_blank"><li class="col-sm-6 group bgG group_A">所有标段人口信息表</li></a>
    <a href="${BASE_PATH}pgzq/export.action?viewName=area" target="_blank"><li class="col-sm-6 group bgG group_A">所有标段面积信息表</li></a>
    <a href="${BASE_PATH}pgzq/export.action?viewName=qianyue" target="_blank"><li class="col-sm-6 group bgG group_A">签约人口统计表</li></a>
    <a href="${BASE_PATH}pgzq/export.action?viewName=money" target="_blank"><li class="col-sm-6 group bgG group_A">腾退补偿总价表</li></a>
	</li>

</ul>
<!--<ul class="row groupMenue">
    <li><a href="${BASE_PATH}pgzq/export.action?viewName=all&field=section&value=1" target="_blank"><li class="col-sm-6 group bgG group_A">第一标段全信息表</li></a>
    <a href="${BASE_PATH}pgzq/export.action?viewName=all" target="_blank"><li class="col-sm-6 group bgG group_A">第二标段全信息表</li></a>
    <a href="${BASE_PATH}pgzq/export.action?viewName=all" target="_blank"><li class="col-sm-6 group bgG group_A">第三标段全信息表</li></a>
    <a href="${BASE_PATH}pgzq/export.action?viewName=all" target="_blank"><li class="col-sm-6 group bgG group_A">第四标段全信息表</li></a>
	</li>

</ul>-->

</@override>
<@extends name = "../base/layout.ftl"/>
