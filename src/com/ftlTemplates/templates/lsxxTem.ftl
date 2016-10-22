          <#if aoJian.aoJianGrainInfoBean??&&aoJian.aoJianGrainInfoBean.curGrainInfo=='1'>
        	
           <form id='aoJianForm'>
		    <div class='container-fluid mb10'>
		    	<div class=' autoGroup fl'>
		      		<label class='fl control-label'>粮食品种:</label>
		      		<select id='selectGrainType' class='form-control fl' style='width:174px;' name='粮食品种' >  
				        <#list grainList as grain> 
				         <option 
				         	<#if (aoJian.aoJianGrainInfoBean.grainType)??>
		            			<#if grain.id==aoJian.aoJianGrainInfoBean.grainType>
	                				selected='selected'
	               				</#if>
	               			 </#if>
				            	 grainId='${grain.id}'>${grain.grainType}</option>  
				        </#list>
			    	</select>   
		        </div>
		        <div class=' autoGroup fl'>      
		    	    <label class='fl control-label'>粮食产地:</label>
		      		<input type='text' class='form-control  ' name='grainOrigin' value="${aoJian.aoJianGrainInfoBean.grainOrigin?default("")}"  placeholder='粮食产地'/>       
		        </div>
		      	<div class=' autoGroup fl'>
		      		<label class='fl control-label'>收获时间:</label>
		      		<input type='text' class='form-control fl dmDate' name='harvestTime'  value="${aoJian.aoJianGrainInfoBean.harvestTimeStr?default("")}" placeholder='收获时间'/>        
		        </div>
		    </div>
		    <div class='container-fluid mb10'>	
		        <div class=' autoGroup fl'>      
		        	<label class='fl control-label'>粮食等级:</label>
		      		<input type='text' class='form-control  ' name='level' value="${aoJian.aoJianGrainInfoBean.level?default("")}"  placeholder='粮食等级'/>        
		        </div>
		    	<div class=' autoGroup fl'>
		      		<label class='fl control-label'>入库水份(%):</label>
		      		<input type='text' class='form-control fl ' name='storageMoisture'  value="${aoJian.aoJianGrainInfoBean.storageMoisture?default("")}" placeholder='入库水份'/>        
		        </div>
		        <div class=' autoGroup fl'>      
		        	<label class='fl control-label'>杂质(%):</label>
		      		<input type='text' class='form-control  ' name='impurity' value="${aoJian.aoJianGrainInfoBean.impurity?default("")}"  placeholder='杂质'/>        
		        </div>
		    </div>

		  <div class='container-fluid mb10'>
			  	<div class=' autoGroup fl'>
		      		<label class='fl control-label'>容重(kg/m³):</label>
		      		<input type='text' class='form-control fl ' name='unitWeight' id="unitWeight" value="${aoJian.aoJianGrainInfoBean.unitWeight?default("")}"  placeholder='容重'/>        
			    </div>

		  	<div class=' autoGroup fl'>
		      		<label class='fl control-label'>不完整粒(%):</label>
		      		<input type='text' class='form-control fl '  name='unsoundGrain'  value="${aoJian.aoJianGrainInfoBean.unsoundGrain?default("")}" placeholder='不完整粒'/>        
		     </div>
	       	  <div class=' autoGroup fl'>      
	        	  <label class='fl control-label'>入库时间:</label>
	      		  <input type='text' class='form-control  dmDate' name='inputTime' value="${aoJian.aoJianGrainInfoBean.inputTimeStr?default("")}"  placeholder='入库时间'/>        
	          </div>
		      
		  </div>
		  <div class='container-fluid mb10'>
		    	<div class=' autoGroup fl'>
		      		<label class='fl control-label'>长(m):</label>
		      		<input type='text' class='form-control fl ' name='length' id="length"   onblur=inputBlur()  value="${aoJian.aoJianGrainInfoBean.length?default("")}" placeholder='长'/>        
		    	</div>
		    	<div class=' autoGroup fl'>
		      		<label class='fl control-label'>宽(m):</label>
		      		<input type='text' class='form-control fl ' name='width' id="width" onblur=inputBlur()   value="${aoJian.aoJianGrainInfoBean.width?default("")}" placeholder='宽'/>        
		    	</div>
		    	<div class=' autoGroup fl'>
		      		<label class='fl control-label'>高(m):</label>
		      		<input type='text' class='form-control fl ' name='height' id="height" onblur=inputBlur()   value="${aoJian.aoJianGrainInfoBean.height?default("")}" placeholder='高'/>        
		    	</div>
		  </div>
		  <div class='container-fluid mb10'>
			    <div class=' autoGroup fl'>      
		        	<label class='fl control-label'>储量(m³):</label>
		      		<input type='text' class='form-control  ' name='capacity' id="capacity" value="${aoJian.aoJianGrainInfoBean.capacity?default("")}"  placeholder='储量'/>        
			    </div>

	    	<div class=' autoGroup fl'>
	      		<label class='fl control-label'>备注:</label>
	      		<input type='text' class='form-control fl '  name='remarks'  value="${aoJian.aoJianGrainInfoBean.remarks?default("")}" placeholder='备注'/>        
	        </div>
	         <div class=' autoGroup fr'>
				 <button type='button' class='btn btn-primary '  data-url='${BASE_PATH}lqjc/exportGrainInfo.action'  onclick='ck(this)'> 出仓</button>
	      		 <button type='button' class='btn btn-primary ml10' data-url='${BASE_PATH}lqjc/saveAoJianGrainInfo.action' onclick="save(this)">保存</button>
		     </div>
		 </div>
		 </form>
		 <#else>
		 	<div>
		 		<span>当前厫间为空仓，请进行入仓操作！</span>
		 		 <button type='button' class='btn btn-primary '  data-url='${BASE_PATH}lqjc/importGrainInfo.action'  onclick='rk(this)' > 入仓</button>
		 	</div>
         </#if>      