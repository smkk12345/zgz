<%@ page import="java.util.List" %>
<%@ page import="com.hibernate.houseinfo.domain.Photo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Photo> photoList = (List)request.getAttribute("photoList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>长辛店镇李家峪村棚改项目签约选房管理系统</title>
    <meta charset="UTF-8">
    <!--CSS文件-->
    <link href="/assets/libs/bootstrap-3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/libs/bootstrap-3.3.4/css/bootstrap-switch.min.css" rel="stylesheet">
    <link href="/assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" >
    <link href="/assets/libs/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" >
    <link href="/assets/css/common.css" rel="stylesheet">
    <link href="/assets/css/lqt-v1.css" rel="stylesheet">
    <link href="/assets/css/style-1.css" rel="stylesheet" id="theme" >
    <!--JS文件-->
    <script src="/assets/libs/jquery-2.1.4.min.js"></script>
    <script src="/assets/libs/bootstrap-3.3.4/js/bootstrap.min.js"></script>
    <script src="/assets/libs/bootstrap-3.3.4/js/bootstrap-switch.js"></script>
    <script src="/assets/libs/bootstrap-progressbar/js/bootstrap-progressbar.min.js"></script>
    <script type="text/javascript" src="/assets/uploadify/swfobject.js"></script>
    <script type="text/javascript" src="/assets/uploadify/jquery.uploadify.v2.1.4.js"></script>


    <script type="text/javascript">
        function uploadImg_init(){
            $('#uploadify').uploadify({
                'fileDesc' : 'Image Files',
                'fileExt':'*.jpg; *.jpeg',
                'sizeLimit' : 5048576,
                'uploader': '/assets/uploadify/uploadify.swf',
                'script': '/photo/uploadPhoto.action',
                'scriptData':{agreementId:${agreementId},type:${type}},
                'cancelImg': '/assets/uploadify/cancel.png',
                'buttonImg': '/assets/uploadify/upfile11.jpg',
//                        'buttonText' : '选择照片',
                'height':'40',
                'width':'140',
                'folder': 'UploadFile',
                'queueID': 'fileQueue',
                'fileDataName':'pic',//将要上传的文件对象的名称 必须与后台controller中抓取的文件名保持一致
//                        'fileObjName':'pic',
                'auto':true,//设置为true当选择文件后就直接上传了，为false需要点击上传按钮才上传
                'multi': true,//设置为true时可以上传多个文件
                'requeueErrors': false, //队列上传出错，是否继续回滚队列
                'onError' : function(event,queueId,fileObj,errorObj) {
                    var info = "";
                    if(errorObj.info=='5048576'){
                        info = "最大允许上传的文件为4M，您上传的文件过大。";
                    }
                    //alert("文件:" + fileObj.name + "上传失败。"+info);
                },
                'onAllComplete':function(){
                    allComplete();
                }
            });
        }

        function allComplete(){
            location.reload();
        }
        $(function(){
            uploadImg_init();
        });

        //        全选
        function check(){
            $("input[name='photoId']").prop('checked', true)
        }
        //        取消全选
        function noCheck(){
            $("input[name='photoId']").prop('checked', false)
        }
        function photoDel(fileId){
            if(confirm('确认删除吗？')){
                $.get("photoBatchDel.action",{photoIds:fileId},function(data){
                    if(data.success){
                        location.reload();
                    }
                });
            }
        }

        function photoBatchDel(){
            var checkFileIds =[];//定义一个数组
            $('input[name="photoId"]:checked').each(function(){//遍历复选框，其中选中的执行函数
                checkFileIds.push($(this).val());//将选中的值添加到数组chk_value中
            });
            if(checkFileIds.length==0){
                alert("请选择照片");
                return;
            }else{
                if(confirm("确认删除这"+checkFileIds.length+"张照片吗？")){
                    $.get("photoBatchDel.action",{photoIds:checkFileIds.join(",")},function(data){
                        if(data.success){
                            location.reload();
                        }
                    })
                }
            }
        }

    </script>
</head>

<body>
<div class="modal-header clearfix" id="print">
    <h4 class="modal-title pull-left m0">档案管理</h4>
    <div class="fr" >
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="history.back();">返回</button>
    </div>
</div>

<div class="content">
    <fieldset  style="background: #ffffff;margin: 10px;">
        <legend><h5>一、档案资料上传</h5></legend>
        <input type="file" name="uploadify" id="uploadify" style="margin: 10px 0 0 10px;">
        <div id="fileQueue"></div>
    </fieldset>
    <fieldset style="background: #ffffff;margin: 10px;">
        <legend><h5>二、已上传档案照片
            <%
                if (photoList != null && !photoList.isEmpty()) {
                    out.print("(共" + photoList.size() + "张)");
                }
            %></h5>
        </legend>
        <div style="width: 100%; text-align: right; padding-right: 20px">
            <div style="float: right">
                <%
                    if (photoList != null && photoList.size()>0){
                %>
                <input type="button" class="btn btn-primary" id="checkAll" name="checkAll" value="全选" onclick="check()"/>
                <input type="button" class="btn btn-primary" id="noCheck" name="noCheck" value="取消全选" onclick="noCheck()"/>
                <input type="button" class="btn btn-primary" name="multiDelete" value="删除" onclick="photoBatchDel();"/>
                <%  }%>
            </div>
            <br>
            <br>
            <div style="text-align: center;background: #ffffff;width:100%;font-size: 15px;font-weight: bold;padding-bottom: 30px;">
                <%
                    for (Photo photo : photoList) {
                %>
                <div style="float: left;padding-left: 80px;padding-bottom: 30px;">
                    <a href="<%=photo.getPhotoUrl()%>"
                       target="_blank">
                        <img src="<%=photo.getPhotoUrl()%>" width="200" height="220" border="0" style="width: 200px;height: 220px;">
                    </a>
                    <div><input type="checkbox" name="photoId" value="<%=photo.getId()%>"></div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </fieldset>
    <hr>
</div>
</body>
</html>
