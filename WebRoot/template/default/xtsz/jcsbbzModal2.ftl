<!--检测设备布置--模态窗体--新增检测设备布置-->
<div class="modal-header" id="arrangementDetailModal" dataId = "${bean.id}">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">检测设备布置俯视图</h4>
</div>
<div class="modal-body" > 
 	<div class="container-full ">
 		<#list 1..bean.rowCount?number as x>
			<#if x == 1>
				<ul class="mt5 center" style="display:inline-block;">
					<#list 1..bean.columnCount?default(7)?number as y>
						<#if y==1>
							<label style="width:50px;line-height: 50px;" class="fl ml5 center">&nbsp </label>
						</#if>
						<li style="text-align:center;" class="fl ml5 li-kuai">
							<label style="width:50px;line-height: 50px;text-align:center;vertical-align:middle" class=" ml5 ">列${y}</label>
						</li>	
					</#list>
				</ul>
			</#if>
 			<ul class="mt5 center" >
 				<#list 1..bean.columnCount?number as z>
 					<#if z==1>
 						<label style="width:50px;line-height: 50px;text-align:center;vertical-align:middle" class="fl ml5 center">行${x}</label>
 					</#if>
 					<li style="text-align:center;" class="fl ml5 li-kuai"><img style="margin-left:2px; width:50px; height:50px;" 
 						src="
 							<#if bean.templateId == "1">
 								<#if x == 2||x==3>
 									<#if z%2 == 0>
 										${BASE_ASSETS_PATH}img/point.png"
 									<#else>
 										${BASE_ASSETS_PATH}img/blank.png"
 									</#if>
 								<#else>
 									<#if z%2 == 0>
										${BASE_ASSETS_PATH}img/blank.png"
 									<#else>
 										${BASE_ASSETS_PATH}img/point.png"
 									</#if>
 								</#if>
 							<#elseif bean.templateId == "3">
 								<#if x%2 == 0>
 									<#if z%2 == 0>
 										${BASE_ASSETS_PATH}img/point.png"
 									<#else>
 										${BASE_ASSETS_PATH}img/blank.png"
 									</#if>
 								<#else>
 									<#if z%2 == 0>
										${BASE_ASSETS_PATH}img/blank.png"
 									<#else>
 										${BASE_ASSETS_PATH}img/point.png"
 									</#if>
 								</#if>
 							<#elseif bean.templateId == "2">
 								${BASE_ASSETS_PATH}img/point.png"
 							<#else>
 								${BASE_ASSETS_PATH}img/point.png"
 							</#if>
 						/>
 					</li>
 				</#list>
 			</ul>
 			<div class='cl'></div>
 		</#list>
 	</div>
    <input  type="text" id="sensorArrangementId" name="sensorArrangementId" value="${bean.id?default("")}" class="display-none" />
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default"  data-url="${BASE_PATH}xtsz/jcsbbzModal1.action?sensorArrangementId=${bean.id}" onclick="backStepClick(this)">上一步</button>
    <button type="button" class="btn btn-default"  onclick="closeBtn(this)">保存关闭</button>
</div>
<script type="text/javascript">
	$(document).ready(function () {
    	var lwindth = $(".modal-body").parent().parent().width();
    	
    	var perWindth = (lwindth - 100)/ ('${bean.columnCount}')-10;
    	$(".li-kuai").each(function(){
    		$(this).css("width",perWindth+"px");
    	});
    });
</script>