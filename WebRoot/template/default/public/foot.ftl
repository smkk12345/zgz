<div id="foot" class="foot">
    <div class="fl bold">长辛店棚改征收项目签约选房管理系统</div>
    <div class="fr">
        <span class="bottomNet" id="sensorNet"></span>
        <span class="bottomNet ml10">网络：<i id="statusNet" class="glyphicon glyphicon-signal"></i></span>
    </div>
</div>
<script type="text/javascript">
    //yulei-js-01
    $(document).ready(
            function () {
                $(window)
                        .resize(
                                function () {
                                    main_height = $(window).height()
                                            - $("#top").height()
                                            - $("#foot").height() - 27;
                                    $("#main").height(main_height);
                                    $("#main_left").height(main_height - 0);
                                    $("#main_right").height(main_height - 0);
                                    if ($("#main_left").is(":visible")) {
                                        $("#main_right").width(
                                                $(window).width()
                                                - $("#main_left").width() - 30);
                                    } else {
                                        $("#main_right").width(
                                                $(window).width());
                                    }

                                });

                $(window).resize();
            });
    //yulei-js-02
    var setInterval_1 = setInterval(function () {
    
        var url = '${BASE_PATH}testConnection.action';
 		$.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                success: function (response) {
                if (response.hasNewData==="true") {
                    $("#sensorNet").html("");
                } else {
                    $("#sensorNet").html(
                            "<a class='bold red' onClick=javascript:alert('网线接触不良或没有网络')>网络连接异常(" +response.hasNewDataTime+ ")</a>"
                            );
                }
                $("#statusNet").html("");
                $("#statusNet").addClass("glyphicon glyphicon-signal");
                $("#statusNet").fadeOut(200).fadeIn(200);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $("#statusNet").removeClass("glyphicon glyphicon-signal");
                $("#statusNet").html("无");
            }

        });
    }, 2000);
</script>

