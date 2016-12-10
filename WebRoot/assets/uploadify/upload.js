var uploadIndex=1;//这里为了删除文件准备
//参数说明
// uploadify:上传空间file的名称
// filePathId：文件路径保存的input标签id
// fileNameId：文件名称保存的input标签id
// multi：设置为true时可以上传多个文件
// queueSizeLimit:上传时允许同时选择的文件个数
function uploadMore_init(uploadify,filePathId,fileNameId,queueSizeLimit,fileExt){//上传多个文件
	if(fileExt==null||fileExt==""){fileExt=[];}
	if(queueSizeLimit==null||queueSizeLimit==""){queueSizeLimit=5}
	$("#"+uploadify).after('<div><div id="upFilesName" style="cursor:pointer"></div></div><br/><div style="display: none;" id="upFiles"></div>');//用户存放文件名称
    $("#"+uploadify).uploadify({
        'uploader': '/plugins/uploadify/uploadify.swf',
        'script': '/fileUpload/upload.do',
        'cancelImg': '/plugins/uploadify/cancel.png',
        'folder': 'UploadFile',
        'queueID': "fileQueue",
        'fileExt':fileExt,
        'fileDesc':fileExt,
        'buttonText':"上传",
        'auto': true,//设置为true当选择文件后就直接上传了，为false需要点击上传按钮才上传
        'multi': true,//设置为true时可以上传多个文件。
        'queueSizeLimit':queueSizeLimit,
        'onComplete':function(e, queueId, fileObj,response){
        	 var jsonObject = jQuery.parseJSON(response);     
        	 var fileName=jsonObject.fileName; 
        	 var filePath=jsonObject.filePath; 
			 //保存文件名称及路径信息（若是需要其他信息，可以在这里继续添加）
        	 var path="<input type='hidden' name='"+filePathId+"' id='"+filePathId+"_"+uploadIndex+"' value='"+filePath+"'/>";
        	 var name="<input type='hidden' name='"+fileNameId+"' id='"+fileNameId+"_"+uploadIndex+"' value='"+fileName+"'/>";
        	 var upFiles=$("#upFiles").html();
        	 upFiles+=(name+path);
        	 $("#upFiles").html(upFiles);//保存上传文件的路径及文件名称
        	 //上传文件名称展示（点击文件名称或删除图标可以删除上传文件）
        	 var upFilesName= $("#upFilesName").html();
        	 fileName="<div width='inherit' class='WarningMsg' onclick=\"removeFile('"+filePathId+"','"+fileNameId+"','"+uploadIndex+"');\" title='点击删除该文件' id='uploadIndex_"+uploadIndex+"'><img src='/plugins/ligerUI/ligerUI/skins/icons/delete.gif' alt='点击删除'  border='0' align='center'/>"+fileName+"</div>";
        	 $("#upFilesName").html(upFilesName+fileName);
        	 uploadIndex++;
        }
    });
}
//参数说明参考上面说明
function uploadSingle_init(uploadify,filePathId,fileNameId,fileExt){//上传单个文件
	if(fileExt==null||fileExt==""){fileExt=[];}
	$("#"+uploadify).after('<div><div id="upFilesName" style="cursor:pointer"></div></div><br/><div style="display: none;" id="upFiles"></div>');//用户存放文件名称
    $("#"+uploadify).uploadify({
        'uploader': '/plugins/uploadify/uploadify.swf',
        'script': '/fileUpload/upload.do',
        'cancelImg': '/plugins/uploadify/cancel.png',
        'folder': 'UploadFile',
        'queueID': "fileQueue",
        'fileExt':fileExt,
        'fileDesc':fileExt,
        'auto': true,//设置为true当选择文件后就直接上传了，为false需要点击上传按钮才上传
        'multi': false,//设置为true时可以上传多个文件。
        'onComplete':function(e, queueId, fileObj,response){
        	 var jsonObject = jQuery.parseJSON(response);     
        	 var fileName=jsonObject.fileName; 
        	 var filePath=jsonObject.filePath; 
			 //保存文件名称及路径信息（若是需要其他信息，可以在这里继续添加）
        	 var path="<input type='hidden' name='"+filePathId+"' id='"+filePathId+"_"+uploadIndex+"' value='"+filePath+"'/>";
        	 var name="<input type='hidden' name='"+fileNameId+"' id='"+fileNameId+"_"+uploadIndex+"' value='"+fileName+"'/>";
        	 $("#upFiles").html("");
        	 $("#upFiles").html(name+path);
        	 //上传文件名称展示（点击文件名称或删除图标可以删除上传文件）
        	 $("#upFilesName").html("");
        	 fileName="<div width='inherit' class='WarningMsg' onclick=\"removeFile('"+filePathId+"','"+fileNameId+"','"+uploadIndex+"');\" title='点击删除该文件' id='uploadIndex_"+uploadIndex+"'><img src='/plugins/ligerUI/ligerUI/skins/icons/delete.gif' alt='点击删除'  border='0' align='center'/>"+fileName+"</div>";
        	 $("#upFilesName").html(fileName);
        	 uploadIndex++;
        }
    });
}
//参数说明参考上面说明
function uploadImages_init(uploadify,filePathId,fileNameId,fileExt){//上传单个文件
	if(fileExt==null||fileExt==""){fileExt=[];}
	$("#"+uploadify).after('<div><div id="upFilesName" style="cursor:pointer"></div></div><br/><div style="display: none;" id="upFiles"></div>');//用户存放文件名称
    $("#"+uploadify).uploadify({
        'uploader': '/plugins/uploadify/uploadify.swf',
        'script': '/fileUpload/upload.do',
        'cancelImg': '/plugins/uploadify/cancel.png',
        'folder': 'UploadFile',
        'queueID': "fileQueue",
        'fileExt':fileExt,
        'fileDesc':fileExt,
        'auto': true,//设置为true当选择文件后就直接上传了，为false需要点击上传按钮才上传
        'multi': false,//设置为true时可以上传多个文件。
        'onComplete':function(e, queueId, fileObj,response){
        	 var jsonObject = jQuery.parseJSON(response);     
        	 var fileName=jsonObject.fileName; 
        	 var filePath=jsonObject.filePath; 
			 //保存文件名称及路径信息（若是需要其他信息，可以在这里继续添加）
        	 var path="<input type='hidden' name='"+filePathId+"' id='"+filePathId+"_"+uploadIndex+"' value='"+filePath+"'/>";
        	 var name="<input type='hidden' name='"+fileNameId+"' id='"+fileNameId+"_"+uploadIndex+"' value='"+fileName+"'/>";
        	 $("#upFiles").html("");
        	 $("#upFiles").html(name+path);
        	 //上传文件名称展示（点击文件名称或删除图标可以删除上传文件）
        	 $("#upFilesName").html("");
        	 fileName="<div width='inherit' class='WarningMsg' onclick=\"removeFile('"+filePathId+"','"+fileNameId+"','"+uploadIndex+"');\" title='点击删除该文件' id='uploadIndex_"+uploadIndex+"'><img src='/plugins/ligerUI/ligerUI/skins/icons/delete.gif' alt='点击删除'  border='0' align='center'/>"+fileName+"</div>";
        	 $("#upFilesName").html(fileName);
        	 uploadIndex++;
        }
    });
}
var removeFileIndex=1;
//移除文件
function removeFile(filePathId,fileNameId,index){
	if(removeFileIndex==1){
		art.dialog.confirm('文件一旦删除，将不可恢复，确定执行删除吗？<br/><br/><div style="padding-right:3px;text-align:right"><input type="checkbox" onclick="altConfirm(this.checked);"/>不再提示</div>', function () {
				$("#"+filePathId+"_"+index).remove();
				$("#"+fileNameId+"_"+index).remove();
				$("#uploadIndex_"+index).remove();
			}, function () {
			    art.dialog.tips('您取消了操作');
		});
	}else{//非首次将不在提醒
		$("#"+filePathId+"_"+index).remove();
		$("#"+fileNameId+"_"+index).remove();
		$("#uploadIndex_"+index).remove();
	}
} 
function altConfirm(checked){
	if(checked){//不再提醒
		removeFileIndex=2;
	}else{
		removeFileIndex=1;
	}
	
}