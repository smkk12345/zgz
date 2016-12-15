<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">【${housebasic.names?default("/")}】房屋腾退货币补偿</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save"   onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body center">
    <div class="content xy-print-con"  id="xy-print" style="font-family: 宋体">
        <p class="xy-num" style="margin-top: 50px;">协议编号：<u>&nbsp;&nbsp;&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></p>
        <p class="title" style="margin-top: 250px;margin-left: 50px;" >北京市宅基地房屋腾退货币补偿协议</p>
        <p class="title1" style="margin-top: 230px;">腾退人：&nbsp;<u>&nbsp;北京市丰台区长辛店镇张郭庄村民委员会&nbsp;</u></p>
        <p class="title1" style="margin-top: 35px;">被腾退人：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${housebasic.names?default("/")} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></p>
        <p class="title1" style="margin-top: 35px;">签订时间： &nbsp;&nbsp;&nbsp;&nbsp;${year?c}&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;${month}&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;${day}&nbsp;&nbsp;&nbsp;日</p>
    </div>
    <div style="clear:both; height:20px;"></div>
</div>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js" ></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<script type = "text/javascript">
            //设置模态框高度和宽度  
            $("#myModal .modal-dialog").width(700);
            $(".modal-body").css("height", ($(window).height() - 150) + "px");
            $(".modal-body").css("overflow-y", "scroll");

            function yu_print() {
                $("#xy-print").jqprint();
            }

            function saveClick(btn) {
                var dataInfo = $("#rhjcAddForm").serialize();
                var url = $(btn - save).attr("data-url");
                $.ajax({
                    type: "POST",
                    url: url,
                    dataType: "json",
                    data: dataInfo,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(errorThrown);
                    },
                    success: function (response) {
                        var bean = response.bean;
                        addAoJianInfo(bean);
                        //初始化日期控件
                        initDate();
                    }
                })
            }

            function addlist(a) {
                var h = $(a + "").html();
                $(a + "").after("<tr>" + h + "</tr>" + "");

            }
</script>