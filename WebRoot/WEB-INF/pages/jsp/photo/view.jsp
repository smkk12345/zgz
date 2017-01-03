<%@ page import="com.hibernate.houseinfo.domain.Photo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Photo photo = (Photo)request.getAttribute("photo");
    Photo prePhoto = (Photo)request.getAttribute("prePhoto");
    Photo nextPhoto = (Photo)request.getAttribute("nextPhoto");
    int familyId = (Integer)request.getAttribute("familyId");
    String type = (String)request.getParameter("type");
%>
<!DOCTYPE html>
<html>
<head>
    <title>长辛店镇李家裕村棚改项目签约选房管理系统</title>
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
    <script src="/static/js/jquery.rotate.1-1.js" type="text/javascript"></script>
    <script type='text/javascript'>
        var size=0;
        //放大缩小图片
        function imgToSize(size) {
            var img = $("#Imgbox");
            var oWidth=img.width(); //取得图片的实际宽度
            var oHeight=img.height(); //取得图片的实际高度
            img.width(oWidth + size);
            img.height(oHeight + size/oWidth*oHeight);
        }
        //        将图片还原为最初大小
        function imgToSource() {
            var img = $("#Imgbox");
            var oWidth=img.width(); //取得图片的实际宽度
            var oHeight=img.height(); //取得图片的实际高度
            img.width(752);
            img.height(1064);
        }

        // 翻转图片
        function imgReverse(arg) {
            var img = $("#Imgbox");
            if (arg == 'h'){
                img.css( {'filter' : 'fliph','-moz-transform': 'matrix(-1, 0, 0, 1, 0, 0)','-webkit-transform': 'matrix(-1, 0, 0, 1, 0, 0)'} );
            }else{
                img.css( {'filter' : 'flipv','-moz-transform': 'matrix(1, 0, 0, -1, 0, 0)','-webkit-transform': 'matrix(1, 0, 0, -1, 0, 0)'} );
            }
        }

        function imageLoad(){
            var clientHeight = $(document).height();
            $("#Imgbox").css("height",clientHeight);
        }

        $(function(){
            imageLoad();
        });

        function printImage(){
            window.print();
        }

    </script>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0 10px 0 10px;
            border: 0;
            height: 100%;
            overflow: auto;
            background-color: #F5F5F5;
        }

        #menu {
            float: right;
            text-align: right;
            top: 0;
            right:20px;
            width: 100%;
            position: fixed;
            padding: 10px;
        }

        * html #menu {
            position: absolute;
            right: 16px;
            top: 0;
        }

        /*only for ie*/
        html {
            overflow: auto !important;
            overflow: hidden;
        }

        .scanFile{
            border:1px solid #0091FB;
            padding:10px;
        }

        .scanArea{
            width:100%;
            text-align: center;
            clear: both;
        }


        /* button
---------------------------------------------- */
        .button {
            display: inline-block;
            zoom: 1; /* zoom and
display = ie7 hack for display:inline-block */
            *display: inline;
            vertical-align: baseline;
            margin: 0 2px;
            outline: none;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            font: 14px/100% Arial, Helvetica, sans-serif;
            padding: .5em 2em .55em;
            text-shadow: 0 1px 1px rgba(0,0,0,.3);
            -webkit-border-radius: .5em;
            -moz-border-radius: .5em;
            border-radius: .5em;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
            box-shadow: 0 1px 2px rgba(0,0,0,.2);
        }
        .button:hover {
            text-decoration: none;
        }
        .button:active {
            position: relative;
            top: 1px;
        }

        .bigrounded {
            -webkit-border-radius: 2em;
            -moz-border-radius: 2em;
            border-radius: 2em;
        }
        .medium {
            font-size: 12px;
            padding: .4em 1.5em .42em;
        }
        .small {
            font-size: 11px;
            padding: .2em 1em .275em;
        }

        /* color styles
        ---------------------------------------------- */

        /* blue */
        .blue {
            color: #d9eef7;
            border: solid 1px #0076a3;
            background: #0095cd;
            background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
            background: -moz-linear-gradient(top,  #00adee,  #0078a5);
            filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5');
        }
        .blue:hover {
            background: #007ead;
            background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e));
            background: -moz-linear-gradient(top,  #0095cc,  #00678e);
            filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e');
        }

        .gray {
            color: #e9e9e9;
            border: solid 1px #555;
            background: #6e6e6e;
            background: -webkit-gradient(linear, left top, left bottom, from(#888), to(#575757));
            background: -moz-linear-gradient(top,  #888,  #575757);
            filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#888888', endColorstr='#575757');
        }

        @media print {

            #menu{
                display: none;
            }
        }
    </style>
</head>

<body>
<div id="menu">
    <a href="#" class="button blue medium" onclick="imgToSource()" ><font color="black">还原</font></a>
    <a href="#" class="button blue medium" onclick="imgToSize(100)" ><font color="black">放大</font></a>
    <a href="#" class="button blue medium" onclick="imgToSize(-100);"><font color="black">缩小</font></a>
    <a href="#" class="button blue medium" onclick="$('#Imgbox').rotateRight(-90);"><font color="black">左旋转</font></a>
    <a href="#" class="button blue medium" onclick="$('#Imgbox').rotateRight(90)"><font color="black">右旋转</font></a>
    <a href="#" class="button blue medium" onclick="printImage();"><font color="black">打印</font></a>
    <%
        if(prePhoto!=null){
    %>
    <a href="view.do?id=<%=prePhoto.getId()%>&familyId=<%=familyId%>&type=<%=type%>" class="button blue medium"><font color="black">&lt;&lt;上一张</font></a>
    <%
    }else{
    %>
    <a href="#" class="button gray medium">&lt;&lt;上一张</a>
    <%
        }
    %>
    <%
        if(nextPhoto!=null){
    %>
    <a href="view.do?id=<%=nextPhoto.getId()%>&familyId=<%=familyId%>&type=<%=type%>" class="button blue medium"><font color="black">下一张&gt;&gt;</font></a>
    <%
    }else{
    %>
    <a  class="button gray medium">下一张&gt;&gt;</a>
    <%
        }
    %>
</div>
<br><br>
<div class="scanArea">
    <img id='Imgbox' src='<%=photo.getPhotoUrl() %>' style="height: 10px;"/>
</div>
</body>
</html>
