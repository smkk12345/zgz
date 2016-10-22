<!--用户管理--添加编辑用户界面-->
<div class="modal-header" id="grainModal">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">
        <#if bean.id??>
    		编辑粮食信息
    	<#else>
    		新增粮食信息
    	</#if>
    </h4>
</div>
<div class="modal-body" >
  <form id="grainTypeForm" action="" method="post">
    <div class="container-fluid mb10" >
    	<div class="autoGroup fl "> 
      		<label class="control-label required" for="grainType">粮食品种:</label>
      		<div class="width-170px fl">
	      		<input type="text" class="form-control required width-160px" name="grainType" id="grainType" value="${bean.grainType?default("")}" errorMsg="粮食品种不能为空"   placeholder="粮食品种"/>
	      		<div class="cl"></div>
      		</div>
        </div>
        <div class="autoGroup fl"> 
      		<label class="control-label">备注</label>
      		<input type="text" class=" form-control" name="remarks" value="${bean.remarks?default("")}"   placeholder="备注"/>
      		<div class="cl"></div>
       </div>
       <div class="cl"></div>
    </div>
    <input  type="text" name="grainTypeId" value="${bean.id?default("")}" class="display-none" />
  </form>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary " id="send" data-url="${BASE_PATH}xtsz/saveGrain.action">保存</button>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>
<script type="text/javascript">
	//保存告警信息
	function save(btn){
		var dataInfo = $("#grainTypeForm").serialize();
		var url = $(btn).attr("data-url");
		$.ajax({
			type : "POST",
			url : url,
			data : dataInfo,
			error: function (XMLHttpRequest, textStatus, errorThrown) {
    		 	alert("出错");
     		},				
			success : function(response) {
				location.reload();
			}
		})
	}
</script>