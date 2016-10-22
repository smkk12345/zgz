    	<div class="panel panel-default mt7 subContent">
        	<div class="panel-heading"><span class="fl clearfix">风网设置</span></div>
	        <div class=" panel-body">
	        	<div class="container-fluid mb10" >
    				<div class="  autoGroup fl "> 
      					<label class="control-label" for="barnIndex">通风模式:</label>
      					<div class="width-170px fl">
				      		<select id="ventilationModeList" class="form-control" style="width:179px;">  
					            <#list ventilationModeList as ventilationMode>
					            	<option 
					            		<#if bean.ventilationMode??>
						            		<#if bean.ventilationMode==ventilationMode>
					                			selected="selected"
					               			</#if>
					            		</#if>
					            	horPos=${ventilationMode}>${ventilationMode}</option>  
					            </#list>
					    	</select>
	      					<div class="cl"></div>
      					</div>
        			</div>
	        		<div class="  autoGroup fl"> 
	      				<label class="control-label " for="openRatio">开孔率(%):</label>
	      				<div class="width-170px fl">
		      				<input type="text" class=" form-control  width-160px" name="openRatio" id="openRatio" value="${bean.openRatio?default("")}" errorMsg="开孔率不能为空"  placeholder="开孔率"/>
		      				<div class="cl"></div>
	      				</div>
	      			 </div>
	        		<div class="  autoGroup fl"> 
	      				<label class="control-label " for="wayThan">途径比:</label>
	      				<div class="width-170px fl">
		      				<input type="text" class=" form-control  width-160px" name="wayThan" id="wayThan" value="${bean.wayThan?default("")}" errorMsg="途径比不能为空"  placeholder="途径比"/>
		      				<div class="cl"></div>
	      				</div>
	      			 </div>
					 <div class="  autoGroup fl"> 
	      				<label class="control-label " for="ventResistance">风网阻力(pa):</label>
	      				<div class="width-170px fl">
		      				<input type="text" class=" form-control  width-160px" name="ventResistance" id="ventResistance" value="${bean.ventResistance?default("")}" errorMsg="风网阻力不能为空"  placeholder="风网阻力"/>
		      				<div class="cl"></div>
	      				</div>
	      			 </div>
	      			 <div class="  autoGroup fl"> 
	      				<label class="control-label " for="ventRemark">备注:</label>
	      				<div class="width-170px fl">
		      				<input type="text" class=" form-control  width-160px" name="ventRemark" id="ventRemark" value="${bean.ventRemark?default("")}"   placeholder="备注"/>
		      				<div class="cl"></div>
	      				</div>
	      			 </div>
	      			 <div class="  autoGroup fl"> 
	      			 	<button type="button" class="btn btn-primary  ml10"  data-url="${BASE_PATH}xtsz/saveAoJianTfsbInfo.action" aoJianId=${bean.zyAoJianNum} onClick="saveAoJianTfsb(this)" >保存</button>
	      			 </div>
   				</div>
	       	</div>
    	</div> 
    	<div class="panel panel-default subContent">
	        <div class="panel-heading"><span class="fl clearfix">通风设备</span> 
	                <div class="btn-group fr">
	                    <button type="button" class="btn btn-primary btn-xs dropdown-toggle"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        添加设备 <span class="caret"></span>
	                    </button>
	                    <ul class="dropdown-menu">
	                        <li><a  href="#" onclick="addDevice(this)" data-url="${BASE_PATH}xtsz/tfkModal.action">添加通风口</a></li>
	                        <li><a  href="#"  onclick="addDevice(this)" data-url="${BASE_PATH}xtsz/fjModal.action" href="#">添加风机</a></li>
	                        <li><a  href="#"  onclick="addDevice(this)" data-url="${BASE_PATH}xtsz/chModal.action" href="#">添加窗户</a></li>
	                        <li><a  href="#"  onclick="addDevice(this)" data-url="${BASE_PATH}xtsz/fljcModal.action" href="#">添加风力检测设备</a></li>
	                    </ul>
	                </div>
	        </div>
	        <div class=" panel-body">
		        <table class="table table-hover mt7 " id="tfsbTable">
			        <tr class="info">
			            <th style="width:50px">序号</th>
			            <th style="width:50px">设备编号</th>
			            <th style="width:75px">设备名称</th>
			            <th style="width:75px">设备位置</th>
			            <th style="width:75px">控制器编号</th>
			            <th style="width:200px">操作</th>
			        </tr>
			        <#if baseDevices?size gt 0>
			        	<#list baseDevices as device>
					        <tr class="active" id=${device.id}>
					            <td style="width:50px">${device_index?number+1}</td>
					            <td style="width: 30px">${device.deviceNo}</td>
					            <td style="width:75px">${device.deviceName}</td>
					            <td style="width:75px">${device.posInfo}</td>
					            <td style="width:75px">${device.controllerNum}</td>
					            <td style="width:75px">
					            	<button type="button" class="btn btn-primary btn-xs ml10"  onClick="editBtnClick(this)" tfType=${device.deviceName} tfId=${device.id} aoJianId = ${bean.zyAoJianNum}>编辑</button>
									<button type="button" class="btn btn-primary btn-xs ml10"  onClick="delBtnClick(this)" data-url="${BASE_PATH}xtsz/deleteDevice.action?curDataId=${device.id}" tfId=${device.id} tfType=${device.deviceName}>删除</button>
								</td>
					        </tr>
			        	</#list>
			        </#if>
		    	 </table>
	       	 </div>
    	</div>      
   