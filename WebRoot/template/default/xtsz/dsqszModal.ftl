<!--用户管理--添加编辑用户界面-->
<div class="modal-header" id="alarmModal">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">
        <#if bean.id??>
        编辑定时任务
        <#else>
        新增定时任务
        </#if>
    </h4>
</div>

<div class="modal-body" >
    <form id="timerTaskForm" action="" method="post">
        <div class="container-fluid mb10" >
            <div class=" autoGroup fl "> 
                <label class="control-label required">任务名称:</label>
                <div class="width-170px fl">
                    <input type="text" class="form-control required" name="taskName" value="${bean.taskName?default("")}"    placeholder="定时任务名称"/>
                    <div class="cl"></div>
                </div>
            </div>
            <div class=" autoGroup fl"> 
                <label class="fl control-label required">类型:</label>
                <select id="timerType" class="form-control fl roleList required" style="width:175px;" >  
                    <#list timerTypeList as timerType>
                    <option 
                        <#if bean.timerType==timerType>
                        selected="selected"
                        </#if>
                        >${timerType}
                </option>  
                </#list>
            </select>
            <div class="cl"></div>
        </div>
        <div class="cl"></div>
    </div>
    <div class="container-fluid mb10">
        <div class=" autoGroup fl">
            <label class="fl control-label required">开始时间:</label>
            <div class="width-170px fl">
                <span style="position: relative; z-index: 9999;"><input type="text" class="form-control fl date required" name="startTime"  value="${bean.startTime?default("")}" placeholder="开始时间"/></span> 
            	<div class="cl"></div>
            </div>      
        </div>
        <div class=" autoGroup fl">
            <label class="fl control-label">结束时间:</label>
            <span style="position: relative; z-index: 9999;"><input type="text" class="form-control fl date" name="stopTime"  value="${bean.stopTime?default("")}" placeholder="结束时间"/></span> 
        </div>
    </div>
    <div class="container-fluid mb10">
        <div class=" autoGroup fl">
            <label class="control-label required">周期单位</label>
            <div class="width-170px fl">
            <select id="periodUnit" class="form-control fl roleList required" style="width:175px;">  
                <#list periodUnitList as periodUnit>
                <option 
                    <#if periodUnit==bean.units>
                    selected="selected"
                    </#if>
                    >${periodUnit}</option>  
                </#list>
            </select>
            <div class="cl"></div>
        </div>                
        </div>
        <div class=" autoGroup fl">
            <label class="fl control-label required">周期:</label>
            <div class="width-170px fl">
            	<input type="text" class="form-control fl  required" name="period"  value="${bean.period?default("")}" placeholder="周期"/>       
            <div class="cl"></div>
        </div>   
        </div>
    </div>  
    <div class="container-fluid mb10">
        <div class=" autoGroup fl">
            <label class="control-label">任务描述</label>
            <input type="text" class=" form-control" style="width:512px;" name="taskDesc" value="${bean.taskDesc?default("")}"   placeholder="任务描述"/>
        </div>
    </div>     
    <input  type="text" name="timerTaskId" value="${bean.id?default("")}" class="display-none" />
</form>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary " data-url="${BASE_PATH}/xtsz/saveTimerTask.action" id="send">保存</button>
</div>

<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>

<script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                format: 'yyyy-mm-dd',

            });
        });
</script>