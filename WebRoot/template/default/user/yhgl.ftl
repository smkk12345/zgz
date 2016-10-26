<#include "../xtsz/leftMenu.ftl"/>
<#include "../macro_ftl/xtszList.ftl">
<@override name="main_right">
<div class="container-fluid">
    <ul class="nav nav-pills menu">
        <li role="presentation" class="active"><a href="${BASE_PATH}user/yhgl.action">用户信息</a></li>
        <li role="presentation" ><a href="${BASE_PATH}user/role.action">用户组</a></li>
        <li role="presentation" class="pull-right">
            <#if role.roleAuthority[7]=="2">
            	<a class="fr YL-ModalClick btn btn-default" href="#" data-url="${BASE_PATH}user/yhglModal.action?userId=" title="点击添加"><span class="glyphicon glyphicon-plus blue"></span> 新 增</a>
            </#if>
        </li>
    </ul>
    <table class="table table-hover table-condensed  mt10 text-center" id="userTable" contenteditable="true">
        <tr class="info">
            <th style="width:100px;text-align: center">用户名</th>
            <th style="width:100px;text-align: center">真实姓名</th>
            <th style="width:90px;text-align: center">用户组</th>
            <th style="width:150px;text-align: center">邮箱</th>
            <th style="width:100px;text-align: center">电话</th>
            <th style="width:auto;text-align: center">备注</th>
            <#if role.roleAuthority[8]=="2">
            	<th style="width:230px;text-align:center">操作</th>
            </#if>
        </tr>
        <tbody id="userTableBody">
            <@UserList userList roleList/>
        </tbody>
    </table>
</div>
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
    if (yu_confirm("您确认要删除该用户吗？")) {
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

    function updateUserInfo(btn){
    var arr = getAoJianIndexStrs();
    var url = $(btn).attr("data-url");
    $.ajax({
    cache:true,
    type : "POST",
    url : url,
    data : {"ids":arr[0],"content":arr[1]},
    error: function (XMLHttpRequest, textStatus, errorThrown) {
    alert("出错");
    },				
    success : function(response) {
   		location.reload();
    }
    })
    $('#myModal').modal('hide');
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
    if(aoJianIndex!="" && typeof(aoJianIndex)!="undefined" && aoJianIndex!=0){
    displayContent = displayContent+aoJianIndex+"/"+barnIndex+",";
    }
    aoJIanIndexStrs = aoJIanIndexStrs+aoJianId+"#";
    });
    aoJIanIndexStrs = aoJIanIndexStrs.substr(0,aoJIanIndexStrs.length-1);
    displayContent = displayContent.substr(0,displayContent.length-1);
    arr.push(aoJIanIndexStrs);
    arr.push(displayContent);
    return arr;
    }

</script>
</@override>
<@extends name = "../base/layout.ftl"/>