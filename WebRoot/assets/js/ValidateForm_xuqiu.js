/*
 * Auth:yulei,2015.3.11
 */

$(function () {
//如果是必填的，则加红星标识.
    $("label.control-label").each(function () {
        var classValue = $(this).attr("class");
        if (indexOfstr('required', classValue)) {
            var $required = $('<span class="glyphicon glyphicon-star red"></span>'); //创建元素
            $(this).append($required); //然后将它追加到文档中
        }
    });
    //文本框失去焦点后
    $('form :input').blur(function () {
        //验证用户名
        if ($(this).is('.required') || $(this).is('.needCheak')) {
            var $parent = $(this).parent();
            $parent.find(".formtips").remove();
            var errorMsg = $(this).attr("errorMsg");
            if (errorMsg == undefined && $(this).is('.required')) {
                errorMsg = "该项不能为空";
            }
            if ($(this).is("#userName")) { //验证密码是否正确
                if ((this.value).trim() === "" && $(this).is('.required')) {
                    var errorMsg = '请输入用户名！';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (!validateUserName((this.value.trim()))&& this.value!=="") {
                        var errorMsg = '该用户名输入不正确或已经存在！';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else if ($(this).is('#displayName')) {
                if (this.value.trim() === "" && $(this).is('.required')) {
                    var errorMsg = '请输入真实姓名！';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (this.value.trim().length < 2 && this.value!=="") {
                        var errorMsg = '姓名输入不正确！';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else if ($(this).is('#phone')) {
                if (this.value.trim() === "" && $(this).is('.required')) {
                    var errorMsg = '请输入电话！';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (this.value.trim().length < 6 && this.value!=="") {
                        var errorMsg = '电话输入不正确';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else if ($(this).is('#email')) {
                if ((this.value).trim() === "" && $(this).is('.required')) {
                    var errorMsg = '请输入E-Mail地址';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (!/.+@.+\.[a-zA-Z]{2,4}$/.test(this.value.trim()) && this.value!=="") {
                        var errorMsg = 'E-Mail地址输入不正确';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else if ($(this).is('#barnIndex')) {
                if (this.value.trim() == ""  && $(this).is('.required')) {
                    var errorMsg = '请输入仓房编号！';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (barnIndexinValidate(this.value.trim()) && this.value!=="") {
                        var errorMsg = '仓房编号不能重复！';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else if ($(this).is('#aoJianIndex')) {
                if (this.value.trim() == ""  && $(this).is('.required')) {
                     var errorMsg = '请输入厫间编号！';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (aoJianIndexinValidate(this.value.trim()) && this.value!=="") {
                        var errorMsg = '同一仓房厫间编号不能重复！';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else if ($(this).is("#validatePassword")) { //验证密码是否正确
                if (this.value.trim() === "" && $(this).is('.required')) {
                    var errorMsg = '请输入密码！';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (!validatePassword(this.value.trim())&& this.value!=="") {
                        var errorMsg = '密码错误';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else if ($(this).is("#validatePasswordFormat")) { //密码格式
                if (this.value.trim() == "" && $(this).is('.required')) {
                    var errorMsg = '请输入密码！';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (!isPasswd(this.value.trim())&& this.value!=="") {
                        var errorMsg = '密码格式错误';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else if ($(this).is("#samePassWord")) {
                if (this.value.trim() == "" && $(this).is('.required')) {
                    var errorMsg = '请再次输入密码！';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (!isSamePassWord(this.value.trim())&& this.value!=="") {
                        var errorMsg = '您两次输入的密码不一致，请确认';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else if (indexOfstr('length', $(this).attr("class"))) {
                if (this.value.trim() == "" && $(this).is('.required')) {
                     var errorMsg = '请输入长度！';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (!isInTheBoundary(this.value.trim())&& this.value!=="") {
                        var errorMsg = '长度总和不能大于仓房长度';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else if ($(this).is('#isValidatePassWord')) {
                if (this.value.trim() == "" && $(this).is('.required')) {
                    var errorMsg = '请输入密码';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (!isValidatePassword(this.value.trim())&& this.value!=="") {
                        var errorMsg = '密码错误，请重新输入';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else if ($(this).is('#passWord')) {
                if (this.value.trim() == ""&& $(this).is('.required')) {
                    var errorMsg = '请输入密码';
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                    if (!isPasswd(this.value.trim())&& this.value!=="") {
                        var errorMsg = '密码格式错误';
                        $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                    }
                }
            } else {
                if (this.value == undefined || this.value == "") {
                    $parent.append('<div class="formtips onError red" style="text-align:left;">' + errorMsg + '</div>');
                } else {
                }
            }
        }
    }).keyup(function () {
        $(this).triggerHandler("blur");
    }).focus(function () {
        $(this).triggerHandler("blur");
    }); //end blur

    //验证select
    $("select").blur(function () {
        if ($(this).is('.required')) {
            var $parent = $(this).parent();
            $parent.find(".formtips").remove();
            var errorMsg = $(this).attr("errorMsg");
            if (errorMsg == undefined) {
                errorMsg = "该项不能为空";
            }
            if ($(this).is('#storeType')) {
                if ($(this).val() == "-1") {
                    var errorMsg = '请选择存储类型';
                    $parent.append('<div class="formtips onError red" style="text-align:left;" >' + errorMsg + '</div>');
                } else {
                }
            }
            if ($(this).is('#sensorArrangementbeanId')) {
                if ($(this).val() == "-1") {
                    var errorMsg = '请选择存储类型';
                    $parent.append('<div class="formtips onError red" style="text-align:left;" >' + errorMsg + '</div>');
                } else {
                }
            }
            if ($(this).is('#grainType')) {
                if ($(this).val() == "-1") {
                    var errorMsg = '请选择粮食品种';
                    $parent.append('<div class="formtips onError red" style="text-align:left;" >' + errorMsg + '</div>');
                } else {
                }
            }
        }
    }).focus(function () {
        $(this).triggerHandler("blur");
    });
    //提交，最终验证。
    $('#send').click(function () {
    	//添加接口
    	//dosth
        $("form :input").trigger('blur'); //检测input
        $("input:checkbox").trigger('blur'); //检测checkbox
        var numError = $('form .onError').length;

        if (numError) {
            return null;
        } else {
            return save(this);
        }
    });
});
//验证
//判断字符串是否在某字符串中存在
function indexOfstr(findstr, str) {
    var sear = new RegExp(findstr);
    if (sear.test(str))
    {
        return true;
    }
    var tag = findstr;
    if (str.indexOf(tag) !== -1)
    {
        return true;
    }
}

function isPasswd(s)
{
    var patrn = /^(\w){6,20}$/;
    if (!patrn.exec(s)) {
        return false;
    }
    else {
        return true;
    }
}