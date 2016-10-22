<!--检测设备布置--模态窗体--新增检测设备布置-->
<div class="modal-header" id="arrangementDetailModal" >
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">检测设备布置</h4>
</div>
<div class="modal-body" > 
    <form id="sensorArrangementForm" action="" method="post">
        <div class="container-fluid mb10">
            <div class="autoGroup fl">
                <label class="fl control-label">基于布置标准:</label>
                <select id="sensorTypeSelector" class="form-control fl" name="sensorName"  style="width:175px;">
                    <#list defaultArrangementList as arrangement>
                    <option dataId="${arrangement.id}" 
                            <#if bean.templateId??>
                            <#if arrangement.id == bean.templateId>
                            selected='selected'
                            </#if>
                            </#if>
                            >${arrangement.arrangementName}</option>
                    </#list>
                </select>
            </div>
        </div>
        <input  type="text" id="sensorArrangementId" name="sensorArrangementId" value="${bean.id?default("")}" class="display-none" />
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-url="${BASE_PATH}xtsz/jcsbbzModal1.action?sensorArrangementId=${bean.id?default("")}" onclick="nextStep0Click(this)" >下一步</button>
</div>
<script type="text/javascript">
</script>