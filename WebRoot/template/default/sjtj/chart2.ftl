<#include "leftMenu.ftl"/>
<#include "../macro_ftl/cxdList.ftl">
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
     
    <style>
        body {
            background-color:#000;
        }
        tr {
            background-color:#000;
        }
        td {
            color:#FFF;
            font-size:32px;
            font-family:"宋体";
            font-weight:bold;
            text-align: center;
        }
    </style>
    <meta http-equiv="refresh" content="5">
    <div>
	<table cellpadding="20" cellspacing="0" border="0" align="center">
	    <tr>
	        <td style="font-size:36px;">签约排号情况公示</td>
	    </tr>
	</table>
	<span>需要添加一些按照标段统计签约的数据</span>
	<div class="content">
	<table width="95%" border="0" cellspacing="1" cellpadding="10" align="center" bgcolor="#FFFFFF">
	    <tr>
	        <td>签约顺序号</td>
	        <td>所属标段</td>
	        <td>被腾退人</td>
	        <td>获取时间</td>
	    </tr>
	    <#if list?size gt 0>
		<#list list as ROW>
		<tr>
		    <td style="color:#FF0;">${ROW.indexNumStr?default("")}</td>
		    <td style="color:#0F0;">
		    	<#if ROW.section == "1">
		    	第一标段
		    	<#elseif ROW.section == "2">
		    	第二标段
		    	<#elseif ROW.section == "3">
		    	第三标段
		    	<#elseif ROW.section == "4">
		    	第四标段
		    	<#elseif ROW.section == "5">
		    	第五标段
		    	<#elseif ROW.section == "6">
		    	第六标段
		    	</#if>
		    </td>
		    <td style="color:#FF0;">${ROW.names?default("")}</td>
		    <td style="color:#0F0;">${ROW.displaydate?default("")}</td>
		</tr>
		</#list>
		</#if>
	</table>
	</div>

<script type="text/javascript">

	$(document).ready(function(){ 
	});  
	
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">
   
</script>
