
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">基本情况调查表</h4>
</div>
<#setting date_format="yyyy-MM-dd HH:mm:ss">
<div class="modal-body p5">
    <form id='rhjcAddForm'>
	<hr size='0.5' width='100%'  align='center' color='#999999;'>
	<div class='container-fluid mb10' >
    	<div class=' aoJianGroup fl '> 
      		<label class='control-label'>廒间编号:</label>
      		<input type='text' class='form-control' name='aoJianIndex' value='aoJianIndex+'   placeholder='廒间编号'/>
      		<div class='cl'></div>
        </div>
       <div class=' aoJianGroup fl'>
      		<label class='fl control-label'>分机编号:</label>
      		<input type='text' class='form-control fl ' name='fjGrainIndex'  value='fjGrainIndex+' placeholder='分机编号'/>        
        </div>  
        <div class=' autoGroup fr'> 
			<a class='fr expandaLink' href='#' data-url='aoJianiIndex+' title='编辑廒间信息' onClick='showDetail(this)'>
        		<span class='glyphicon glyphicon-menu-up blue'></span>
        	</a>
       </div>
       <div class='cl'></div>
    </div>
    <div class='ml20' style='margin-left: 30px;'  id='aoJianiIndex+'>
        <div class='container-fluid mb10'>
    	<div class=' aoJianGroup fl'>
      		<label class='fl control-label'>粮食品种:</label>
      		<select id='selectGrainType' class='form-control fl' style='width:120px;' name='粮食品种' >  
	            <#list grainList as grain>
	             <option 
	            		<#if grainType==grain.id>
                			selected='selected'
               			</#if>
	            	grainId='${grain.id}'>${grain.grainType}</option>  
	            </#list>
	    	</select>   
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>粮食产地:</label>

      		<input type='text' class='form-control  ' name='grainOrigin' value='grainOrigin+'  placeholder='粮食产地'/>       
        </div>
      	<div class=' aoJianGroup fl'>
      		<label class='fl control-label'>收获时间:</label>
      		<input type='text' class='form-control fl dmDate' name='harvestTime'  value='harvestTime+' placeholder='收获时间'/>        
        </div>
    </div>
            <div class='container-fluid mb10'>	
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>粮食等级:</label>

      		<input type='text' class='form-control  ' name='level' value='level+'  placeholder='粮食等级'/>        
        </div>
       
    	<div class=' aoJianGroup fl'>
      		<label class='fl control-label'>入库水分:</label>
      		<input type='text' class='form-control fl ' name='storageMoisture'  value='storageMoisture+' placeholder='入库水份'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>杂质:</label>

      		<input type='text' class='form-control  ' name='impurity' value='impurity+'  placeholder='杂志'/>        
        </div>
    </div>
 
       <div class='container-fluid mb10'>
    	<div class=' aoJianGroup fl'>
      		<label class='fl control-label'>粮堆长宽高:</label>
      		<input type='text' class='form-control fl ' name='lwh'  value='length+/width+/height+' placeholder='长/宽/高'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>储量:</label>

      		<input type='text' class='form-control  ' name='capacity' value='capacity+'  placeholder='储量'/>        
        </div>
    	<div class=' aoJianGroup fl'>
      		<label class='fl control-label'>容重:</label>
      		<input type='text' class='form-control fl ' name='unitWeight'  value='unitWeight+' placeholder='容重'/>        
        </div>
    </div>
        <div class='container-fluid mb10'>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>入库时间:</label>

      		<input type='text' class='form-control  dmDate' name='inputTime' value='inputTime+'  placeholder='入库时间'/>        
        </div>
         <div class=' aoJianGroup fl'>
      		<label class='fl control-label'>不完整粒:</label>
      		<input type='text' class='form-control fl '  name='unsoundGrain'  value='unsoundGrain+' placeholder='不完整粒'/>        
        </div>
    	<div class=' aoJianGroup fl'>
      		<label class='fl control-label'>备注:</label>
      		<input type='text' class='form-control fl '  name='remarks'  value='remarks+' placeholder='备注'/>        
        </div>
   </div>
    </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary btn-save" data-url="${BASE_PATH}/xtsz/saveArrangementInfo.action" onclick="saveClick(this)" >保存</button>
</div>

<script type = "text/javascript" >
       function saveClick(btn) {
        var dataInfo = $("#rhjcAddForm").serialize();
        var url = $(btn-save).attr("data-url");
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
</script>