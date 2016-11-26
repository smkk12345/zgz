
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">档案管理</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save"   onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body center">
    <div class="content fhfa-rdjg-print-con"  id="xy-print">
		<form name="uploadfrm" url="${BASE_PATH}dagl/save.action?housebasicid=${housebasicid}" method="post"  enctype="multipart/form-data">
		    <div class=' aoJianGroup fl'>  
                <input style="width:200px;" type="file" name="cxdfile">    
            </div>
		 	<button style="submit"  class=" fl control-label btn btn-primary btn-save">上传</button>    
		</form>
		 <table id="table1" class="table">
            <tr>
                <td colspan="12" style="text-align: center;font-weight: bold">档案列表</td>
            </tr>
            <tr>
                <th class="center">序号</th>
                <th class="center">文件名称</th>
                <th class="center">文件后缀名</th>
                <th class="center">上传时间</th>
                <th class="center">操作</th>
            </tr>
            <#if list?size gt 0>  
	        <#list list as vo>
	        <tr id="${vo.id}">
	           	<td>${vo_index+1}</td>
	            <td><a href="${BASE_PATH}upload/${vo.path}">${vo.filename?default("")}</a></td>
	            <td>${vo.sufffix?default("")}</td>
	            <td>${vo.updateTime?default("")}</td>
	            <td><button type="button" class="btn btn-warning btn-xs ml10 glyphicon glyphicon-remove-circle"
                                    title='删除' onClick='delBtnClick(this)' data-url="${BASE_PATH}dagl/del.action"
                                    pname="${vo.id}"></button>
                 </td>
	        </tr>
	        </#list>
    	</#if>
		</table>
    </div>
</div>
<script src="${BASE_ASSETS_PATH}libs/jquery/jquery-form.js"></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js"></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
    //设置模态框高度和宽度
    //设置模态框高度和宽度
    $("#myModal .modal-dialog").width(750);
    $(".modal-body").css("height", ($(window).height() - 150) + "px");
    $(".modal-body").css("overflow-y", "scroll");

    function yu_print() {
        $("#xy-print").jqprint();
    }
    
    function delBtnClick(btn) {
        if (yu_confirm("确认删除该数据？")) {
            var curDataId = $(btn).attr("pname");
            var p = $(btn).attr("data-url");
            var par = $(btn).parent().parent();
            $.ajax({
                cache: true,
                type: "POST",
                url: p,
                dataType: "json",
                data: {fileid: curDataId},
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                	$("#"+curDataId).remove();
                },
                success: function (response) {
                	$("#"+curDataId).remove();
                }
            })
        }
    }

	function subimtBtn() {  
        var form = $("#uploadfrm");
		var url = '${BASE_PATH}'+"dagl/save.action?housebasicid="+'${housebasicid}';
		alert(url);
        var options  = {    
            url:url,    
            type:'post', 
			data:$("#uploadfrm").serialize(),   
            success:function(data)    
            {    
				
            }    
        };    
        form.ajaxSubmit(options);  
    }  

</script>
