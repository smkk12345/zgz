<#include "../xtsz/leftMenu.ftl"/>
<#include "../macro_ftl/xtszList.ftl">
<@override name="main_right">
<div class="container-fluid">
<ul class="nav nav-pills menu">
    <li role="presentation" ><a href="${BASE_PATH}user/yhgl.action">用户信息</a></li>
    <li role="presentation" class="active"><a href="${BASE_PATH}user/role.action">用户组</a></li>
    <li role="presentation" class="pull-right">
        <#if role.roleAuthority[13]=="2">
        <a class="fr YL-ModalClick btn btn-default" href="#" data-url="${BASE_PATH}user/roleModal.action" title="点击添加"><span class="glyphicon glyphicon-plus blue"></span> 新 增</a>
        </#if>
    </li>
</ul>
<table class="table table-hover table-condensed  mt10 text-center" id="userTable" contenteditable="true">
    <tr class="info">
        <th style="width:200px;text-align: center">用户组名称</th>
        <th style="width:230px;text-align: center">标段信息</th>
        <th style="width:auto;text-align: center">备注</th>
        <th style="width:230px;text-align: center">操作</th>
    </tr>
    <tbody id="userTableBody">
        <@RoleList roleList/>
    </tbody>
</table>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javaScript">
    //保存用户信息
    function editBtnClick(btn){

    $('#myModal').modal({
    keyboard: false
    });
    $(".modal-content").load(
    $(btn).attr("data-url"), {name: "yl", title: "ly"},
    //Modal
    $('#myModal').on('shown.bs.modal', function () {
    $('#myInput').focus();
    })
    );
    }

    function delBtnClick(btn){
    if (yu_confirm("确认删除该用户组？")) {
    var curDataId = $(btn).attr("pname");
    var p = $(btn).attr("data-url");
    var par = $(btn).parent().parent();
    //var par = $("#"+pname);
    $.ajax({                         
    cache:true,
    type : "POST",
    url : p,
    dataType : "json",
    data : {curDataId:curDataId},
    error: function (XMLHttpRequest, textStatus, errorThrown) {
    alert("出错");
    },
    success : function(response) {
    if(response.success==true){
    par.remove();
    alert("删除数据成功");
    }
    else{
    alert("删除数据出错");
    }
    }
    })
    }
    }

    //获取颜色为绿色的选择状态下的廒间信息
    function getAoJianIndexStrs(){
    var arr= new Array();
    var displayContent = "";
    var aoJIanIndexStrs = "";
    $("#aojian .btn-success").each(function () {
    var aoJianId = $(this).attr("dataId");
    var barnIndex = $(this).attr("barnIndex");
    var aoJianIndex = $(this).attr("aria-label");
    aoJIanIndexStrs = aoJIanIndexStrs+aoJianId+"#";
    displayContent = displayContent+aoJianIndex+"/"+barnIndex+"#";
    });
    aoJIanIndexStrs = aoJIanIndexStrs.substr(0,aoJIanIndexStrs.length-1);
    displayContent = displayContent.substr(0,displayContent.length-1);
    arr.push(aoJIanIndexStrs);
    arr.push(displayContent);
    return arr;
    }

    function saveClick(btn){
    var authorityStr = getAuthorityStr();
    var url = $(btn).attr("data-url");
    $.ajax({
    cache:true,
    type : "POST",
    url : url,
    dataType : "json",
    data : {"roleAuthority":authorityStr},
    error: function (XMLHttpRequest, textStatus, errorThrown) {
    alert("出错");
    },				
    success : function(response) {
    $('#myModal').modal('hide');
    }
    })
    }

    function getAuthorityStr(){
    var authorityArr = new Array(15);
    $("[name = chkItem]:checkbox").each(function () {
    var dataIndex = $(this).attr("dataIndex");
    if ($(this).is(":checked")) {
    authorityArr[dataIndex] = 2;
    }
    else{
    authorityArr[dataIndex] = 1;
    }
    });
    return authorityArr.join("");
    }


</script>