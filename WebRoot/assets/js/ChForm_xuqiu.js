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
        var $parent = $(this).parent();
        $parent.find(".formtips").remove();
        //验证用户名
        if ($(this).is('#name')) {
            if (this.value == "" || this.value.length < 2) {
                var errorMsg = '请输入正确的姓名';
                $parent.append('<div class="formtips onError red" >' + errorMsg + '</div>');
            } else {
                var okMsg = '输入正确';
                //$parent.append('<div class="formtips onSuccess">' + okMsg + '</div>');
            }
        }
        
        if($(this).is('#displayName')){
        	if(this.value == "" || this.value.length < 2){
        		 var errorMsg = '请输入正确的姓名';
        		 $parent.append('<div class="formtips onError red" >' + errorMsg + '</div>');
        	} else {
        	}
        }
        
        if($(this).is('#userName')){
        	if(this.value == "" || this.value.length < 2){
        		 var errorMsg = '请输入正确的用户名';
        		 $parent.append('<div class="formtips onError red" >' + errorMsg + '</div>');
        	} else {
        	}
        }
        
        if($(this).is('#userName')){
        	if(this.value == "" || this.value.length < 2){
        		 var errorMsg = '请输入正确的用户名';
        		 $parent.append('<div class="formtips onError red" >' + errorMsg + '</div>');
        	} else {
        	}
        }
        
        if ($(this).is('#phone')) {
            if (this.value == "" || this.value.length < 6) {
                var errorMsg = '请输入正确的电话';
                $parent.append('<div class="formtips onError" >' + errorMsg + '</div>');
            } else {
            }
        }
        //验证邮件
        if ($(this).is('#email')) {
            if (this.value == "" || (this.value != "" && !/.+@.+\.[a-zA-Z]{2,4}$/.test(this.value))) {
                var errorMsg = '请输入正确的E-Mail地址';
                $parent.append('<div class="formtips onError">' + errorMsg + '</div>');
            } else {

            }
        }
        if ($(this).is('#danwei')) {
            if (this.value == "" || this.value.length < 5) {
                var errorMsg = '请输入正确的单位名称';
                $parent.append('<div class="formtips onError" >' + errorMsg + '</div>');
            } else {
            }
        }
    }).keyup(function () {
        $(this).triggerHandler("blur");
    }).focus(function () {
        $(this).triggerHandler("blur");
    }); //end blur

    //验证checkbox。
    $("input:checkbox").blur(function () {
        var $parent = $(this).parent().parent();
        $parent.find(".formtips").remove();
        var classValue = $parent.parent().find('label').attr("class");
        if (indexOfstr('required', classValue)) {
            if ($(this).is("input:checkbox[name='fangshi[]']")) {
                if ($("input:checkbox[name='fangshi[]']:checked").length < 1) {
                    var errorMsg = '请选择需求方式';
                    $parent.append('<div class="formtips onError" >' + errorMsg + '</div>');
                } else {
                }
            }
            if ($(this).is("input:checkbox[name='yongtu[]']")) {
                if ($("input:checkbox[name='yongtu[]']:checked").length < 1) {
                    var errorMsg = '请选择用途';
                    $parent.append('<div class="formtips onError" >' + errorMsg + '</div>');
                } else {
                }
            }
            if ($(this).is("input:checkbox[name='area[]']")) {
                if ($("input:checkbox[name='area[]']:checked").length < 1) {
                    var errorMsg = '请选择面积大小';
                    $parent.append('<div class="formtips onError" >' + errorMsg + '</div>');
                } else {
                }
            }
            if ($(this).is("input:checkbox[name='caoxiang[]']")) {
                if ($("input:checkbox[name='caoxiang[]']:checked").length < 1) {
                    var errorMsg = '请选择房屋朝向';
                    $parent.append('<div class="formtips onError" >' + errorMsg + '</div>');
                } else {
                }
            }
            if ($(this).is("input:checkbox[name='lianxi[]']")) {
                if ($("input:checkbox[name='lianxi[]']:checked").length < 1) {
                    var errorMsg = '请选择联系方式';
                    $parent.append('<div class="formtips onError" >' + errorMsg + '</div>');
                } else {
                }
            }
        }
    }).focus(function () {
        $(this).triggerHandler("blur");
    });
    //提交，最终验证。
    $('#send').click(function () {

        $("form :input").trigger('blur'); //检测input
        $("input:checkbox").trigger('blur'); //检测checkbox
        var numError = $('form .onError').length;
        if (numError) {
            return false;
        } else {
            $('form').submit();
        }
    });
});
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