
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">房屋征收安置补偿方案信息登记单（基本情况，房屋信息，部分补助信息是从入户信息中提取，如有调整，请到入户信息管理中修改）</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    </div>
</div>
<div class="modal-body rhjc-add-con" id="fhfa-edit-con">
    <form id='rhjcAddForm' modelAttribute = "Agreement" action="${BASE_PATH}/pgzq/saveAgreenment.action"
          accept-charset="UTF-8" method="post">
        <input type="hidden" class='form-control input-sm ' name='aid' value="${bean.id?default("")}" style="width: 0px;"/>
        <input type="hidden" class='form-control input-sm ' name='housebasicid' value="${housebasic.id?default("")}" style="width: 0px;"/>
 		<input type="hidden" class='form-control input-sm ' name='protocolnumber' value="${bean.protocolnumber?default("")}" style="width: 0px;"/>
 		<input type="hidden" class='form-control input-sm ' name='zxsbfsw' value="<#if bean.zxsbfsw??>${bean.zxsbfsw?c}<#else></#if>" style="width: 0px;"/>
 		<input type="hidden" class='form-control input-sm ' name='fwjk' value="<#if bean.fwjk??>${bean.fwjk?c}<#else></#if>" style="width: 0px;"/>
 		<input type="hidden" id＝"input_people" class='form-control input-sm ' name='people' value="${housebasic.people}" style="width: 0px;"/>

 		
        <div class='ml15' >
            <h4><span class="label label-default">1.安置意向选择：</span></h4>
            <div class='container-fluid con-bg mb10' id="div1">
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">被腾退人姓名:</label>
                    <input type='text'  class='form-control input-sm  ' name='names' value="${housebasic.names?default("")}"/>
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">房屋坐落:</label>
                    <input type='text'  class='form-control input-sm  ' name='location' value="${housebasic.location?default("")}"/>
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">安置意向:</label>
                </div> 
                <div class="container-fluid fl">
                    <label >
                        <input type="radio" name="atype" id="optionsRadios3" value="0" <#if (bean.atype?default("0"))=='0'>checked</#if>>房屋安置
                    </label>
                    <label >
                        <input type="radio" name="atype" id="optionsRadios4" value="1" <#if (bean.atype?default("0"))=='1'>checked</#if>>货币补偿
                    </label>
                </div>
 
                <div class=' aoJianGroup fl' >
                    <label class='fl control-label' ">货币补偿方式人员选定:</label>
                    <select id='azrkxx' class='form-control input-sm fl' style="width: 120px;" name='azrkxx' >  
                        <option <#if (housebasic.azrkxx?default("0"))=='0'>selected='selected'</#if> value="0">推举非安置人员</option>  
                        <option <#if (housebasic.azrkxx?default("-1"))=='1'>selected='selected'</#if> value="1">被安置人员</option> 
                    </select>
                </div>	
                
            </div>   
            <h4><span class="label label-default">2.测绘面积</span></h4>
            <div class='container-fluid con-bg mb10' id="div3">	
            
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">宅基地测绘面积:</label>
                    <input type='text' class='form-control input-sm  ' name='zjdarea' value="<#if housebasic.zjdarea??>${housebasic.zjdarea?c}<#else>0</#if>"/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">房屋测绘面积:</label>
                    <input type='text' class='form-control input-sm  ' name='fwarea' value="<#if housebasic.fwarea??>${housebasic.fwarea?c}<#else>0</#if>" />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">首层测绘面积:</label>
                    <input type='text' class='form-control input-sm  ' name='firstfloorarea' value="<#if housebasic.firstfloorarea??>${housebasic.firstfloorarea?c}<#else>0</#if>"/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">二层以上面积:</label>
                    <input type='text' class='form-control input-sm  ' name='abovetwoarea' value="<#if housebasic.abovetwoarea??>${housebasic.abovetwoarea?c}<#else>0</#if>"/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">地下室面积:</label>
                    <input type='text' class='form-control input-sm  ' name='basement' value="<#if housebasic.basement??>${housebasic.basement?c}<#else>0</#if>"/>        
                </div>
                 <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">棚面积:</label>
                    <input type='text' class='form-control input-sm  ' name='shed' value="<#if housebasic.shed??>${housebasic.shed?c}<#else>0</#if>"/>        
                </div>
            </div>             	
            <h4><span class="label label-default">3.认定面积信息：</span></h4>
            <div class='container-fluid con-bg mb10' id="div2">
             <div class=' aoJianGroup fl' >
                    <label class='fl control-label' style="width:220px;">认定依据:</label>
                    <select id='rdyj' class='form-control input-sm fl' style="width: 120px;" name='rdyj' >  
                        <option <#if (bean.rdyj?default("0"))=='0'>selected='selected'</#if> value="0">宅基地原始批单</option>  
                        <option <#if (bean.rdyj?default("-1"))=='1'>selected='selected'</#if> value="1">认定小组认定</option> 
                         <option <#if (bean.rdyj?default("-1"))=='2'>selected='selected'</#if> value="2">翻建表</option> 
                          <option <#if (bean.rdyj?default("-1"))=='3'>selected='selected'</#if> value="3">其他</option> 
                    </select>
                </div>	
               <#-- <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>宅基地实测用地面积:</label>
                    <input type='text'  class='form-control input-sm  ' name='scydmj'  value="<#if bean.scydmj??>${bean.scydmj?c}<#else></#if>" />
                </div>-->
                   <div class=' aoJianGroup fl'>
                       <label class='fl control-label' style="width:220px;">认定宅基地面积（㎡）:</label>																		
                       <input type='text' id="rdzjdallarea"  onchange="caculat1()"  class='form-control input-sm' name='rdzjdallarea'  value="${bean.rdzjdallarea?default("")}" />
                   </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">补偿宅基地面积（㎡）:</label>
                    <input type='text' class='form-control input-sm  ' id='bczjdmj' name='bczjdmj'  onchange="caculat1()"  value="<#if bean.bczjdmj??>${bean.bczjdmj?c}</#if>" />    
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">控制面积（㎡）:</label>
                    <input type='text' id="conhomestarea" onchange="caculat1()"  class='form-control input-sm  ' name='conhomestarea'  value="<#if bean.conhomestarea??>${bean.conhomestarea?c}<#else></#if>" />
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">超控面积（㎡）:</label>
                    <input type='text' id="overhomesteadarea" readonly  class='form-control input-sm  ' name='overhomesteadarea'  value="<#if bean.overhomesteadarea??>${bean.overhomesteadarea?c}<#else></#if>" />
                </div>
                <!-- 超控面积的算法 -->
                <script type = "text/javascript">
                    $(document).ready(function(){
                        $("#overhomesteadarea").val(($("#bczjdmj").val()-$("#conhomestarea").val()).toFixed(2));
                    });
                    function caculat1(){
                    	var ibczjdmj = $("#bczjdmj").val();
                    	if(ibczjdmj){
                    		$("#bczjdmjreadonly").val(ibczjdmj);
                    	}
                        $("#overhomesteadarea").val(($("#bczjdmj").val()-$("#conhomestarea").val()).toFixed(2));
                    }
                </script>
              <#--  <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>现状实测房屋建筑面积:</label>
                    <input type='text'  class='form-control input-sm  ' name='wfhbz'  value="${bean.wfhbz?default("")}" />
                </div>-->
               <#-- <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>首层建筑面积:</label>
                    <input type='text'  class='form-control input-sm  ' name='firstfloorarea'  value="${housebasic.firstfloorarea?default("")}" />
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>二层及以上建筑面积:</label>
                    <input type='text'  class='form-control input-sm  ' name='abovetwoarea'  value="${bean.abovetwoarea?default("")}" />
                </div>    
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>地下室建筑面积:</label>
                    <input type='text'  class='form-control input-sm  ' name='basement'  value="${housebasic.basement?default("")}" />
                </div>                
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>棚面积:</label>
                    <input type='text'  class='form-control input-sm  ' name='shed'  value="${housebasic.shed?default("")}" />
                </div>-->
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">宅基地认定年限:</label>
                    <select id='homesteadyear' class='form-control input-sm fl' style='width:120px;' name='homesteadyear' >  
                        <option  <#if (bean.homesteadyear?default("-1"))=='-1'>selected='selected'</#if> value="-1">请选择</option>  
                        <option  <#if (bean.homesteadyear?default("-1"))=='0'>selected='selected'</#if>  value="0">82年前</option>  
                        <option  <#if (bean.homesteadyear?default("-1"))=='1'>selected='selected'</#if> value="1">82年后</option> 
                    </select>  
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">认定房屋面积（㎡）:</label>
                    <input type='text' class='form-control input-sm  ' name='fwbcmj'  value="<#if bean.fwbcmj??>${bean.fwbcmj?c}<#else></#if>" />   
                </div>
                
                <div class=' aoJianGroup fl'>
                   <label class='fl control-label' style="width:220px;">住房困难户补偿方案:</label>
                   <input type='text' class='form-control input-sm  ' name='zfknhbcfa'  value="${bean.zfknhbcfa?default("")}" />m<sup>2</sup>
               </div>
                
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:202px;">经营用房面积:</label>
                    <input type='text' class='form-control input-sm  ' name='operatearea' value="<#if housebasic.operatearea??>${housebasic.operatearea?c}<#else></#if>"/>        
                </div>
          
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">分签单元一经营认定面积:</label>
                     <input type='text' class='form-control input-sm  ' name='operatearea1'  value="<#if bean.operatearea1??>${bean.operatearea1?c}<#else></#if>" />   
                </div>
                
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">分签单元二经营认定面积:</label>
                     <input type='text' class='form-control input-sm  ' name='operatearea2'  value="<#if bean.operatearea2??>${bean.operatearea2?c}<#else></#if>" />   
                </div>
            </div>


            <h4><span class="label label-default">4.认定人口信息：</span></h4>
            <div class='container-fluid con-bg mb10' id="div3">
<!--                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>认定人口数量:</label>
                    <input type='text' class='form-control input-sm  ' name='rdbazrk'  value="${bean.rdbazrk?default("")}" />    
                </div>-->
<!--                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>认定人口信息:</label>
                    <input type='text' class='form-control input-sm  fl' name='rdbazrkxx'   value="${bean.rdbazrkxx?default("")}"/>       
                </div>-->
                
<!--                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>父母及超生子女姓名:</label>
                    <input type='text' class='form-control input-sm  fl' name='parentnames'   value="${bean.parentnames?default("")}"/>       
                </div>-->
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">认定住房困难:</label>
                     <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='hardhouse' >  
                        <option  <#if (bean.hardhouse?default("-1"))=='-1'>selected='selected'</#if> value="-1">请选择</option>  
                        <option  <#if (bean.hardhouse?default("-1"))=='0'>selected='selected'</#if>  value="0">是</option>  
                        <option  <#if (bean.hardhouse?default("-1"))=='1'>selected='selected'</#if> value="1">否</option> 
                    </select>        
                </div>
                <#--<div class=' aoJianGroup fl'>
                    <label class='fl control-label'>被腾退家庭购房标准:</label>
                    <input type='text' class='form-control input-sm  fl' name='gfbz'   value="${bean.gfbz?default("")}"/>  
                     <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='gfbz' >  
                        <option  <#if (bean.gfbz?default("-1"))=='-1'>selected='selected'</#if> value="-1">请选择</option>  
                        <option  <#if (bean.gfbz?default("-1"))=='0'>selected='selected'</#if>  value="0">50m<sup>2</sup></option>  
                        <option  <#if (bean.gfbz?default("-1"))=='1'>selected='selected'</#if> value="1">45m<sup>2</sup></option> 
                    </select>        
                </div>-->
            <div class=' aoJianGroup fl'>
                <label class='fl control-label' style="width:220px;">购房标准(50m<sup>2</sup>)(非超生人数):</label>
                <input type='text' class='form-control input-sm  fl' name='gfbz50'   value="${bean.gfbz50?default("")}"/>人
            </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">购房标准(45m<sup>2</sup>)(超生人数):</label>
                    <input type='text' class='form-control input-sm  fl' name='gfbz45'   value="${bean.gfbz45?default("")}"/>人
                </div>
            </div>    

            <h4><span class="label label-default">5.评估数据：</span></h4>
            <div class='container-fluid con-bg mb10' id="div4">
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">评估方:</label>
                   <!-- <input type='text' class='form-control input-sm  ' name='pgjg'  readonly title='<#if housebasic.section??><#if housebasic.section == '1' >北京兴庆房地产土地评估有限公司<#elseif housebasic.section == '2' >北京中建华房地产土地评估有限责任公司<#elseif housebasic.section == '3' >北京龙泰房地产评估有限责任公司<#elseif housebasic.section == '4' >北京大地盛业房地产土地评估有限公司<#elseif housebasic.section == '5' >北京建亚恒泰房地产评估有限公司<#elseif housebasic.section == '6' >北京奥隆房地产评估有限责任公司<#elseif housebasic.section == '7' >北京中资房地产土地评估有限公司</#if><#else>请输入评估方名称</#if>' 
                           value="<#if housebasic.section??><#if housebasic.section == '1' >北京兴庆房地产土地评估有限公司<#elseif housebasic.section == '2' >北京中建华房地产土地评估有限责任公司<#elseif housebasic.section == '3' >北京龙泰房地产评估有限责任公司<#elseif housebasic.section == '4' >北京大地盛业房地产土地评估有限公司<#elseif housebasic.section == '5' >北京建亚恒泰房地产评估有限公司<#elseif housebasic.section == '6' >北京奥隆房地产评估有限责任公司<#elseif housebasic.section == '7' >北京中资房地产土地评估有限公司</#if><#else>请输入评估方名称</#if>" />  
                   -->
                    <input type='text' class='form-control input-sm  ' name='pgjg'  readonly title='<#if housebasic.section??><#if housebasic.section == '8' >北京华信房地产评估有限公司<#elseif housebasic.section == '9' >北京仁达房地产评估有限公司<#elseif housebasic.section == '10' >中财宝信(北京)房地产土地评估有限公司</#if><#else>请输入评估方名称</#if>' 
                           value="<#if housebasic.section??><#if housebasic.section == '8' >北京华信房地产评估有限公司<#elseif housebasic.section == '9' >北京仁达房地产评估有限公司<#elseif housebasic.section == '10' >中财宝信(北京)房地产土地评估有限公司</#if><#else>请输入评估方名称</#if>" />  
                             
                   
                </div>
                <!--<div class=' aoJianGroup fl' >
                    <label class='fl control-label' style="150px !important">是否满足不足200平米补助200平米:</label>
                     <select id='bzbzmj' class='form-control input-sm fl' style='width:120px;' name='bzbzmj' >  
                        <option  <#if (bean.bzbzmj?default("-1"))=='1'>selected='selected'</#if>  value="1">是</option>  
                        <option  <#if (bean.bzbzmj?default("-1"))=='0'>selected='selected'</#if> value="0">否</option> 
                    </select>        
                </div>-->
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">补偿宅基地面积（㎡）:</label>
                    <input type='text' class='form-control input-sm  ' readonly id='bczjdmjreadonly'   value="<#if bean.bczjdmj??>${bean.bczjdmj?c}</#if>" />    
                </div>
                <div class=' aoJianGroup fl'> 
                    <label class='fl control-label' style="width:220px;">控制面积区位单价(元):</label>
                    <input  type='text' class='form-control input-sm  ' id="kzmjqwbcdj" name='kzmjqwbcdj' readonly  value="${bean.kzmjqwbcdj?c}"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">超控面积区位单价(元):</label>
                    <input id="ckmjqwbcdj" type='text' class='form-control input-sm ' readonly  name='ckmjqwbcdj'   
                    value="${bean.ckmjqwbcdj?c}"/>      
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">控制宅基地区位价(元):</label>
                    <input type='text' class='form-control input-sm  ' id='kzzjdqwbcj' name='kzzjdqwbcj'   value="<#if bean.kzzjdqwbcj??>${bean.kzzjdqwbcj?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">超控宅基地区位价(元):</label>
                    <input type='text' class='form-control input-sm  ' id="ckzjdqwbcj" name='ckzjdqwbcj'   value="<#if bean.ckzjdqwbcj??>${bean.ckzjdqwbcj?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">房屋价款(元):</label>
                    <input type='text' class='form-control input-sm  ' id="bttfwczcxj"  name='bttfwczcxj'   value="<#if bean.bttfwczcxj??>${bean.bttfwczcxj?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">装修设备附属物价款(元):</label>
                    <input type='text' class='form-control input-sm  ' id="zxsbfswjk" name='zxsbfswjk'   value="<#if bean.zxsbfswjk??>${bean.zxsbfswjk?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">宅基地腾退补偿款(合计)(元):</label>
                    <input type='text' class='form-control input-sm  ' readonly id="zjdttbck" name='zjdttbck'   value="<#if bean.zjdttbck??>${bean.zjdttbck?c}<#else></#if>"/>       
                </div>                                              
            </div>  
            <h4><span class="label label-default">6.奖励费 补助费(元)：</span></h4>
            <div class='container-fluid con-bg mb10' id="div5">
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">提前搬家奖(元):</label>
                    <input type='text' class='form-control input-sm input_jl input_hj' name='tqbjl' readonly  value="<#if bean.tqbjl??>${bean.tqbjl?c}<#else>5000</#if>" />  
                </div>            
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">工程配合奖(元):</label>
                    <input type='text' class='form-control input-sm  input_jl input_hj' name='gcphjl' readonly value="<#if bean.gcphjl??>${bean.gcphjl?c}<#else>100000</#if>" />   
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">腾退促进奖(元):</label>
                    <input type='text' class='form-control input-sm  input_jl input_hj' name='ttcjjl' readonly  value="<#if bean.ttcjjl??>${bean.ttcjjl?c}<#else>50000</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">棚改支持签约奖励（元）:</label>
                    <input type='text'  class='form-control input-sm input_jl input_hj' name='pgzcqyjl'   value="<#if bean.pgzcqyjl??>${bean.pgzcqyjl?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">无违章奖励费(元):</label>
                    <input type='text' class='form-control input-sm  input_jl input_hj' name='wwzjl'   value="<#if bean.wwzjl??>${bean.wwzjl?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">未建二层及地下室奖励(元):</label>
                    <input type='text' class='form-control input-sm  input_jl input_hj' name='wjecjj'   value="<#if bean.wjecjj??>${bean.wjecjj?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">未经批准已建二层补助(元):</label>
                    <input type='text' class='form-control input-sm  input_jl input_hj' name='wjpzyjecbz'   value="<#if bean.wjpzyjecbz??>${bean.wjpzyjecbz?c}<#else>0</#if>"/>       
                </div> 
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">搬家及家电迁移补助(元):</label>
                    <input type='text' class='form-control input-sm  input_jl input_hj' name='bjbz' readonly  value="<#if bean.bjbz??>${bean.bjbz?c}<#else>12000</#if>"/>       
                </div>    
                <div class=' aoJianGroup fl azxy'>      
                    <label class='fl control-label' style="width:220px;">期房补助费(元):</label>
                    <input type='text' id="input-qfbz"  class='form-control input-sm input_hj'  name='qfbz'    value="<#if bean.qfbz??>${bean.qfbz?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">大病补助(元):</label>
                    <input type='text' class='form-control input-sm  input_jl input_hj' name='dbbz'   value="<#if bean.dbbz??>${bean.dbbz?c}<#else>0</#if>"/>       
                </div>    
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">残疾补助(元):</label>
                    <input type='text' class='form-control input-sm  input_jl input_hj' name='cjbz'   value="<#if bean.cjbz??>${bean.cjbz?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">低保户补助(元):</label>
                    <input type='text' class='form-control input-sm  input_jl input_hj' name='dbhbz'   value="<#if bean.dbhbz??>${bean.dbhbz?c}<#else>0</#if>"/>       
                </div>   
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">独生子女奖励费(元):</label>
                    <input type='text' class='form-control input-sm  input_jl input_hj' name='dsznbz'   value="<#if bean.dsznbz??>${bean.dsznbz?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">一次性停产停业补助费(元):</label>
                    <input type='text' class='form-control input-sm  input_jl input_hj' name='tctdbz'   value="<#if bean.tctdbz??>${bean.tctdbz?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">周转补助费(元):</label>
                    <input type='text' id='inputzzbz' readonly class='form-control input-sm  input_jl input_hj' name='zzbz'   value="<#if bean.zzbz??>${bean.zzbz?c}<#else>0</#if>"/>       
                </div>  
<!--                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>其他补助费:</label>
                    <input type='text' class='form-control input-sm' name='otherbz'   value="<#if bean.otherbz??>${bean.otherbz?c}<#else></#if>"/>       
                </div>-->
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">滴水补助费(元):</label>
                    <input type='text' class='form-control input-sm input_jl input_hj' name='dsbzf'   value="<#if bean.dsbzf??>${bean.dsbzf?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">信鸽补助费(元):</label>
                    <input type='text' class='form-control input-sm input_jl input_hj' name='xgbzf'   value="<#if bean.xgbzf??>${bean.xgbzf?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">宅基地应批未批补助(元):</label>
                    <input type='text' class='form-control input-sm input_jl input_hj' name='zjdypwpbz'   value="<#if bean.zjdypwpbz??>${bean.zjdypwpbz?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl azxy'>      
                    <label class='fl control-label' style="width:220px;">优惠指标未选满补偿(元):</label>
                    <input type='text' id="input_yhzbwxmbc" class='form-control input-sm input_hj' name='yhzbwxmbc'   value="<#if bean.yhzbwxmbc??>${bean.yhzbwxmbc?c}<#else>0</#if>"/>       
                </div>
      
                <div class='container-fluid con-bg mb10'>
                    <div class=' aoJianGroup fl'>      
                        <label class='fl control-label' style="width:220px;">合计(元):</label>
                        <input id="jlhj" type='text' class='form-control input-sm  ' name='jlfsum' readonly  value="<#if bean.jlfsum??>${bean.jlfsum?c}<#else>0</#if>"/>       
                    </div>   
                </div>                                                                                                                                 
            </div> 
            <h4><span class="label label-default azxy">7.初步选房意向：</span></h4>
            <div class='container-fluid con-bg mb10 azxy' id="div6">
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">安置房源:</label>
                    <input type='text' class='form-control input-sm  ' name='fyxx'  value="${bean.fyxx?default("")}" />    
                </div>            
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">一居室(55m<sup>2</sup>)（套）  :</label>
                    <input type='text' class='form-control input-sm  calc' area=55 name='yjs'  value="${bean.yjs?default("0")}" />  
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">二居室（70m<sup>2</sup>）（套）:</label>
                    <input type='text' class='form-control input-sm  calc' area=70 name='ljs70'   value="${bean.ljs70?default("0")}"/>  
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">二居室（75m<sup>2</sup>）（套）:</label>
                    <input type='text' class='form-control input-sm  calc' area=75 name='ljs75'   value="${bean.ljs75?default("0")}"/>     
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">二居室（80m<sup>2</sup>）（套）:</label>
                    <input type='text' class='form-control input-sm  calc' area=80 name='ljs80'   value="${bean.ljs80?default("0")}"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">二居室（85m<sup>2</sup>）（套）:</label>
                    <input type='text' class='form-control input-sm  calc'  area=85 name='ljs85'   value="${bean.ljs85?default("0")}"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">三居室（110m<sup>2</sup>）（套） :</label>
                    <input type='text' class='form-control input-sm  calc' area=110 name='sjs'   value="${bean.sjs?default("0")}"/>      
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">实际选房套数（套）:</label>
                    <input id="xfts" type='text' class='form-control input-sm  ' name='xfts' readonly  value="${bean.xfts?default("0")}"/>      
                </div> 
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">应选面积（㎡）:</label>
                    <input type='text' id="input_yxmj" class='form-control input-sm  ' name='yxmj'   value="<#if bean.yxmj??>${bean.yxmj?c}<#else></#if>"/>       
                </div>
              <#-- 	<div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>控制可选面积（㎡）:</label>
                    <input type='text' id="kzkxmj" class='form-control input-sm  ' readonly  value="<#if bean.yxmj??>${(bean.yxmj?c)?number+30}<#else></#if>"/>       
                </div> -->

                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">实际选房面积（㎡）:</label>
                    <input id="sjxfmj" type='text' class='form-control input-sm  ' name='sjxfmj' readonly  value="<#if bean.sjxfmj??>${bean.sjxfmj?c}<#else></#if>"/>       
                </div>  
                 <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">指标内面积（㎡）(4000元/㎡):</label>
                    <input  type='text' id = "input_zbnmj" class='form-control input-sm  ' name='zbnmj'   value="<#if bean.zbnmj??>${bean.zbnmj?c}<#else></#if>"/>     
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">超指标面积（㎡）(6000元/㎡):</label>
                    <input type='text' id="input_czbmj" class='form-control input-sm  ' name='czbmj'   value="<#if bean.czbmj??>${bean.czbmj?c}<#else></#if>"/>       
                </div>  
             <#--   <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>是否超生:</label>
                    <select id='sel_sfcs' class='form-control input-sm fl' style='width:120px;' name='sfcs' >  
                        <option  <#if (bean.sfcs?default("-1"))=='1'>selected='selected'</#if>  value="1">是</option>  
                        <option  <#if (bean.sfcs?default("-1"))=='0'>selected='selected'</#if> value="0">否</option> 
                    </select>        
                </div>  -->                
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">指标内购房款(元):</label>
                    <input id="zbngfk" type='text' class='form-control input-sm  ' name='zbngfk' readonly <#if (bean.sfcs?default("-1"))=='0'></#if>  value="<#if bean.zbngfk??>${bean.zbngfk?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">指标外购房款(元):</label>
                    <input id="zbwgfk" type='text' class='form-control input-sm  ' name='zbwgfk' readonly <#if (bean.sfcs?default("-1"))=='0'></#if>  value="<#if bean.zbwgfk??>${bean.zbwgfk?c}<#else>0</#if>"/>       
                </div>                   
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label' style="width:220px;">购房款(元):</label>
                    <input id="azfgfk" type='text' class='form-control input-sm  ' name='azfgfk' readonly  value="<#if bean.azfgfk??>${bean.azfgfk?c}<#else>0</#if>"/>       
                </div>                             
            </div>               
            <h4><span class="label label-default div_eight">8.评估款，补偿补助及奖励费合计(元)：</span></h4>
            <div class='container-fluid con-bg mb10' id="div8">
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label' style="width:220px;">腾退补偿款总价(元):</label>
                    <input type='text' id="zjdttzj" class='form-control input-sm  ' readonly name='zjdttzj'  value="<#if bean.zjdttzj??>${bean.zjdttzj?c}<#else>0</#if>" />    
                </div>
                <div class=' aoJianGroup fl azxy'>      
                    <label class='fl control-label' style="width:220px;">结算后款(元):</label>
                    <input id="jshk" type='text' class='form-control input-sm  ' name='jshk'  readonly value="<#if bean.jshk??>${bean.jshk?c}<#else>0</#if>"/>       
                </div>
            </div>              
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary btn-save"   >保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </form>
</div>

<script type = "text/javascript">

//权限锁定部分逻辑
	$(function(){ 
		if('${role.roleAuthority[43]}'!='2'){
			$("#div1 input").attr("readonly",true);
			$("#div1 select").attr("readonly",true);
			$("#div1 button").attr("readonly",true);
		} 
 		if('${role.roleAuthority[44]}'!='2'){
			$("#div2 input").attr("readonly",true);
			$("#div2 select").attr("readonly",true);
			$("#div2 button").attr("readonly",true);
		} 
		if('${role.roleAuthority[45]}'!='2'){
			$("#div3 input").attr("readonly",true);
			$("#div3 select").attr("readonly",true);
			$("#div3 button").attr("readonly",true);
		} 
		if('${role.roleAuthority[46]}'!='2'){
			$("#div4 input").attr("readonly",true);
			$("#div4 select").attr("readonly",true);
			$("#div4 button").attr("readonly",true);
		} 
		if('${role.roleAuthority[47]}'!='2'){
			$("#div5 input").attr("readonly",true);
			$("#div5 select").attr("readonly",true);
			$("#div5 button").attr("readonly",true);
		} 
		if('${role.roleAuthority[48]}'!='2'){
			$("#div6 input").attr("readonly",true);
			$("#div6 select").attr("readonly",true);
			$("#div6 button").attr("readonly",true);
		} 
		if('${role.roleAuthority[49]}'!='2'){
			$("#div7 input").attr("readonly",true);
			$("#div7 select").attr("readonly",true);
			$("#div7 button").attr("readonly",true);
		} 
		if('${role.roleAuthority[50]}'!='2'){
			$("#div8 input").attr("readonly",true);
			$("#div8 select").attr("readonly",true);
			$("#div8 button").attr("readonly",true);
		} 
		var selectedvalue = '${bean.atype}';
		if(selectedvalue==='1'){
		    var people = ${housebasic.people};
            if(people){
            var money = parseFloat(people)*6000;
            	$("#inputzzbz").val(money);
           }
		}
		else{
		    var people = ${housebasic.people};
            if(people){
            var money = parseFloat(people)*1500*40;
            	$("#inputzzbz").val(money);
           }
           }
		
			
	})  
	
//设置模态框高度和宽度  
    $("#fhfa-edit-con").css("height", ($(window).height() - 150) + "px");
    $("#fhfa-edit-con").css("overflow-y", "scroll");
    
    //
     $("input[name=atype]").click(function () {
        var $selectedvalue = $("input[name='atype']:checked").val();
    	var p1=$("#homesteadyear").children('option:selected').val();
		if(p1 == '0'){
			if($selectedvalue == '0'){
				$("#kzmjqwbcdj").val(6000);
				$("#ckmjqwbcdj").val(3000);
			}else{
				$("#kzmjqwbcdj").val(26588);
				$("#ckmjqwbcdj").val(13294);
			}
		}else if(p1 == '1'){
			if($selectedvalue == '0'){
				$("#kzmjqwbcdj").val(6000);
				$("#ckmjqwbcdj").val(1800);
			}else{
				$("#kzmjqwbcdj").val(26588);
				$("#ckmjqwbcdj").val(7976.4);
			}
		}else{
			$("#ckmjqwbcdj").val("");
		};
        
        if ($selectedvalue === '1') {
            $(".azxy").hide();
           	$(".azxy input[type='text']").attr("disabled","disabled");
            $(".div_eight").html("7.评估款，补偿补助及奖励费合计：");
              var people = ${housebasic.people};
              if(people){
                var money = parseFloat(people)*6000;
            	$("#inputzzbz").val(money);
           }
        }
        else {
            $(".azxy").show();
            $(".azxy input[type='text']").removeAttr("disabled");
            $(".div_eight").html("8.评估款，补偿补助及奖励费合计：");
            var people = ${housebasic.people};
            if(people){
                var money = parseInt(people)*1500*40;
              
            	$("#inputzzbz").val(money);
            }
        }
        
		var sum = 0.00;
		$('.input_jl').each(function (index,domEle){
			var text = $(domEle).val();
			if(text){
				sum = sum+parseFloat(text);
			}
		});
		var qfbz = $("#input-qfbz").val();
		var inputyhzbwxmbc = $("#input_yhzbwxmbc").val();
		if(qfbz){
   			var $selectedvalue = $("input[name='atype']:checked").val();
	        if ($selectedvalue === '0') {
				sum = sum+parseFloat(qfbz);
	        }
		}
		if(inputyhzbwxmbc){
			var $selectedvalue = $("input[name='atype']:checked").val();
	        if ($selectedvalue === '0') {
				sum = sum+parseFloat(inputyhzbwxmbc);
	        }
		}
		$("#jlhj").val(sum.toFixed(2));
		var temp = (parseFloat($("#zjdttbck").val())+sum).toFixed(2);
		$("#zjdttzj").val(temp);
		//var temp1 = parseFloat($("#azfgfk").val());
		//$("#jshk").val((temp-temp1).toFixed(2));
   			
   		
     });



//TODO
    function saveClick(btn) {
        var dataInfo = $("#rhjcAddForm").serialize();
        var url = $(btn - save).attr("data-url");
        $.ajax({
            type: "POST",
            url: url,
            dataType: "json",
            data: dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            },
            success: function (response) {
                var bean = response.bean;
                addAoJianInfo(bean);
                //初始化日期控件
                initDate();
            }
        })
    }

    function addlist(a) {
        var h = $(a + "").html();
        $(a + "").after("<tr>" + h + "</tr>" + "");
    }

    $(document).ready(function () {
        var b = '${bean.atype!''}';
        if (b.length == 0) {

        } else {
            if (b == '1') {
                $(".azxy").hide();
                $(".azxy input[type='text']").attr("disabled","disabled");
                $(".div_eight").html("7.评估款，补偿补助及奖励费合计：");
            }
            else {
                $(".azxy").show();
                $(".azxy input[type='text']").removeAttr("disabled");
                $(".div_eight").html("8.评估款，补偿补助及奖励费合计：");
            }
        }
    });
    
   $(function(){
             
       
       $("#input_yxmj").change(function(){
   			var value = $("#input_yxmj").val()
   			if(value){
   				var n = parseFloat(value);
   				n = n + 30;
   				$("#kzkxmj").val(n);
   			}
   			
   		});

   		
   		$("#homesteadyear").change(function(){
			var p1=$(this).children('option:selected').val();
			var $selectedvalue = $("input[name='atype']:checked").val();
			if(p1 == '0'){
				if($selectedvalue == '0'){
					$("#kzmjqwbcdj").val(6000);
					$("#ckmjqwbcdj").val(3000);
				}else{
					$("#kzmjqwbcdj").val(26588);
					$("#ckmjqwbcdj").val(13294);
				}
			}else if(p1 == '1'){
				if($selectedvalue == '0'){
					$("#kzmjqwbcdj").val(6000);
					$("#ckmjqwbcdj").val(1800);
				}else{
					$("#kzmjqwbcdj").val(26588);
					$("#ckmjqwbcdj").val(7976.4);
				}
			}else{
				$("#ckmjqwbcdj").val("");
			};
   		});
   		
   		//指标购房款
   		//指标购房款
   	    $("#input_zbnmj,#input_czbmj").change(function(){
	   		var zbngfk=parseFloat($("#input_zbnmj").val())*4000;
	        var a=$("#input_czbmj").val();
	        $("#zbngfk").val(zbngfk);
	        if(a==""||a==undefined||a==null){
	        	$("#zbwgfk").val("0");
	        }else{        
	        	var zbwgfk=parseFloat($("#input_czbmj").val())*6000;
	        	$("#zbwgfk").val(zbwgfk);
	        }
	        var temp = (parseFloat($("#zbngfk").val())+parseFloat($("#zbwgfk").val())).toFixed(0);
	       	$("#azfgfk").val(temp);
   		});
                
        //宅基地腾退补偿款计算
        $("#zjdttbck").val(((parseFloat($("#kzzjdqwbcj").val()))+parseFloat($("#ckzjdqwbcj").val())+parseFloat($("#bttfwczcxj").val())+parseFloat($("#zxsbfswjk").val())).toFixed(2));
        $("#kzzjdqwbcj,#ckzjdqwbcj,#bttfwczcxj,#zxsbfswjk").change(function(){
        	var subsum = ((parseFloat($("#kzzjdqwbcj").val()))+parseFloat($("#ckzjdqwbcj").val())+parseFloat($("#bttfwczcxj").val())+parseFloat($("#zxsbfswjk").val())).toFixed(2);
       		$("#zjdttbck").val(subsum);
       		var hj = $("#jlhj").val();
       		var temp = parseFloat(subsum)+ parseFloat(hj);
       		$("#zjdttzj").val(temp.toFixed(2));
   		});
        $("#zbngfk,#zbwgfk").change(function(){
        	var temp = (parseFloat($("#zbngfk").val())+parseFloat($("#zbwgfk").val())).toFixed(2);
       		$("#azfgfk").val(temp);
       //	var qfbz=parseFloat($("#azfgfk").val())*0.1;
       	//	$("#input-qfbz").val(qfbz).toFixed(2);-->
       		var temp1 = parseFloat($("#zjdttzj").val());
       		//$("#jshk").val((temp1-temp).toFixed(2));
   		});
   		        
   		$("#zjdttzj").change(function(){
        	var temp = (parseFloat($("#zjdttzj").val())-parseFloat($("#azfgfk").val())).toFixed(2);
       		//$("#jshk").val(temp);
   		});  
   			
   		//zjdttbck   jlfsum  zjdttzj     jshk =  zjdttzj  - azfgfk
   		$("#zjdttbck,#jlfsum").change(function(){
       		$("#zjdttzj").val((parseFloat($("#zjdttbck").val())+parseFloat($("#jlfsum").val())).toFixed(2));
   		});  
 
   		
   		$(".input_hj").change(function(){
   			var sum = 0.00;
   			$('.input_jl').each(function (index,domEle){
   				var text = $(domEle).val();
   				if(text){
   					sum = sum+parseFloat(text);
   				}
   			});
   			var qfbz = $("#input-qfbz").val();
   			var inputyhzbwxmbc = $("#input_yhzbwxmbc").val();
   			if(qfbz){
	   			var $selectedvalue = $("input[name='atype']:checked").val();
		        if ($selectedvalue === '0') {
   					sum = sum+parseFloat(qfbz);
		        }
   			}
   			if(inputyhzbwxmbc){
   				var $selectedvalue = $("input[name='atype']:checked").val();
		        if ($selectedvalue === '0') {
   					sum = sum+parseFloat(inputyhzbwxmbc);
		        }
   			}
   			$("#jlhj").val(sum.toFixed(2));
   			var temp = (parseFloat($("#zjdttbck").val())+sum).toFixed(2);
   			$("#zjdttzj").val(temp);
   			//var temp1 = parseFloat($("#azfgfk").val());
   			//$("#jshk").val((temp-temp1).toFixed(2));
   			
   		});
   
   		//房屋件数和房屋面积计算代码
		$(".calc").change(function(){
			var text = $(this).val();
			var count = 0;
			var area = 0;
			$('.calc').each(function (index,domEle){
				var ecount = $(domEle).val();
				var earea = $(domEle).attr("area");
				if(ecount == ""){
				}else{
					count = count+parseInt(ecount);
					area = area + earea*ecount;
				}
			});
			$("#xfts").val(count);
			$("#sjxfmj").val(area);
		});
                
                //计算总价
               
   });

</script>