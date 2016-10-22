/*Auth:yulei,2015.3.3
 * tabs切换，ajax加载页面方法
 * 使用方法如下
 * <ul class="tabs">
        <li id="tab-name-1"><a  href = "#tab1" >基本信息</a></li>
        <li id="tab-name-2"><a href="#tab2" >项目相册</a></li>
  </ul>
  <div>
        <div id = "tab1"  class = "tab_content" title = "url"  style = "display: block;"></div>
        <div id = "tab2"  class = "tab_content"  title = "url" style = "display: block;"></div>
  </div>  
 */


$(document).ready(function () {

    //Default Action
    var DefaultNumber = "1";//设置默认标签数字
    var DefaultTabId = "tab-name-" + DefaultNumber;
    var DefaultTabContentId = "#tab" + DefaultNumber;

    $(".tab_content").hide();  //Hide all content   
    $("#" + DefaultTabId).addClass("active").show();  //Activate first tab   
    $(DefaultTabContentId).show();  //Show first tab content   
    loadPage(DefaultTabContentId, $(DefaultTabContentId).attr("title"));

    //On Click Event   
    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active");  //Remove any "active" class   
        $(".tab_content").hide();  //Hide all tab content
        $(this).addClass("active");  //Add "active" class to selected tab    
        var activeTab = $(this).find("a").attr("href");  //Find the rel attribute value to identify the active tab + content  
        var activeTabUrl = $(activeTab).attr("title");
        //ajax加载页面
        loadPage(activeTab, activeTabUrl);
        $(activeTab).fadeIn();  //Fade in the active content   
        return   false;
    });

});

//动态加载页面
//id 显示页面的容器组件ID
//url 欲加载页面网址
function loadPage(id, url) {
    $(id).addClass("loader");
    $(id).append("页面加载中......");
    $.ajax({
        type: "get",
        url: url,
        cache: false,
        error: function () {
            alert('加载页面' + url + '时出错！');
        },
        success: function (msg) {
            $(id).empty().append(msg);
            $(id).removeClass("loader");
        }
    });
}
