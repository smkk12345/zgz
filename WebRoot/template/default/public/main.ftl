<div id="main" class="main">
    <#if CURENT_TAB =='INDEX'>
	
     <#else>
     <div id="main_left" class="left">
		<@block name="main_left"></@block>
	</div>
    </#if>
	<div id="main_right" class="right">
		<@block name="main_right"></@block>
	</div>
</div>


