<#include "leftMenu.ftl"/>
<@override name="main_right">
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/three.min.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/Projector.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/CanvasRenderer.js"></script>
<script src="${BASE_ASSETS_PATH}libs/mrdoob-three/stats.min.js"></script>
<script src="${BASE_ASSETS_PATH}js/ssjcyu3d.js"></script>
<script src="${BASE_ASSETS_PATH}js/ssjc0.js"></script>
<div class="container-fluid ssjc">
    <#if aoJian??>
    <#if aoJian.grainStatus?? && aoJian.grainStatus == '1'>
    <#if lqData??>
    <ul class="nav nav-pills menu">
        <#include "ssjcMenu.ftl"/>
        <li role="presentation" class="pull-right">
            <button type="button"  class="btn btn-info pull-right ml5 ljssjc" onclick="realDetection()" title="实时检测"><span class="bold">实时检测</span></button>
            <button type="button" class="btn btn-info dropdown-toggle YL-ModalClick pull-right ml5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-url='${BASE_PATH}lqjc/lqModal.action' title="选择粮情，默认为最新粮情"><span class="bold">历史粮情:</span> <i class="bold">${lqtime}</i></button>
            <select class="form-control width-80px pull-right" id="WSS-Select">
                <option value="wd">温度</option>
                <option value="sd">湿度</option>
                <option value="sf">水分</option>
            </select>
        </li>
    </ul>
    <div id="yu-3d">
        <div class="yu-3d-con">
            <div class="c-3d-left c-3d-${fangxiang}"></div>
            <div class="c-3d-mid"></div>
            <div class="c-3d-right"></div>
        </div>
        <#list lqData as vo>
        <div class="ceng ceng-${vo_index+1}" id="c${vo_index+1}">
            <#list vo as voo>
            <ul class="hang" id="h${voo_index+1}">
                <!--<li class="h-title point-3d">(${voo_index+1})行</li>-->
                <#list voo as vooo> 
                <#if vooo.wd?string !="">
                <li class="point-3d  
                    <#if (vooo.wd)??>
                    <#if vooo.wd?string =="无">
                    warning label-war-wd
                    <#else>
                    <#if vooo.wd?number gte alarms.tem.maxAttri>
                    warning label-war-wd 
                    <#else> 
                    commen 
                    </#if> 
                    </#if> 
                    </#if>"
                    id='${vo_index+1}${voo_index+1}${vooo_index+1}' c='${vo_index+1}' h='${voo_index+1}' l='${vooo_index+1}' wd='${vooo.wd}' sd='${vooo.sd}' sf='${vooo.sf}' xyz='${vooo.xyz}' path='${BASE_PATH}lqjc/shouPointDetail.action' onMouseOver="mouseoverShow(this, 'show-point-data')" temAvg='${temAvg}' maxAttri='${alarms.tem.maxAttri}' gtAverageAttri='${alarms.tem.gtAverageAttri}'>
                    ${vooo.wd}
                </li>
                <#else>
                <li class="point-3d"  id='${vo_index+1}${voo_index+1}${vooo_index+1}'></li>
                </#if>
                </#list>
            </ul>
            </#list>
        </div>
        </#list>

        <#list 1..arrangementBean.layerCount as c>
        <button type="button" title='点击查看该层云图' href="javascript:showCloudPic(this);" class="btn btn-info btn-sm YL-ModalClick ctitle" idn='${c_index+1}' id="ctitle-${c_index+1}" data-url='${BASE_PATH}lqjc/ytfxModal.action?lqId=${lqID}&ytType=1&curSection=c${c_index+1}'>层${c_index+1}</button>
        </#list>
        <#list 1..arrangementBean.rowCount as h>
        <#if fangxiang=="EastWest">
        <button type="button" title='点击查看该层云图' href="javascript:showCloudPic(this);" class="btn btn-info btn-sm YL-ModalClick htitle" idn='${h_index+1}' id="htitle-${h_index+1}" data-url='${BASE_PATH}lqjc/ytfxModal.action?lqId=${lqID}&ytType=1&curSection=h${h_index+1}'>行${h_index+1}</button>
        <#else>
        <button type="button" title='点击查看该层云图' href="javascript:showCloudPic(this);" class="btn btn-info btn-sm YL-ModalClick htitle" idn='${h_index+1}' id="htitle-${h_index+1}" data-url='${BASE_PATH}lqjc/ytfxModal.action?lqId=${lqID}&ytType=1&curSection=h${h_index+1}'>${arrangementBean.rowCount-h_index}</button>
        </#if>
        </#list>
        <#list 1..arrangementBean.columnCount as l>
        <button type="button" title='点击查看该层云图' href="javascript:;" class="btn btn-info btn-sm YL-ModalClick ltitle" idn='${l_index+1}' id="ltitle-${l_index+1}" data-url='${BASE_PATH}lqjc/ytfxModal.action?lqId=${lqID}&ytType=1&curSection=l${l_index+1}'>列${l_index+1}</button>
        </#list>

    </div>
    <div class="r-infor">
        <div class="panel-heading bold">整体情况</div>
        <div class="panel-body shuoming">
            <#if temAvg?number gte alarms.tem.averageAttri>
            <i class='red'>粮堆整体不安全！</i>
            <#else>
            粮堆整体安全！
            </#if>
        </div>
        <div class="panel-heading bold">报警图例</div>
        <ul class="panel-body shuoming">                           
            <li><span class="label label-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>：全部正常</li>
            <li><span class="label label-war-wd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>：温度异常</li>
<!--            <li><span class="label label-war-sd">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>：湿度异常</li>-->
            <li><span class="label label-war-sf">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>：水分异常</li>
<!--            <li><span class="label label-war-all">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>：多项异常</li>-->
        </ul>
        <div class="zhibeizhen">
            <div class="zbz-tu ${fangxiang}"></div>
            <div class="zbz-title"><i>指北针</i>
                <!--                <p>说明：依据行业规范对平房仓东南角的确定方法，以及仓房檐墙与正北方向的夹角，将所有仓房近似简化成"东西向"和"南北向"两种情况。</p>-->
            </div>
        </div>
        <div class="panel-heading bold mt10">粮食主要信息</div>
        <ul class="">
            <li>仓容：${aoJian.aoJianGrainInfoBean.capacity}t</li>
            <li>品种：${grainTypeBean.grainType}</li>
            <li>水分：${aoJian.aoJianGrainInfoBean.storageMoisture}%</li>
            <li>级别：${aoJian.aoJianGrainInfoBean.level}</li>
            <li>容重：${aoJian.aoJianGrainInfoBean.unitWeight}t/m<sup>3</sup></li>
            <li>杂质：${aoJian.aoJianGrainInfoBean.impurity}%</li>
        </ul>
        <button type="button"  class="btn  YL-ModalClick mt5 btn-sm btn-primary mt10"  data-url='${BASE_PATH}lqjc/fdszModel.action' title="查看风道数据"><span class="bold">查看风道数据</span></button>
    </div>
    <div id="show-point-data"  onMouseOut="mouseoverHide(this, 'show-point-data')">
        <span class='fl bold'>该点详情</span><a href="javascript:;" onclick="onclickHide('show-point-data')"  class='glyphicon glyphicon-remove font-size-14 fr'></a><br>
        <div id="point-data"></div>
    </div>
    <#else>
    <div class="alert alert-danger">当前厫间无数据！</div>
    <button type="button"  class="btn btn-info pull-left ljssjc" onclick="realDetection()" title="立即检测一次粮情数据"><span class="bold">立即检测一次粮情数据</span></button>
    </#if>
    <#else>
    <div class="alert alert-danger">${disSelectName?default("")} 仓内没有粮食！</div>
    </#if>
    <#else>
    <#if hasdata??>
    <#if hasdata == "no">
    <div class="alert alert-danger">当前厫间无数据！</div>
    <button type="button"  class="btn btn-info pull-left ljssjc m10" onclick="realDetection()" title="立即检测一次粮情数据"><span class="bold">立即检测一次粮情数据</span></button>
    <#else>
    <div class="alert alert-danger">未选择厫间或当前用户未分配廒间！</div>
    </#if>
    <#else>
    <div class="alert alert-danger">未选择厫间或当前用户未分配廒间！</div>
    </#if>
    </#if>
</div>
<script type="text/javascript">
    function realDetection() {
        $("#yu-fade").html('');
        $("#yu-fade").html('<div id="wait" class="waitPic "></div>');
        $("#yu-fade").removeClass("hidden");

        var url = '${BASE_PATH}' + "lqjc/realTimeMonitoring.action";
        $.ajax({
            type: "POST",
            url: url,
            async: true,
            error: function (XMLHttpRequest, errorThrown) {
            },
            success: function (response) {
                if (response.success !== "false") {
                    if (response.hasNewData === "true") {
                        if (response.successTwo === "true") {
                            $(".ljssjc").attr("disabled", "disabled");
                             alert("恭喜您！实时数据采集成功！");
                             window.location.reload();
                        } else {
                            alert("实时数据采集失败！请检查数据连接！");
                        }
                    } else {
                        alert("传感器已(" + response.hasNewDataTime + ")连接异常，请检查数据线或电缆是否连接完好？");
                    }
                } else {
                    alert("实时数据采集失败，请检查数据库远程连接问题");
                }
                $("#yu-fade").html('');
                $("#yu-fade").addClass('hidden');
               
            }
        });
    }

    CallYu3D('${arrangementBean.layerCount}', '${arrangementBean.rowCount}', '${arrangementBean.columnCount}');
    function showCloudPic(btn) {
        $('#myModal').modal({
            keyboard: false
        });
        $(".modal-content").load(
                $(btn).attr("data-url"), {name: "yl", title: "ly"},
        //Modal
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').focus();
        }));
    }
</script>
</@override>
<@extends name = "../base/layout.ftl"/>
