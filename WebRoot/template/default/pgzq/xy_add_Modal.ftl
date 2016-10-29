
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">房屋征收安置与补偿方案信息登记单（基本情况，房屋信息，部分补助信息是从入户信息中提取，如有调整，请到入户信息管理中修改）</h4>
</div>
<div class="modal-body rhjc-add-con">
    <form id='rhjcAddForm' modelAttribute = "Agreement" action="${BASE_PATH}/pgzq/saveAgreenment.action"
          accept-charset="UTF-8" method="post">
          
        <input type="hidden" class='form-control input-sm ' name='aid' value="${bean.id?default("")}" style="width: 0px;"/>
        <input type="hidden" class='form-control input-sm ' name='housebasicid' value="${housebasic.id?default("")}" style="width: 0px;"/>
        
        <div class='ml15' >
            <h4><span class="label label-default">一.基本情况：</span></h4>
            <div class='container-fluid con-bg mb10'>
             	<div class=' aoJianGroup fl'>
                    <label class='fl control-label'>被腾退人姓名:</label>
                    <input type='text' class='form-control input-sm  ' name='names' value="${housebasic.names?default("")}"/>    
                </div>
            	<div class=' aoJianGroup fl'>
                    <label class='fl control-label'>房屋坐落:</label>
                    <input type='text' class='form-control input-sm  ' name='location' value="${housebasic.location?default("")}"/>    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>联系固话:</label>

                    <input type='text' class='form-control input-sm  ' name='telephone' value="${housebasic.telephone?default("")}"/>       
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>手机:</label>
                    <input type='text' class='form-control input-sm fl dmDate' name='mobile' value="${housebasic.mobile?default("")}"/>        
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>被腾退人身份证号:</label>
                    <input type='text' class='form-control input-sm fl dmDate' name='mobile' value="${housebasic.mobile?default("")}"/>        
                </div>               
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>安置意向:</label>
					<!--<label class="radio">
					  <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
					 房屋安置
					</label>
					<label class="radio">
					  <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
					  货币补偿
					</label>-->
                </div> 
		      <div class="container-fluid fl">
	                 <label class="checkbox-inline">
					    <input type="radio" name="atype" id="optionsRadios3" value="0" checked>房屋安置
					 </label>
					 <label class="checkbox-inline">
					    <input type="radio" name="atype" id="optionsRadios4" value="1">货币补偿
					 </label>
		      </div>
    	  </div>                	
		    <h4><span class="label label-default">二.宅基地，房屋信息：</span></h4>
           	<div class='container-fluid con-bg mb10'>
           	    <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>宅基地实测用地面积:</label>
                     <input type='text' class='form-control input-sm  ' name='scydmj'  value="${bean.scydmj?default("")}" />   
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>宅基地认定年限:</label>
                     <input type='text' class='form-control input-sm  ' name='homesteadyear'  value="${bean.homesteadyear?default("")}" />   
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>宅基地控制面积:</label>
                     <input type='text' class='form-control input-sm  ' name='conhomestarea'  value="${bean.conhomestarea?default("")}" />   
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>超出宅基地控制面积:</label>
                     <input type='text' class='form-control input-sm  ' name='overhomesteadarea'  value="${bean.overhomesteadarea?default("")}" />   
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>现状实测房屋建筑面积:</label>
                     <input type='text' class='form-control input-sm  ' name='wfhbz'  value="${bean.wfhbz?default("")}" />   
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>首层建筑面积:</label>
                     <input type='text' class='form-control input-sm  ' name='wfhbz'  value="${housebasic.firstfloorarea?default("")}" />   
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>二层及以上建筑面积:</label>
                     <input type='text' class='form-control input-sm  ' name='wfhbz'  value="${housebasic.abovetwoarea?default("")}" />   
                </div>    
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>地下室建筑面积:</label>
                     <input type='text' class='form-control input-sm  ' name='wfhbz'  value="${housebasic.basement?default("")}" />   
                </div>                
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>棚面积:</label>
                     <input type='text' class='form-control input-sm  ' name='shed'  value="${bean.shed?default("")}" />   
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>认定房屋补偿面积:</label>
                     <input type='text' class='form-control input-sm  ' name='fwbcmj'  value="${bean.fwbcmj?default("")}" />   
                </div>
            </div>
           
           
            <h4><span class="label label-default">三.认定人口信息：</span></h4>
            <div class='container-fluid con-bg mb10'>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>认定人口数量:</label>
                    <input type='text' class='form-control input-sm  ' name='rdbazrk'  value="${bean.rdbazrk?default("")}" />    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>认定人口信息:</label>
                    <input type='text' class='form-control input-sm  fl' name='rdbazrkxx'   value="${bean.rdbazrkxx?default("")}"/>       
                </div>
            </div>    
              
            <h4><span class="label label-default">四.宅基地腾退补偿款：</span></h4>
            <div class='container-fluid con-bg mb10'>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>评估方:</label>
                    <input type='text' class='form-control input-sm  ' name='pgjg'  value="${bean.pgjg?default("")}" />    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>控制宅基地区位补偿价:</label>
                    <input type='text' class='form-control input-sm  ' name='kzzjdqwbcj'   value="${bean.kzzjdqwbcj?default("")}"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>超控宅基地区位补偿价:</label>
                    <input type='text' class='form-control input-sm  ' name='ckzjdqwbcj'   value="${bean.ckzjdqwbcj?default("")}"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>被腾退房屋重置成新价:</label>
                    <input type='text' class='form-control input-sm  ' name='bttfwczcxj'   value="${bean.bttfwczcxj?default("")}"/>       
                </div>   
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>宅基地腾退补偿款(合计):</label>
                    <input type='text' class='form-control input-sm  ' name='zjdttbck'   value="${bean.zjdttbck?default("")}"/>       
                </div>                                              
            </div>  
            <h4><span class="label label-default">五.奖励费 补助费：</span></h4>
            <div class='container-fluid con-bg mb10'>
				<div class=' aoJianGroup fl'>
                    <label class='fl control-label'>提前搬家奖:</label>
                    <input type='text' class='form-control input-sm  ' name='tqbjl'  value="${bean.tqbjl?default("")}" />    
                </div>            
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>工程配合奖:</label>
                    <input type='text' class='form-control input-sm  ' name='gcphjl'  value="${bean.gcphjl?default("")}" />    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>腾退促进奖:</label>
                    <input type='text' class='form-control input-sm  ' name='ttcjjl'   value="${bean.ttcjjl?default("")}"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>无违章奖励费:</label>
                    <input type='text' class='form-control input-sm  ' name='wwzjl'   value="${bean.wwzjl?default("")}"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>未建二层奖励费:</label>
                    <input type='text' class='form-control input-sm  ' name='wjecjj'   value="${bean.wjecjj?default("")}"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>搬家及家电迁移补助:</label>
                    <input type='text' class='form-control input-sm  ' name='bjbz'   value="${bean.bjbz?default("")}"/>       
                </div>    
                <div class=' aoJianGroup fl azxy'>      
                    <label class='fl control-label'>期房补助费:</label>
                    <input type='text' class='form-control input-sm  ' name='qfbz'   value="${bean.qfbz?default("")}"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>大病补助:</label>
                    <input type='text' class='form-control input-sm  ' name='dbbz'   value="${bean.dbbz?default("")}"/>       
                </div>    
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>残疾补助:</label>
                    <input type='text' class='form-control input-sm  ' name='cjbz'   value="${bean.cjbz?default("")}"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>低保户补助:</label>
                    <input type='text' class='form-control input-sm  ' name='dbhbz'   value="${bean.dbhbz?default("")}"/>       
                </div>   
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>独生子女奖励费:</label>
                    <input type='text' class='form-control input-sm  ' name='dsznbz'   value="${bean.dsznbz?default("")}"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>一次性停产停业补助费:</label>
                    <input type='text' class='form-control input-sm  ' name='tctdbz'   value="${bean.tctdbz?default("")}"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>其他补助费:</label>
                    <input type='text' class='form-control input-sm  ' name='otherbz'   value="${bean.otherbz?default("")}"/>       
                </div>  
                <div class='container-fluid con-bg mb10'>
	                <div class=' aoJianGroup '>      
	                    <label class='fl control-label'>合计:</label>
	                    <input type='text' class='form-control input-sm  ' name='jlfsum'   value="${bean.jlfsum?default("")}"/>       
	                </div>   
                </div>                                                                                                                                 
            </div> 
            <h4><span class="label label-default azxy">六.安置选房信息：</span></h4>
            <div class='container-fluid con-bg mb10 azxy'>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>安置房源:</label>
                    <input type='text' class='form-control input-sm  ' name='fyxx'  value="${bean.fyxx?default("")}" />    
                </div>            
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>一居室:</label>
                    <input type='text' class='form-control input-sm  ' name='yjs'  value="${bean.yjs?default("")}" />    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>二居室:</label>
                    <input type='text' class='form-control input-sm  ' name='ljs'   value="${bean.ljs?default("")}"/>       
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>三居室:</label>
                    <input type='text' class='form-control input-sm  ' name='sjs'   value="${bean.sjs?default("")}"/>       
                </div>
                 <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>实际选房面积:</label>
                    <input type='text' class='form-control input-sm  ' name='sjxfmj'   value="${bean.sjxfmj?default("")}"/>       
                </div>  
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>购房款:</label>
                    <input type='text' class='form-control input-sm  ' name='azfgfk'   value="${bean.azfgfk?default("")}"/>       
                </div>                             
            </div>  
            <h4><span class="label label-default div_seven">七.其他：</span></h4>
            <div class='container-fluid con-bg mb10'>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>腾退时间:</label>
                    <input type='text' class='form-control input-sm  ' name='ttrq'  value="${bean.ttrq?default("")}" />    
                </div>
            </div>                 
            <h4><span class="label label-default div_eight">八.评估款，补偿补助及奖励费合计：</span></h4>
            <div class='container-fluid con-bg mb10'>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>总补偿款:</label>
                    <input type='text' class='form-control input-sm  ' name='zjdttzj'  value="${bean.zjdttzj?default("")}" />    
                </div>
                <div class=' aoJianGroup fl azxy'>      
                    <label class='fl control-label'>结算后款:</label>
                    <input type='text' class='form-control input-sm  ' name='wwzjlf'   value="${bean.wwzjlf?default("")}"/>       
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

		 $("input[name=atype]").click(function(){
				var $selectedvalue = $("input[name='atype']:checked").val();
				if ($selectedvalue == 1) {
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

function addlist(a){
    var h=$(a+"").html();
    $(a+"").after("<tr>"+h+"</tr>"+"");
    
}
</script>