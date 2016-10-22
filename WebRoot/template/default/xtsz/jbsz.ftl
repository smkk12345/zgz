'<#include "leftMenu.ftl"/>
<#include "../macro_ftl/xtszList.ftl">
<@override name="main_right">
<div class="container-fluid xtsz">
    <#if role.id=="5" || role.id=="1" || role.id=="2">
    <div class="panel panel-default ">
        <div class="panel-heading">基本设置</div>
        <div class="panel-body">
            <form class="width-100-" id="baseInfo">
                <div class="form-group fl">
                    <label for="ckhInput" class="control-label fl">粮库名称:</label> 
                    <input type="text" class="form-control fl width-350px" id="lkNameInput" name="lkmc" value="${lkmc?default("")}"
                           placeholder="粮库名称">
                </div>
                <div class="form-group fl">
                    <label for="btlInput" class="control-label  fl">所在省份:</label> 
                    <select id="selectProvince" class="form-control fl width-110px" name="所在省份索引" >  
                        <option value="-1">请选择省份</option>  
                    </select>
                </div>
                <div class="form-group fl">
                    <label for="btlInput" class="control-label  fl">所在市区:</label> 
                    <select id="selectCity" class="form-control fl width-110px" name="所在市区索引">  
                        <option value="-1">请选择城市</option>  
                    </select>
                </div>
            </form>
            <div class="form-group fl">
                <button class="btn btn-primary ml10 fl baseInfoBtn" formName="baseInfo" data-url="${BASE_PATH}xtsz/saveBaseSettingInfo.action" onclick="saveBaseSettingClick(this)">保存</button>
            </div>
        </div>
    </div>
    </#if>
    <#if role.id=="5">
	 <div class="panel panel-default ">
	        <div class="panel-heading">区域划分</div>
	        <div class="panel-body">
	            <form class="width-100-" id="areaDevideForm">
	                <div class="form-group fl">
	                    <label for="btlInput" class="control-label  fl">划分方式一:</label> 
	                    <select id="selectProvince" class="form-control fl width-200px" name="qyhf1" >  
	                    	<option value="-1">请选择所在区域</option>  
	                        <option value="south" <#if qyhf1??><#if qyhf1=="south">selected='selected'</#if></#if>>南方</option>  
               				<option value="north" <#if qyhf1??><#if qyhf1=="north">selected='selected'</#if></#if>>北方</option>  
	                    </select>
                    </div>
	               	<div class="form-group fl">
	                    <label for="btlInput" class="control-label  fl">划分方式二:</label> 
	                    <select id="selectProvince" class="form-control fl width-200px" name="qyhf2" >  
	                        <option value="-1">请选择所在区域</option>  
	                        <option value="northEast" <#if qyhf2??><#if qyhf2=="northEast">selected='selected'</#if></#if>>东北</option>  
	                        <option value="northChina" <#if qyhf2??><#if qyhf2=="northChina">selected='selected'</#if></#if>>华北</option>  
	                        <option value="south" <#if qyhf2??><#if qyhf2=="south">selected='selected'</#if></#if>>南方</option>  
	                    </select>
                    </div>
                    <div class="form-group fl">
	                    <label for="btlInput" class="control-label  fl">划分方式三:</label> 
	                    <select id="selectProvince" class="form-control fl width-200px" name="qyhf3" >  
	                        <option value="-1">请选择所在区域</option>  
	                        <option value="first" <#if qyhf3??><#if qyhf3=="first">selected='selected'</#if></#if>>第一生态区</option>  
	                        <option value="second" <#if qyhf3??><#if qyhf3=="second">selected='selected'</#if></#if>>第二生态区</option>  
	                        <option value="third" <#if qyhf3??><#if qyhf3=="third">selected='selected'</#if></#if>>第三生态区</option>  
	                        <option value="forth" <#if qyhf3??><#if qyhf3=="forth">selected='selected'</#if></#if>>第四生态区</option>  
	                        <option value="fifth" <#if qyhf3??><#if qyhf3=="fifth">selected='selected'</#if></#if>>第五生态区</option>  
	                        <option value="sixth" <#if qyhf3??><#if qyhf3=="sixth">selected='selected'</#if></#if>>第六生态区</option>  
	                        <option value="seventh" <#if qyhf3??><#if qyhf3=="seventh">selected='selected'</#if></#if>>第七生态区</option>  
	                    </select>
                    </div>
	            </form>
	            <div class="form-group fl">
	                <button class="btn btn-primary ml10 fl"  data-url="${BASE_PATH}xtsz/saveAreaDevide.action" onclick="saveAreaDevide(this)">保存</button>
	            </div>
	        </div>
	    </div>
	</#if>
    <div class="panel panel-default">
        <div class="panel-heading"><span class="fl clearfix">粮食品种列表</span>
            <#if role.roleAuthority[6]=="2">
<!--            <a class="fr YL-ModalClick" href="#" data-url="${BASE_PATH}xtsz/grainTypeModal.action" title="点击添加"><span class="glyphicon glyphicon-plus blue"></span> 新 增</a>-->
            </#if>
        </div>
        <div class=" panel-body">
            <form  id="grainList" >
                <@GrainList grainList/>
            </form>
       	</div>
    </div> 
    
    <div class="panel panel-default">
        <div class="panel-heading"><span class="fl clearfix">主题色调</span></div>
        <div class="panel-body">
            <form class="width-100-">
                <div class="form-group">
                    <label for="ckhInput" class="control-label fl">主题:</label> 
                    <div class="btn-group dropup">
                        <button class="btn btn-default dropdown-toggle themeBtn" type="button" 
                        id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              ${theme?default("默认" )}
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu yu-drop-menu" role="menu">
                            <li><a href="#">默认</a></li>
                            <li><a href="#">深蓝科技</a></li>
                            <li><a href="#">青花瓷韵</a></li>
                            <li><a href="#">萌芽新绿</a></li>
                            <li><a href="#">金属质感</a></li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </div>    
	<#if role.id=="5">
    <div class="panel panel-default">
        <div class="panel-heading">串口设置</div>
        <div class="panel-body">
            <form class="width-100-" id="chuanKou" method="post">
                <div class="form-group fl">
                    <label for="ckhInput" class="control-label fl">串口号:</label> <input
                        type="text" class="form-control fl" id="ckhInput" value="${ckh?default("COM5")}"
                        placeholder="串口号" name="ckh">
                </div>
                <div class="form-group fl">
                    <label for="btlInput" class="control-label  fl">波特率:</label> <input
                        type="text" class="form-control  fl" id="btlInput" value="${btl?default("9600")}"
                        placeholder="波特率" name="btl">
                </div>
                <div class="form-group fl">
                    <label for="jywInput" class="control-label  fl">校验位:</label> <input
                        type="text" class="form-control  fl" id="jywInput"  value="${xyw?default("")}"
                        placeholder="校验位" name="xyw">
                </div>
                <div class="form-group fl ">
                    <label for="tzwInput" class="control-label  fl">数据位:</label> <input
                        type="text" class="form-control  fl" id="tzwInput" value="${sjw?default("8")}"
                        placeholder="数据位" name="sjw">
                </div>
                <div class="form-group fl">
                    <label for="sjwInput" class="control-label  fl">停止位:</label> <input
                        type="text" class="form-control  fl" id="sjwInput"  value="${tzw?default("1")}"
                        placeholder="停止位" name="tzw">
                </div>
            </form>
            <div class="form-group fl ">
                <button  class="btn btn-primary ml10 fl chuanKouBtn" formName="chuanKou" data-url="${BASE_PATH}xtsz/saveBaseSettingInfo.action" 
                         onclick="saveBaseSettingClick(this)">保存
                </button>
            </div>
        </div>
    </div>
     <div class="panel panel-default">
        <div class="panel-heading">数据配置</div>
        <div class="panel-body">
            <form class="width-100-" id="sjk" method="post">
                <div class="form-group fl">
                    <label for="ckhInput" class="control-label fl">数据库名称:</label> <input
                        type="text" class="form-control fl width-150px" id="ckhInput" value="${sjk?default("")}"
                        placeholder="数据库名称" name="sjk">
                </div>
               	<div class="form-group fl">
                    <label for="dqtdh" class="control-label fl">大气探点号(,号隔开):</label> 
                    <input type="text" class="form-control fl width-150px ml20" id="dqtdh" value="${dqtdh?default("")}" placeholder="大气探点号，以逗号隔开" title="大气探点号，以逗号隔开" name="dqtdh">
                </div>
                <div class="form-group fl">
                    <label for="cacheTime" class="control-label fl">缓存时间(小时):</label> 
                    <input type="text" class="form-control fl width-70px ml20" id="cacheTime" value="${cacheTime?default("")}" placeholder="缓存时间" title="缓存时间" name="cacheTime">
                </div>
                <div class="form-group fl">
                    <label for="blsj" class="control-label fl">数据保留时间(天):</label> 
                    <input type="text" class="form-control fl width-70px ml20" id="blsj" value="${blsj?default("")}" placeholder="数据保留时间" title="数据库数据保留时间" name="blsj">
                </div>
                <div class="form-group fl">
                    <label for="qlsj" class="control-label fl">数据清理时间(时:分):</label> 
                    <input type="text" class="form-control fl width-70px ml20" id="blsj" value="${qlsj?default("")}" placeholder="数据清理时间" title="数据清理时间(如：01:30)" name="qlsj">
                </div>
				
				<div class="form-group fl">
                    <label for="jzCount" class="control-label fl">矫正次数:</label> 
                    <input type="text" class="form-control fl width-70px ml20" id="jzCount" value="${jzCount?default("")}" placeholder="数据矫正次数" title="矫正次数" name="jzCount">
                </div>
				<div class="form-group fl">
                    <label for="jzTime" class="control-label fl">矫正时间(小时):</label> 
                    <input type="text" class="form-control fl width-70px ml20" id="jzTime" value="${jzTime?default("")}" placeholder="矫正时间(负数)" title="矫正时间" name="jzTime">
                </div>
            </form>
            <div class="form-group fl ">
                <button  class="btn btn-primary ml10 fl"  data-url="${BASE_PATH}xtsz/saveSjk.action" 
                         onclick="saveSjk(this)">保存
                </button>
            </div>
        </div>
    </div>
    </#if>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">
    $(document).ready(function () {
		
        initRoleAuthority();

        $(".sensorDelBtn").click(function () {
            delBtnClick($(this));
        });
        var theme = '${theme}';
        if (theme == -1000) {
            theme = getCookie("theme");
        }
        if (theme == -1000) {
            theme = "默认";
        }
        $(".yu-drop-menu a").click(function () {
            $(".themeBtn").innerHTML = this.innerHTML;
            var url = '${BASE_PATH}' + "xtsz/saveTheme.action";
            theme = this.innerHTML;
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: {theme: theme},
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                },
                success: function (response) {
                    var date = new Date();
                    date.setTime(date.getTime() + 5256000 * 60 * 1000); //设置date为当前时间+10年                   
                    document.cookie = "theme=" + escape(theme) + ";expires=" + date.toGMTString();
                    location.reload();
                }
            })
        })
    })
    //获取cookie
    function getCookie(theme) {
        var strCookie = document.cookie;
        var arrCookie = strCookie.split(";");
        for (var i = 0; i < arrCookie.length; i++) {
            var arr = arrCookie[i].split("=");
            var curTheme = unescape(arr[0]);
            if (curTheme === theme) {
                return unescape(arr[1]);
            }
        }
    }
    function initRoleAuthority() {
        var authority = '${role.roleAuthority}';
        if (authority[6] == "1") {
            //基本设置
            $("#baseInfo").find(":input").attr("disabled", true);
            $(".baseInfoBtn").attr("disabled", true);
            //串口设置
            $("#chuanKou").find(":input").attr("disabled", true);
            $(".chuanKouBtn").attr("disabled", true);
            //传感器列表
            $("#sensorList").find(":input").attr("disabled", true);
            $("#sensorList").find(":button").attr("disabled", true);
            //粮食品种列表
            $("#grainList").find(":input").attr("disabled", true);
            $("#grainList").find(":button").attr("disabled", true);
        }
    }
	//保存数据库信息
	function saveSjk(btn){
		var dataJson = $("#sjk").serialize();
		var p = $(btn).attr("data-url");
		$.ajax({
            type: "POST",
            url: p,
            dataType: "json",
            data: dataJson,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                alert("保存成功！");
            }
        })
	}
	//保存区域划分信息
	function saveAreaDevide(btn){
		var dataJson = $("#areaDevideForm").serialize();
		var p = $(btn).attr("data-url");
		$.ajax({
            type: "POST",
            url: p,
            dataType: "json",
            data: dataJson,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                alert("保存成功！");
            }
        })
	}
	
    //保持当前设置信息
    function saveBaseSettingClick(curBtn) {
        var p = $(curBtn).attr("data-url");
        var formName = "#" + $(curBtn).attr("formName");

        var obj = document.getElementById('selectProvince');
        var index = obj.selectedIndex; //序号，取当前选中选项的序号
        var val = obj.options[index].text;

        var obj1 = document.getElementById('selectCity');
        var index1 = obj1.selectedIndex; //序号，取当前选中选项的序号
        var val1 = obj1.options[index1].text;

        var dataJson = $(formName).serialize();
        if ("#baseInfo" == formName) {
            dataJson = dataJson + "&szsf=" + val + "&szsq=" + val1;
        }
        $.ajax({
            type: "POST",
            url: p,
            dataType: "json",
            data: dataJson,
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("出错");
            },
            success: function (response) {
                alert("保存成功！");
            }
        })
    }

    function delBtnClick(btn) {
        if (yu_confirm("确认删除该信息？")) {
            var pname = $(btn).attr("pname");
            var p = $(btn).attr("data-url");
            var par = $(btn).parent().parent();
            //var par = $("#"+pname);
            var curDataId = par.attr("curDataId");
            $.ajax({
                cache: true,
                type: "POST",
                url: p,
                dataType: "json",
                data: {curDataId: curDataId},
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("出错");
                },
                success: function (response) {
                    if (response.success == true) {
                        par.remove();
                    }
                    else {
                        alert("删除数据出错");
                    }
                }
            })
        }
    }

    function editBtnClick(btn) {
        $('#myModal').modal({
            keyboard: false
        });
        $(".modal-content").load(
                $(btn).attr("data-url"), {name: "yl", title: "ly"},
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').focus();
        })
                );

    }
    var provinceAndCityArray = [{name: "北京", cities: ["北京"]},
        {name: "天津", cities: ["天津"]},
        {name: "河北", cities: ["石家庄", "秦皇岛", "廊坊", "保定", "邯郸", "唐山", "邢台", "衡水", "张家口", "承德", "沧州", "衡水"]},
        {name: "山西", cities: ["太原", "大同", "长治", "晋中", "阳泉", "朔州", "运城", "临汾", "晋城", "忻州", "吕梁"]},
        {name: "内蒙古", cities: ["呼和浩特", "赤峰", "通辽", "锡林郭勒", "兴安", "包头", "乌海", "鄂尔多斯", "呼伦贝尔", "巴彦淖尔", "乌兰察布", "阿拉善"]},
        {name: "辽宁", cities: ["大连", "沈阳", "鞍山", "抚顺", "营口", "锦州", "丹东", "朝阳", "辽阳", "阜新", "铁岭", "盘锦", "本溪", "葫芦岛"]},
        {name: "吉林", cities: ["长春", "吉林", "四平", "辽源", "通化", "延吉", "白城", "辽源", "松原", "白山", "延边"]},
        {name: "黑龙江", cities: ["哈尔滨", "齐齐哈尔", "大庆", "牡丹江", "鹤岗", "佳木斯", "绥化", "双鸭山", "鸡西", "伊春", "七台河", "黑河"]},
        {name: "上海", cities: ["上海"]},
        {name: "江苏", cities: ["南京", "苏州", "无锡", "常州", "扬州", "徐州", "南通", "镇江", "泰州", "淮安", "连云港", "宿迁", "盐城"]},
        {name: "浙江", cities: ["杭州", "金华", "宁波", "温州", "嘉兴", "绍兴", "丽水", "湖州", "台州", "舟山", "衢州"]},
        {name: "安徽", cities: ["合肥", "马鞍山", "蚌埠", "黄山", "芜湖", "淮南", "铜陵", "阜阳", "宣城", "安庆", "淮北", "滁州", "宿州", "巢湖", "六安", "亳州", "池州"]},
        {name: "福建", cities: ["福州", "厦门", "泉州", "漳州", "南平", "龙岩", "莆田", "三明", "宁德"]},
        {name: "江西", cities: ["南昌", "景德镇", "上饶", "萍乡", "九江", "吉安", "宜春", "鹰潭", "新余", "赣州", "抚州"]},
        {name: "山东", cities: ["青岛", "济南", "淄博", "烟台", "泰安", "临沂", "日照", "德州", "威海", "东营", "荷泽", "济宁", "潍坊", "枣庄", "聊城", "莱芜", "滨州"]},
        {name: "河南", cities: ["郑州", "洛阳", "开封", "平顶山", "濮阳", "安阳", "许昌", "南阳", "信阳", "周口", "新乡", "焦作", "三门峡", "商丘", "鹤壁", "漯河", "驻马店", "济源"]},
        {name: "湖北", cities: ["武汉", "襄樊", "孝感", "十堰", "荆州", "黄石", "宜昌", "黄冈", "恩施", "鄂州", "咸宁", "荆门", "随州", "仙桃", "潜江", "天门", "恩施"]},
        {name: "湖南", cities: ["长沙", "湘潭", "岳阳", "株洲", "怀化", "永州", "益阳", "张家界", "常德", "衡阳", "湘西", "邵阳", "娄底", "郴州"]},
        {name: "广东", cities: ["广州", "深圳", "东莞", "佛山", "珠海", "汕头", "韶关", "江门", "梅州", "揭阳", "中山", "河源", "惠州", "茂名", "湛江", "阳江", "潮州", "云浮", "汕尾", "肇庆", "清远"]},
        {name: "广西", cities: ["南宁", "桂林", "柳州", "梧州", "来宾", "贵港", "玉林", "贺州", "北海", "防城港", "钦州", "百色", "贺州", "河池", "崇左"]},
        {name: "海南", cities: ["海口", "三亚"]},
        {name: "重庆", cities: ["重庆"]},
        {name: "四川", cities: ["成都", "达州", "南充", "乐山", "绵阳", "德阳", "内江", "遂宁", "宜宾", "巴中", "自贡", "攀枝花", "泸州", "广元", "眉山", "广安", "雅安", "资阳", "阿坝", "甘孜", "凉山"]},
        {name: "贵州", cities: ["贵阳", "遵义", "安顺", "黔西南", "六盘水", "铜仁", "毕节", "黔东南", "黔南"]},
        {name: "云南", cities: ["昆明", "丽江", "昭通", "玉溪", "临沧", "文山", "红河", "楚雄", "大理", "曲靖", "保山", "普洱", "德宏", "怒江", "迪庆", "西双版纳"]},
        {name: "西藏", cities: ["拉萨", "林芝", "日喀则", "昌都", "那曲", "山南", "阿里"]},
        {name: "陕西", cities: ["西安", "咸阳", "延安", "汉中", "榆林", , "铜川", "宝鸡", "渭南", "安康", "商洛"]},
        {name: "甘肃", cities: ["兰州", "金昌", "天水", "武威", "张掖", "平凉", "酒泉", "白银", "嘉峪关", "庆阳", "定西", "陇南", "甘南", "临夏"]},
        {name: "青海", cities: ["黄南", "海南", "西宁", "海东", "海西", "海北", "果洛", "玉树"]},
        {name: "宁夏", cities: ["银川", "吴忠", "石嘴山", "固原", "中卫"]},
        {name: "新疆", cities: ["乌鲁木齐", "哈密", "喀什", "巴音郭楞", "昌吉", "伊犁", "阿勒泰", "克拉玛依", "博尔塔拉", "吐鲁番", "和田", "阿克苏", "塔城", "克孜勒苏"]},
        {name: "香港", cities: ["香港"]},
        {name: "澳门", cities: ["澳门"]}];



    $(document).ready(function () {
        // 填充省下拉列表  
        var p = '${szsf}';
        var c = '${szsq}';
        initSelectInfo(p, c);
    });

    function initSelectInfo(p, c) {
        var provincesOptionHtml = "";
        var provinces = [];
        var selectIndex = -1;
        for (var i = 0; i < provinceAndCityArray.length; i++) {
            var el = provinceAndCityArray[i];
            provinces.push(el.name);
            provincesOptionHtml += "<option value=" + el + ">" + el.name + "</option>";
            if (p == el.name) {
                selectIndex = i;
            }
        }
        if (selectIndex != -1) {
            var citiesOptionHtml = "";
            var cities = [];
            cities = provinceAndCityArray[selectIndex].cities;
            var cityIndex = -1;
            for (var elCity in cities) {
                citiesOptionHtml += "<option value=" + elCity + ">" + cities[elCity] + "</option>";
                if (c == cities[elCity]) {
                    cityIndex = elCity;
                }
            }
            // 清空之前的城市列表  
            $("#selectCity option[value!=-1]").remove();

            $("#selectCity").empty().append(citiesOptionHtml);

            var obj1 = document.getElementById('selectCity');
            obj1.options[cityIndex].selected = true;
        }
        selectIndex = selectIndex + 1;

        $("#selectProvince").append(provincesOptionHtml);
        var obj = document.getElementById('selectProvince');

        obj[selectIndex].selected = true;

        // 填充城市下拉列表  
        $("#selectProvince").bind("change", function () {
            var selectedProvince = $("#selectProvince :selected").index() - 1;
            if (selectedProvince != -1) {
                var citiesOptionHtml = "";
                var cities = [];
                cities = provinceAndCityArray[selectedProvince].cities;
                for (var elCity in cities) {
                    citiesOptionHtml += "<option value=" + elCity + ">" + cities[elCity] + "</option>";
                }
                // 清空之前的城市列表  
                $("#selectCity option[value!=-1]").remove();
                $("#selectCity option[value=-1]").attr("selected", true);
                $("#selectCity").empty().append(citiesOptionHtml);
            }
        });
    }

</script>