<#if haveGrain=="yes">
<#if haveAoJianData=="yes">
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">选择粮情</h4>
    <div class="form-group pull-right m0">
        <button type="button" onclick="seach()" class="btn btn-success ml10 fl" >查 询</button>
    </div>
    <form id="seachForm" class="form-inline pull-right m0">
        <div class="form-group fl m0 ">
            <label for="ckhInput" class="control-label fl">时间段:</label>
            <span style="position: relative; z-index: 9999;"><input type="text" class="form-control fl width-110px m0"   id="datepicker-start"  placeholder="请选择开始时间" name="startDateStr" <#if startDateStr??>value="${startDateStr?substring(0,10)}"</#if>/></span>
        </div>   
        <div class="form-group fl m0 ">
            <label for="ckhInput" class="control-label fl">至</label>
            <span style="position: relative; z-index: 9999;"><input type="text" class="form-control fl width-110px m0 "   id="datepicker-last"   placeholder="请选择结束时间" name="endDateStr" <#if endDateStr??>value="${endDateStr?substring(0,10)}"</#if>/></span> <div class="clearfix"></div>
        </div>
    </form>
</div>
<#setting date_format="yyyy-MM-dd HH:mm:ss">
<div class="modal-body p5">
    <ul class="aojian-modle clearfix pt10" id="aojian">
        <#if AoJianDataList??>
        <#list AoJianDataList as vo>
        <li  title="${disSelectName?default("当前无厫间信息")}" aria-label="${vo.barnIndex}">
            <div class="btn-group btn-group-xm" role="group">
                <button type="button" class="btn bold  
                        <#if lqIdbean.id==vo.id>
                        btn-success
                        <#else>
                        btn-default gray
                        </#if>"  
                        dataId="${vo.id}">${vo.startDate?date}</button>
            </div>
        </li>
        </#list>
        <#else>
        <div class="alert alert-danger">该时间段没有粮情记录！</div>
        </#if>
    </ul>
    <div id="yu-pager" class="clearfix mt10 mb5 ml5">
        <#import "../macro_ftl/pager_modal.ftl" as p>
        <#if recordCount??>
        <@p.pager pageNo=pageNo pageSize=30 recordCount=recordCount toURL="/lqjc/lqModal.action" 
        OtherParameter="grainId="+grainId+","+"startDateStr="+startDateStr+","+"endDateStr="+endDateStr/>
        </#if>
    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary" data-url="${BASE_PATH}lqjc/selectLq.action" onclick="aoJianSelect(this)">确认</button>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
<script type = "text/javascript" >
        $(document).ready(function () {
            /*Auth:yulei,2015.7.7
             * 加载厫间 
             */
            $("#aojian button").click(function () {
                $("#aojian .btn-success").each(function () {
                    $(this).removeClass().addClass("btn btn-default bold gray");
                });

                $(this).removeClass().addClass("btn btn-success bold");
            });
        });

        function aoJianSelect(btn) {
            var url = $(btn).attr("data-url");
            var lqId = "";
            $("#aojian .btn-success").each(function () {
                lqId = $(this).attr("dataId");
            });
            if (lqId.length > 0) {
                $.ajax({
                    cache: true,
                    type: "POST",
                    url: url,
                    dataType: "json",
                    data: {lqId: lqId},
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("出错");
                    },
                    success: function (response) {
                        location.replace(location.href);
                    }
                });
            }

        }
        //日期插件-只能选择过去日期
        $('#datepicker-last').datepicker({
            format: 'yyyy-mm-dd',
            showMeridian: true,
            todayBtn: true,
            autoclose: true
        }).on('changeDate', function (ev) {
            var startTime = $("#datepicker-start")[0].value;
            var endTime = $("#datepicker-last")[0].value;
            if (startTime != "") {
                if (endTime < startTime) {
                    alert(" 结束时间不能小于开始时间！");
                    $("#datepicker-last").focus();
                }
            }
        });
        $('#datepicker-start').datepicker({
            format: 'yyyy-mm-dd',
            showMeridian: true,
            autoclose: true
        }).on('changeDate', function (ev) {
            var startTime = $("#datepicker-start")[0].value;
            var endTime = $("#datepicker-last")[0].value;
            if (endTime != "") {
                if (endTime < startTime) {
                    alert(" 开始时间不能大于结束时间 ！");
                    $("#datepicker-start").focus();
                }
            }
        });

        function seach() {
            var jsonData = $("#seachForm").serializeArray();
            //启动modal
            var url = '${BASE_PATH}lqjc/lqModal.action';
            $('#myModal').modal({
                keyboard: false
            });
            $(".modal-content").load(
                    url, jsonData,
                    //Modal
                    $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').focus();
            })
                    );
        }

</script>
<#else>
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">选择粮情</h4>
</div>
<div class="modal-body p5">
    <div class="alert alert-danger" role="alert">该仓房无粮情信息！</div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    </#if>

    <#else>
    <div class="modal-header clearfix">
        <h4 class="modal-title pull-left m0">选择粮情</h4>
    </div>
    <div class="modal-body p5">
        <div class="alert alert-danger" role="alert">该仓房无粮食信息！</div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    </div>
    </#if>