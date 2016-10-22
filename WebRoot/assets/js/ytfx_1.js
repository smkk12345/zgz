/*ytfx_1
 * 于磊，2015.8.30
 */
//日期插件
$('.datepicker-last').datepicker({
    format: 'yyyy-mm-dd',
    showMeridian: true,
    todayBtn: true,
    autoclose: true,
    endDate: new Date
});

//yu-progress
function yu_progress(url) {
    $("#progress-cloud").css("display", "block");
    var data_transitiongoal = 1;
    var yuProgressBar = $("#progress-cloud .progress-bar");
    var timer = setInterval(function () {
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                if (response !== "") {
                    var data = response.split("/");
                    data_transitiongoal = 100 * data[0] / data[1];
                    if (data_transitiongoal > 1) {
                        $("#progress-cloud #text-tongji").html('共 <i class="red bold">' + data[1] + '</i> 个，已生成 <i class="red bold">' + data[0] + '</i> 个，请耐心等待几分钟！');
                        yuProgressBar.attr("data-transitiongoal", data_transitiongoal);
                    } else {
                        $("#progress-cloud #text-tongji").html('请耐心等待几分钟！');
                    }
                }
                yuProgressBar.progressbar({display_text: 'fill'});
            }
        });
        if (data_transitiongoal > 99) {
            clearInterval(timer);
        }
    }, 1000);
}