/*ssjc，3D show
 * 于磊，2015.7.29
 */
function CallYu3D(cc, hh, ll) {
    var c = parseInt(cc);
    var h = parseInt(hh);
    var l = parseInt(ll);

    var height_3d = $(window).height() - 180;
    var width_3d = $(window).width() - 350;
    $("#yu-3d .yu-3d-con").css("height", (height_3d + "px"));
    $("#yu-3d .c-3d-left").css("width", (height_3d * 0.28943 + "px"));
    $("#yu-3d .c-3d-right").css("width", (height_3d * 0.28943 + "px"));
    $("#yu-3d .c-3d-mid").css("width", ((width_3d - $("#yu-3d .c-3d-left").width() - $("#yu-3d .c-3d-right").width()) + "px"));

    //层
    $("#yu-3d .ceng").css("width", ((width_3d - $("#yu-3d .c-3d-left").width() - 10) + "px"));
    $("#yu-3d .ceng").css("height", (($("#yu-3d .yu-3d-con").height() / 4 - 20) + "px"));
    $("#yu-3d .ceng").css("left", (($("#yu-3d .c-3d-mid").offset().left - $("#yu-3d .ceng").height() * 0.65) + "px"));
   
    //层间距
    margin_ceng =($("#yu-3d .yu-3d-con").height()-$("#yu-3d .ceng").height()*c-50)/(c-1);
//    if ($(window).height() > 950) {
//        margin_ceng = 20;
//    } else if ($(window).height() <= 950) {
//        margin_ceng = 10;
//    }
    $("#yu-3d .ceng-1").css("top", (($("#yu-3d .c-3d-left").offset().top - 40) + "px"));
    var last_C_top = $("#yu-3d .ceng-1").offset().top;
    for (i = 2; i < c + 1; i++) {
        var c_N = $("#yu-3d .ceng-" + i + "");
        $(c_N).css("top", ((last_C_top + $("#yu-3d .ceng").height() * 0.65 + margin_ceng) + "px"));
        last_C_top = $(c_N).offset().top;
    }

//    $("#yu-3d .ctitle").css("left", (($("#yu-3d .c-3d-left").offset().left - 22) + "px"));
//    $("#yu-3d #ctitle-" + c).css("top", (($("#yu-3d .c-3d-left").offset().top + $("#yu-3d .c-3d-left").height() - 50 - 20) + "px"));
//    var last_CTitle_top = $("#yu-3d #ctitle-" + c).offset().top;
//    for (i = 1; i < c; i++) {
//        var ctitle_N = $("#yu-3d #ctitle-" + (c - i) + "");
//        $(ctitle_N).css("top", ((last_CTitle_top - $("#yu-3d .ceng").height() * 1.5) + "px"));
//        last_CTitle_top = $(ctitle_N).offset().top;
//    }
    
    $("#yu-3d .ctitle").css("left", (($("#yu-3d .c-3d-left").offset().left - 25) + "px"));
    for (i = 1; i < c+1; i++) {
        var c_N = $("#yu-3d .ceng-" + i + "");
        var ctitle_N = $("#yu-3d #ctitle-" + i + "");
        $(ctitle_N).css("top", (($(c_N).offset().top + $("#yu-3d .ceng").height()*0.65) + "px"));
    }
    
    //行
    $("#yu-3d .hang").css("margin", ($("#yu-3d .ceng").height() - $("#yu-3d .point-3d").height() * h + 10) / (c * 2) + "px 0");
    $("#yu-3d .point-3d").css("margin", "0 " + ($("#yu-3d .ceng").width() - $("#yu-3d .point-3d").width() * (l + 2)) / (l * 2) + "px");
    for (i = 1; i < h + 1; i++) {
        var htitle_N = $("#yu-3d " + "#htitle-" + i + "");
        var point_first = $("#yu-3d " + "#1" + i + "1");
        $(htitle_N).css("top", (($(point_first).offset().top - 50 - 10) + "px"));
        $(htitle_N).css("left", (($(point_first).offset().left - ($("#yu-3d .ceng").width() - $("#yu-3d .point-3d").width() * (l + 2)) / (l * 2) - 30) + "px"));
    }
    //列
    for (i = 1; i < l + 1; i++) {
        var ltitle_N = $("#yu-3d " + "#ltitle-" + i + "");
        var point_first = $("#yu-3d " + "#1" + "1" + i);
        $(ltitle_N).css("top", (($(point_first).offset().top - 50 - 40) + "px"));
        $(ltitle_N).css("left", (($(point_first).offset().left + 30) + "px"));
    }
}
function mouseoverShow(obj, id) {
    var objDiv = $("#" + id + " ");
    $(objDiv).show();
    if ($(obj).attr('c') === "4") {
        $(objDiv).css("top", ($(obj).offset().top - 20 - $(objDiv).height() - 50) + "px");
    } else {
        $(objDiv).css("top", ($(obj).offset().top - 37) + "px");
    }
    $(objDiv).css("left", ($(obj).offset().left + 22) + "px");

    $(objDiv).find("div").empty();
    var pointStr = $(obj).attr('xyz');
    var baseUrl = $(obj).attr("path") + "?point=" + pointStr;

    $(objDiv).find("div").append("当前坐标：" + "层" + $(obj).attr('c') + "," + "行" + $(obj).attr('h') + "," + "列" + $(obj).attr('l') + "<br>");
    if (($(obj).attr('wd') > $(obj).attr('maxAttri'))) {
        $(objDiv).find("div").append("<i class='red'>温度：" + $(obj).attr('wd') + "℃</i><br>");
    } else {
        $(objDiv).find("div").append("温度：" + $(obj).attr('wd') + "℃<br>");
    }

    $(objDiv).find("div").append("湿度：" + $(obj).attr("sd") + "%<br>");
    $(objDiv).find("div").append("水分：" + $(obj).attr("sf") + "%<br>");

    $(objDiv).find("div").append("<a  class='btn btn-success btn-sm YL-ModalClick' data-url='" + baseUrl + "&oType=wd' onclick='shouDetail(this)'>温度变化曲线</a><br>"
            + "<a  class='btn btn-success btn-sm YL-ModalClick' data-url='" + baseUrl + "&oType=sd' onclick='shouDetail(this)'>湿度变化曲线</a><br>"
            + "<a  class='btn btn-success btn-sm YL-ModalClick' data-url='" + baseUrl + "&oType=sf' onclick='shouDetail(this)'>水分变化曲线</a><br>"
            );
}
function shouDetail(btn) {

    $('#myModal').modal({
        keyboard: false
    });
    $(".modal-content").load(
            $(btn).attr("data-url"), {name: "yl", title: "ly"},
    //Modal
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').focus();
    })
            );
}

function mouseoverHide(obj, id) {
    var e = window.event || obj;
    var s = e.toElement || e.relatedTarget;
    if (document.all) {
        if (!obj.contains(s)) {
            var objDiv = $("#" + id + "");
            $(objDiv).hide();
        }
    } else {
        var res = obj.compareDocumentPosition(s);
        if (!(res === 20 || res === 0)) {
            var objDiv = $("#" + id + "");
            $(objDiv).hide();
        }
    }

}
function onclickHide(id) {
    var objDiv = $("#" + id + "");
    $(objDiv).hide();
}