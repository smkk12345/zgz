
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">档案管理</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save"   onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body center">
    <div class="content fhfa-rdjg-print-con"  id="xy-print">
        <span class="title">档案管理</span>
         <form   action="${BASE_PATH}/dagl/save.action"
          accept-charset="UTF-8" method="post">
		档案上传<input type="file" name="filedata"></input>
        <div style="clear:both; height:20px;"></div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-primary btn-save">保存</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        </div>
		</form>
    </div>
</div>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery.jqprint.js"></script>
<script src="${BASE_ASSETS_PATH}libs/jqprint/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
       //设置模态框高度和宽度
    //设置模态框高度和宽度
    $("#myModal .modal-dialog").width(750);
    $(".modal-body").css("height", ($(window).height() - 150) + "px");
    $(".modal-body").css("overflow-y", "scroll");

    function yu_print() {
        $("#xy-print").jqprint();
    }

</script>
