<@override name="main_left">
	<ul class="menu-group">
		<li <#if CURENT_TAB_2 =='JCFX'>class="active"</#if>><a  href="${BASE_PATH}lqfx/jcfx.action">基础分析</a></li>
                <li <#if CURENT_TAB_2 =='JMFX'>class="active"</#if>><a href="${BASE_PATH}lqfx/jmfx.action">截面分析</a></li>
                <li <#if CURENT_TAB_2 =='JMFX'>class="active"</#if>><a href="${BASE_PATH}lqfx/jmfx.action">异常点分析</a></li>
		<li <#if CURENT_TAB_2 =='YCFX'>class="active"</#if>><a href="${BASE_PATH}lqfx/ycfx.action">危险区域预测</a></li>
	</ul>
</@override>