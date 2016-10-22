<#include "leftMenu.ftl"/>
<@override name="main_right">
<#setting date_format="yyyy-MM-dd HH:mm:ss">
<div class="container-fluid ycfx">
    <div  class="menu mt7 clearfix">
        <form action="${BASE_PATH}lqjc/searchLq.action" method="post">
            <!--            <div class="form-group clearfix fl">
                            <label for="ckhInput" class="control-label fl mt10">廒间列表:</label>
                            <select id="selsectAoJian" class="form-control fl" style="width:110px;" name="aoJianId">  
                                <option value="-1">全 部</option>  
                                <#if aoJianList??>
                                <#if aoJianList?size gt 0>
                                <#list aoJianList as aoJian>
                                <#if aoJian.aoJianIndex??>
                                <option value="${aoJian.zyAoJianNum}" <#if aoJian.zyAoJianNum == aoJianId>selected="selected"</#if>>${aoJian.aoJianIndex} 厫</option>  
                                </#if>
                                </#list>
                                </#if>
                                </#if>
                            </select>
                        </div>-->
            <input type="hidden"   name="aoJianId" value="${aoJian.zyAoJianNum}"/>
            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">时间段:</label>
                <input type="text" class="form-control fl"   id="datepicker-start"   placeholder="请选择开始时间" name="startDate" <#if startDate??>value="${startDate}</#if>"/>
            </div>
            <div class="form-group clearfix fl">
                <label for="ckhInput" class="control-label fl mt10">到:</label>
                <input type="text" class="form-control fl"   id="datepicker-last"   placeholder="请选择结束时间" name="endDate" <#if startDate??>value="${endDate}"</#if>/>
            </div>
            <input type="hidden" name="doSearch" value="do"/>
            <button type="submit" class="btn btn-success ml10" >查 询</button>
        </form>
    </div>
    <ul class="aojian-modle clearfix pt10">
        <#if doSearch?? && doSearch=="do">
        <#if aoJianDataList?? && aoJianDataList?size gt 0>
        <#list aoJianDataList as vo>
        <li  title="${disSelectName?default("当前无厫间信息")}" aria-label="${vo.barnIndex}">
            <div class="btn-group btn-group-xm" role="group" >
                <button type="button" class="btn bold
                        btn-default gray" style="border-radius:0px"
                        dataId="${vo.id}" startDate="${vo.StartDate}" aojianName="${disSelectName?default("")}" avgTem = "${vo.jwz}" avgHum="${vo.jsz}" onMouseOver="mouseoverShow(this, 'show-menu-1')">${vo.startDate?date}</button>
            </div>
        </li>
        </#list>
        <#else>
        <div class="alert alert-danger">该时间段没有粮情记录！</div>
        </#if>
        <#else>    
        <div class="alert alert-success">请输入条件搜索，并选择您想要编辑的粮情！</div>
        </#if>
    </ul>

    <div id="show-menu-1"  onMouseOut="mouseoverHide(this, 'show-menu-1')">
        <span class='fl bold'>操作粮情：</span>
        <a href="javascript:;" onclick="onclickHide('show-menu-1')"  class='glyphicon glyphicon-remove font-size-14 fr'></a><br>
        <div id="point-data"></div>
    </div>

    <div id="yu-pager" class="mt10">
        <#import "../macro_ftl/pager.ftl" as p>
        <#if recordCount??>   
        <#if doSearch??>
        <@p.pager pageNo=pageNo pageSize=60 recordCount=recordCount toURL=BASE_PATH+"lqjc/searchLq.action" 
        OtherParameter="doSearch="+doSearch+","+"startDate="+startDate+","+"endDate="+endDate+","+"aoJianId="+aoJianId />
        <#else>
        <@p.pager pageNo=pageNo pageSize=60 recordCount=recordCount toURL=BASE_PATH+"lqjc/searchLq.action" OtherParameter=""/>
        </#if>
        </#if>
    </div>
</div>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript">

            function afterOperate(isOk, operateId) {
                if (isOk) {
                    alert("删除成功");
                    location.reload();
                    $('#myModal').modal('hide');
                }
                else {
                    alert("请先删除掉关联数据，再进行删除操作");
                }
            }

            function mouseoverShow(obj, id) {
                var objDiv = $("#" + id + " ");
                $(objDiv).show();
                $(objDiv).css("top", ($(obj).offset().top - 17) + "px");
                $(objDiv).css("left", ($(obj).offset().left + 0) + "px");
                var p = '${BASE_PATH}' + 'lqjc/editLq.action?lqId=' + $(obj).attr("dataId");
                var editUrl = '${BASE_PATH}' + 'xtsz/confirmDeleteModel.action?deleteUrl=' + '${BASE_PATH}' + 'lqjc/deleteAoJianDataById.action?dataId=' + $(obj).attr("dataId");
                $(objDiv).find("div").empty();
                $(objDiv).find("div").append("均温：" + $(obj).attr("avgTem") + "℃<br>");
                $(objDiv).find("div").append("均湿：" + $(obj).attr("avgHum") + "%<br>");
                $(objDiv).find("div").append("<a  class='btn btn-primary btn-xs' href='" + p + "'>编辑 </a>"
                        + " <a  class='btn btn-primary btn-xs YL-ModalClick ml10' data-url= '" + editUrl + "' onclick='popUpModel(this)'> 删除</a>"
                        );
            }

            function popUpModel(btn) {
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
            function mouseoverHide(obj, id) {
                var e = window.event || obj;
                var s = e.toElement || e.relatedTarget;
                if (document.all) {
                    if (!obj.contains(s)) {
                        var objDiv = $("#" + id + "");
                        $(objDiv).hide();
                    }
                } else {
                    var res = obj.compareDocumentPosition(s);
                    if (!(res === 20 || res === 0)) {
                        var objDiv = $("#" + id + "");
                        $(objDiv).hide();
                    }
                }
            }

            function onclickHide(id) {
                var objDiv = $("#" + id + "");
                $(objDiv).hide();
            }

            //日期插件-只能选择过去日期
            $('#datepicker-last').datepicker({
                format: 'yyyy-mm-dd',
                showMeridian: true,
                todayBtn: true,
                autoclose: true
            }).on('changeDate', function (ev) {
                var startTime = $("#datepicker-start")[0].value;
                var endTime = $("#datepicker-last")[0].value;
                if (startTime != "") {
                    if (endTime < startTime) {
                        alert(" 结束时间不能小于开始时间 ！");
                        $("#datepicker-last").focus();
                    }
                }
            });
            $('#datepicker-start').datepicker({
                format: 'yyyy-mm-dd',
                showMeridian: true,
                autoclose: true
            }).on('changeDate', function (ev) {
                var startTime = $("#datepicker-start")[0].value;
                var endTime = $("#datepicker-last")[0].value;
                if (endTime != "") {
                    if (endTime < startTime) {
                        alert(" 开始时间不能大于结束时间 ！");
                        $("#datepicker-start").focus();
                    }
                }
            });
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
