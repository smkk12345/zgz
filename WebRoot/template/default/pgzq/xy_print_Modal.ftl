
<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">打印协议</h4>
</div>
<div class="modal-body xy-print-con">
    
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