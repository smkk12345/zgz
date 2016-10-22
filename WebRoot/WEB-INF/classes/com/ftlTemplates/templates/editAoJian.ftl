 <#if bean.aoJianSet?size gt 0>
                <#list bean.aoJianSet as aoJianBean>
                <#if aoJianBean_index != 0>
                <hr size='0.5' width='100%'  align='center' color='#999999;'>
                </#if>
                <form id=${aoJianBean_index+'aoJianForm'}>
                     <div class='container-fluid mb10' >
                         <div class=' aoJianGroup fl '> 
                             <label class='control-label' >廒间编号:<span class="glyphicon glyphicon-star red"></span></label>
                             <div class="width-170px fl">
                                 <input type='text' class='form-control required width-160px' name='aoJianIndex' id="aoJianIndex" value="${aoJianBean.aoJianIndex?default("")}"   placeholder='廒间编号'/>
                                 <div class='cl'></div>
                             </div>
                         </div>
                         <div class=' aoJianGroup fl'>
                             <label class='fl control-label'>分机编号:</label>
                             <input type='text' class='form-control fl ' name='fjGrainIndex'  value="${aoJianBean.fjGrainIndex?default("")}" placeholder='分机编号'/>        
                         </div> 

                         <div class=' aoJianGroup fl'>
                             <label class='fl control-label required' >储存类型:</label>
                             <select  class='form-control fl required' style='width:120px;' id="storeType" name="storeType">  
                             	 <option value="-1">选择存储状态</option>
                                 <option value="常温"
                                         <#if (aoJianBean.aoJianGrainInfoBean.storeType)??>
                                         <#if aoJianBean.aoJianGrainInfoBean.storeType=='常温'>
                                         selected='selected'
                                         </#if>
                                         </#if>
                                         >常温</option>
                                 <option value="低温"
                                         <#if (aoJianBean.aoJianGrainInfoBean.storeType)??>
                                         <#if aoJianBean.aoJianGrainInfoBean.storeType=='低温'>
                                         selected='selected'
                                         </#if>
                                         </#if>>低温</option>
                                 <option value="准低温"
                                         <#if (aoJianBean.aoJianGrainInfoBean.storeType)??>
                                         <#if aoJianBean.aoJianGrainInfoBean.storeType=='准低温'>
                                         selected='selected'
                                         </#if>
                                         </#if>>准低温</option> 
                                 grainId='${grain.id}'>${grain.grainType}</option>  
                             </select>   
                         </div>
                         <div class=' autoGroup fr'> 
                             <a class='fr expandaLink' href='#' data-url="${aoJianBean.aoJianIndex?default("")}" title='编辑廒间信息' onClick='showDetail(this)'>
                                 <span class='glyphicon glyphicon-menu-up blue'></span>
                             </a>
                         </div>
                         <div class='cl'></div>
                     </div>
                     <div class='ml20' style='margin-left: 30px;'  id="${aoJianBean.aoJianIndex?default("")}">
                                                                 <div class='container-fluid mb10'>
                                                                     <div class=' aoJianGroup fl'>      
                                                                         <label class='fl control-label required'>布置方式:</label>
                                                                         <select  class='form-control fl required' style='width:120px;' name='sensorArrangementbeanId' id="sensorArrangementbeanId">  
                                                                             <option value="-1">选择布置方式</option>
                                                                             <#list sensorArrangementBeanList as arrangement> 
                                                                             <option 
                                                                                 <#if arrangement.id==aoJianBean.sensorArrangementbeanId>
                                                                                 	selected='selected'
                                                                                 </#if>
                                                                                 value="${arrangement.id}">${arrangement.arrangementName}</option>  
                                                                             </#list>
                                                                         </select>   
                                                                     </div>
                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label required'>粮食品种:</label>
                                                                         <select  class='form-control fl required' style='width:120px;' name='grainType' id="grainType">  
                                                                             <option value="-1">选择粮食品种</option> 
                                                                             <#list grainList as grain>
                                                                             <option 
                                                                                 <#if (aoJianBean.aoJianGrainInfoBean.grainType)??>
                                                                                 <#if grain.id==aoJianBean.aoJianGrainInfoBean.grainType>
                                                                                 selected='selected'
                                                                                 </#if>
                                                                                 </#if>
                                                                                 value="${grain.id}">${grain.grainType}</option>  
                                                                             </#list>
                                                                         </select>   
                                                                     </div>
                                                                     <div class=' aoJianGroup fl'>      
                                                                         <label class='fl control-label'>粮食产地:</label>
                                                                         <input type='text' class='form-control  ' name='grainOrigin' value="${aoJianBean.aoJianGrainInfoBean.grainOrigin?default("")}"  placeholder='粮食产地'/>       
                                                                     </div>
                                                                 </div>
                                                                 <div class='container-fluid mb10'>	
                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label'>收获时间:</label>
                                                                         <input type='text' class='form-control fl dmDate' name='harvestTime'  value="${aoJianBean.aoJianGrainInfoBean.harvestTimeStr?default("")}" placeholder='收获时间'/>        
                                                                     </div>
                                                                     <div class=' aoJianGroup fl'>      
                                                                         <label class='fl control-label'>粮食等级:</label>
                                                                         <input type='text' class='form-control  ' name='level' value="${aoJianBean.aoJianGrainInfoBean.level?default("")}"  placeholder='粮食等级'/>        
                                                                     </div>
                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label'>入库水份(%):</label>
                                                                         <input type='text' class='form-control fl ' name='storageMoisture'  value="${aoJianBean.aoJianGrainInfoBean.storageMoisture?default("")}" placeholder='入库水份'/>        
                                                                     </div>
                                                                 </div>

                                                                 <div class='container-fluid mb10'>
                                                                     <div class=' aoJianGroup fl'>      
                                                                         <label class='fl control-label'>杂质(%):</label>
                                                                         <input type='text' class='form-control  ' name='impurity' value="${aoJianBean.aoJianGrainInfoBean.impurity?default("")}"  placeholder='杂质'/>        
                                                                     </div>
                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label'>容重(t/m³):</label>
                                                                         <input type='text' class='form-control fl ' name='unitWeight' id="${aoJianBean_index}unitWeight" onblur=inputBlur(${aoJianBean_index}) value="${aoJianBean.aoJianGrainInfoBean.unitWeight?default("0.75")}"  placeholder='容重'/>        
                                                                     </div>

                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label'>不完整粒(%):</label>
                                                                         <input type='text' class='form-control fl '  name='unsoundGrain'  value="${aoJianBean.aoJianGrainInfoBean.unsoundGrain?default("")}" placeholder='不完整粒'/>        
                                                                     </div>
                                                                 </div>
                                                                 <div class='container-fluid mb10'>
                                                                     <div class=' aoJianGroup fl'>      
                                                                         <label class='fl control-label'>入库时间:</label>
                                                                         <input type='text' class='form-control  dmDate' name='inputTime' value="${aoJianBean.aoJianGrainInfoBean.inputTimeStr?default("")}"  placeholder='入库时间'/>        
                                                                     </div>

                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label required'>长(m):</label>
                                                                         <input type='text' class='form-control fl required length' name='length' id=${aoJianBean_index}length   onblur=inputBlur(${aoJianBean_index})  value="${aoJianBean.aoJianGrainInfoBean.length?default("")}" placeholder='长'/>        
                                                                     </div>
                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label required'>宽(m):</label>
                                                                         <input type='text' class='form-control fl required' name='width' id=${aoJianBean_index}width onblur=inputBlur(${aoJianBean_index})   value="${bean.width?default("")}" placeholder='宽'/>        
                                                                     </div>
                                                                 </div>
                                                                 <div class='container-fluid mb10'>
                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label required'>装粮线(m):</label>
                                                                         <input type='text' class='form-control fl required' name='height' id=${aoJianBean_index}height onblur=inputBlur(${aoJianBean_index})   value="${aoJianBean.aoJianGrainInfoBean.height?default("")}" placeholder='高'/>        
                                                                     </div>
                                                                     <div class=' aoJianGroup fl'>      
                                                                         <label class='fl control-label'>仓容(t):</label>
                                                                         <input type='text' class='form-control  ' name='capacity' id="capacity${aoJianBean_index}" 
                                                                                value="${aoJianBean.aoJianGrainInfoBean.capacity?default("")}"
                                                                                placeholder='储量'/>        
                                                                     </div>

                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label'>备注:</label>
                                                                         <input type='text' class='form-control fl '  name='remarks'  value="${aoJianBean.aoJianGrainInfoBean.remarks?default("")}" placeholder='备注'/>        
                                                                     </div>
                                                                     <div class=' aoJianGroup fr'>
                                                                         <button type='button' class='btn btn-primary '  data-formId="${aoJianBean_index+'aoJianForm'}"  onclick='editAoJianClick(this)' >编辑</button>
                                                                         <button type='button' class='btn btn-primary ml10 savebtn' 
                                                                                 data-url='${BASE_PATH}/xtsz/saveAoJianInfo.action?aoJianId=${aoJianBean.zyAoJianNum}' 
                                                                                 data-formId=${aoJianBean_index+'aoJianForm'}  >保存</button>
                                                                     </div>
                                                                 </div>
                                                             </div>
                     </form>
                     </#list>
                     </#if>