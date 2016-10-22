<!--仓房布置-->
<div class="modal-header" id="barnModal">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel"><span class="form-group autoGroup fl">
        </span>
        <#if aoJianBean.grainStatus=="0">
        入仓操作
        <#else>
        编辑厫间信息
        </#if>
    </h4>
</div>
<div class="modal-body" style="height:auto;">
    <div id="aoJianListDiv">    
        <form id="aoJianForm">
            <div class='container-fluid mb10' >
                <div class=' aoJianGroup fl '> 
                    <label class='control-label' >廒间编号:<span class="glyphicon glyphicon-star red"></span></label>
                    <div class="width-170px fl">
                        <input type='text' class='form-control required width-160px' name='aoJianIndex' id="aoJianIndex" value="${aoJianBean.aoJianIndex?default("")}"   placeholder='廒间编号'/>
                        <div class='cl'></div>
                    </div>
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
                <div class='cl'></div>

                <div class='ml20 mt10'  id="${aoJianBean.id?default("")}">
                                      <div class='container-fluid mb10'>
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
                                              <input type='text' class='form-control  ' name='grainOrigin' value="${(aoJianBean.aoJianGrainInfoBean.grainOrigin)?default("")}"  placeholder='粮食产地'/>       
                                          </div>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label'>收获时间:</label>
                                              <span style="position: relative; z-index: 9999;"><input type='text' class='form-control fl dmDate' name='harvestTime'  value="${(aoJianBean.aoJianGrainInfoBean.harvestTimeStr)?default("")}" placeholder='收获时间'/></span>        
                                          </div>
                                      </div>
                                      <div class='container-fluid mb10'>
                                          <div class=' aoJianGroup fl'>      
                                              <label class='fl control-label'>入库时间:</label>
                                              <span style="position: relative; z-index: 9999;"><input type='text' class='form-control fl  dmDate' name='inputTime' value="${(aoJianBean.aoJianGrainInfoBean.inputTimeStr)?default("")}"  placeholder='入库时间'/></span>      
                                          </div>
                                          <div class=' aoJianGroup fl'>      
                                              <label class='fl control-label'>粮食等级:</label>
                                              <input type='text' class='form-control  ' name='level' value="${(aoJianBean.aoJianGrainInfoBean.level)?default("")}"  placeholder='粮食等级'/>        
                                          </div>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label'>入库水份(%):</label>
                                              <input type='text' class='form-control fl ' name='storageMoisture'  value="${(aoJianBean.aoJianGrainInfoBean.storageMoisture)?default("")}" placeholder='入库水份'/>        
                                          </div>
                                      </div>

                                      <div class='container-fluid mb10'>
                                          <div class=' aoJianGroup fl'>      
                                              <label class='fl control-label'>杂质(%):</label>
                                              <input type='text' class='form-control  ' name='impurity' value="${(aoJianBean.aoJianGrainInfoBean.impurity)?default("")}"  placeholder='杂质'/>        
                                          </div>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label'>容重(t/m³):</label>
                                              <input type='text' class='form-control fl ' name='unitWeight' id="${aoJianBean_index}unitWeight" onblur=inputBlur(${aoJianBean_index}) value="${(aoJianBean.aoJianGrainInfoBean.unitWeight)?default("0.75")}"  placeholder='容重'/>        
                                          </div>

                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label'>不完整粒(%):</label>
                                              <input type='text' class='form-control fl '  name='unsoundGrain'  value="${(aoJianBean.aoJianGrainInfoBean.unsoundGrain)?default("")}" placeholder='不完整粒'/>        
                                          </div>
                                      </div>
                                      <div class='container-fluid mb10'>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label required'>长(m):</label>
                                              <input type='text' class='form-control fl required length' name='length' id=${aoJianBean_index}length   onblur=inputBlur(${aoJianBean_index})  value="${(aoJianBean.length)?default("")}" placeholder='长'/>        
                                          </div>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label required'>宽(m):</label>
                                              <input type='text' class='form-control fl required' name='width' id=${aoJianBean_index}width onblur=inputBlur(${aoJianBean_index})   value="${(barn.width)?default("")}" placeholder='宽'/>        
                                          </div>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label required'>装粮线(m):</label>
                                              <input type='text' class='form-control fl required' name='height' id=${aoJianBean_index}height onblur=inputBlur(${aoJianBean_index})   value="${(aoJianBean.height)?default("")}" placeholder='高'/>        
                                          </div>
                                      </div>
                                      <div class='container-fluid mb10'>
                                          <div class=' aoJianGroup fl'>      
                                              <label class='fl control-label'>仓容(t):</label>
                                              <input type='text' class='form-control  ' name='capacity' id="capacity${aoJianBean_index}" 
                                                     value="${(aoJianBean.aoJianGrainInfoBean.capacity?c)?default("")}"
                                                     placeholder='储量'/>        
                                          </div>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label'>备注:</label>
                                              <input type='text' class='form-control fl '  name='remarks'  value="${(aoJianBean.aoJianGrainInfoBean.remarks)?default("")}" placeholder='备注'/>        
                                          </div>
                                      </div>
                                      <#if "5,2"?index_of(role.id) gt -1>
                                      <div class='container-fluid mb5'>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label'>风道分机:</label>
                                              <input type='text' class='form-control fl ' name='fjGrainIndex'  value="${aoJianBean.fjGrainIndex?default("")}" placeholder='风道分机编号'/>        
                                          </div> 
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label '>风道<#if fangxiang == "NorthSouth">东<#else>南</#if>:</label>
                                              <input type='text' class='form-control fl ' name='fd1'   value="${aoJianBean.fd1?default("")}" placeholder='请填写探头号，以,隔开'/>   
                                          </div>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label '>风道<#if fangxiang == "NorthSouth">西<#else>北</#if>:</label>
                                              <input type='text' class='form-control fl ' name='fd2'   value="${aoJianBean.fd2?default("")}" placeholder='请填写探头号，以,隔开'/>        
                                          </div>
                                      </div>                                                                 
                                      </#if>
                                      <#if role.id == "5">
                                      <div class='container-fluid mb5'>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label '>数据源格式:</label>
                                              <select  class='form-control fl' style='width:120px;' name='dataSourceType' id="dataSourceType">
                                                  <option 
                                                      <#if (aoJianBean.dataSourceType)??>
                                                      <#if "dbdb1"==aoJianBean.dataSourceType>
                                                      selected='selected'
                                                      </#if>
                                                      <#else>
                                                      selected='selected'
                                                      </#if>
                                                      value="dbdb1">数据格式1</option> 
                                                  <option
                                                      <#if (aoJianBean.dataSourceType)??>
                                                      <#if "dbdb2"==aoJianBean.dataSourceType>
                                                      selected='selected'
                                                      </#if>
                                                      </#if>
                                                      value="dbdb2">数据格式2</option> 

                                              </select>       
                                          </div>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label '>仓温探点:</label>
                                              <input type='text' class='form-control fl ' name='barnTemHumNumStr'   value="${aoJianBean.barnTemHumNumStr?default("")}" placeholder='请填写探头号，以,隔开'/>        
                                          </div>
                                          <div class=' aoJianGroup fl'>
                                              <label class='fl control-label '>表名称:</label>
                                              <input type='text' class='form-control fl ' name='dbname'   value="${aoJianBean.dbName?default("")}" placeholder='表名称'/>        
                                          </div>
                                      </div>
                                      </#if>
                                  </div>

                </div>
            </form>
        </div>
    </div>
    <div class="modal-footer ">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type='button' class='btn btn-primary savebtn fr'   data-url='${BASE_PATH}/xtsz/saveAoJianInfo.action?aoJianId=${aoJianBean.zyAoJianNum}'  data-formId="aoJianForm" >保存</button>
    </div>

    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
    <script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>
    <script type="text/javascript">
                                                          $(function(){
                                                          initDate();
                                                          })
                                                          //计算联动
                                                                  function inputBlur(){
                                                                  var lengthValue = $("#length").val();
                                                                          var widthValue = $("#width").val();
                                                                          var heightValue = $("#height").val();
                                                                          var unitWeight = $("#unitWeight").val();
                                                                          if (lengthValue != "" && widthValue != "" && heightValue != "" && unitWeight != ""){
                                                                  var capacityValue = (lengthValue * widthValue * heightValue / 6) * (unitWeight / 0.75) * 4.275;
                                                                          $("#capacity").attr("value", capacityValue.toFixed(0));
                                                                  }
                                                                  }

                                                          function closeBtnClick(){
                                                          var url = '${BASE_PATH}' + "xtsz/updateBarnsAfterClose.action";
                                                                  $.ajax({
                                                                  type : "POST",
                                                                          url : url,
                                                                          error: function (XMLHttpRequest, errorThrown) {
                                                                          },
                                                                          success : function(response) {
                                                                          $("#barnCont").empty().append(response);
                                                                                  $('#myModal').modal('hide');
                                                                          }
                                                                  })
                                                          }

                                                          function initDate(){
                                                          $(".dmDate").datepicker({
                                                          format:'yyyy-mm-dd'
                                                          });
                                                          }


                                                          function aoJianIndexinValidate(value){
                                                          return false;
                                                          }

//提交，最终验证。
                                                          $('.savebtn').click(function () {

                                                          var $iInputs = $("#aoJianForm").find("input");
                                                                  var $iInputs = $("#aoJianForm").find("select");
                                                                  $iInputs.trigger('blur');
                                                                  var $select = $("#aoJianForm").find("select");
                                                                  $select.trigger('blur'); //检测select

                                                                  var numError = $("#aoJianForm").find('.onError').length;
                                                                  if (numError) {
                                                          return null;
                                                          } else {
                                                          return saveAoJianClick(this);
                                                          }
                                                          });
                                                                  function saveAoJianClick(btn){
                                                                  var url = $(btn).attr("data-url");
                                                                          var formId = $(btn).attr("data-formId");
                                                                          var dataInfo = $("#aoJianForm").serialize();
                                                                          $.ajax({
                                                                          cache:true,
                                                                                  type : "POST",
                                                                                  url : url,
                                                                                  dataType : "json",
                                                                                  data : dataInfo,
                                                                                  error: function (XMLHttpRequest, textStatus, errorThrown) {
                                                                                  },
                                                                                  success : function(response) {
                                                                                  $('#myModal').modal('hide');
                                                                                          location.reload();
                                                                                  }
                                                                          })
                                                                  }

    </script>