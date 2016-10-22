<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="ytfx_1 container-fluid">
    <ul class="nav nav-pills menu">
        <#include "ytfxMenu.ftl"/>
        <li role="presentation" class="pull-right"></li>
    </ul>
    <form action="${BASE_PATH}lqjc/ytfx_1_1.action" method="post">
        <div class="panel panel-default mt10">
            <div class="panel-heading"><span class="fl clearfix">1.请输入起始日期</span></div>
            <div class="panel-body">
                <div class="form-group mt7 clearfix">
                    <label for="ckhInput" class="control-label mt10 fl ">起始日期:</label>
                    <input type="text" class="form-control width-130px datepicker-last fl"  name="startDate" value=""  placeholder="输入起始日期"/> 
                    <label for="ckhInput" class="control-label mt10 fl ">结束日期:</label>
                    <input type="text" class="form-control width-130pxpx datepicker-last fl" name="endDate" value=""   placeholder="输入结束日期"/>
                </div>
            </div>
            <div class="panel-heading"><span class="fl clearfix">2.请选择云图类型</span></div>
            <div class="panel-body">
                <div class="form-group yu-switch clearfix">
                    <ul class="mt7 clearfix bootstrap-switch-mini">
                        <li class="common-sw">温度云图：<input  type="checkbox" name="cloudType[]" value="1"></li>
                        <li class="common-sw">湿度云图：<input  type="checkbox" name="cloudType[]" value="2"></li>
                    </ul>
                </div>
            </div>
        </div>
        <button type="button" id="send" class="btn btn-primary ml10 fl" disabled="disabled">生成云图</button>
    </form>

    <div class="panel panel-default mt10" id="progress-cloud">
        <div class="panel-heading"><span class="fl clearfix">系统正在生成云图</span></div>
        <div class="panel-body">
            <p id="text-tongji"></p>
            <div class="progress progress-striped active mt10">
                <div  class="progress-bar progress-bar-success"  role="progressbar" data-transitiongoal="1"></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script><script src="${BASE_ASSETS_PATH}js/ytfx_1.js"></script>
<script type="text/javascript">
//swich
    $(".yu-switch input").bootstrapSwitch();
//提交，最终验证。
    $('#send').click(function () {
        if ($('input[name="startDate"]').val() === "") {
            alert("请输入起始日期");
            $('input[name="startDate"]').focus();
            return false;
        }
        if ($('input[name="endDate"]').val() === "") {
            alert("请输入结束日期");
            $('input[name="endDate"]').focus();
            return false;
        }
        if ($('input[name="cloudType[]"]:checked').length < 1) {
            alert("至少选择一种云图类型");
            return false;
        }
        $('form').submit();
        $(this).attr("disabled", "disabled");
        $('form input').attr("disabled", "disabled");
        
        //progress
         var url = '${BASE_PATH}lqjc/ytfx_process.action';
         $("form").css("display", "none");
        yu_progress(url);
    });
</script>
</@override>
<@extends name = "../base/layout.ftl"/>