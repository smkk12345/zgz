<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title">风道数据展示</h4>
</div>
<div class="modal-body fdzs">
	<#if fd1??||fd2??>
	<div class="content">
            <div class="top">
			<#if fangxiang == "NorthSouth">
			西
			<#else>
			南
			</#if>
		</div>
		<#if fd1??>
			<div class="td${fd1?size} td">
				<#list 0..fd1?size-1 as i>
					<div class="td_${i} td_td"> 
					 <div class="bold">测点${fd1[i]}：</div>
			       		 <div class="panel-body shuoming">
				         	  温度：${fd1TemArr[i]?default("无")}℃ <p>
				         	  湿度：${fd1HumArr[i]?default("无")}%
			       		 </div>
					</div>
				</#list>
			</div>
		</#if>
		<div class="fdAoJian">
			<div class="center" style="width:200px;height:200px;line-height:200px; font-size: 23px;">厫间俯视图</div>
		</div>
		<div class="td2">
		<#if fd2??>
			<div class="td${fd2?size} td">
				<#list 0..fd2?size-1 as i>
					<div class="td_${i} td_td"> 
					 <div class="bold">测点${fd2[i]}：</div>
			       		 <div class="panel-body shuoming">
				         	  温度：${fd2TemArr[i]?default("无")}℃ <p>
				         	  湿度：${fd2HumArr[i]?default("无")}%
			       		 </div>
					</div>
				</#list>
			</div>
		</#if>
		</div>
		<div class="center bottom">			
			<#if fangxiang == "NorthSouth">
			东
			<#else>
			北
			</#if>
		</div>
	</div>
	<#else>
		无风道数据
	</#if>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
<script type="text/javascript">
</script>