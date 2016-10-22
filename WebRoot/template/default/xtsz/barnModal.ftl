<!--仓房布置-->
<div class="modal-header" id="barnModal">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <h4 class="modal-title  center" id="myModalLabel"><span class="form-group autoGroup fl">
        </span>
        <#if bean.id??>
        编辑仓房信息
        <#else>
        新增仓房
        </#if>
    </h4>
</div>
<div id="barnHead" beanId="${bean.id}" isAdd="${add}">
    <div class="modal-body" style="height:auto;">
        <form id="barnForm" action="" method="post">
            <div class="container-fluid mb10" >
                <div class="  autoGroup fl "> 
                    <label class="control-label required" for="barnIndex">仓房编号:</label>
                    <div class="width-170px fl">
                        <input type="text" class="form-control required width-160px" name="barnIndex" id="barnIndex" value="${bean.barnIndex?default("")}"  errorMsg="仓房编号不能为空"   placeholder="仓房编号"/>
                        <div class="cl"></div>
                    </div>
                </div>
                <div class="  autoGroup fl"> 
                    <label class="control-label required" for="aoJianCount">廒间数:</label>
                    <div class="width-170px fl">
                        <#if bean.aoJianCount??>
                        ${bean.aoJianCount} 个 <input type="hidden" value="${bean.aoJianCount}" name="aoJianCount">
                        <#else>
                        <input type="text" class=" form-control required width-160px" name="aoJianCount" id="aoJianCount" value="" errorMsg="廒间数量不能为空"  placeholder="廒间数"/>
                        </#if>
                        <span class="center mt5">(注：设定后不能修改)</span>
                        <div class="cl"></div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mb10">
                <div class="  autoGroup fl">
                    <label class="fl control-label required" for="length">长:</label>
                    <div class="width-170px fl">
                        <input type="text" class="form-control fl required width-160px" name="length" id="length" errorMsg="仓房长度不能为空" value="${bean.length?default('')}" placeholder="长"/>  
                        <div class="cl"></div> 
                    </div>     
                </div>

                <div class="  autoGroup fl">      
                    <label class="fl control-label required">宽:</label>
                    <div class="width-170px fl">
                        <input type="text" class="form-control required width-160px " name="width" value="${bean.width?default("")}"  errorMsg = "仓房宽度不能为空" placeholder="宽"/>
                        <div class="cl"></div>   
                    </div>     
                </div>
            </div>
            <div class="container-fluid mb10">        
                <div class="  autoGroup fl mb10"> 
                    <label class="fl control-label required" for="angle">角度:</label>
                    <div class="width-170px fl">
                        <input type="text" class="form-control fl required width-160px " name="angle" id="angle" errorMsg="仓房角度不能为空" value="${bean.angle?default("")}"  placeholder="角度"/>
                        <div class="cl"></div>
                    </div>
                </div>
                <div class="autoGroup fl"> 
                    <div class="mt10">注：檐墙与正北的夹角,顺时针为正，-90~90度。</div>
                </div>
            </div>
           	<div class="container-fluid mb10">
                <div class="  autoGroup fl">
                    <label class="fl control-label" for="xPos">零点的绝对坐标x:</label>
                    <div class="width-170px fl">
                        <input type="text" class="form-control fl width-160px" name="xPos" id="xPos"  value="${bean.xPos?default('')}" placeholder="零点的绝对坐标x"/>  
                        <div class="cl"></div> 
                    </div>     
                </div>

                <div class="  autoGroup fl">      
                    <label class="fl control-label" for="yPos">零点的绝对坐标y:</label>
                    <div class="width-170px fl">
                        <input type="text" class="form-control width-160px " name="yPos" id="yPos" value="${bean.yPos?default("")}"  placeholder="零点的绝对坐标y"/>
                        <div class="cl"></div>   
                    </div>     
                </div>
            </div>
            <input  type="text" name="barnId" value="${bean.id?default("")}" class="display-none" />
        </form>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-primary " id="send" data-url="${BASE_PATH}/xtsz/saveBarnInfo.action"  >保存并下一步</button>
    </div>
</div>

<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}libs/bootstrap-datepicker/js/locales/bootstrap-datepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript" src="${BASE_ASSETS_PATH}js/ValidateForm_xuqiu.js" charset="UTF-8"></script>
<script type="text/javascript">
    //仓房编号唯一性验证ajax代码
    function barnIndexinValidate(barnIndex) {
        var url = '${BASE_PATH}' + "xtsz/isRepeatBarnIndex.action?barnIndex=" + barnIndex + "&barnId=" + '${bean.id?default("")}';
        var isExist = false;
        $.ajax({
            type: "POST",
            url: url,
            async: false,
            error: function (XMLHttpRequest, errorThrown) {
            },
            success: function (response) {
                if (response.isExist) {
                    isExist = true;
                }
                else {
                    isExist = false;
                }
            }
        })
        return isExist;
    }
    //上一步
    function upStep() {
        $("#barnHead").removeClass("display-none");
        $("#aoJianModal").addClass("display-none");
    }

    function initDate() {
        $(".dmDate").datepicker({
            format: 'yyyy-mm-dd'
        });
    }
    function showDetail(aLink) {
        if ($(aLink).find("span").hasClass('glyphicon-menu-up')) {
            $(aLink).find("span").removeClass().addClass("glyphicon glyphicon-menu-down blue");
        }
        else {
            $(aLink).find("span").removeClass().addClass("glyphicon glyphicon-menu-up blue");
        }
        var attr = $(aLink).attr("data-url");
        $("#" + attr).toggle();
    }

    function save(btn) {
        var dataInfo = $("#barnForm").serialize();
        var url = $(btn).attr("data-url");
        $.ajax({
            type: "POST",
            url: url,
            data: dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(errorThrown);
            },
            success: function (response) {
                var bean = response.bean;
                var url = '${BASE_PATH}' + "xtsz/editAoJianModal.action?barnId=" + bean.id;
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
        })
    }

    function addAoJianInfo(bean) {

        $("#barnHead").addClass("display-none");
        $("#aoJianModal").removeClass("display-none");
        var innerHtml = "";
        var count = parseInt(bean.aoJianCount);
        for (var i = 0; i < count; i++) {
            //innerHtml = innerHtml + getAddAoJianInnerHtml(bean.aoJianSet[i],i)	;
        }
        $("#aoJianListDiv").empty().append(innerHtml);
    }

    function getLocalTime(nS) {
        return new Date(parseInt(nS)).toLocaleString().replace(/年|月/g, "-").replace(/日/g, " ");
    }

    function editAoJianClick(btn) {
        var formId = $(btn).attr("data-formId");
        $("#" + formId + " input").removeAttr("disabled");
    }

    function saveAoJianClick(btn) {
        var url = $(btn).attr("data-url");
        var formId = $(btn).attr("data-formId");
        var dataInfo = $("#" + formId).serialize();
        var val = $('#selectGrainType option:selected').attr("grainId");

        dataInfo = dataInfo + "&grainType=" + val;
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            dataType: "json",
            data: dataInfo,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
            },
            success: function (response) {
                $("#" + formId + " input").attr("disabled", "disabled");//再改成disabled 
            }
        })
    }
</script>