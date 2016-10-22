<#include "leftMenu.ftl"/>
<@override name="main_right">
<div class="panel panel-default mt7">
        <div class="panel-heading"><span class="fl clearfix">粮情数据调整（正数为加，负数为减）</span></div>
        <div class="panel-body">
            <#if barnList?size gt 0>
            <#list barnList as vo>
            	<#list vo.aoJianSet as voo>
            	<#if voo.aoJianIndex??&&voo.sensorArrangementbeanId??>
                <div class="form-group fl">
                    <label class="control-label fl" style="width:70px;color: blue">
                       ${voo.aoJianIndex}
                    </label> 
                    <label for="tem${voo.zyAoJianNum}" class="control-label fl">温度调整值:</label>
                    <div class="input-group fl width-130px">
                        <input type="text" class="form-control fl  width-80px" id="tem${voo.zyAoJianNum}"  
                        name="adjustTemNum" value="${voo.adjustTemNum?default("0")}" placeholder="温度" >
                        <div class="input-group-addon width-50px bold">℃</div>
                    </div>
                    
                    <label for="max${voo.zyAoJianNum}" class="control-label  fl">湿度调整值:</label> 
                    <div class="input-group fl width-130px">
                        <input type="text" class="form-control fl  width-80px" id="hum${voo.zyAoJianNum}" 
                        name="adjustHumNum" value="${voo.adjustHumNum?default("0")}" placeholder="湿度" onblur="onBlurFun(${voo.zyAoJianNum},this)" >
                        <div class="input-group-addon width-50px bold">%</div>
                    </div>
                    
                    <label for="max${voo.zyAoJianNum}" class="control-label  fl">水份调整值:</label> 
                    <div class="input-group fl width-130px">
                        <input type="text" class="form-control fl  width-80px" id="wet${voo.zyAoJianNum}" 
                        name="adjustWetNum" value="${voo.adjustWetNum?default("0")}" placeholder="水份" onblur="onBlurFun(${voo.zyAoJianNum}, this)">
                        <div class="input-group-addon width-50px bold">%</div>
                    </div>
                    
                    <button type="button" class="btn btn-primary ml10  fl"  data-url="${BASE_PATH}lqjc/adjustAoJianLq.action?id=${voo.zyAoJianNum}" 
                    pId="${voo.zyAoJianNum}" onclick="save(this)">保存</button>
                    
                </div>
                </#if>
                </#list>
            </#list>
            </#if>
        </div>
    </div> 
<script type="text/javascript">

		function checkValue(value){
			alert(value);
		    if(isNAN(value)){
		    	 $(it).val($(it).attr(""));
		    }
	  	}
	function checkkey(v,it){
		  var kc=event.keyCode;
		  if (kc ==43 ||kc ==45 ||kc ==46 ||kc ==13 || (kc >47 && kc <58)){
		      if(kc==46&&v.indexOf('.') >-1)event.returnValue = false;
		      if((kc==43||kc==45)&&(v.indexOf('+')>-1||v.indexOf('-')>-1||v.length>0))event.returnValue = false;
		  }else{
		    event.returnValue = false;
		    alert("请输入数字");
		  }
	}

	function save(btn){
		var url = $(btn).attr("data-url");
        var id = $(btn).attr("pId");
        var adjustTemNum = $("#tem" + id).val();
        var adjustHumNum = $("#hum" + id).val();
        var adjustWetNum = $("#wet" + id).val();  
        $.ajax({
        type : "POST",
                url : url,
                dataType : "json",
                data : {"adjustTemNum":adjustTemNum, "adjustHumNum":adjustHumNum,"adjustWetNum":adjustWetNum,"aoJianId":id},
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                },
                success : function(response) {
                	alert("保存成功！");
                }
        })
     }
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
