<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="container-fluid">
    <ul class="nav nav-pills menu">
        <#include "tfTypeMenu.ftl"/>
    </ul>

    <div class="alert alert-danger mt7">当前廒间正进行降温通风！</div>
    
    <table class="table table-hover " id="tfsbTable" >
	    <tr class="info">
	        <th style="width:100px">序号</th>
	        <th style="width:175px">设备名称</th>
	        <th >设备位置</th>
	        <th style="width:100px;">当前状态</th>
	        <th style="width:120px">控制器编号</th>
	        <th style="width:200px">操作</th>
	    </tr>
	    <#if baseDevices?size gt 0>
	    	<#list baseDevices as device>
		        <tr class="active" id=${device.id}>
		            <td >${device_index?number+1}</td>
		            <td >${device.deviceName}</td>
		            <td >${device.posInfo}</td>
		            <td >
		            	<#if device.isOpen??>
			            	<#if device.isOpen>
			            		开启
			            	<#else>
			            		未打开
			            	</#if>
			            <#else>
			           
		            	</#if>
		            </td>
		            <td >${device.controllerNum}</td>
		            <td >
		            <#if device.isOpen??>
		            	<button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" 
		            		tfType=${device.deviceName} tfId=${device.id} aoJianId = ${bean.zyAoJianNum}>
			            		
					            	<#if device.isOpen>
					            		关闭
					            	<#else>
					            		开启
					            	</#if>
					           
		            	</button>
		            <#else>
					           
				    </#if>
					</td>
		        </tr>
	    	</#list>
	    </#if>
	 </table>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>