/* document在文档加载后激活函数js
 * 2015.6.1，于磊
 */
$(document).ready(function () {
    IE();
    /*Auth:yulei,2015.3.5
     * 加载&modal 
     */
    $(".YL-ModalClick").click(function () {
        $('#myModal').modal({
            backdrop: 'static',
            keyboard: false
        });
        $(".modal-content").load(
                $(this).attr("data-url"), {name: "yl", title: "ly"},
        //Modal
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').focus();
        })
                );
    });
    /*Auth:yulei,2015.7.7
     * 加载厫间 
     */
    $("#aojian button").click(function () {
        $("#aojian .btn-success").each(function () {
            $(this).removeClass().addClass("btn btn-default");
        });

        $(this).removeClass().addClass("btn btn-success");
    });
});
/* 其他公共函数
 * 2015.7.1，于磊
 */
//确认函数
function yu_confirm(infor) {
    return confirm(infor);
}

/*Auth:yulei,2015.11.28
 * 浏览器判断并处理
 */
function IE() {
    if (navigator.userAgent.indexOf("MSIE") > 0) {
        if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {
            location.href = "ie.action";
        }
        if (navigator.userAgent.indexOf("MSIE 7.0") > 0) {
            location.href = "ie.action";
        }
        if (navigator.userAgent.indexOf("MSIE 9.0") > 0 && !window.innerWidth) {//这里是重点，你懂的
            location.href = "ie.action";
        }
        if (navigator.userAgent.indexOf("MSIE 9.0") > 0) {
           location.href = "ie.action";
        }
    }else{
         
    }
}

