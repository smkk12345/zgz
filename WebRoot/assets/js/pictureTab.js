/*Auth:yulei,2015.4.19
 * 详情页面图片tabs切换 
 */
function pictureTab(DefaultTabId) {
    $("#" + DefaultTabId).addClass("active");
    //On Click Event   
    $(".pic-small li").unbind('click').click(function () {
        $("#nofind").remove();
        $(".pic-small li").removeClass("active");
        $(this).addClass("active");
        var thisPicUrl = $(this).attr("picUrl");
        $(".pic-big").parent().attr("href", thisPicUrl);
        $(".pic-big").css("background-image", "url('" + thisPicUrl + "')");
        $("#title-section").html($(this).attr("title"));
    });
}
//left and right
$(document).unbind('keydown').keydown(function (e) {
    var code;
    if (!e)
        var e = window.event;
    if (e.keyCode) {
        code = e.keyCode;
    } else if (e.which) {
        code = e.which;
    }

    if (code === 37) {
        movePrev();
    } else if (code === 39) {
        moveNext();
    }
});
var movePrev = function () {
    var index = $(".pic-small li.active").prevAll().length;
    $("#nofind").remove();
    if (index === 0) {
        $(".pic-small li").removeClass('active').eq($(".pic-small li").length - 1).addClass('active'); //可循环移动
        // if(index == 0) return false; //不可循环移动
        var thisPicUrl = $(".pic-small li").eq($(".pic-small li").length - 1).attr("picUrl");
        $("#title-section").html($(".pic-small li").eq($(".pic-small li").length - 1).attr("id"));
    } else {
        $(".pic-small li").removeClass('active').eq(index - 1).addClass('active');
        var thisPicUrl = $(".pic-small li").eq(index - 1).attr("picUrl");
        $("#title-section").html($(".pic-small li").eq(index - 1).attr("id"));
    }
    $(".pic-big").parent().attr("href", thisPicUrl);
    $(".pic-big").css("background-image", "url('" + thisPicUrl + "')");
};
var moveNext = function () {
    var index = $(".pic-small li.active").prevAll().length;
    $("#nofind").remove();
    if (index === $(".pic-small li").length - 1) {
        $(".pic-small li").removeClass('active').eq(0).addClass('active'); //可循环移动
        // if(index == $("li").length-1) return false; //不可循环移动
         var thisPicUrl = $(".pic-small li").eq(0).attr("picUrl");
        $("#title-section").html($(".pic-small li").eq(0).attr("id"));
    } else {
        $(".pic-small li").removeClass('active').eq(index + 1).addClass('active');
         var thisPicUrl = $(".pic-small li").eq(index + 1).attr("picUrl");
        $("#title-section").html($(".pic-small li").eq(index + 1).attr("id"));
    }
    $(".pic-big").parent().attr("href", thisPicUrl);
    $(".pic-big").css("background-image", "url('" + thisPicUrl + "')");
};