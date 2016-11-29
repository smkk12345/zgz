
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">房屋征收安置补偿方案信息登记单（基本情况，房屋信息，部分补助信息是从入户信息中提取，如有调整，请到入户信息管理中修改）</h4>
</div>
<div class="modal-body rhjc-add-con" id="fhfa-edit-con">
    <form id='rhjcAddForm' modelAttribute = "Agreement" action="${BASE_PATH}/pgzq/saveAgreenment.action"
          accept-charset="UTF-8" method="post">

        <input type="hidden" class='form-control input-sm ' name='aid' value="${bean.id?default("")}" style="width: 0px;"/>
        <input type="hidden" class='form-control input-sm ' name='housebasicid' value="${housebasic.id?default("")}" style="width: 0px;"/>
 		<input type="hidden" class='form-control input-sm ' name='protocolnumber' value="${bean.protocolnumber?default("")}" style="width: 0px;"/>
 		<input type="hidden" class='form-control input-sm ' name='zxsbfsw' value="<#if bean.zxsbfsw??>${bean.zxsbfsw?c}<#else></#if>" style="width: 0px;"/>
 		<input type="hidden" class='form-control input-sm ' name='fwjk' value="<#if bean.fwjk??>${bean.fwjk?c}<#else></#if>" style="width: 0px;"/>
        <div class='ml15' >
            <h4><span class="label label-default">一.基本情况：</span></h4>
            <div class='container-fluid con-bg mb10' id="div1">
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>被腾退人姓名:</label>
                    <input type='text'  class='form-control input-sm  ' name='names' value="${housebasic.names?default("")}"/>
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>房屋坐落:</label>
                    <input type='text'  class='form-control input-sm  ' name='location' value="${housebasic.location?default("")}"/>
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>联系固话:</label>

                    <input type='text'  class='form-control input-sm  ' name='telephone' value="${housebasic.telephone?default("")}"/>
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>手机:</label>
                    <input type='text'  class='form-control input-sm fl dmDate' name='mobile' value="${housebasic.mobile?default("")}"/>
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>被腾退人身份证号:</label>
                    <input type='text'  class='form-control input-sm fl dmDate' name='idcard' value="${housebasic.idcard?default("")}" title='${housebasic.idcard?default("")}'/>
                </div>               
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>安置意向:</label>
                </div> 
                <div class="container-fluid fl">
                    <label class="checkbox-inline">
                        <input type="radio" name="atype" id="optionsRadios3" value="0" <#if (bean.atype?default("0"))=='0'>checked</#if>>房屋安置
                    </label>
                    <label class="checkbox-inline">
                        <input type="radio" name="atype" id="optionsRadios4" value="1" <#if (bean.atype?default("0"))=='1'>checked</#if>>货币补偿
                    </label>
                </div>
            </div>                	
            <h4><span class="label label-default">二.认定面积信息：</span></h4>
            <div class='container-fluid con-bg mb10' id="div2">
               <#-- <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>宅基地实测用地面积:</label>
                    <input type='text'  class='form-control input-sm  ' name='scydmj'  value="<#if bean.scydmj??>${bean.scydmj?c}<#else></#if>" />
                </div>-->
                   <div class=' aoJianGroup fl'>
                       <label class='fl control-label'>认定宅基地面积:</label>
                       <input type='text' id="rdzjdallarea" onchange="caculat1()"  class='form-control input-sm' name='rdzjdallarea'  value="${bean.rdzjdallarea?default("")}" />
                   </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>宅基地控制面积:</label>
                    <input type='text' id="conhomestarea" onchange="caculat1()"  class='form-control input-sm  ' name='conhomestarea'  value="<#if bean.conhomestarea??>${bean.conhomestarea?c}<#else></#if>" />
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>超出宅基地控制面积:</label>
                    <input type='text' id="overhomesteadarea" readonly  class='form-control input-sm  ' name='overhomesteadarea'  value="<#if bean.overhomesteadarea??>${bean.overhomesteadarea?c}<#else></#if>" />
                </div>
                <script type = "text/javascript">
                    $(document).ready(function(){
                        $("#overhomesteadarea").val(($("#rdzjdallarea").val()-$("#conhomestarea").val()).toFixed(2));
                    });
                    function caculat1(){
                        $("#overhomesteadarea").val(($("#rdzjdallarea").val()-$("#conhomestarea").val()).toFixed(2));
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
                    <label class='fl control-label'>宅基地认定年限:</label>
                    <select id='homesteadyear' class='form-control input-sm fl' style='width:120px;' name='homesteadyear' >  
                        <option  <#if (bean.homesteadyear?default("-1"))=='-1'>selected='selected'</#if> value="-1">请选择</option>  
                        <option  <#if (bean.homesteadyear?default("-1"))=='0'>selected='selected'</#if>  value="0">82年前</option>  
                        <option  <#if (bean.homesteadyear?default("-1"))=='1'>selected='selected'</#if> value="1">82年后</option> 
                    </select>  
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>认定房屋补偿面积:</label>
                    <input type='text' class='form-control input-sm  ' name='fwbcmj'  value="${bean.fwbcmj?default("")}" />   
                </div>
                   <div class=' aoJianGroup fl'>
                       <label class='fl control-label'>住房困难户补偿方案:</label>
                       <input type='text' class='form-control input-sm  ' name='zfknhbcfa'  value="${bean.zfknhbcfa?default("")}" />m<sup>2</sup>
                   </div>
            </div>


            <h4><span class="label label-default">三.认定人口信息：</span></h4>
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
                    <label class='fl control-label'>认定住房困难:</label>
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
                <label class='fl control-label'>购房标准(50m<sup>2</sup>):</label>
                <input type='text' class='form-control input-sm  fl' name='gfbz50'   value="${bean.gfbz50?default("")}"/>人
            </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>购房标准(45m<sup>2</sup>):</label>
                    <input type='text' class='form-control input-sm  fl' name='gfbz45'   value="${bean.gfbz45?default("")}"/>人
                </div>
            </div>    

            <h4><span class="label label-default">四.宅基地腾退补偿款：</span></h4>
            <div class='container-fluid con-bg mb10' id="div4">
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>评估方:</label>
                    <input type='text' class='form-control input-sm  ' name='pgjg'  readonly title='<#if housebasic.section??><#if housebasic.section == '1' >北京兴庆房地产土地评估有限公司<#elseif housebasic.section == '2' >北京中建华房地产土地评估有限责任公司<#elseif housebasic.section == '3' >北京龙泰房地产评估有限责任公司<#elseif housebasic.section == '4' >北京大地盛业房地产土地评估有限公司<#elseif housebasic.section == '5' >北京建亚恒泰房地产评估有限公司<#elseif housebasic.section == '6' >北京奥隆房地产评估有限责任公司<#elseif housebasic.section == '7' >北京中资房地产土地评估有限公司</#if><#else>请输入评估方名称</#if>' 
                           value="<#if housebasic.section??><#if housebasic.section == '1' >北京兴庆房地产土地评估有限公司<#elseif housebasic.section == '2' >北京中建华房地产土地评估有限责任公司<#elseif housebasic.section == '3' >北京龙泰房地产评估有限责任公司<#elseif housebasic.section == '4' >北京大地盛业房地产土地评估有限公司<#elseif housebasic.section == '5' >北京建亚恒泰房地产评估有限公司<#elseif housebasic.section == '6' >北京奥隆房地产评估有限责任公司<#elseif housebasic.section == '7' >北京中资房地产土地评估有限公司</#if><#else>请输入评估方名称</#if>" />  
                </div>
                <!--<div class=' aoJianGroup fl' >
                    <label class='fl control-label' style="150px !important">是否满足不足200平米补助200平米:</label>
                     <select id='bzbzmj' class='form-control input-sm fl' style='width:120px;' name='bzbzmj' >  
                        <option  <#if (bean.bzbzmj?default("-1"))=='1'>selected='selected'</#if>  value="1">是</option>  
                        <option  <#if (bean.bzbzmj?default("-1"))=='0'>selected='selected'</#if> value="0">否</option> 
                    </select>        
                </div>-->
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>补偿宅基地面积:</label>
                    <input type='text' class='form-control input-sm  ' name='bczjdmj'  value="<#if bean.bczjdmj??>${bean.bczjdmj?c}</#if>" />    
                </div>
                <div class=' aoJianGroup fl'> 
                    <label class='fl control-label'>控制面积区位补偿单价:</label>
                    <input type='text' class='form-control input-sm  ' id="kzmjqwbcdj" name='kzmjqwbcdj' disabled="disabled"  value="6000"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>超控面积区位补偿单价:</label>
                    <input id="ckmjqwbcdj" type='text' class='form-control input-sm ' disabled="disabled"  name='ckmjqwbcdj'   
                    value="<#if (bean.homesteadyear?default("-1"))=='0'>3000<#elseif bean.homesteadyear?default("-1")=='1'>1800<#else></#if>"/>      
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>控制宅基地区位补偿价:</label>
                    <input type='text' class='form-control input-sm  ' id='kzzjdqwbcj' name='kzzjdqwbcj'   value="<#if bean.kzzjdqwbcj??>${bean.kzzjdqwbcj?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>超控宅基地区位补偿价:</label>
                    <input type='text' class='form-control input-sm  ' id="ckzjdqwbcj" name='ckzjdqwbcj'   value="<#if bean.ckzjdqwbcj??>${bean.ckzjdqwbcj?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>房屋价款:</label>
                    <input type='text' class='form-control input-sm  ' id="bttfwczcxj"  name='bttfwczcxj'   value="<#if bean.bttfwczcxj??>${bean.bttfwczcxj?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>装修设备附属物价款:</label>
                    <input type='text' class='form-control input-sm  ' id="zxsbfswjk" name='zxsbfswjk'   value="<#if bean.zxsbfswjk??>${bean.zxsbfswjk?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>宅基地腾退补偿款(合计):</label>
                    <input type='text' class='form-control input-sm  ' readonly id="zjdttbck" name='zjdttbck'   value="<#if bean.zjdttbck??>${bean.zjdttbck?c}<#else></#if>"/>       
                </div>                                              
            </div>  
            <h4><span class="label label-default">五.奖励费 补助费：</span></h4>
            <div class='container-fluid con-bg mb10' id="div5">
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>提前搬家奖:</label>
                    <input type='text' class='form-control input-sm input_jl' name='tqbjl' readonly  value="<#if bean.tqbjl??>${bean.tqbjl?c}<#else>5000</#if>" />  
                </div>            
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>工程配合奖:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='gcphjl' readonly value="<#if bean.gcphjl??>${bean.gcphjl?c}<#else>100000</#if>" />   
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>腾退促进奖:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='ttcjjl' readonly  value="<#if bean.ttcjjl??>${bean.ttcjjl?c}<#else>50000</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>无违章奖励费:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='wwzjl'   value="<#if bean.wwzjl??>${bean.wwzjl?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>未建二层及地下室奖励:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='wjecjj'   value="<#if bean.wjecjj??>${bean.wjecjj?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>未经批准已建二层补助:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='wjpzyjecbz'   value="<#if bean.wjpzyjecbz??>${bean.wjpzyjecbz?c}<#else>0</#if>"/>       
                </div> 
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>搬家及家电迁移补助:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='bjbz' readonly  value="<#if bean.bjbz??>${bean.bjbz?c}<#else>12000</#if>"/>       
                </div>    
                <div class=' aoJianGroup fl azxy'>      
                    <label class='fl control-label'>期房补助费:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='qfbz'   value="<#if bean.qfbz??>${bean.qfbz?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>大病补助:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='dbbz'   value="<#if bean.dbbz??>${bean.dbbz?c}<#else>0</#if>"/>       
                </div>    
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>残疾补助:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='cjbz'   value="<#if bean.cjbz??>${bean.cjbz?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>低保户补助:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='dbhbz'   value="<#if bean.dbhbz??>${bean.dbhbz?c}<#else>0</#if>"/>       
                </div>   
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>独生子女奖励费:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='dsznbz'   value="<#if bean.dsznbz??>${bean.dsznbz?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>一次性停产停业补助费:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='tctdbz'   value="<#if bean.tctdbz??>${bean.tctdbz?c}<#else>0</#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>周转补助费:</label>
                    <input type='text' class='form-control input-sm  input_jl' name='zzbz'   value="<#if bean.zzbz??>${bean.zzbz?c}<#else>0</#if>"/>       
                </div>  
<!--                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>其他补助费:</label>
                    <input type='text' class='form-control input-sm' name='otherbz'   value="<#if bean.otherbz??>${bean.otherbz?c}<#else></#if>"/>       
                </div>-->
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>滴水补助费:</label>
                    <input type='text' class='form-control input-sm input_jl' name='dsbzf'   value="<#if bean.dsbzf??>${bean.dsbzf?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>信鸽补助费:</label>
                    <input type='text' class='form-control input-sm input_jl' name='xgbzf'   value="<#if bean.xgbzf??>${bean.xgbzf?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>宅基地应批未批补助:</label>
                    <input type='text' class='form-control input-sm input_jl' name='zjdypwpbz'   value="<#if bean.zjdypwpbz??>${bean.zjdypwpbz?c}<#else>0</#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>优惠指标未选满补偿:</label>
                    <input type='text' class='form-control input-sm input_jl' name='yhzbwxmbc'   value="<#if bean.yhzbwxmbc??>${bean.yhzbwxmbc?c}<#else>0</#if>"/>       
                </div>
                <div class='container-fluid con-bg mb10'>
                    <div class=' aoJianGroup '>      
                        <label class='fl control-label'>合计:</label>
                        <input id="jlhj" type='text' class='form-control input-sm  ' name='jlfsum' readonly  value="<#if bean.jlfsum??>${bean.jlfsum?c}<#else></#if>"/>       
                    </div>   
                </div>                                                                                                                                 
            </div> 
            <h4><span class="label label-default azxy">六.安置选房信息：</span></h4>
            <div class='container-fluid con-bg mb10 azxy' id="div6">
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>安置房源:</label>
                    <input type='text' class='form-control input-sm  ' name='fyxx'  value="${bean.fyxx?default("")}" />    
                </div>            
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>一居室(55m<sup>2</sup>):</label>
                    <input type='text' class='form-control input-sm  calc' area=55 name='yjs'  value="${bean.yjs?default("")}" /> （套）   
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>二居室（70m<sup>2</sup>）:</label>
                    <input type='text' class='form-control input-sm  calc' area=70 name='ljs70'   value="${bean.ljs70?default("")}"/>  （套）     
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>二居室（75m<sup>2</sup>）:</label>
                    <input type='text' class='form-control input-sm  calc' area=75 name='ljs75'   value="${bean.ljs75?default("")}"/>  （套）     
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>二居室（80m<sup>2</sup>）:</label>
                    <input type='text' class='form-control input-sm  calc' area=80 name='ljs80'   value="${bean.ljs80?default("")}"/> （套）      
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>二居室（85m<sup>2</sup>）:</label>
                    <input type='text' class='form-control input-sm  calc'  area=85 name='ljs85'   value="${bean.ljs85?default("")}"/>   （套）    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>三居室（110m<sup>2</sup>）:</label>
                    <input type='text' class='form-control input-sm  calc' area=110 name='sjs'   value="${bean.sjs?default("")}"/>  （套）     
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>实际选房套数:</label>
                    <input id="xfts" type='text' class='form-control input-sm  ' name='xfts'   value="${bean.xfts?default("")}"/> （套）      
                </div> 
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>应选面积:</label>
                    <input id="sjxfmj" type='text' class='form-control input-sm  ' name='yxmj'   value="<#if bean.yxmj??>${bean.yxmj?c}<#else></#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>实际选房面积:</label>
                    <input id="sjxfmj" type='text' class='form-control input-sm  ' name='sjxfmj'   value="<#if bean.sjxfmj??>${bean.sjxfmj?c}<#else></#if>"/>       
                </div>  
                 <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>指标内面积:</label>
                    <input id="sjxfmj" type='text' class='form-control input-sm  ' name='zbnmj'   value="<#if bean.zbnmj??>${bean.zbnmj?c}<#else></#if>"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>超指标面积:</label>
                    <input id="sjxfmj" type='text' class='form-control input-sm  ' name='czbmj'   value="<#if bean.czbmj??>${bean.czbmj?c}<#else></#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>指标内购房款:</label>
                    <input id="sjxfmj" type='text' class='form-control input-sm  ' name='zbngfk'   value="<#if bean.zbngfk??>${bean.zbngfk?c}<#else></#if>"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>指标外购房款:</label>
                    <input id="sjxfmj" type='text' class='form-control input-sm  ' name='zbwgfk'   value="<#if bean.zbwgfk??>${bean.zbwgfk?c}<#else></#if>"/>       
                </div>                   
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>购房款:</label>
                    <input type='text' class='form-control input-sm  ' name='azfgfk'   value="<#if bean.azfgfk??>${bean.azfgfk?c}<#else></#if>"/>       
                </div>                             
            </div>  
            <h4><span class="label label-default div_seven">七.其他：</span></h4>
            <div class='container-fluid con-bg mb10' id="div7">
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>腾退时间:</label>
                    <input type='text' class='form-control input-sm  ' name='ttrq'  value="${bean.ttrq?default("")}" />    
                </div>
            </div>                 
            <h4><span class="label label-default div_eight">八.评估款，补偿补助及奖励费合计：</span></h4>
            <div class='container-fluid con-bg mb10' id="div8">
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>腾退补偿款总价:</label>
                    <input type='text' class='form-control input-sm  ' name='zjdttzj'  value="<#if bean.zjdttzj??>${bean.zjdttzj?c}<#else></#if>" />    
                </div>
                <div class=' aoJianGroup fl azxy'>      
                    <label class='fl control-label'>结算后款:</label>
                    <input type='text' class='form-control input-sm  ' name='jshk'   value="<#if bean.jshk??>${bean.jshk?c}<#else></#if>"/>       
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
	})  

//设置模态框高度和宽度  
    $("#fhfa-edit-con").css("height", ($(window).height() - 150) + "px");
    $("#fhfa-edit-con").css("overflow-y", "scroll");
    
    //
     $("input[name=atype]").click(function () {
        var $selectedvalue = $("input[name='atype']:checked").val();
        if ($selectedvalue === '1') {
            $(".azxy").hide();
            $(".div_seven").html("六.其他：");
            $(".div_eight").html("七.评估款，补偿补助及奖励费合计：");
        }
        else {
            $(".azxy").show();
            $(".div_seven").html("七.其他：");
            $(".div_eight").html("八.评估款，补偿补助及奖励费合计：");
        }
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
                $(".div_seven").html("六.其他：");
                $(".div_eight").html("七.评估款，补偿补助及奖励费合计：");
            }
            else {
                $(".azxy").show();
                $(".div_seven").html("七.其他：");
                $(".div_eight").html("八.评估款，补偿补助及奖励费合计：");
            }
        }
    });
    
   $(function(){
   		
		$("#homesteadyear").change(function(){
			var p1=$(this).children('option:selected').val();
			if(p1 == '0'){
				$("#ckmjqwbcdj").val(3000);
			}else if(p1 == '1'){
				$("#ckmjqwbcdj").val(1800);
			}else{
				$("#ckmjqwbcdj").val("");
			};
   		});
                
        //宅基地腾退补偿款计算
        $("#zjdttbck").val(((parseFloat($("#kzzjdqwbcj").val()))+parseFloat($("#ckzjdqwbcj").val())+parseFloat($("#bttfwczcxj").val())+parseFloat($("#zxsbfswjk").val())).toFixed(2));
        $("#kzzjdqwbcj,#ckzjdqwbcj,#bttfwczcxj,#zxsbfswjk").change(function(){
       		$("#zjdttbck").val(((parseFloat($("#kzzjdqwbcj").val()))+parseFloat($("#ckzjdqwbcj").val())+parseFloat($("#bttfwczcxj").val())+parseFloat($("#zxsbfswjk").val())).toFixed(2));
   		});
                
   			
   		$(".input_jl").change(function(){
   			var sum = 0.00;
   			$('.input_jl').each(function (index,domEle){
   				var text = $(domEle).val();
   				if(text){
   					sum = sum+parseFloat(text);
   				}
   			});
   			$("#jlhj").val(sum.toFixed(2));
   			
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