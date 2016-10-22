<#if RequestERR == 'youData'>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  width-100- center">${data[0].barnName}号仓${data[0].aojianName}#厫间<i class="violet bold"> ${data[0].startDate} </i><#if yuTuType==1><i class="red">温度云图</i><#else><i class="blue">湿度云图</i></#if>（<i class="violet bold" id="title-section"><#if data[0].curSection == "null"> 层1 <#else> ${data[0].curSection} </#if></i>）</h4>
</div>
<div class="modal-body" style="min-height:350px;max-height:900px;">
    <div id="picture-container">
        <#if data[0].curSection == "null">
        <a href="${picData[0].picPath}" target='_blank' title='点击查看大图'><div class="well pic-big"  style="background-image: url('${picData[0].picPath}')"></div></a>
        <#else> 
        <#assign Sec = "nofind">
        <#list picData as voo>
        <#if data[0].curSection == voo.section>
        <a href="${picData[0].picPath}" target='_blank' title='点击查看大图'><div class="well pic-big"   style="background-image: url('${voo.picPath}')"></div></a>
        <#assign Sec = "findle">
        </#if> 
        </#list>
        <#if Sec == "nofind">
        <script type="text/javascript">
            //YuCloudSinPro
            function YuCloudSinPro() {
                var url = '${BASE_PATH}lqjc/ytSinPro.action';
                $("#nofind").html('<p class="mt20">正在生成该截面云图，请稍等片刻...</p>');
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: url,
                    dataType: "json",
                    data: {lqId: '${data[0].lqId}', Type: '${data[0].yuTuType}', curSecNum: '${data[0].curSecNum}'},
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("出错");
                    },
                    success: function (data) {
                        $("#nofind").remove();
                        $(".pic-small li").removeClass("active");
                        $("#" + data.layName + (data.layNum - 1) + "").after(
                                '<li id=' + data.layName + data.layNum + ' class="thumbnail" title=' + data.layName + data.layNum + '   picUrl=' + data.picUrl + ' style="background-image: url(' + data.picUrl + ')" order=' + data.order + '><p>' + data.layName + data.layNum + '</p></li>'
                                );
                        pictureTab(data.layName + data.layNum + "");
                        $(".pic-big").css("background-image", "url(" + data.picUrl + ")");
                        $("#title-section").html($("#" + data.layName + data.layNum + "").attr("title"));
                    }
                });
            }
        </script>
        <div class="well pic-big font-size-20">
            <div id="nofind" class="pl10"></div>
        </div>
        <script type="text/javascript">YuCloudSinPro();</script>
        </#if>
        </#if> 
        <ul class="pic-small">
            <#list picData as vo>
            <li id="${vo.section}" class="thumbnail" title="${vo.section}" picUrl="${vo.picPath}" style="background-image: url('${vo.picPath}')" order='${vo.ViewOrder}'><p>${vo.section}</p></li> 
            </#list>
        </ul>
    </div>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script><script src="${BASE_ASSETS_PATH}js/pictureTab.js"></script>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/jquery.shCircleLoader-min.js" charset="UTF-8"></script>
    <script type="text/javascript">
            $(document).ready(function () {
                //初始化
                $(".modal-body").parent().parent().css("max-width", "1100px");
                $(".modal-body").parent().parent().css("width", ($(window).width() * 0.95) + "px");
                $(".modal-body").parent().parent().css("height", ($(window).height() * 0.78) + "px");
                var modalHeight = $(".modal-body").parent().parent().height();
                var modalWidth = $(".modal-body").parent().parent().width();
                $(".modal-body").css("height", modalHeight + "px");
                $(".pic-big").css("height", (modalHeight - 90) + "px");
                $(".pic-big").css("max-width", modalWidth * 0.95 + "px");
                $(".pic-big").css("width", ($(".pic-big").height() * 1.95) + "px");

                $(".pic-big").css("background-size", ($(".pic-big").width() * 1.15) + "px  " + ($(".pic-big").height() * 1.10) + "px");
                //云图展示
                var DefaultTabId = "${data[0].curSection}";//默认
                if (DefaultTabId === "" || DefaultTabId === "null") {
                    DefaultTabId = "层1";
                }
                pictureTab(DefaultTabId);
            });
    </script>
</div>
<div class="modal-footer">
    <div class="pull-left gray">小提示：键盘【←】向左翻图片，键盘【→】向右翻图片</div>
    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">关闭</button>
</div>
<#elseif RequestERR == 'noData'>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  width-100- center">错误！</h4>
</div>
<div class="modal-body" style="height:150px;width:auto;">
    <div id="picture-container">
        <div class="alert alert-danger" role="alert">该粮情没有数据，请检查数据库！</div>
    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
<#else>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  width-100- center">提示信息</h4>
</div>
<div class="modal-body" style="height:230px;width:auto;">
    <div id="picture-container">
        <div class="alert alert-danger" role="alert">生成该粮情的云图预计需要 1 分钟！ </div>
        <a class="btn btn-success btn- mt10 font-size-14" role="button" onclick="YuCloudAllPro();" href="javascript:;">确认生成云图</a>
    </div> 
    <div class="panel panel-default mt10" id="progress-cloud">
        <div class="panel-heading"><span class="fl clearfix">系统正在生成云图</span></div>
        <div class="panel-body">
            <p id="text-tongji"></p>
            <div class="progress progress-striped active mt10">
                <div  class="progress-bar progress-bar-success"  role="progressbar" data-transitiongoal="1"></div>
            </div>
        </div>
    </div>
    <script src="${BASE_ASSETS_PATH}js/ytfx_1.js"></script>
    <script type="text/javascript">
            //YuCloudAllPro
            function YuCloudAllPro() {
                //progress
                var urlProgress = '${BASE_PATH}lqjc/ytfx_process.action';
                $("#picture-container").css("display", "none");
                yu_progress(urlProgress);

                var url = '${BASE_PATH}lqjc/ytAllPro.action';
                var lqId = '${lqId}';
                var Type = '${yuTuType}';
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: url,
                    dataType: "json",
                    data: {lqId: lqId, Type: Type},
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("出错");
                    },
                    success: function (data) {
                        if (data.STATUS === 'nodata') {
                            alert("该粮情下没有数据");
                        } else if (data.STATUS === 'ortherPersonIsDoing') {
                            alert("您暂时不能操作，因为您的同伴正在对该厫间进行云图生成操作！\\n请等候几分钟，直接查看她/他生成的云图即可");
                        } else if (data.Progress === 'complete') {
                            $("#progress-cloud").css("display", "none");
                            $("#picture-container").empty();
                            $("#picture-container").html(' <div class="alert alert-success font-size-14" role="alert">恭喜，成功生成粮情（' + data.lqName + '）主要截面的云图！</div>');
                            $("#picture-container").css("display", "block");
                        }
                    }
                });
            }
    </script>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
</#if>