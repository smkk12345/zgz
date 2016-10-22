<!--检测设备布置-->
<#include "leftMenu.ftl"/>
<#include "../macro_ftl/xtszList.ftl">
<@override name="main_right">
<div class="container-fluid">
    <ul class="nav nav-pills menu">
        <#include "lqpzMenu.ftl"/>
        <li role="presentation" class="pull-right"></li>
    </ul>
    <table class="table table-hover table-condensed  mt10" id="userTable" contenteditable="true">
        <tr class="info">
            <th>序号</th>
            <th>布置方式名称</th>
            <th>检测设备类型</th>
            <th>检测设备名称</th>
            <th>布置标准</th>
            <th>操作</th>
        </tr>
        <tbody id="userTableBody">
            <@SensorArrangementList sensorArrangementBeanList/>
        </tbody>
    </table>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">

	function popUpModel(btn){
	 	$('#myModal').modal({
            keyboard: false
        });
        $(".modal-content").load(
                $(btn).attr("data-url"), {name: "yl", title: "ly"},
        //Modal
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').focus();
        })
       );
	}
	
    //上一步
    function backStepClick(btn) {
        var url = $(btn).attr("data-url");
        nextModel(url);
    }
    //下一步 点击
    function nextStep0Click(btn) {
        var arrangeId = $("#sensorTypeSelector").find("option:selected").attr("dataid");
        var url = $(btn).attr("data-url") + "&arrangeId=" + arrangeId;
        nextModel(url);
    }
    function save(btn) {
        var url = $(btn).attr("data-url");
        var dataInfo = $("#arrangeForm1").serialize();
        var sensorId = $("#sensorSelector").find("option:selected").attr("dataid");
        var positionInfo = $("#positionSelector").find("option:selected").val();
        var cableDirection = $("#typeSelector").find("option:selected").val();

        dataInfo = dataInfo + "&sensorId=" + sensorId + "&positionInfo=" + positionInfo + "&cableDirection=" + cableDirection;
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            data: dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                var arrangeId = response;
                var url = '${BASE_PATH}' + "xtsz/jcsbbzModal2.action?sensorArrangementId=" + arrangeId;
                nextModel(url);
            }
        })
    }
    function nextModel(url) {
        $(".modal-dialog ").css("width", ((13 + 1) * 52) + 110 + "px");
        $(".modal-dialog ").css("height", (2 + 1) * 55 + 100 + "px");
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
    }

    function closeBtn(btn) {
        var url = '${BASE_PATH}' + "xtsz/refleshSensorArrangement.action";
        $.ajax({
            type: "POST",
            url: url,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                $("#userTableBody").empty().append(response);
                $('#myModal').modal('hide');
            }
        })
    }

    function saveClick(btn) {
        //选择的id
        var sensorId = $("#sensorSelector").find("option:selected").attr("dataId");
        var sensorType = $("#sensorTypeInput").val();
        var arrangementName = $("#arrangementNameInput").val();
        var positionInfo = $("#positionSelector").find("option:selected").val();
        var url = $(btn).attr("data-url");
        var sensorArrangementId = $("#sensorArrangementId").val();

        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            dataType: "json",
            data: {sensorId: sensorId, sensorType: sensorType, arrangementName: arrangementName, positionInfo: positionInfo, sensorArrangementId: sensorArrangementId},
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                var bean = response.bean;
                var isAdd = response.add;
                var innerHtml = "";
                if (isAdd) {
                    innerHtml = ""
                            + "<tr class='table_ModalDbClick active' id=" + bean.id + "  data-url='${BASE_PATH}user/sensorArrangementModal.action?sensorArrangementId=" + bean.id + "'>"
                            + "<td>" + bean.sensor.sensorName + "</td>"
                            + "<td>" + bean.arrangementName + "</td>"
                            + "<td>" + bean.sensor.sensorType + "</td>"
                            + "<td>"
                            + "<button type='button' class='btn btn-primary btn-xs ml10'  onClick='editBtnClick(this)' data-url='${BASE_PATH}xtsz/jcsbbzModal.action?sensorArrangementId=" + bean.id + "'>详情</button>"
                            + "<button type='button' class='btn btn-primary btn-xs ml10'  onClick='editBtnClick(this)' data-url='${BASE_PATH}xtsz/aoJianSelectedModal.action?sensorArrangementId=" + bean.id + "'>布置范围</button>"
                            + "<button type='button' class='btn btn-primary btn-xs ml10'  onClick='editBtnClick(this)' data-url='${BASE_PATH}xtsz/sensorArrangementModal.action?sensorArrangementId=" + bean.id + "'>编辑</button>"
                            + "<button type='button' class='btn btn-primary btn-xs ml10'  onClick='delBtnClick(this)' data-url='${BASE_PATH}xtsz/delSensorArrangement.action?sensorArrangementId=" + bean.id + "'>删除</button>"
                            + "</td>" +
                            +"</tr>";

                    $("#userTableBody").append(innerHtml);
                } else {
                    innerHtml = ""
                            + "<td>" + bean.sensor.sensorName + "</td>"
                            + "<td>" + bean.arrangementName + "</td>"
                            + "<td>" + bean.sensor.sensorType + "</td>"
                            + "<td>"
                            + "<button type='button' class='btn btn-primary btn-xs ml10'  onClick='editBtnClick(this)' data-url='${BASE_PATH}xtsz/jcsbbzModal.action?sensorArrangementId=" + bean.id + "'>详情</button>"
                            + "<button type='button' class='btn btn-primary btn-xs ml10'  onClick='editBtnClick(this)' data-url='${BASE_PATH}xtsz/aoJianSelectedModal.action?sensorArrangementId=" + bean.id + "'>布置范围</button>"
                            + "<button type='button' class='btn btn-primary btn-xs ml10'  onClick='editBtnClick(this)' data-url='${BASE_PATH}xtsz/sensorArrangementModal.action?sensorArrangementId=" + bean.id + "'>编辑</button>"
                            + "<button type='button' class='btn btn-primary btn-xs ml10'  onClick='delBtnClick(this)' data-url='${BASE_PATH}xtsz/delSensorArrangement.action?sensorArrangementId=" + bean.id + "'>删除</button>"
                            + "</td>"

                    var id = "#" + bean.id;
                    $(id).empty().append(innerHtml);
                }
                $('#myModal').modal('hide');
            }
        })
    }
    
   function afterOperate(isOk,operateId){
    	if(isOk){
    		alert("删除成功");
    		location.reload();
    		$('#myModal').modal('hide');
    	}
    	else{
    		alert("请先删除掉关联数据，再进行删除操作");
    	}
    }
    
    //编辑布置
    function editBtnClick(btn) {
        $('#myModal').modal({
            keyboard: false
        });
        $(".modal-content").load(
                $(btn).attr("data-url"), {name: "yl", title: "ly"},
        //Modal
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').focus();
        })
                );
    }

    //获取颜色为绿色的选择状态下的廒间信息
    function getAoJianIndexStrs() {
        var aoJIanIndexStrs = "";
        $("#aojian .btn-success").each(function () {
            var aoJianId = $(this).attr("dataId");
            var barnIndex = $(this).attr("barnIndex");
            var aoJianIndex = $(this).attr("aria-label");
            aoJIanIndexStrs = aoJIanIndexStrs + aoJianId + "#";
        });
        aoJIanIndexStrs = aoJIanIndexStrs.substr(0, aoJIanIndexStrs.length - 1);
        return aoJIanIndexStrs;
    }

    function updateAoJianArrangement(btn) {
        var ids = getAoJianIndexStrs();
        var url = $(btn).attr("data-url");
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            dataType: "json",
            data: {"ids": ids},
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                $('#myModal').modal('hide');
            }
        })
    }
</script>