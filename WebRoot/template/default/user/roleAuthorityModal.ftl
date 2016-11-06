<!--用户管理--添加编辑用户界面-->
<div class="modal-header" id="alarmModal">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">分配用户组权限</h4>
</div>

<div class="modal-body" >
  <form id="barnForm" action="" method="post">
  
    <div class="container-fluid">
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=0 name="chkItem" class="item_levelOne_0"
                <#if bean.roleAuthority[0]=="2">
                	checked
                </#if>
                > 前期入户管理
            </label>
        </div> 
    </div>
    <div class="container-fluid" style=" margin-left:30px;">
      <div class="container-fluid">
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=1 name="chkItem" class="subItem_levelOne_0"
                      <#if bean.roleAuthority[1]=="2">
                		checked
               		  </#if>> 入户基础信息管理
                  </label>
              </div>  
          </div>
          <div class="form-group fl  ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=2 name="chkItem" class="subItem_levelOne_0" <#if bean.roleAuthority[2]=="2">checked </#if>
                      > 入户信息登记编辑删除
                  </label>
              </div>  
          </div>
          <div class="form-group fl  ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=3 name="chkItem" class="subItem_levelOne_0" <#if bean.roleAuthority[3]=="2">checked </#if>
                      > 入户信息查看
                  </label>
              </div>  
          </div>
          <div class="form-group fl  ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=4 name="chkItem" class="subItem_levelOne_0" <#if bean.roleAuthority[4]=="2">checked </#if>
                      > 入户信息审计审核
                  </label>
              </div>  
          </div>
      </div>
    </div>

    <div class="container-fluid">
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=5 name="chkItem" class="item_levelOne_1" <#if bean.roleAuthority[5]=="2">checked </#if>> 方案协议管理
            </label>
        </div> 
    </div>
    <div class="container-fluid" style=" margin-left:30px;">
      <div class="container-fluid">
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=6 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[6]=="2">checked </#if>> 分户方案管理
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=7 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[7]=="2">checked </#if>> 协议签订管理
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=8 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[8]=="2">checked </#if>> 选房排号管理
                  </label>
              </div>  
          </div>          
      </div>
    </div>  
    <div class="container-fluid">
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=9 name="chkItem" class="item_levelOne_2" <#if bean.roleAuthority[9]=="2">checked </#if>> 交房信息管理
            </label>
        </div> 
    </div>
    <div class="container-fluid" style=" margin-left:30px;">
      <div class="container-fluid">
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=10 name="chkItem" class="subItem_levelOne_2" <#if bean.roleAuthority[10]=="2">checked </#if>> 交房登记
                  </label>
              </div>  
          </div>
      </div>
    </div>  
    <div class="container-fluid " >
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=11 name="chkItem" class="item_levelOne_3" <#if bean.roleAuthority[11]=="2">checked </#if>> 用户管理
            </label>
        </div> 
    </div>
    <div class="container-fluid" style=" margin-left:30px;">
      <div class="container-fluid">
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=12 name="chkItem"  class="subItem_levelOne_3" <#if bean.roleAuthority[12]=="2">checked </#if>> 用户信息
                  </label>
              </div>  
          </div>
          <div class="form-group  fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=13 name="chkItem" class="subItem_levelOne_3" <#if bean.roleAuthority[13]=="2">checked </#if>> 用户组
                  </label>
              </div>  
          </div>
      </div>
    </div>
    <div class="container-fluid " >
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=14 name="chkItem" class="item_levelOne_3" <#if bean.roleAuthority[14]=="2">checked </#if>> 数据统计
            </label>
        </div> 
    </div>
    <div class="container-fluid " >
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=15 name="chkItem" class="item_levelOne_4" <#if bean.roleAuthority[15]=="2">checked </#if>> 系统锁定
            </label>
        </div> 
    </div>    
    <input  type="text" name="barnId" value="${bean.id?default("")}" class="display-none" />
   
  </form>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary " data-url="${BASE_PATH}user/saveRoleInfo.action?roleId=${bean.id}" onclick="saveClick(this)" >保存</button>
</div>

<script type="text/javascript">
	//js  选中根节点子节点默认全部选中  选中子节点 根节点直接选中
	$(function(){
		$("[name = chkItem]:checkbox").click(function(){
			var curClass = $(this).attr("class");
			var i = curClass.indexOf("subItem_levelOne");
			if(i==0){    
				//子节点
				curClass = ".i"+curClass.substring(4,curClass.length);
				if($(curClass).is(":checked")){
				}
				else{
					$(curClass).prop("checked", true);
				}
			}
			else{
				var curClass = ".subI"+curClass.substring(1,curClass.length);
				if($(this).is(":checked")){
					$(curClass).prop("checked", true);
				}
				else{
					$(curClass).prop("checked", false);
				}
			}
			});
		})

</script>