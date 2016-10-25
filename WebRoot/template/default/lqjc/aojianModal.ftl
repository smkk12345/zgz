<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title">选择仓房厫间</h4>
</div>
<div class="modal-body">
    <ul class="aojian-modle clearfix " id="aojian">
        <#list barnList as vo>
        <li  title="${vo.barnIndex}号仓房" aria-label="${vo.barnIndex}">
            <div class="btn-group" role="group">
                <#list vo.aoJianSet as voo>

                <#if voo.aoJianIndex??&&voo.sensorArrangementbeanId??>
	                <button type="button" class="btn selBtn 
                        <#if aoJian.zyAoJianNum==voo.zyAoJianNum>
                        btn-success
                        <#else>
                        btn-default
                        </#if>"  
                        dataId=${voo.zyAoJianNum} barnIndex=${vo.barnIndex} aria-label="${voo.aoJianIndex?default("")}">
	                    ${voo.aoJianIndex?default("")}#厫间
	                </button>
                <#else>
	                <button type="button" class="btn  barnIndex=${vo.barnIndex}">
						未设置
	                </button>               
                </#if>

                </#list>
            </div>
            <p>${vo.barnIndex}号仓房</p>
        </li>
        </#list>
    </ul>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary" data-url="${BASE_PATH}lqjc/selectAoJian.action" onclick="aoJianSelect(this)">确认</button>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        /*Auth:yulei,2015.7.7
         * 加载厫间 
         */
        $("#aojian .selBtn").click(function () {
            $("#aojian .btn-success").each(function () {
                $(this).removeClass().addClass("btn btn-default");
            });

            $(this).removeClass().addClass("btn btn-success");
        });
    });

    function aoJianSelect(btn) {
        var url = $(btn).attr("data-url");
        var aoJianId = "";
        $("#aojian .btn-success").each(function () {
            aoJianId = $(this).attr("dataId");
        });
        if (aoJianId.length > 0) {
            url = url + "?aoJianId=" + aoJianId;
            $.ajax({
                cache: true,
                type: "POST",
                url: url,
                dataType: "json",
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("出错");
                },
                success: function (response) {
                    var url=location.href.split("?");
                    location.href = url[0];
                }
            });
        }

    }
</script>