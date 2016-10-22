<!--仓房布置-->
<div class="modal-header" id="barnModal">
    <button type="button" class="close" data-dismiss="modal" onclick="closeBtnClick()"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel"><span class="form-group autoGroup fl">
        </span>
        <#if bean.id??>
        编辑廒间信息
        <#else>
        新增廒间信息
        </#if>
    </h4>
</div>
<div id="barnHead" beanId="${bean.id}">
    <div  id="aoJianModal">
        <div class="modal-body" style="height:auto;">
            <div id="aoJianListDiv">    
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
                             <label class='fl control-label required' >储存类型:</label>
                             <div class="fl">
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
                                 <div class='cl'></div>
                             </div> 
                         </div>
                         <div class=' aoJianGroup fl'>      
                             <label class='fl control-label required'>布置方式:</label>
                             <div class="fl">
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
                                 <div class='cl'></div>
                             </div> 
                         </div>
                         <div class=' autoGroup fr'> 
                             <a class='fr expandaLink' href='#' data-url="${aoJianBean.id?default("")}" title='编辑廒间信息' onClick='showDetail(this)'>
                                 <span class='glyphicon glyphicon-menu-up blue'></span>
                             </a>
                         </div>
                         <div class='cl'></div>
                     </div>
                     <div class='ml20' style='margin-left: 30px;'  id="${aoJianBean.id?default("")}">
                                                                 <div class='container-fluid mb10'>
                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label required'>粮食品种:</label>
                                                                         <div class="fl">
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
                                                                             <div class='cl'></div>
                                                                         </div> 
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
                                                                         <span style="position: relative; z-index: 9999;"><input type='text' class='form-control  fl dmDate' name='inputTime' value="${(aoJianBean.aoJianGrainInfoBean.inputTimeStr)?default("")}"  placeholder='入库时间'/></span>        
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
                                                                         <div class="fl">
                                                                             <input type='text' class='form-control fl required length' name='length' id=${aoJianBean_index}length   onblur=inputBlur(${aoJianBean_index})  value="${(aoJianBean.length)?default("")}" placeholder='长'/>        
                                                                             <div class='cl'></div>
                                                                         </div>
                                                                     </div>
                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label required'>宽(m):</label>
                                                                         <div class="fl">
                                                                             <input type='text' class='form-control fl required' name='width' id=${aoJianBean_index}width onblur=inputBlur(${aoJianBean_index})   value="${(bean.width)?default("")}" placeholder='宽'/>        
                                                                             <div class='cl'></div>
                                                                         </div>
                                                                     </div>
                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label required'>装粮线(m):</label>
                                                                         <div class="fl">
                                                                             <input type='text' class='form-control fl required' name='height' id=${aoJianBean_index}height onblur=inputBlur(${aoJianBean_index})   value="${(aoJianBean.height)?default("")}" placeholder='高'/>        
                                                                             <div class='cl'></div>
                                                                         </div>
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
                                                                 <!--                                                                 <div class='container-fluid mb5'>
                                                                                                                                      <div class=' aoJianGroup fl'>
                                                                                                                                          <label class='fl control-label'>风道分机设置:</label>
                                                                                                                                          <select  class='form-control fl required' style='width:200px;' name='fdfjsz' id="fdfjsz">  
                                                                                                                                              <option value="-1">选择风道分机设置</option> 
                                                                                                                                              <option value="single" <#if aoJianBean.fdfjsz??><#if aoJianBean.fdfjsz == "single">selected='selected'</#if></#if>>风道独立分机</option>
                                                                                                                                              <option value="union" <#if aoJianBean.fdfjsz??><#if aoJianBean.fdfjsz == "union">selected='selected'</#if></#if>>风道与粮堆共用分机</option>
                                                                                                                                          </select>   
                                                                                                                                      </div> 
                                                                                                                                  </div> -->
                                                                 <div class='container-fluid mb5'>
                                                                     <div class=' aoJianGroup fl fd'>
                                                                         <label class='fl control-label'>风道分机:</label>
                                                                         <input type='text' class='form-control fl ' name='fjGrainIndex'  value="${aoJianBean.fjGrainIndex?default("")}" placeholder='风道分机编号'/>        
                                                                     </div> 
                                                                     <div class='aoJianGroup fl fd'>
                                                                         <label class='fl control-label '>风道<#if fangxiang == "NorthSouth">东<#else>南</#if>:</label>
                                                                         <input type='text' class='form-control fl ' name='fd1'   value="${aoJianBean.fd1?default("")}" placeholder='请填写探头号，以,隔开'/>   
                                                                     </div>
                                                                     <div class=' aoJianGroup fl fd'>
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
                                                                     <div class=' aoJianGroup fl fd'>
                                                                         <label class='fl control-label '>仓温探点:</label>
                                                                         <input type='text' class='form-control fl ' name='barnTemHumNumStr'   value="${aoJianBean.barnTemHumNumStr?default("")}" placeholder='请填写探头号，以,隔开'/>        
                                                                     </div>
                                                                     <div class=' aoJianGroup fl'>
                                                                         <label class='fl control-label '>表名称:</label>
                                                                         <input type='text' class='form-control fl ' name='dbname'   value="${aoJianBean.dbName?default("")}" placeholder='表名称'/>        
                                                                     </div>
                                                                 </div>
                                                                 </#if>
                                                                 <div class='container-fluid'>
                                                                     <div class=' aoJianGroup fr clearfix'>
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
                 </div>
                </div>
                <div class="modal-footer ">
                    <button type="button" class="btn btn-primary" onclick="upStep()" >上一步</button>
                    <button type="button" class="btn btn-primary "  onclick="closeBtnClick()" >关闭</button>
                </div>
            </div>

            <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
            <script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
            <script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>
            <script type="text/javascript">

                                $("#fdfjsz").change(function(){
                        var value = $("#fdfjsz option:selected").val();
                                if (value == "union"){
                        $("#fdfj").addClass("display-none");
                        } else if (value == "single"){
                        $("#fdfj").removeClass("display-none");
                                $(".fd").addClass("display-none");
                        } else{
                        $(".fd").addClass("display-none");
                        }
                        });
                                //判断廒间总长度是否大于仓房长度
                                        function isInTheBoundary(value){
                                        var totalLength = 0;
                                                $("#aoJianListDiv input[name='length']").each(function(){
                                        if ($(this).val() != ""){
                                        totalLength = totalLength + Number($(this).val());
                                        }
                                        })
                                                var beanLength = '${bean.length}';
                                                if (totalLength > '${bean.length}'){
                                        return false;
                                        }
                                        else{
                                        return true;
                                        }
                                        }
                                //同一仓房厫间编号不能重复
                                function aoJianIndexinValidate(value){
                                var length = $("#aoJianListDiv input[name='aoJianIndex']").length;
                                        var count = 0;
                                        $("#aoJianListDiv input[name='aoJianIndex']").each(function(){
                                if ($(this).val() == value){
                                count = count + 1;
                                }
                                })
                                        if (count > 1){
                                return true;
                                }
                                else{
                                return false;
                                }
                                }

                                //仓房编号唯一性验证ajax代码
                                function barnIndexinValidate(barnIndex){
                                var url = '${BASE_PATH}' + "xtsz/isRepeatBarnIndex.action?barnIndex=" + barnIndex;
                                        var isExist = false;
                                        $.ajax({
                                        type : "POST",
                                                url : url,
                                                async: false,
                                                error: function (XMLHttpRequest, errorThrown) {
                                                },
                                                success : function(response) {
                                                if (response.isExist){
                                                isExist = true;
                                                }
                                                else{
                                                isExist = false;
                                                }
                                                }
                                        })
                                        return isExist;
                                }
                                //计算联动
                                function inputBlur(str){
                                var lengthValue = $("#" + str + "length").val();
                                        var widthValue = $("#" + str + "width").val();
                                        var heightValue = $("#" + str + "height").val();
                                        var unitWeight = $("#" + str + "unitWeight").val();
                                        if (lengthValue != "" && widthValue != "" && heightValue != "" && unitWeight != ""){
                                var capacityValue = (lengthValue * widthValue * heightValue / 6) * (unitWeight / 0.75) * 4.275;
                                        $("#capacity" + str).attr("value", capacityValue.toFixed(0));
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
                                                location.reload();
                                                        $('#myModal').modal('hide');
                                                }
                                        })
                                }
                                //上一步
                                function upStep(){
                                var url = '${BASE_PATH}' + "xtsz/barnModal.action?barnId=" + '${bean.id}';
                                        $('#myModal').modal({
                                keyboard: false
                                });
                                        $(".modal-content").load(
                                        url, {name: "yl", title: "ly"},
                                        //Modal
                                        $('#myModal').on('shown.bs.modal', function () {
                                $('#myInput').focus();
                                })
                                        );
                                }
                                $(function(){
                                initDate();
                                });
                                        function initDate(){
                                        $(".dmDate").datepicker({
                                        format:'yyyy-mm-dd'
                                        });
                                        }

                                function showDetail(aLink){
                                if ($(aLink).find("span").hasClass('glyphicon-menu-up')){
                                $(aLink).find("span").removeClass().addClass("glyphicon glyphicon-menu-down blue");
                                }
                                else{
                                $(aLink).find("span").removeClass().addClass("glyphicon glyphicon-menu-up blue");
                                }
                                var attr = $(aLink).attr("data-url");
                                        $("#" + attr).toggle();
                                }


                                function addAoJianInfo(bean){

                                $("#barnHead").addClass("display-none");
                                        $("#aoJianModal").removeClass("display-none");
                                        var innerHtml = "";
                                        var count = parseInt(bean.aoJianCount);
                                        for (var i = 0; i < count; i++){
                                //innerHtml = innerHtml + getAddAoJianInnerHtml(bean.aoJianSet[i],i)	;
                                }
                                $("#aoJianListDiv").empty().append(innerHtml);
                                }

                                function getLocalTime(nS) {
                                return new Date(parseInt(nS)).toLocaleString().replace(/年|月/g, "-").replace(/日/g, " ");
                                }

                                function editAoJianClick(btn){
                                var formId = $(btn).attr("data-formId");
                                        $("#" + formId + " input").removeAttr("disabled");
                                }

                                //提交，最终验证。
                                $('.savebtn').click(function () {
                                var formId = $(this).attr("data-formId");
                                        var $iInputs = $("#" + formId).find("input");
                                        if ($iInputs != undefined && $iInputs.length > 0){
                                $iInputs.trigger('blur');
                                }
                                var $iCheckBoxes = $("input:checkbox");
                                        if ($iCheckBoxes != undefined && $iCheckBoxes.length > 0){
                                $iCheckBoxes.trigger('blur');
                                }
                                var $select = $("#" + formId).find("select");
                                        $select.trigger('blur'); //检测select

                                        var numError = $("#" + formId).find('.onError').length;
                                        if (numError) {
                                return null;
                                } else {
                                return saveAoJianClick(this);
                                }
                                });
                                        function saveAoJianClick(btn){
                                        var url = $(btn).attr("data-url");
                                                var formId = $(btn).attr("data-formId");
                                                var dataInfo = $("#" + formId).serialize();
                                                $.ajax({
                                                cache:true,
                                                        type : "POST",
                                                        url : url,
                                                        dataType : "json",
                                                        data : dataInfo,
                                                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                                                        },
                                                        success : function(response) {
                                                        $("#" + formId + " input").attr("disabled", "disabled"); //再改成disabled 
                                                        }
                                                })
                                        }
            </script>