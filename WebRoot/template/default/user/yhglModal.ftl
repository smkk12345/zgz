<!--用户管理--添加编辑用户界面-->
<div class="modal-header" id="alarmModal">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">
        <#if bean.id??>
        编辑用户
        <#else>
        新增用户
        </#if>
    </h4>
</div>

<div class="modal-body" >
    <form id="userForm" action="" method="post">
        <div class="container-fluid mb10" >
            <div class=" autoGroup fl"> 
                <label class="control-label required" for="userName">用户名:</label>
                <div class="width-170px fl">
                    <input type="text" class="form-control required width-160px" name="userName" id="userName" value="${bean.userName?default("")}"  errorMsg="用户名不能为空"   placeholder="用户名"/>
                    <div class="cl"></div>
                </div>
            </div>
            <div class=" autoGroup  "> 
                <label class="control-label required"  for="displayName">姓  名:</label>
                <div class="width-170px fl">
                    <input type="text" class="form-control required width-160px" name="displayName" id="displayName" value="${bean.displayName?default("")}"  errorMsg="请填写真实姓名"   placeholder="真实姓名"/>
                    <div class="cl"></div>
                </div>
            </div>
        </div>
        <div class="container-fluid mb10">
            <div class=" autoGroup fl">
                <label class="control-label  <#if bean.id??>needCheak<#else>required</#if>" for="passWord">密码:</label>
                <div class="width-170px fl">
                    <input type="password" class="form-control  <#if bean.id??>needCheak<#else>required</#if> width-160px" name="passWord" id="passWord" errorMsg="密码不能为空" value="" placeholder="密码"/>
                    <div class="cl"></div> 
                </div>   
            </div>
            <div class="autoGroup fl">
                <label for="btlInput" class="control-label  " for="selectRole">用户组:</label> 
                <select id="selectRole" class="form-control roleList fl"  style="width:170px;"  name="用户组" > 
                    <#assign sel="0">
                    <#list roleList as role>
                    <option 
                        <#if bean.rightLevel==role.id>
                        selected="selected"
                        <#assign sel="1">
                        </#if>
                        <#if sel=="0" && "3"==role.id>
                        selected="selected"
                        </#if>
                        roleId=${role.id}>${role.roleName}</option>  
                    </#list>
                </select>
            </div>
        </div>

        <div class="container-fluid mb10">        
            <div class=" autoGroup fl"> 
                <label class=" control-label required" for="phone">联系方式:</label>
                <div class="width-170px fl">
                    <input type="text" class="form-control  required width-160px" name="tel" id="phone" value="${bean.tel?default("")}" errorMsg="联系方式不能为空" placeholder="联系方式"/>
                    <div class="cl"></div>
                </div>
            </div>
            <div class=" autoGroup fl"> 
                <label class=" control-label needCheak">邮箱:</label>
                <div class="width-170px fl">
                    <input type="text" class="form-control needCheak width-160px" name="email" id="email" value="${bean.email?default("")}"  placeholder="邮箱"/>
                    <div class="cl"></div>
                </div>
            </div>
        </div>
        <div class="container-fluid mb10">        
            <div class="autoGroup  fl width-100-"> 
                <label class=" control-label fl">备注:</label>
                <div class="width-467px fl">
                    <input type="text" class="form-control width-100-"  name="memo" value="${bean.memo?default("")}"  placeholder="备注"/>
                    <div class="cl"></div>
                </div>
            </div>
        </div>
        <input  type="hidden" name="userId" <#if (bean.id)??>value='${bean.id}'<#else>value=''</#if>  />
    </form>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary "  id="send" data-url="${BASE_PATH}/user/saveUserInfo.action" >保存</button>
</div>

<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>

<script type="text/javascript">

    //保存告警信息
    function save(btn) {
        var dataInfo = $("#userForm").serialize();
        var obj = document.getElementById('selectRole');
        var index = obj.selectedIndex; //序号，取当前选中选项的序号
        var val = $('#selectRole option:selected').attr("roleId");
        dataInfo = dataInfo + "&roleId=" + val;
        var url = $(btn).attr("data-url");
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            data: dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                //$("#userTableBody").empty().append(response);
                location.reload();
                $('#myModal').modal('hide');
            }
        });
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
                if (!response && UserName != '${bean.userName}') {
                    isOk = false;
                } else {
                    isOk = true;
                }
            }
        });
        return isOk;
    }

</script>