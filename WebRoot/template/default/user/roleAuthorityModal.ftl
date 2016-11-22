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
               		  </#if>> 入户基础信息登记
                  </label>
              </div>  
          </div>
          <div class="form-group fl  ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=2 name="chkItem" class="subItem_levelOne_0" <#if bean.roleAuthority[2]=="2">checked </#if>
                      > 入户信息查询
                  </label>
              </div>  
          </div>
          <div class="form-group fl  ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=3 name="chkItem" class="subItem_levelOne_0" <#if bean.roleAuthority[3]=="2">checked </#if>
                      > 入户信息编辑删除
                  </label>
              </div>  
          </div>
          <div class="form-group fl  ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=4 name="chkItem" class="subItem_levelOne_0" <#if bean.roleAuthority[4]=="2">checked </#if>
                      > 入户信息查看
                  </label>
              </div>  
          </div>
      </div>
    </div>

    <div class="container-fluid">
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=5 name="chkItem" class="item_levelOne_1" <#if bean.roleAuthority[5]=="2">checked </#if>> 分户方案管理
            </label>
        </div> 
    </div>
    <div class="container-fluid" style=" margin-left:30px;">
      <div class="container-fluid">
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=6 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[6]=="2">checked </#if>> 分户方案查询
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=7 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[7]=="2">checked </#if>> 分户方案编辑
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=8 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[8]=="2">checked </#if>> 分户方案查看
                  </label>
              </div>  
          </div> 
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=9 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[9]=="2">checked </#if>> 金额审查表查看
                  </label>
              </div>  
          </div>     
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=10 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[10]=="2">checked </#if>> 协议查看
                  </label>
              </div>  
          </div> 
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=11 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[11]=="2">checked </#if>> 确认签约
                  </label>
              </div>  
          </div>      
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=12 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[12]=="2">checked </#if>> 打印首页
                  </label>
              </div>  
          </div>  
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=13 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[13]=="2">checked </#if>> 打印告知单
                  </label>
              </div>  
          </div> 
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=14 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[14]=="2">checked </#if>> 方案审核审计查询
                  </label>
              </div>  
          </div> 
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=15 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[15]=="2">checked </#if>> 打印基本调查表
                  </label>
              </div>  
          </div>      
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=16 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[16]=="2">checked </#if>> 打印认定结果
                  </label>
              </div>  
          </div> 
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=17 name="chkItem" class="subItem_levelOne_1" <#if bean.roleAuthority[17]=="2">checked </#if>> 审核审查
                  </label>
              </div>  
          </div>        
      </div>
    </div>  
     <div class="container-fluid">
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=18 name="chkItem" class="item_levelOne_2" <#if bean.roleAuthority[18]=="2">checked </#if>> 实时数据
            </label>
        </div> 
    </div>
    <div class="container-fluid" style=" margin-left:30px;">
      <div class="container-fluid">
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=19 name="chkItem" class="subItem_levelOne_2" <#if bean.roleAuthority[19]=="2">checked </#if>> 实时数据展示
                  </label>
              </div>  
          </div>
      </div>
    </div>
    <div class="container-fluid">
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=20 name="chkItem" class="item_levelOne_3" <#if bean.roleAuthority[20]=="2">checked </#if>> 电子地图
            </label>
        </div> 
    </div>
    <div class="container-fluid" style=" margin-left:30px;">
      <div class="container-fluid">
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=21 name="chkItem" class="subItem_levelOne_3" <#if bean.roleAuthority[21]=="2">checked </#if>> 第一标段
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=22 name="chkItem" class="subItem_levelOne_3" <#if bean.roleAuthority[22]=="2">checked </#if>> 第二标段
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=23 name="chkItem" class="subItem_levelOne_3" <#if bean.roleAuthority[23]=="2">checked </#if>> 第三标段
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=24 name="chkItem" class="subItem_levelOne_3" <#if bean.roleAuthority[24]=="2">checked </#if>> 第四标段
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=25 name="chkItem" class="subItem_levelOne_3" <#if bean.roleAuthority[25]=="2">checked </#if>> 第五标段
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=26 name="chkItem" class="subItem_levelOne_3" <#if bean.roleAuthority[26]=="2">checked </#if>> 第六标段
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=27 name="chkItem" class="subItem_levelOne_3" <#if bean.roleAuthority[27]=="2">checked </#if>> 第七标段
                  </label>
              </div>  
          </div>
      </div>
    </div>    
    <div class="container-fluid">
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=28 name="chkItem" class="item_levelOne_4" <#if bean.roleAuthority[28]=="2">checked </#if>> 数据统计
            </label>
        </div> 
    </div>
    <div class="container-fluid" style=" margin-left:30px;">
      <div class="container-fluid">
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=29 name="chkItem" class="subItem_levelOne_4" <#if bean.roleAuthority[29]=="2">checked </#if>> 各标段签约情况统计
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=30 name="chkItem" class="subItem_levelOne_4" <#if bean.roleAuthority[30]=="2">checked </#if>> 各标段交房情况统计
                  </label>
              </div>  
          </div>
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=31 name="chkItem" class="subItem_levelOne_4" <#if bean.roleAuthority[31]=="2">checked </#if>> 签约顺序号台账
                  </label>
              </div>  
          </div>
      </div>
    </div>  
    <div class="container-fluid">
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=32 name="chkItem" class="item_levelOne_5" <#if bean.roleAuthority[32]=="2">checked </#if>> 交房信息管理
            </label>
        </div> 
    </div>
    <div class="container-fluid" style=" margin-left:30px;">
      <div class="container-fluid">
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=33 name="chkItem" class="subItem_levelOne_5" <#if bean.roleAuthority[33]=="2">checked </#if>> 交房登记
                  </label>
              </div>  
          </div>
      </div>
    </div>  
    <div class="container-fluid " >
         <div class="checkbox fl">
            <label>
                <input type="checkbox" dataIndex=34 name="chkItem" class="item_levelOne_6" <#if bean.roleAuthority[34]=="2">checked </#if>> 系统配置
            </label>
        </div> 
    </div>
    <div class="container-fluid" style=" margin-left:30px;">
      <div class="container-fluid">
          <div class="form-group fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=35 name="chkItem"  class="subItem_levelOne_6" <#if bean.roleAuthority[35]=="2">checked </#if>> 用户信息
                  </label>
              </div>  
          </div>
          <div class="form-group  fl ml10">
               <div class="checkbox fl">
                  <label>
                      <input type="checkbox" dataIndex=36 name="chkItem" class="subItem_levelOne_6" <#if bean.roleAuthority[36]=="2">checked </#if>> 用户组
                  </label>
              </div>  
          </div>
		    <div class="form-group  fl ml10">
		         <div class="checkbox fl">
		            <label>
		                <input type="checkbox" dataIndex=37 name="chkItem" class="subItem_levelOne_6" <#if bean.roleAuthority[37]=="2">checked </#if>> 个人设置
		            </label>
		        </div> 
		    </div>
		   <div class="form-group  fl ml10">
		         <div class="checkbox fl">
		            <label>
		                <input type="checkbox" dataIndex=38 name="chkItem" class="subItem_levelOne_6" <#if bean.roleAuthority[38]=="2">checked </#if>> 系统锁定
		            </label>
		        </div> 
		    </div>    
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