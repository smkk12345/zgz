<!--参数设置--模态窗体--告警阀值-->
<div class="modal-header" id="alarmModal">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">新增温度告警阀值</h4>
</div>

<div class="modal-body" style="height:200px;">
  <form id="alarmForm" action="" method="post">
    <div class="container-fluid mb10" >
    	<div class=" autoGroup fl "> 
      		<label class="control-label">时间段:</label>
      		<input type="text" class="form-control dmDate" name="startDateStr" value="${bean.startDateStr?default("")}" id="startTime"   placeholder="开始时间"/>
      		<div class="cl"></div>
        </div>
        <div class=" autoGroup fl"> 
      		<label class="control-label">至</label>
      		<input type="text" class=" form-control dmDate" name="endDateStr" id="endTime" value="${bean.endDateStr?default("")}"   placeholder="结束时间"/>
      		<div class="cl"></div>
       </div>
       <div class="cl"></div>
    </div>
    <div class="container-fluid mb10">
    	<div class=" autoGroup fl">
      		<label class="fl control-label">平均值:</label>
      		<input type="text" class="form-control fl " name="averageAttri"  value="${bean.averageAttri?default("")}" placeholder="平均温度"/>        
        </div>
        <div class=" autoGroup fl">      
        	<label class="fl control-label">极大值:</label>
      		<input type="text" class="form-control  " name="maxAttri" value="${bean.maxAttri?default("")}"  placeholder="极大值"/>        
        </div>
    </div>
    
    <div class="container-fluid mb10">        
    	<div class=" autoGroup fl"> 
      		<label class="fl control-label">水平截面差值:</label>
      		<input type="text" class="form-control fl " name="horAttri" value="${bean.horAttri?default("")}"  placeholder="水平截面差值"/>
       </div>
       <div class=" autoGroup fl"> 
      		<label class="fl control-label">垂直截面差值:</label>
      		<input type="text" class="form-control  " name="verAttri" value="${bean.verAttri?default("")}"  placeholder="垂直截面差值"/>
       </div>
    </div>
    <div class="container-fluid mb10">
    	<div class=" autoGroup fl"> 
      		<label class="fl control-label">高于平均值:</label>
      		<input type="text" class="form-control fl " name="gtAverageAttri" value="${bean.gtAverageAttri?default("")}"  placeholder="高于平均值"/>
       </div>
    </div>
    <input  type="text" name="alarmId" value="${bean.id?default("")}" class="display-none" />
    <input  type="text" name="alarmType" value="${bean.alarmType?default("")}" class="display-none" />
  </form>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    <button type="button" class="btn btn-primary " data-url="${BASE_PATH}/xtsz/saveAlarmInfo.action" onclick="saveClick(this)" >保存</button>
</div>

<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>

<script type="text/javascript">

$(document).ready(function () {
   $(".dmDate").datepicker({
			format:'mm-dd'
		});
});
	//保存告警信息
	function saveClick(btn){
		var dataInfo = $("#alarmForm").serialize();
		var url = $(btn).attr("data-url");
		$.ajax({
			cache:true,
			type : "POST",
			url : url,
			dataType : "json",
			data : dataInfo,
			error: function (XMLHttpRequest, textStatus, errorThrown) {
    		 	alert("出错");
     		},
			success : function(response) {
				var bean = response.bean;   
				var url = response.url;
				var editUrl = response.editUrl;
				var add = response.add;
				var beanId = "#"+bean.id;
				var tableId = "#" + bean.alarmType+"Table";
				if(add==true){                  
					var innerHtml = "<tr class='table_ModalDbClick' id='"+bean.id+"' data-url='"+editUrl+"'>" +
							"<td>"+bean.startDateStr+"</td>"+
							"<td>"+bean.endDateStr+"</td>"+
							"<td>"+bean.averageAttri+"</td>"+
							"<td>"+bean.maxAttri+"</td>"+
							"<td>"+bean.horAttri+"</td>"+
							"<td>"+bean.verAttri+"</td>"+
							"<td>"+bean.gtAverageAttri+"</td>"+
							"<td>"+
								"<button type='button' class='btn btn-primary btn-xs ml10'  onClick='editBtnClick(this)' data-url='"+editUrl+"'>编辑</button>"+
								"<button type='button' class='btn btn-primary btn-xs ml10' onClick='delBtnClick(this)' data-url='"+url+"' pname='"+bean.id+"'>删除</button>"+
							"</td>"
						"</tr>"	;
					$("#alarmModal").parent().parent().parent().parent().find(tableId).append(innerHtml);
				}
				else{
					var innerHtml = ""+
							"<td>"+bean.startDateStr+"</td>"+
							"<td>"+bean.endDateStr+"</td>"+
							"<td>"+bean.averageAttri+"</td>"+
							"<td>"+bean.maxAttri+"</td>"+
							"<td>"+bean.horAttri+"</td>"+
							"<td>"+bean.verAttri+"</td>"+ 
							"<td>"+bean.gtAverageAttri+"</td>"+
							"<td>"+
								"<button type='button' class='btn btn-primary btn-xs ml10'  onClick='editBtnClick(this)' data-url='"+editUrl+"'>编辑</button>"+
								"<button type='button' class='btn btn-primary btn-xs ml10' onClick='delBtnClick(this)' data-url='"+url+"' pname='"+bean.id+"'>删除</button>"+
							"</td>"
					$("#alarmModal").parent().parent().parent().parent().find(beanId).empty().append(innerHtml);
				}
				$('#myModal').modal('hide');
			}
			
		})
	}
  
</script>