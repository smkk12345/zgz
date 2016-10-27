
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">协议补录(共3项)</h4>
</div>
<div class="modal-body rhjc-add-con">
    <form id='rhjcAddForm' modelAttribute = "Agreement" action="${BASE_PATH}/saveAgreenment.action"
          accept-charset="UTF-8" method="post">
          
        <input type="hidden" class='form-control input-sm ' name='aid' value="${bean.id?default("")}" style="width: 0px;"/>
        <input type="hidden" class='form-control input-sm ' name='housebasicid' value="${housebasic.id?default("")}" style="width: 0px;"/>
        
        <div class='ml15' >
            <h4><span class="label label-default">1.基本数据：</span></h4>
            <div class='container-fluid con-bg mb10'>
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
                    <label class='fl control-label'>被腾退人姓名:</label>
                    <input type='text' class='form-control input-sm  ' name='names' value="${housebasic.names?default("")}"/>    
                </div>
             	<div class=' aoJianGroup fl'>
                    <label class='fl control-label'>协议类型:</label>
                     <select id='sexsel' class='form-control input-sm fl' style='width:120px;' name='atype' >  
                    	<option <#if (bean.atype?default("-1"))=='-1'>selected='selected'</#if> value="-1">请选择</option>  
                        <option <#if (bean.atype?default("-1"))=='0'>selected='selected'</#if> value="0">款补</option>  
                        <option <#if (bean.atype?default("-1"))=='1'>selected='selected'</#if> value="1">房补</option> 
                     </select>
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>协议编号:</label>
                    <input type='text' class='form-control input-sm  ' name='agreementnum'  value="${bean.agreementnum?default("")}" />    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>腾退人:</label>
                    <input type='text' class='form-control input-sm  ' name='vacatepeople'  value="${bean.vacatepeople?default("")}"/>       
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>宅基地年限:</label>
                    <input type='text' class='form-control input-sm ' name='homesteadyear' value="${bean.homesteadyear?default("")}" />        
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>宅基地控制面积:</label>
                    <input type='text' class='form-control input-sm  ' name='conhomestarea'  value="${bean.conhomestarea?default("")}" />    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>超出宅基地:</label>
                   <input type='text' class='form-control input-sm  ' name='overhomesteadarea'  value="${bean.overhomesteadarea?default("")}" />    
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>大棚:</label>
                    <input type='text' class='form-control input-sm fl ' name='shed'   value="${bean.shed?default("")}"/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>评估机构:</label>
                    <input type='text' class='form-control input-sm  ' name='pgjg'  value="${bean.pgjg?default("")}" />        
                </div>
            </div>
		    <h4><span class="label label-default">2.腾退各项补助费：</span></h4>
           	<div class='container-fluid con-bg mb10'>
           	    <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>一居室:</label>
                     <input type='text' class='form-control input-sm  ' name='wfhbz'  value="${bean.wfhbz?default("")}" />   
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>二居室:</label>
                     <input type='text' class='form-control input-sm  ' name='wfhbz'  value="${bean.wfhbz?default("")}" />   
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>三居室:</label>
                     <input type='text' class='form-control input-sm  ' name='wfhbz'  value="${bean.wfhbz?default("")}" />   
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>宅基地未分户补助:</label>
                     <input type='text' class='form-control input-sm  ' name='wfhbz'  value="${bean.wfhbz?default("")}" />   
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>停产停业补助:</label>
                    <input type='text' class='form-control input-sm  ' name='tctdbz'  value="${bean.tctdbz?default("")}"/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>搬家及家电迁移补助费:</label>
                    <input type='text' class='form-control input-sm  ' name='bgbz'   value="${bean.bgbz?default("")}"/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>期房补助费:</label>
                    <input type='text' class='form-control input-sm  ' name='qfbz'  value="${bean.qfbz?default("")}"/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>大病人数:</label>
                    <input type='text' class='form-control input-sm '  disabled="true"  />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>大病补助费:</label>
                    <input type='text' class='form-control input-sm  ' name='dpbz'  value="${bean.dpbz?default("")}" />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>残疾人数:</label>
                    <input type='text' class='form-control input-sm '  disabled="true"  />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>残疾补助费:</label>
                    <input type='text' class='form-control input-sm  ' name='cjbz'  value="${bean.cjbz?default("")}" />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>低保人数:</label>
                    <input type='text' class='form-control input-sm '  disabled="true"  />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>低保补助费:</label>
                    <input type='text' class='form-control input-sm  ' name='people'  value="${bean.people?default("")}" />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>独生子女人数:</label>
                    <input type='text' class='form-control input-sm '  value="${bean.dsznz?default("")}" />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>独生子女补助:</label>
                    <input type='text' class='form-control input-sm  ' name='dsznbz'  value="${bean.dsznbz?default("")}" />        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>腾退合计费用:</label>
                    <input type='text' class='form-control input-sm  ' name='vacatesum'   value="${bean.vacatesum?default("")}"/>        
                </div>
            </div>
           
            <h4><span class="label label-default">3.腾退各项奖励费：</span></h4>
            <div class='container-fluid con-bg mb10'>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>未建奖励费:</label>
                    <input type='text' class='form-control input-sm  ' name='wjjlf'  value="${bean.wjjlf?default("")}" />    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>无违章奖励费:</label>
                    <input type='text' class='form-control input-sm  ' name='wwzjlf'   value="${bean.wwzjlf?default("")}"/>       
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>提前搬家奖励费:</label>
                    <input type='text' class='form-control input-sm fl dmDate' name='tqbjjlf'  value="${bean.tqbjjlf?default("")}"/>        
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>工程配合奖励费:</label>
                    <input type='text' class='form-control input-sm  ' name='gcphjlf'   value="${bean.gcphjlf?default("")}"/>    
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>预签约20天奖励费:</label>
                   <input type='text' class='form-control input-sm  ' name='qyjlf'  value="${bean.qyjlf?default("")}"/>    
                </div>
                <div class=' aoJianGroup fl'>
                    <label class='fl control-label'>其他:</label>
                    <input type='text' class='form-control input-sm fl ' name='other'   value="${bean.other?default("")}"/>        
                </div>
                <div class=' aoJianGroup fl'>      
                    <label class='fl control-label'>奖励费合计:</label>
                    <input type='text' class='form-control input-sm  ' name='jlfsum'   value="${bean.jlfsum?default("")}"/>        
                </div>
			    <div class=' aoJianGroup fl'>      
                  <label class='fl control-label'>总合计:</label>
                  <input type='text' class='form-control input-sm  ' name='sum'   value="${bean.sum?default("")}"/>        
                </div>
            </div>            
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary btn-save"   >保存并打印</button>
            </div>
        </div>
    </form>
</div>

<script type = "text/javascript">


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