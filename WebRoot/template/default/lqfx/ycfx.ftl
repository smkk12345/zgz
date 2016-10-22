<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="container-fluid mt7 ycfx">
    <form class="width-100-">
        <div id="ycfx_aojian" class="panel panel-default">
            <div class="panel-heading"><span class="fl clearfix">选择厫间</span></div>
            <ul class="panel-body">
                <#include "../public/aojian.ftl"/>
            </ul>
        </div>
        <button type="submit" class="btn btn-primary  fl">提交分析</button>
    </form>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>

