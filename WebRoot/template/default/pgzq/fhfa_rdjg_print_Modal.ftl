<div class="modal-header clearfix">
    <h4 class="modal-title pull-left m0">查看认定结果确认一览表</h4>
    <div class="fr">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary btn-save" onclick="yu_print()">打印</button>
    </div>
</div>
<div class="modal-body ">
    <div class="container-fluid fhfa-rdjg-print-con" id="xy-print">
        <table class="table table-bordered">
            <tr>
                <td colspan="8" class="center">
                    <div class="title">张三认定结果确认一览表</div>
                    <div class="title-x">
                        征收编号： &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  打印日期：2016-11-15
                    </div>
                    
                </td>
            </tr>
            <tr>
                <td colspan="8" class="title2">
                    一、被征收人/承租人和房屋基本情况
                </td>
            </tr>
            <tr>
                <td colspan="2">姓名</td>
                <td>张三</td>
                <td>身份证号</td>
                <td>410222198100112564</td>
                <td>房屋坐落</td>
                <td colspan="2">淮阳饭店东侧-550号</td>
            </tr>
            <tr>
                <td colspan="2">使用面积</td>
                <td>15.00</td>
                <td>确认建筑面积</td>
                <td>19.995</td>
                <td>评估基准价格</td>
                <td colspan="2">5008.05</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
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