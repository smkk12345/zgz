<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
List<String[]> archivePhotoCategory = (List)request.getAttribute("archivePhotoCategory");
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
    <style>
        .content ul li.picture{width:200px;display: inline-block;margin-right: 60px;vertical-align: top;height: 240px;}
        a:link {
            text-decoration: none;
        }
        a:visited {
            text-decoration: none;
        }
        a:hover {
            text-decoration: none;
        }
        a:active {
            text-decoration: none;
        }
    </style>
</head>

<body>
<div class="modal-header clearfix" id="print">
    <h4 class="modal-title pull-left m0">档案管理</h4>
    <div class="fr" >
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.close();">关闭</button>
    </div>
</div>

<div class="content">
    <div align="left" style="margin-top: 50px;margin-left: 50px;">
        <ul style="list-style-type: none;">
            <%
                for(String[] category : archivePhotoCategory){
            %>
            <li align="center" class="picture">
                <a href="upload.action?agreementId=${agreementId}&type=<%=category[0]%>"><img style="width: 120px;" src="/assets/img/file.png"></a></br><%=category[1]%>
            </li>
            <%}%>
        </ul>
    </div>
    <hr>
</div>
<div>
    提示：点击图标上传相应的图片。
</div>
<div class="modal-body center">
    <div style="clear:both; height:20px;"></div>
</div>
</body>
</html>
