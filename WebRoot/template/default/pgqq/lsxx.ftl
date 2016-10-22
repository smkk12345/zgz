<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="container-fluid lsxx">
	<#if aoJian??>
	    <#if aoJian.grainStatus?? && aoJian.grainStatus == '1'>
	    <div class="panel panel-default">
	        <div class="panel-heading"><span class="fl clearfix">粮源信息</span></div>
	        <div class="panel-body">
	            <ul class="">
	                <li class="">厫间仓容：${aoJian.aoJianGrainInfoBean.capacity?default("")}吨</li>
	                <li class="">粮食品种：${grainTypeBean.grainType?default("")}</li>
	                <li class="">入库水分：${aoJian.aoJianGrainInfoBean.storageMoisture?default("")}%</li>
	                <li class="">粮食级别：${aoJian.aoJianGrainInfoBean.level?default("")}</li>
	                <li class="">容&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp重：${aoJian.aoJianGrainInfoBean.unitWeight?default("")}t/m<sup>3</sup></li>
	                <li class="">杂&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp质：${aoJian.aoJianGrainInfoBean.impurity?default("")}%</li>
	                <li class="">不完整粒：${aoJian.aoJianGrainInfoBean.unsoundGrain?default("")}</li>
	                <li class="">入库时间：${aoJian.aoJianGrainInfoBean.inputTime?default("")}</li>
	                <li class="">收获时间：${aoJian.aoJianGrainInfoBean.harvestTime?default("")}</li>
	                <li class="">粮食产地：${aoJian.aoJianGrainInfoBean.grainOrigin?default("")}</li>
	                <li class="">备&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp注：${aoJian.aoJianGrainInfoBean.remarks?default("")}</li>
	            </ul>
	        </div>
	    </div>
	    <#else>
              <div class="alert alert-danger">${disSelectName?default("")} 仓内没有粮食！</div>
	    </#if>
    <#else>
    <div class="alert alert-danger"> 当前仓未设置厫间信息 </div>
    </#if>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>
