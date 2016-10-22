	<#if grainList?size gt 0>
    	<#list grainList as ROW>
        	<div  id="${ROW.id}" curDataId="${ROW.id}">
        		<div class="form-group fl">
            		<label class="control-label  fl">品种${ROW_index +1}:</label>
       				<input  type="text"   class="form-control fl" value="${ROW.grainType?default("")}" placeholder="粮食品种" disabled="disabled"/>		
           		</div>
            	<div class="form-group fl">
                 	<label class="control-label  fl">备注:</label>      
       			 	<input  type="text"   class="form-control fl" value="${ROW.remarks?default("")}" placeholder="备注" disabled="disabled"/>	
            	</div> 
            	<#if ROW.defaultGrain == "0">
	            	<div class="form-group fl">
	      				<button type="button" class="btn btn-primary ml10 "  data-url="${BASE_PATH}xtsz/grainTypeModal.action?grainTypeId=${ROW.id}"
	      				onclick="editBtnClick(this)">修改</button>
	      				<button type="button"  data-url="${BASE_PATH}xtsz/delGrain.action?grainTypeId=${ROW.id}" onclick="delBtnClick(this)"
	      				class="btn btn-primary ml10">删除</button>
	            	</div>
            	</#if>
            	<div class="cl"></div>
            </div> 
      	</#list>
    </#if>