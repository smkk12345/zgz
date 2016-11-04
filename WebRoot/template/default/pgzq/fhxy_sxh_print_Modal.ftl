<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">【${housebasic.names?default("/")}】房屋腾退补偿安置协议</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save"   onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body center">
    <div class="content xy-print-con"  id="xy-print">
        <span class="title">选房顺序通知单</span>
        <p class="xy-num" style="margin-top: 50px;">立项编号：<u>&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;</u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;档案编号：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></p>

        <p class="contex-1" style="margin-top:50px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;被拆迁人：<u>&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;</u>（身份证号码为：<u>&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;</u>） </p>

        <p class="contex-1" style="margin-top:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您与<u>&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;</u>签订了《集体土地房屋拆迁补偿协议》，并于<u>&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;</u>获取到选房顺序号，您的顺序号为<u>&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;</u>号，您是本村第<u>&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;</u>个签约的家庭。</p>
        <p class="contex-1" style="margin-top:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请您于<u>&nbsp;&nbsp;${bean.protocolnumber?default("/")}&nbsp;&nbsp;</u> 到选房中心选房。携带材料如下：《选房顺序号结果单》、《交房验收单》、被拆迁人与签约人身份证件。</p>

        <p class="contex-1" style="margin-top:100px; text-align: right">2016年10月28日</p>
        <p class="pageBreak" style="margin-top: 200px;">&nbsp;</p>
        <div style="clear:both; height:20px;"></div>
    </div>
</div>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js" ></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<script type = "text/javascript">
            //设置模态框高度和宽度  
            $("#myModal .modal-dialog").width(750);
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