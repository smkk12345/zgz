<!--仓房布置-->
<div class="modal-header" id="barnModal">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel"><span class="form-group autoGroup fl">
    </span>
		编辑廒间信息
    </h4>
</div>
<div id="barnHead" beanId="${bean.id}" isAdd="${add}">
<div class="modal-body" style="height:auto;">

 <form id='iIndex+aoJianForm'>
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
         <div class=' aoJianGroup fr'>
          		<button type='button' class='btn btn-primary '  data-formId='iIndex+aoJianForm' onclick='editAoJianClick(this)' >编辑</button>
      		    <button type='button' class='btn btn-primary ml10' data-url='${BASE_PATH}/xtsz/saveAoJianInfo.action?aoJianId=aoJianBean.zyAoJianNum+' data-formId='iIndex+aoJianForm' onclick='saveAoJianClick(this)' >保存</button>
        </div>
   </div>
    </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-primary " data-url="${BASE_PATH}/xtsz/saveBarnInfo.action" onclick="saveClick(this)" >保存并下一步</button>
</div>
</div>
<!---->
<div class="display-none" id="aoJianModal">


	<div class="modal-body" style="height:auto;">
		<form id="aoJianListDiv">    
    	</form>
	</div>
	<!---->
	<div class="modal-footer ">
    	<button type="button" class="btn btn-primary" onclick="upStep()" >上一步</button>
    	<button type="button" class="btn btn-primary "  data-dismiss="modal" >关闭</button>
	</div>
</div>


<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>

<script type="text/javascript">
	
	$(function(){  
    	//这里处理
    	var isAdd = '${isAdd}';
    	if(isAdd=="true"){
    		return;
    	}
    	var beanId = $("#barnHead").attr("beanId");  
    	if(beanId!=null && beanId!="" && beanId!=undefined){
    		var url='${BASE_PATH}'+"xtsz/getBarnById.action?beanId="+beanId;
    		$.ajax({
			type : "GET",
			url : url,
			dataType : "json",
			error: function (XMLHttpRequest, errorThrown) {
    		 	alert(errorThrown);
     		},
     		
			success : function(response) {
				var bean = response.bean;   
				addAoJianInfo(bean);
				//初始化日期控件
				initDate();
			}
			})
    	}
	});  
	
	//上一步
	function upStep(){
		$("#barnHead").removeClass("display-none");
		$("#aoJianModal").addClass("display-none");
	}
	
	function initDate(){
	 $(".dmDate").datepicker({
			format:'yyyy-mm-dd'
		});
	}
		function showDetail(aLink){
			if($(aLink).find("span").hasClass('glyphicon-menu-up')){
        		$(aLink).find("span").removeClass().addClass("glyphicon glyphicon-menu-down blue");
        	}
        	else{
        		$(aLink).find("span").removeClass().addClass("glyphicon glyphicon-menu-up blue");
        	}
			var attr = $(aLink).attr("data-url");
			$("#"+attr).toggle();
		}
		
	function saveClick(btn){
		var dataInfo = $("#barnForm").serialize();
		var url = $(btn).attr("data-url");
		$.ajax({
			type : "POST",
			url : url,
			dataType : "json",
			data : dataInfo,
			error: function (XMLHttpRequest, textStatus, errorThrown) {
    		 	alert(errorThrown);
     		},
			success : function(response) {
				var bean = response.bean;   
				addAoJianInfo(bean);
				//初始化日期控件
				initDate();
			}
		})
	}

	function addAoJianInfo(bean){
		
		$("#barnHead").addClass("display-none");
		$("#aoJianModal").removeClass("display-none");
		var innerHtml = "";
		var count  = parseInt(bean.aoJianCount);
		for(var i=0;i<count;i++){
			innerHtml = innerHtml + getAddAoJianInnerHtml(bean.aoJianSet[i],i)	;
		}
		$("#aoJianListDiv").empty().append(innerHtml);
	}

	function getLocalTime(nS) {     
       return new Date(parseInt(nS)).toLocaleString().replace(/年|月/g, "-").replace(/日/g, " ");      
    }    
	//通过廒间信息生成廒间信息界面
	function getAddAoJianInnerHtml(aoJianBean,iIndex){
		var brhtml = "";
		if(iIndex!=0){
			brhtml = " <hr size='0.5' width='100%'  align='center' color='#999999;'>";
		}
		var aoJianIndex = (aoJianBean.aoJianIndex==null)?"":aoJianBean.aoJianIndex;
		var length = (aoJianBean.length==null)?"0":aoJianBean.length;
		var height = (aoJianBean.height==null)?"0":aoJianBean.height;
		var width = (aoJianBean.width==null)?"0":aoJianBean.width;
		var capacity = (aoJianBean.capacity==null)?"":aoJianBean.capacity;
		var fjGrainIndex = (aoJianBean.fjGrainIndex==null)?"":aoJianBean.fjGrainIndex;
		
		var aoJianGrainBean = aoJianBean.aoJianGrainInfoBean;
		var grainType = (aoJianGrainBean.grainType==null)?"":aoJianGrainBean.grainType;
		
		var grainOrigin = (aoJianGrainBean.grainOrigin==null)?"":aoJianGrainBean.grainOrigin;
		var harvestTimeDate = (aoJianGrainBean.harvestTime==null)?"":aoJianGrainBean.harvestTime;
		var harvestTime = getLocalTime(harvestTimeDate);
		alert(harvestTime);
		if(harvestTime.length>10){
			harvestTime = harvestTime.substring(0,10);
		}
		alert(harvestTime);
		var level = (aoJianGrainBean.level==null)?"":aoJianGrainBean.level;
		var storageMoisture = (aoJianGrainBean.storageMoisture==null)?"":aoJianGrainBean.storageMoisture;
		var impurity = (aoJianGrainBean.impurity==null)?"":aoJianGrainBean.impurity;
		var unitWeight = (aoJianGrainBean.unitWeight==null)?"":aoJianGrainBean.unitWeight;
		var inputTimeDate = (aoJianGrainBean.inputTime==null)?"":aoJianGrainBean.inputTime;
		var inputTime = getLocalTime(inputTimeDate);
		if(inputTime.length>10){
			inputTime = inputTime.substring(0,10);}
		var unsoundGrain = (aoJianGrainBean.unsoundGrain==null)?"":aoJianGrainBean.unsoundGrain;
		var remarks = (aoJianGrainBean.remarks==null)?"":aoJianGrainBean.remarks;
		
	var innerHtml="<form id='"+iIndex+"aoJianForm'>"+
	brhtml+
	"<div class='container-fluid mb10' >"+
    	"<div class=' aoJianGroup fl '> "+
      		"<label class='control-label'>廒间编号:</label>"+
      		"<input type='text' class='form-control' name='aoJianIndex' value='"+aoJianIndex+"'   placeholder='廒间编号'/>"+
      	"	<div class='cl'></div>"+
       " </div>"+
       "<div class=' aoJianGroup fl'>"+
      		"<label class='fl control-label'>分机编号:</label>"+
      		"<input type='text' class='form-control fl ' name='fjGrainIndex'  value='"+fjGrainIndex+"' placeholder='分机编号'/>  "+      
        "</div>"+  
       " <div class=' autoGroup fr'> "+
			"<a class='fr expandaLink' href='#' data-url='aoJian"+iIndex+"' title='编辑廒间信息' onClick='showDetail(this)'>"+
        		"<span class='glyphicon glyphicon-menu-up blue'></span>"+
        "	</a>"+
      " </div>"+
    "   <div class='cl'></div>"+
   " </div>"+
   " <div class='ml20' style='margin-left: 30px;'  id='aoJian"+iIndex+"'>"+
       " <div class='container-fluid mb10'>"+
    	"<div class=' aoJianGroup fl'>"+
      		"<label class='fl control-label'>粮食品种:</label>"+
      		"<select id='selectGrainType' class='form-control fl' style='width:120px;' name='粮食品种' >  "+
	           " <#list grainList as grain>"+
	            " <option "+
	            		"<#if grainType==grain.id>"+
                			"selected='selected'"+
               			"</#if>"+
	            	"grainId='${grain.id}'>${grain.grainType}</option> "+ 
	            "</#list>"+
	    	"</select>"+   
        "</div>"+
        "<div class=' aoJianGroup fl'>      "+
        "	<label class='fl control-label'>粮食产地:</label>"+

      	"	<input type='text' class='form-control  ' name='grainOrigin' value='"+grainOrigin+"'  placeholder='粮食产地'/>  "+     
      "  </div>"+
      	"<div class=' aoJianGroup fl'>"+
      		"<label class='fl control-label'>收获时间:</label>"+
      		"<input type='text' class='form-control fl dmDate' name='harvestTime'  value='"+harvestTime+"' placeholder='收获时间'/> "+       
        "</div>"+
   " </div>"+
          "  <div class='container-fluid mb10'>"+	
        "<div class=' aoJianGroup fl'>      "+
        	"<label class='fl control-label'>粮食等级:</label>"+

      		"<input type='text' class='form-control  ' name='level' value='"+level+"'  placeholder='粮食等级'/> "+       
       " </div>"+
       
    	"<div class=' aoJianGroup fl'>"+
      		"<label class='fl control-label'>入库水分:</label>"+
      		"<input type='text' class='form-control fl ' name='storageMoisture'  value='"+storageMoisture+"' placeholder='入库水份'/> "+       
        "</div>"+
        "<div class=' aoJianGroup fl'>   "+   
        	"<label class='fl control-label'>杂质:</label>"+

      		"<input type='text' class='form-control  ' name='impurity' value='"+impurity+"'  placeholder='杂志'/>     "+   
        "</div>"+
   " </div>"+
 
     "  <div class='container-fluid mb10'>"+
    	"<div class=' aoJianGroup fl'>"+
      		"<label class='fl control-label'>粮堆长宽高:</label>"+
      		"<input type='text' class='form-control fl ' name='lwh'  value='"+length+"/"+width+"/"+height+"' placeholder='长/宽/高'/> "+       
       " </div>"+
        "<div class=' aoJianGroup fl'>    "+  
        	"<label class='fl control-label'>储量:</label>"+

      		"<input type='text' class='form-control  ' name='capacity' value='"+capacity+"'  placeholder='储量'/>    "+    
        "</div>"+
    	"<div class=' aoJianGroup fl'>"+
      		"<label class='fl control-label'>容重:</label>"+
      		"<input type='text' class='form-control fl ' name='unitWeight'  value='"+unitWeight+"' placeholder='容重'/>  "+      
       " </div>"+
    "</div>"+
       " <div class='container-fluid mb10'>"+
        "<div class=' aoJianGroup fl'>     "+ 
        	"<label class='fl control-label'>入库时间:</label>"+

      	"	<input type='text' class='form-control  dmDate' name='inputTime' value='"+inputTime+"'  placeholder='入库时间'/> "+       
      "  </div>"+
         "<div class=' aoJianGroup fl'>"+
      		"<label class='fl control-label'>不完整粒:</label>"+
      		"<input type='text' class='form-control fl '  name='unsoundGrain'  value='"+unsoundGrain+"' placeholder='不完整粒'/> "+       
        "</div>"+
    	"<div class=' aoJianGroup fl'>"+
      		"<label class='fl control-label'>备注:</label>"+
      		"<input type='text' class='form-control fl '  name='remarks'  value='"+remarks+"' placeholder='备注'/> "+       
        "</div>"+
         "<div class=' aoJianGroup fr'>"+
          		"<button type='button' class='btn btn-primary '  data-formId='"+iIndex+"aoJianForm' onclick='editAoJianClick(this)' >编辑</button>"+
      		    "<button type='button' class='btn btn-primary ml10' data-url='${BASE_PATH}/xtsz/saveAoJianInfo.action?aoJianId="+aoJianBean.zyAoJianNum+"' data-formId='"+iIndex+"aoJianForm' onclick='saveAoJianClick(this)' >保存</button>"+
        "</div>"+
  " </div>"+
    
    "</div></form>";
	return innerHtml;
	}
	
	function editAoJianClick(btn){
		var formId = $(btn).attr("data-formId");
		$("#"+formId +" input").removeAttr("disabled");
	}
	
	function saveAoJianClick(btn){
	
		var url = $(btn).attr("data-url");
		var formId = $(btn).attr("data-formId");
		var dataInfo = $("#"+formId).serialize();
		var val=$('#selectGrainType option:selected').attr("grainId");
		
		alert(val);
		dataInfo = dataInfo+"&grainType="+val;
		$.ajax({
			cache:true,
			type : "POST",
			url : url,
			dataType : "json",
			data : dataInfo,
			error: function (XMLHttpRequest, textStatus, errorThrown) {
    		 	alert(errorThrown);
     		},
			success : function(response) {
				$("#"+formId +" input").attr("disabled","disabled");//再改成disabled 
			}
		})
	}
</script>