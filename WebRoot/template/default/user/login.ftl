<@override name="bodyClass">class="login"</@override>
<@override name="mainBody">
<div class="login-box" onkeydown="keyLogin();">
    <div class="login-box-bg">
        <div class="bananer mb20">
            <img src="${BASE_ASSETS_PATH}img/logobig.png"/>
        </div>
        <div class="login-box-con">
            <div  class="login-box-form">
                <div class="form-group">
                    <input type="text" id="inputUsername" value="" class="form-control-yl user" placeholder="用户名"  ajaxurl="${BASE_ASSETS_PATH}/member/checkUserNameUnique.html" errormsg="请填写1-16位用户名" nullmsg="请填写用户名" datatype="*1-16"  name="username">
                </div>
                <div class="form-group">
                    <input type="password" value="" id="inputPassword"  class="form-control-yl pwd01" placeholder="密  码"  errormsg="密码为6-20位" nullmsg="请填写密码" datatype="*6-20" name="password">
                </div>
                <!--<div class="form-group">
                    <input id="yancode"  class="form-control-yl width-45- fl" placeholder="验证码"  
                        errormsg="验证码错误" nullmsg="请填写验证码" datatype="*6-20" name="yancode">
                    <a  onClick="javascript:$(this).find('img').attr('src', '/Verify/index/code_id/login/' + Math.random())" 
                        href="javascript: void(0)"><img class="verification-code-img  width-45- fr" src="${BASE_ASSETS_PATH}img/erweima.png"/>
                    </a>
                     <a><img id="validateCode" class="verification-code-img  width-45- fr" src="${BASE_PATH}validateRandomCode.action"/>
                    </a>
                </div>-->
                <div class="form-group checkbox-1">
                    <input type="checkbox" id="rePass"  name="rePass" value="yes"> <i class="white">自动登录</i>
                </div>
                <input type="hidden" name='url' value='{$url}'>
                <button type="button" class="btn btn-group-lg btn-warning" onclick= "cPassw()">登	录</button>
                <!--<div class="stat mt10"><a href="#">找回密码</a></div>-->
                <div class="copy mt20"><a href="">北京佳木东方科技有限公司</a></div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

	function keyLogin(){  
	  if (event.keyCode==13)                         
	     cPassw();
	}  
	
    $(function () {
        //$('#validateCode').click(function () {//生成验证码  
        //  var url = '${BASE_PATH}'+"validateRandomCode.action?" + Math.floor(Math.random()*100);
        // $(this).hide().attr('src', url).fadeIn();  
        //  event.cancelBubble=true;  
        //});  
        var userName = getCookie("userName");
        if (userName !== "" && userName !== null && userName.length > 2) {
            $("#rePass").attr("checked", "checked");
        }
    });

    function cPassw() {
        var username = $("#inputUsername").val();
        var password = $("#inputPassword").val();
        var validateCode = $("#yancode").val();
        var p = '${BASE_PATH}' + "/validate.action";
        var rePass;
        if ($("#rePass")[0].checked) {
            rePass = "yes";
        }
        else {
            rePass = "no";
        }
        var isLogin;
        $.ajax({
            type: "POST",
            url: p,
            async: false,
            data: {
                username: username,
                password: password,
                rePass: rePass
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            
            },
            success: function (response) {
            	var url = response.replace("true","");
                if (response === "validateError") {
                    isLogin = false;
                    alert("验证码错误");
                } else if (response === "false") {
                    alert("密码错误");
                    isLogin = false;
                }else{
                	isLogin = true;
                    window.location.href = url;
                }
            }
        });

    }
</script>
</@override>
<@extends name = "../base/layoutBase.ftl"/>