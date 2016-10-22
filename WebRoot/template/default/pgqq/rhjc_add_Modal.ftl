
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">基本情况调查表</h4>
</div>
<#setting date_format="yyyy-MM-dd HH:mm:ss">
<div class="modal-body p5">
    <form id='rhjcAddForm' modelAttribute = "HouseBasic" action="${BASE_PATH}/pgqq/savehousebasic.action"
     accept-charset="UTF-8" method="post">
	<hr size='0.5' width='100%'  align='center' color='#999999;'>
	<div class='container-fluid mb10' >
    	<div class=' aoJianGroup fl '> 
      		<label class='control-label'>基本情况:</label>
      		<div class='cl'></div>
        </div>
    </div>
    <div class='ml20' style='margin-left: 30px;'  id='aoJianiIndex+'>
        <div class='container-fluid mb10'>
    	<div class=' aoJianGroup fl'>
      		<label class='fl control-label'>房屋坐落:</label>
      		<input type='text' class='form-control  ' name='location'   placeholder='房屋坐落'/>    
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>联系固话:</label>

      		<input type='text' class='form-control  ' name='telephone'   placeholder='联系固话'/>       
        </div>
      	<div class=' aoJianGroup fl'>
      		<label class='fl control-label'>手机:</label>
      		<input type='text' class='form-control fl dmDate' name='mobile'  placeholder='手机'/>        
        </div>
        <div class=' aoJianGroup fl'>
      		<label class='fl control-label'>被腾退人姓名:</label>
      		<input type='text' class='form-control  ' name='names'   placeholder='被腾退人姓名'/>    
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>性别:</label>
			<select id='sexsel' class='form-control fl' style='width:120px;' name='sex' >  
	             <option   value="0">男</option>  
	             <option   value="1">女</option> 
	    	</select>  
        </div>
      	<div class=' aoJianGroup fl'>
      		<label class='fl control-label'>年龄:</label>
      		<input type='text' class='form-control fl ' name='age'   placeholder='年龄'/>        
        </div>
    </div>
    
    <div class='container-fluid mb10'>	
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>备用联系电话:</label>
      		<input type='text' class='form-control  ' name='remobile'   placeholder='备用联系电话'/>        
        </div>
       
    	<div class=' aoJianGroup fl'>
      		<label class='fl control-label'>权属取得方式:</label>
      		<select id='sexsel' class='form-control fl' style='width:120px;' name='ownership' >  
	             <option value="0">自有</option>  
	             <option value="1">老宅</option> 
	             <option value="2">买卖</option>  
	             <option value="3">继承</option> 
	             <option value="4">其他</option> 
	    	</select>  
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>房屋间数:</label>
      		<input type='text' class='form-control  ' name='housecount'   placeholder='房屋间数'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>本址在册户口簿数量:</label>
      		<input type='text' class='form-control  ' name='localbook'   placeholder='本址在册户口簿数量'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>本址在册户籍数量:</label>
      		<input type='text' class='form-control  ' name='localpeoplecount'  placeholder='本址在册户籍数量'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>非本址在册户口簿数量:</label>
      		<input type='text' class='form-control  ' name='notlocalbook'   placeholder='本址在册户口簿数量'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>非本址在册户籍数量:</label>
      		<input type='text' class='form-control  ' name='notlocalpeoplecount'   placeholder='非本址在册户籍数量'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>拟被安置人口:</label>
      		<input type='text' class='form-control  ' name='people'   placeholder='拟被安置人口'/>        
        </div>
    </div>
    
    <div class='container-fluid mb10' >
    	<div class=' aoJianGroup fl ' style="width:500px;"> 
      		<label class='control-label'>被腾退房屋本址在册户籍家庭人口情况:</label>
      		<div class='cl'></div>
        </div>
    </div>
    
    <div class='container-fluid mb10'>	
        <table id="table1" class="table table-striped table-bordered table-condensed ">
        <thead>
        	<tr>
        		<th>序号</th>
        		<th>户主</th>
        		<th>户籍性质</th>
        		<th>姓名</th>
        		<th>身份证号</th>
        		<th>性别</th>
        		<th>户关</th>
        		<th>产关</th>
        		<th>婚否</th>
        		<th>类型</th>
        		<th>工作单位</th>
        		<th>人口类别</th>
        	</tr>
        </thead>
        <tbody>
        	<tr>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='序号'/></td>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='户主'/>        </td>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='户籍性质'/>        </td>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='姓名'/>        </td>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='身份证号'/>        </td>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='性别'/>        </td>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='户关'/>        </td>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='产关'/>        </td>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='婚否'/>        </td>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='婚否'/>        </td>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='工作单位'/>        </td>
        		<td><input type='text' class='form-control  ' name='people'   placeholder='人口类别'/>        </td>
        	</tr>
        </tbody>
        </table>
        <button id="addLoalbtn" type="button" class="btn btn-default" onclick="addLocal(this)" >添加</button>
    </div>
    //面积相关
    <div class='container-fluid mb10'>	
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>宅基地测绘面积:</label>
      		<input type='text' class='form-control  ' name='zjdarea'   placeholder='宅基地测绘面积'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>房屋测绘面积:</label>
      		<input type='text' class='form-control  ' name='fwarea'   placeholder='房屋测绘面积'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>首层测绘面积:</label>
      		<input type='text' class='form-control  ' name='firstfloorarea'   placeholder='首层测绘面积'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>二层以上面积:</label>
      		<input type='text' class='form-control  ' name='abovetwoarea'   placeholder='二层以上面积'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>地下室面积:</label>
      		<input type='text' class='form-control  ' name='basement'   placeholder='地下室面积'/>        
        </div>
    </div>
    //经营状况
    <div class='container-fluid mb10'>	
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>经营用房面积:</label>
      		<input type='text' class='form-control  ' name='operatearea'   placeholder='经营用房面积'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>工商备案面积:</label>
      		<input type='text' class='form-control  ' name='businessarea'   placeholder='工商备案面积'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>经营用途:</label>
      		<input type='text' class='form-control  ' name='operatecontent'   placeholder='经营用途'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>执照字号:</label>
      		<input type='text' class='form-control  ' name='licensename'   placeholder='执照字号'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>与被腾退人关系:</label>
  		     <select id='sexsel' class='form-control fl' style='width:120px;' name='relate' >  
	             <option value="0">本人</option>  
	             <option value="1">本家庭成员</option> 
	             <option value="2">租赁</option>  
	             <option value="3">其他</option> 
    		</select>    
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>执照标明经营场所:</label>
      		<input type='text' class='form-control  ' name='licenselocation'   placeholder='执照标明经营场所'/>        
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>税务登记证:</label>
  		     <select id='sexsel' class='form-control fl' style='width:120px;' name='taxlicense' >  
	             <option value="0">有</option>  
	             <option value="1">无</option> 
    		</select>       
        </div>
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>租赁协议:</label>
  		     <select id='sexsel' class='form-control fl' style='width:120px;' name='leaselicense' >  
	             <option value="0">有</option>  
	             <option value="1">无</option> 
    		</select>       
        </div>    
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>完税证明:</label>
  		     <select id='sexsel' class='form-control fl' style='width:120px;' name='taxprove' >  
	             <option value="0">有</option>  
	             <option value="1">无</option> 
    		</select>       
        </div> 
        <div class=' aoJianGroup fl'>      
        	<label class='fl control-label'>执照编号:</label>
      		<input type='text' class='form-control  ' name='license'   placeholder='执照编号'/>        
        </div>
    </div>
    //其他，残疾，大病，低保等
    
	<div class="modal-footer">
	    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	    <button type="submit" class="btn btn-primary btn-save"   >保存</button>
	</div>
    </form>
</div>

<script type = "text/javascript">

    
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