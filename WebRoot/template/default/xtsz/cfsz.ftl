
<#include "leftMenu.ftl"/>
<#include "../macro_ftl/xtszList.ftl">
<@override name="main_right">
<div class="container-fluid cfsz-xtsz">
    <ul class="nav nav-pills menu mb5 clearfix">
        <#if role.roleAuthority[7]=="2">
        <li role="presentation" class="pull-left active"><a class="fr" href="#" data-url="${BASE_PATH}xtsz/barnModal.action"  onclick="addBarnBtnClick(this)"
        title="点击添加仓房"><span class="glyphicon glyphicon-plus white"></span> 添加仓房</a></li>
        </#if>
    </ul>
    <form class="cang-qu form-horizontal" >
        <div class="container-fluid mt7">
            <div class="aojian" id="barnCont" aaab="aaaaab">
                <@BarnList barnList/>
            </div>
        </div>
    </form>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">

	//添加仓房按钮被点击事件
	function addBarnBtnClick(btn){
		var sensorArrangementBeanCount = '${sensorArrangementBeanCount}';
		if(sensorArrangementBeanCount>0){
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
		}else{
			alert("请先添加传感器布置信息");
		}
	}
	
    //$(".cang-qu").css("height", ($(window).height() - 140) + "px");
    function saveClick(btn) {
        var url = $(btn).attr("data-url");
        var outTime = $(".dmDate")[0].value;
        $.ajax({
            type: "POST",
            url: url,
            data: {outTime: outTime},
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            },
            success: function (response) {
                location.reload();
            }
        });
    }
    function save(btn) {
        var url = $(btn).attr("data-url");
        alert(url);
        var dataInfo = $("#aoJianForm").serialize();
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            dataType: "json",
            data: dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            },
            success: function (response) {
                location.reload();
            }
        })
    }

    function aoJianEditClick(obj, type) {
        var url = $(obj).attr("data-url");
        if (type == "import") {
            if (yu_confirm("确认进行粮食入仓操作？")) {
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
        }
        else {
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
    }
    //编辑仓房
    function editBarn(btn) {
        var url = $(btn).attr("base-url");
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

    function getSelectIdStrs() {
        var idStrs = "";
        $("input:checkbox").each(function () {
            if ($(this)[0].checked) {
                var barnId = $(this).attr("barnid");

                idStrs = idStrs + barnId + "#";
            }
        });
        idStrs = idStrs.substr(0, idStrs.length - 1);
        return idStrs;
    }

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
	 function afterOperate(isOk,operateId){
    	if(isOk){
    		alert("删除成功");
    		$("#" + operateId).remove();
    		$('#myModal').modal('hide');
    	}
    	else{
    		alert("请先删除掉关联数据，再进行删除操作");
    	}
    }
	
    function saveClickaaaa(bean) {
        var url = $(btn).attr("data-url");
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            dataType: "json",
            data: bean,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {

            }
        });
    }

    $(function () {
        var dragObj = null;
        var bool = false;
        var offsetX = 0;
        var offsetY = 0;
        $(".drigging").mouseover(function () {
            $(this).css('cursor', 'move');
        });
        $(".drigging").mousedown(function () {

            dragObj = $(this);
            if (bool === true) {
                bool = false;
                //save();
                var bean = dragObj.attr("bean");
                //bean.xPos = dragObj.style.left;
                //bean.ypos = dragObj.style.top;
                //saveClick(dragObj.attr("bean"));
            }
            else {
                bool = true;
            }
            if (dragObj === null) {
                alert("aaa");
            }
            var yuanX = event.target.offsetLeft;
            var yuanY = event.target.offsetTop;

            offsetX = event.clientX;
            offsetY = event.clientY;

            offsetX = offsetX - yuanX;
            offsetY = offsetY - yuanY;

            $(this).css('cursor', 'move');
        }).mouseup(function () {
            //bool=false;

        });
        $(document).mousemove(function () {
            if (!bool)
                return;
            if (dragObj !== null) {
                var x = event.clientX - 70;
                var y = event.clientY - 85;

                dragObj.css("left", x);
                dragObj.css("top", y);
                dragObj.css('cursor', 'move');
            }
        });
    });

    function closeClick(btn) {
        var dataInfo = $("#barnForm").serialize();
        var url = $(btn).attr("data-url");
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            dataType: "json",
            data: dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                var bean = response.bean;
                var url = response.url;
                var editUrl = response.editUrl;
                var add = response.add;
                var beanId = "#" + bean.id;
                if (add === true) {
                    var innerHtml = getAddAoJianInnerHtml(bean);
                    $("#barnCont").append(innerHtml);
                }
                else {
                    $("#barnCont").append(innerHtml);
                }
                $('#myModal').modal('hide');
            }

        });
    }
    function getAddAoJianInnerHtml(bean) {
        var aoJianClass = "aojian-" + bean.aoJianCount;
        var innnerHtml = "" +
                " <div class='drigging' draggable='true' style='top:" + bean.yPos + "px; left:" + bean.xPos + "px;>" +
                "<div class='" + aoJianClass + " aojian-commen ' >" +
                "<div class='top'>" +
                "<div class='top-left'></div>" +
                "<div class='top-middle'>" +
                "<a href='#'><span class='warning-info'><span class='glyphicon glyphicon-exclamation-sign'></span>高水分</span></a>" +
                "</div>" +
                "<div class='top-right'></div>" +
                "</div>" +
                "<div class='middle'>" +
                "<a href='${BASE_PATH}lqjc/ssjc.action?a=1/1' title='1/2'>" +
                "<div class='middle-left ao-warning'><span class='title'>1#</span>" +
                "</div>" +
                "</a>" +
                "<div class='middle-right'></div>" +
                "<p class='title'>" + bean.barnIndex + "</p>" +
                "</div>" +
                "</div>" +
                "</div>";
        return innnerHtml;
    }
</script>