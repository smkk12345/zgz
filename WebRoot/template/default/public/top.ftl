<div id="top" class="top">
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a <#if CURENT_TAB == 'INDEX'>class="active"</#if>  href="/index.action"><div class="logo"></div></a>
                <ul class="nav nav1">	
<!--                    <li><a <#if CURENT_TAB == 'INDEX'>class="active"</#if> href="${BASE_PATH}index.action">首页</a>
                    </li>-->
                    
                    	<li><a <#if CURENT_TAB == 'PGQQ'>class="active"</#if> 
                    		href="${BASE_PATH}pgqq.action"
                    	>前期入户管理</a>
                    	</li>
                    
                    <#if role.roleAuthority[5]=="2">
                    	<li><a <#if CURENT_TAB == 'AGREENMENT'>class="active"</#if> 
                    	href="${BASE_PATH}pgzq/agreenment.action"
                    	>方案协议管理</a></li>  
                    </#if> 
                    <#if role.roleAuthority[32]=="2">
                    	<li><a <#if CURENT_TAB == 'JFDJ'>class="active"</#if> 
                    	<#if role.roleAuthority[3]=="2">
                    		href="${BASE_PATH}jfdj/jfdj_1.action"
                    	<#else>
                    		href="${BASE_PATH}jfdj/jfdj_0.action"
                    	</#if>
                    	>交房信息管理</a></li>  
                    </#if>
                    <#if role.roleAuthority[18]=="2">
                    	<li><a <#if CURENT_TAB == 'SJTJ'>class="active"</#if> 
                    		href="${BASE_PATH}sjtj/lists.action"
                    	>实时数据</a></li>  
                    </#if>
                    <#if role.roleAuthority[20]=="2">
                    	<li><a <#if CURENT_TAB == 'DZDT'>class="active"</#if> 
                    		href="${BASE_PATH}dzdt/bd1.action"
                    	>电子地图</a></li>  
                    </#if> 
                     <#if role.roleAuthority[28]=="2">
                    	<li><a <#if CURENT_TAB == 'SJFX'>class="active"</#if> 
                    		href="${BASE_PATH}sjfx/gbdqytj.action"
                    	>数据统计</a></li>  
                    </#if>         
                    <#if role.roleAuthority[14]=="2">
                    	<li><a <#if CURENT_TAB == 'CWJS'>class="active"</#if> 
                    		href="${BASE_PATH}cwjs/cwjs.action"
                    	>财务结算</a></li>  
                    </#if> 
                    
                	<li>
	                	<a <#if CURENT_TAB == 'DAGL'>class="active"</#if> 
	                		href="${BASE_PATH}dagl/list.action"
	                	>档案管理</a>
                	</li>  
                	
                    <#if role.roleAuthority[34]=="2">
                        	<li><a <#if CURENT_TAB == 'XTSZ'>class="active"</#if> href="
                        		<#if role.roleAuthority[36]=="2" ||  role.roleAuthority[35]=="2">
                        			${BASE_PATH}xtsz.action"
                        		<#else>
                        			${BASE_PATH}user/personDetail.action?oType=detail"
                        		</#if>
                        	>系统配置</a>
                    </#if>
                    </li>
	               <!--  <li><a <#if CURENT_TAB == 'GJXX'>class="active"</#if> href="${BASE_PATH}gjxx.action">信息管理</a>
                    </li>
                    
                    <!--   <li><a <#if CURENT_TAB == 'BZ'>class="active"</#if> href="${BASE_PATH}help.action">帮助</a>
                     </li>-->
                </ul>
             <ul class="pull-right mt10">
                     <!--  <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            快捷入口 <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" style="width: 100px;">
                            <#if (user.fastCutUrls)??>  
                            <#list (user.fastCutUrls?split("@")) as url>
                            <#if url != "">
                            <li><a href="${BASE_PATH}${url?split("#")[1]}">${url?split("#")[0]}</a></li>
                            </#if>
                            </#list>
                            </#if>
                            <li role="separator" class="divider"></li>
                            <li><a href="javascript:" class="YL-ModalClick" data-url="${BASE_PATH}fastCut.action"><i class="glyphicon glyphicon-off"></i>自定义</a></li>
                        </ul>
                    </div>-->
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ${user.displayName} <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right pt0">
                            <li><a style='background-color: #286090'><i class="orange bold">${role.roleName}</i></a></li>
                            <li role="separator" class="divider" style="margin: 2px 0 0 0;padding:0"></li>
                            <li><a href="${BASE_PATH}user/personDetail.action?oType=detail">修改资料</a></li>
                            <li><a href="${BASE_PATH}user/personDetail.action?oType=password">修改密码</a></li>
                            <li><a href="${BASE_PATH}user/personDetail.action?oType=kjdl">快捷登录</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${BASE_PATH}quit.action"><i class="glyphicon glyphicon-off"></i>退出</a></li>
                        </ul>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</div>


