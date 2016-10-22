<#include "../xtsz/leftMenu.ftl"/>
<@override name="main_right">
<div class="container-fluid personal">
    <ul class="nav nav-pills menu">
        <#include "personalLeftMenu.ftl"/>
    </ul>
    <#if oType == "detail">
    <div class="panel panel-default mt7">
        <div class="panel-heading"><span class="fl clearfix">个人信息</span></div>
        <div class="panel-body">
            <form id="userForm" action="" method="post">
<!--                <div class="container-fluid mb10">
                    <div class=" autoWidthGroup fl"> 
                        <label class="control-label required  width-60px" for="userName">用户名:</label>
                        <div class="width-250px fl">
                            <input type="button" class="btn btn-primary required" name="userName" id="userName" value="${bean.userName?default("")}"  errorMsg="用户名不能为空"   placeholder="用户名"/>
                            <div class="cl"></div> 
                        </div>   
                    </div>
                </div>-->
               
                <div class="container-fluid mb10" >
                    <div class=" autoWidthGroup fl ">  
                        <label class="control-label required  width-60px"  for="displayName">姓名:</label>
                        <div class="width-250px fl">
                            <input type="text" class="form-control required  " name="displayName" id="displayName" value="${bean.displayName?default("")}"  errorMsg="姓名不能为空"   placeholder="真实姓名"/>
                            <div class="cl"></div> 
                        </div>   
                    </div>
                </div>


                <div class="container-fluid mb10">        
                    <div class=" autoWidthGroup fl"> 
                        <label class=" control-label required  width-60px" for="phone">手机:</label>
                        <div class="width-250px fl">
                            <input type="text" class="form-control  required" name="tel" id="phone" value="${bean.tel?default("")}" errorMsg="联系方式不能为空" placeholder="联系方式"/>
                            <div class="cl"></div> 
                        </div>  
                    </div>

                </div>
                <div class="container-fluid mb10">   
                    <div class=" autoWidthGroup fl"> 
                        <label class=" control-label required  width-60px">邮箱:</label>
                        <div class="width-250px fl">
                            <input type="text" class="form-control required" name="email" id="email" value="${bean.email?default("")}"  placeholder="邮箱"/>
                            <div class="cl"></div> 
                        </div>
                    </div>
                </div>
                <div class="container-fluid mb10">        
                    <div class="autoWidthGroup  fl width-100-"> 
                        <label class="control-label fl width-60px">备注:</label>
                        <textarea  class="form-control fl width-250px "  name="memo"  placeholder="备注">${bean.memo?default("")}</textarea>
                        <div class="cl"></div> 
                    </div>
                </div>
                <div class="container-fluid mb10">        
                    <div class="autoWidthGroup  fl width-100-"> 
                        <label class=" control-label fl">&nbsp</label>
                        <button type="button"  data-url="${BASE_PATH}/user/updatePersonDetail.action" id="send" fromId="userForm" class="btn btn-primary ml10 ">保存</button>
                    </div>
                </div>     				
                <input  type="text" name="userId" value="${bean.id?default("")}" class="display-none" />
            </form>
        </div>
    </div>
    <#elseif oType == "password">
    <!--修改密码-->
    <div class="panel panel-default mt7">
        <div class="panel-heading"><span class="fl clearfix">密码修改</span></div>
        <div class="panel-body">
            <form id="passWordForm" action="" method="post">
                <div class="container-fluid mb10">
                    <div class=" autoWidthGroup fl"> 
                        <label class="control-label required width-110px" for="userName">现在密码:</label>
                        <div class="width-250px fl">
                            <input type="password" class="form-control required  "  id="validatePassword"   errorMsg="请输入您现在的密码"   />
                            <div class="cl"></div> 
                        </div>
                    </div>
                </div>  
                <div class="container-fluid mb10">
                    <div class=" autoWidthGroup fl"> 
                        <label class="control-label required width-110px" for="userName">设置新密码:</label>
                        <div class="width-250px fl">
                            <input type="password" class="form-control required  " name="passWord" id="validatePasswordFormat"   errorMsg="请输入您的新密码"  />
                            <div class="cl"></div> 
                             <span class="width-250px cl fl" > 6-16位，数字和字母（区分大小写）</span>
                        </div>
                    </div>
                </div>     
                <div class="container-fluid mb10">
                    <div class=" autoWidthGroup fl"> 
                        <label class="control-label required width-110px" for="userName">重复新的密码:</label>
                        <div class="width-250px fl">
                            <input type="password" class="form-control required  "  id="samePassWord"   errorMsg="确认新密码"   />
                            <div class="cl"></div> 
                        </div>
                    </div>
                </div> 
                <div class="container-fluid mb10">
                    <div class=" autoWidthGroup fl"> 
                        <label class="control-label " >&nbsp</label>
                        <button type="button"  data-url="${BASE_PATH}/user/updatePersonDetail.action" fromId="passWordForm" id="send" class="btn btn-primary ml10 ">保存</button>
                    </div>
                </div>    
            </form>
        </div>
        <#else>
        <div class="panel panel-default mt7">
            <div class="panel-heading"><span class="fl clearfix">快捷登陆开关</span></div>
            <div class="panel-body">
                <div class="form-group fl yu-switch">
                    <ul class="mt0 clearfix ">
                        <li  class="heng-jm">开关：
                            <div class="btn-group" role="group">
                                <button type="button" class="btn 
                                        <#if fastLoginIn?? && fastLoginIn=="yes"> 
                                        btn-success
                                        <#else>
                                        btn-default
                                        </#if>"
                                        fastLoginIn="yes">开</button>
                                <button type="button" class="btn <#if fastLoginIn?? && fastLoginIn=="yes"> btn-default<#else>btn-success</#if>" fastLoginIn="no">关</button> 
                            </div>
                        </li>
                    </ul>
                    <ul  class="mt20"><li>（备注：打开记住用户及密码，下次进入系统免输用户名和密码！）</li> </ul>
                </div>

            </div>
        </div>
        </#if>

        <script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>	
    </div>
</div>
<script type="text/javascript">

    $(".yu-switch button").click(function () {
        if ($(this).hasClass('btn-success')) {
            var $curBtn = $(this);
            $(".yu-switch button").each(function () {
                if ($(this).hasClass('btn-default')) {
                    $(this).removeClass().addClass("btn btn-success");
                }
            })
            $curBtn.removeClass().addClass("btn btn-default");

            if ($(this).attr("fastLoginIn") == "yes") {
                updateUserPersonSet("no");
            }
            else {
                updateUserPersonSet("yes");
            }
        }
        else {
            var $curBtn = $(this);
            $(".yu-switch button").each(function () {
                if ($(this).hasClass('btn-success')) {
                    $(this).removeClass().addClass("btn btn-default");
                }
            })
            $curBtn.removeClass().addClass("btn btn-success");
            if ($(this).attr("fastLoginIn") == "yes") {
                updateUserPersonSet("yes");
            }
            else {
                updateUserPersonSet("no");
            }
        }
    })

    function updateUserPersonSet(isFastLoginIn) {
        var url = '${BASE_PATH}user/updatePersonDetail.action?fastLoginIn=' + isFastLoginIn;
        $.ajax({
            type: "POST",
            url: url,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {

            }
        });
    }

    function save(btn) {
        var formId = $(btn).attr("fromId");
        var dataInfo = $("#" + formId).serialize();
        var url = $(btn).attr("data-url");
        $.ajax({
            type: "POST",
            url: url,
            data: dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            },
            success: function (response) {
                alert("修改成功");
            }
        });
    }

    function isSamePassWord(p) {
        var oldP = $("#validatePasswordFormat").val();
        if (oldP === p) {
            return true;
        }
        else {
            return false;
        }
    }

    function validateUserName(UserName) {
        var url = '${BASE_PATH}' + "/validateUserName.action?UserName=" + UserName;
        var isOk;
        $.ajax({
            type: "POST",
            url: url,
            async: false,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            },
            success: function (response) {
                if(!response && UserName!=='${bean.userName?default("")}'){
                    isOk = false;
                }else{
                    isOk = true;
                }
            }
        });
        return isOk;
    }
    function validatePassword(passWord) {
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

</script>
</@override>
<@extends name = "../base/layout.ftl"/>
