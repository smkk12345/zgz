//ready方式加载
$(document).ready(function () {
    /*Auth:yulei,2015.7.7
     * 图表页面通用js
     */
    $("#tu-container").css("width", ($(window).width() - 220) + "px");
    $("#tu-container").css("height", ($(window).height() - 330) + "px");
    $(".yu-switch input").bootstrapSwitch();
    //日期插件-通用
    $('#datepicker').datepicker({
        format: 'yyyy-mm-dd',
        showMeridian: true,
        todayBtn: true,
        autoclose: true
    });
    /*switch开关change事件
     * Auth:yulei,2015.7.7
     */
//    $("input[name='switch']").on('switchChange.bootstrapSwitch', function (e, state) {
//        if (state) {
//            Chart();
//        }
//        else {
//            Chart();
//        }
//    });
    /*Auth:yulei,2015.7.7
     * 三维图及曲线图绘制:初始化曲线图
     */
    Chart();
});


