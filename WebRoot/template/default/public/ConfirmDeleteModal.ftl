<!--仓房布置-->
<div class="modal-header" id="barnModal">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel"><span class="form-group autoGroup fl">
        </span>
		请输入您的密码，确认删除
    </h4>
</div>
<div class="modal-body" style="height:auto;">
  	<div class="container-fluid mb10" >
  		<div class="alert alert-danger" role="alert">注：该删除操作无法恢复</div>
  		<form>
        <div class="  autoGroup fl "> 
            <label class="control-label required" for="barnIndex">请输入您的密码:</label>
            <div class="width-170px fl">
                <input type="password" class="form-control required width-160px" name="password" id="isValidatePassWord" errorMsg="密码不能为空"   placeholder="输入密码"/>
                <div class="cl"></div>
            </div>
        </div>
        </form>
     </div>
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
	   $('#confirmBtn').click(function () {
	       $("form :input").trigger('blur'); //检测input
	        var numError = $('form .onError').length;
	        if (numError) {
	            return null;
	        } else {
	        	return deleteSuccess(this);
	        }
	    });
    })
    //  
    function deleteSuccess(btn) {
    	var deleteUrl = $(btn).attr("data-url");
        $.ajax({
            cache: true,
            type: "POST",
            url: deleteUrl,
            dataType: "json",
            success: function (response) {
            	afterOperate(response.success,deleteUrl.split("=")[1]);
            }
        });
    }
	
</script>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary " id="confirmBtn" data-url="${deleteUrl}">确定</button>
</div>