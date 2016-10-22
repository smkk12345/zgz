<#include "leftMenu.ftl"/>
<@override name="main_right">
<ul class="nav nav-pills menu">
	<li <#if CURENT_TAB_3 =='BGSJ'>class="active"</#if> role="presentation" ><a href="${BASE_PATH}zntf/tfjcbgsj.action">表格数据</a></li>
	<li <#if CURENT_TAB_3 =='YTZS'>class="active"</#if> role="presentation"><a href="${BASE_PATH}zntf/tfjcytzs.action">云图展示</a></li>
</ul>
</@override>

<@extends name = "../base/layout.ftl"/>