<!--检测设备布置--模态窗体--新增检测设备布置-->
<div class="modal-header" id="arrangementDetailModal" dataId = "${bean.id}">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel">检测设备布置</h4>
</div>
<div class="modal-body" Style="height:450px;width:850px;"> 
	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%" id="SensorArrangementDetail">
	    <param name="movie" value="${BASE_PATH}lqt/SensorArrangementDetail.swf" />
	    <param name="quality" value="high" />
	    <param name="bgcolor" value="#ffffff" />
	    <param name="allowScriptAccess" value="sameDomain" />
	    <param name="allowFullScreen" value="true" />
	    <!--[if !IE]>-->
	    <object type="application/x-shockwave-flash" data="${BASE_PATH}template/default/flex/SensorArrangementDetail.swf" width="100%" height="100%">
	        <param name="quality" value="high" />
	        <param name="bgcolor" value="#ffffff" />
	        <param name="allowScriptAccess" value="sameDomain" />
	        <param name="allowFullScreen" value="true" />
	    <!--<![endif]-->
	    <!--[if gte IE 6]>-->
	        <p> 
	            Either scripts and active content are not permitted to run or Adobe Flash Player version
	            11.1.0 or greater is not installed.
	        </p>
	    <!--<![endif]-->
	        <a href="http://www.adobe.com/go/getflashplayer">
	            <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash Player" />
	        </a>
	    <!--[if !IE]>-->
	    </object>
	    <!--<![endif]-->
	</object>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
<script type="text/javascript">  
	//flex端调用获取布置id
	function getSensorArrangementId(){
		var dataId = $("#arrangementDetailModal").attr("dataId");
		return dataId;
	}
	
	function selectAoJian(){
		var url='${BASE_PATH}'+"user/aoJianSelectedModal.action";
		alert(url);
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
        return url;
	}
</script>