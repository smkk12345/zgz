<@override name="main_left">

<div title="点击切换仓房厫间">
    <button type="submit" id="aoJianDisplayBtn" class="btn btn-toolbar width-100- bold YL-ModalClick" data-url="${BASE_PATH}lqjc/aojianModal.action">
        ${disSelectName?default("无仓房信息")}
        <br>点击切换
    </button>
</div>

<ul class="menu-group">
    <li <#if CURENT_TAB_2 =='TFJC'>class="active"</#if>>
    	<a href="${BASE_PATH}zntf/tfjcbgsj.action">
    		<#if CURENT_TAB_2 =='TFJC'>
    			<span class="yu-tu-fgsj-active"></span>
    		<#else>
    			<span class="yu-tu-fgsj-commen"></span>
    		</#if>状态进程
    	</a>
    </li>
    <li <#if CURENT_TAB_2 =='ZNTF'>class="active"</#if>>
    	<a href="${BASE_PATH}zntf/zntf.action">
	    	<#if CURENT_TAB_2 =='ZNTF'>
	    		<span class="yu-tu-fgsj-active"></span>
	    	<#else>
	    		<span class="yu-tu-fgsj-commen"></span>
	    	</#if>智能控制
    	</a>
    </li>
    <li <#if CURENT_TAB_2 =='SDKZ'>class="active"</#if>>
    	<a href="${BASE_PATH}zntf/sdkz.action">
	    	<#if CURENT_TAB_2 =='SDKZ'>
	    		<span class="yu-tu-fgsj-active"></span>
	    	<#else>
	    		<span class="yu-tu-fgsj-commen"></span>
	    	</#if>手动控制
    	</a>
    </li>
    <li <#if CURENT_TAB_2 =='XNPG'>class="active"</#if>>
	    <a href="${BASE_PATH}zntf/tfms.action">
	    	<#if CURENT_TAB_2 =='TFJL'>
	    		<span class="yu-tu-fgsj-active"></span>
	    	<#else>
	    		<span class="yu-tu-fgsj-commen"></span>
	    	</#if>通风报告
	    </a>
    </li>
</ul>
</@override>
