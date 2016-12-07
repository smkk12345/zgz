
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">档案管理</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    </div>
</div>
<div class="modal-body center">
    <div class="content fhfa-rdjg-print-con"  id="xy-print">
		<form id="fileform"  action="${BASE_PATH}dagl/save.action?housebasicid=${housebasicid}" method="post"  enctype="multipart/form-data">
		    <div class=' aoJianGroup fl'>  
                <input id="cxdfile" style="width:200px;" type="file" name="cxdfile">    
            </div>
		</form>
		 <button   class=" fl control-label btn btn-primary btn-save" onclick="submitfile()">上传1</button>    
		 <table id="fileTable" class="table">
            <tr>
                <td colspan="12" style="text-align: center;font-weight: bold">档案列表</td>
            </tr>
            <tr>
                <th class="center">文件名称</th>
                <th class="center">文件后缀名</th>
                <th class="center">上传时间</th>
                <th class="center">操作</th>
            </tr>
            <#if list?size gt 0>  
	        <#list list as vo>
	       
	        <tr id="${vo.id}">
	            <td><a href="${BASE_PATH}upload/${vo.path}">${vo.filename?default("")}</a></td>
	            <td>${vo.sufffix?default("")}</td>
	            <td>${vo.updateTime?default("")}</td>
	            <td><button type="button" class="btn btn-warning btn-xs ml10 glyphicon glyphicon-remove-circle delfilebtn"
                                    title='删除' data-url="${BASE_PATH}dagl/del.action"
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
    
     $(".delfilebtn").live("click",function(event){
    	event.stopPropagation(); 
     if (yu_confirm("确认删除该数据？")) {
            var curDataId = $(this).attr("pname");
            var p = $(this).attr("data-url");
            var par = $(this).parent().parent();
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

	}); 
    
    function submitfile(){
    		var filename = $("#cxdfile").val();
    		if(filename){
    			if(filename==""){
    				return ;
    			}
    		}else{
    			return;
    		}
            var form = new FormData(document.getElementById("fileform"));
            $.ajax({
                url:'${BASE_PATH}'+"dagl/save.action?housebasicid="+'${housebasicid}',
                type:"post",
                data:form,
                processData:false,
                contentType:false,
                success:function(data){
					$("#fileTable").append(data.innertr);
					$("#cxdfile").val("");
                },
                error:function(e){
                    alert("错误！！");
                    window.clearInterval(timer);
                }
            });        
        }
        
    
</script>
