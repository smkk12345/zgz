<#include "leftMenu.ftl"/>

<@override name="main_right">
<div class="container-fluid">
    <div class="panel panel-default">
        <div class="panel-heading"><span class="fl clearfix">用户信息列表</span><a class="fr YL-ModalClick" href="#" data-url="${BASE_PATH}xtsz/jbszModalCgq.action" title="点击添加"><span class="glyphicon glyphicon-plus blue"></span></a></div>
        <div class="panel-body">
            <form class="form-horizontal " id="sensorList" >

            </form>
        </div>
    </div> 
</div>
</@override>
<@extends name = "../base/layout.ftl"/>
