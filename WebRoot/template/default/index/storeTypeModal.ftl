<!--出仓时间选择-->
<div class="modal-header" id="barnModal">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel"><span class="form-group autoGroup fl">
        </span>
        请选择仓储模式
    </h4>
</div>
<div class="modal-body">
    <div class="alert alert-danger mb20">请确认改变粮食仓储模式，此操作会改变粮情告警阈值信息!</div>
    <form>
       <div class="aoJianGroup clearfix"> 
            <label class='fl control-label required'>仓储模式:</label>
            <div class="aoJianGroup fl">
                <input type='text' class='form-control ml0 dmDate width-200px required' name='outputTime'  placeholder='出仓时间'/> 
                <div class="cl"></div>
            </div>
        </div>
        <div class="mt20 clearfix"></div>
        <div class="aoJianGroup clearfix"> 
            <label class="control-label required" for="barnIndex">用户密码:</label>
            <div class="aoJianGroup fl">
                <input type="password" class="form-control required width-200px" name="password" id="isValidatePassWord" errorMsg="密码不能为空"   placeholder="输入密码"/>
                <div class="cl"></div>
            </div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary confirmBtn" data-url="${BASE_PATH}xtsz/exportGrainInfo.action?aoJianId=${aoJianBean.zyAoJianNum}"  >出仓</button>
</div>

<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>
<script type="text/javascript">
    function isValidatePassword(passWord) {
        var url = '${BASE_PATH}' + "/validatePassWord.action?passWord=" + passWord;
        var isOk;
        $.ajax({
            type: "POST",
            url: url,
            async: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            },
            success: function (response) {
                isOk = response;
            }
        });
        return isOk;
    }
    
    $(document).ready(function () {
	   $('.confirmBtn').click(function () {
	       $("form :input").trigger('blur'); //检测input
	        var numError = $('form .onError').length;
	        if (numError) {
	            return null;
	        } else {
	        	return saveClick(this);
	        }
	    });
    })
    
        $(function () {
            initDate();
        })
        function initDate() {
            $(".dmDate").datepicker({
                format: 'yyyy-mm-dd',
                todayBtn: 'linked'
            });
        }
</script>