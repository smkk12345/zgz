
<#include "leftMenu.ftl"/>
<#include "../macro_ftl/xtszList.ftl">
<@override name="main_right">
<div class="container-fluid personal">
<div class="container-fluid cfsz-xtsz">
    <form class="cang-qu form-horizontal" >
       <div class="panel panel-default mt7">
            <div class="panel-heading"><span class="fl clearfix">系统锁定</span></div>
            <div class="panel-body ml30">
                <div class="form-group fl yu-switch">
					<div class="radio">
					  <label class="ml30">
					    <input type="radio" name="optionsRadios" id="optionsRadios1" value="0" >
					   	系统锁定
					  </label>
					</div>
					<div class="radio">
					  <label class="ml30">
					    <input type="radio" name="optionsRadios" id="optionsRadios2" value="1" checked>
					    解除锁定
					  </label>
					</div>
                    <ul  class="mt20"><li>（备注：锁定之后系统无法访问，请慎重操作！）</li> </ul>
                </div>
            </div>
        </div>
    </form>
</div>
</div>
</@override>
<@extends name = "../base/layout.ftl"/>
<script type="text/javascript">

	    $("input[name=optionsRadios]").click(function () {
        var $selectedvalue = $("input[name='optionsRadios']:checked").val();
        alert("1231");
        if ($selectedvalue === '1') {
		        if (yu_confirm("确认解除系统锁定？")) {
		            var p = ${BASE_PATH}+'/xtsz/sdcz.action?sd = 0';
		            $.ajax({
		                cache: true,
		                type: "POST",
		                url: p,
		                dataType: "json",
		                error: function (XMLHttpRequest, textStatus, errorThrown) {
		                    alert("系统锁定已经解除");
		                },
		                success: function (response) {
		                    alert("系统锁定已经解除");
		                }
		            })
		        }
        }
        else {
		        if (yu_confirm("确认锁定系统？")) {
		            var p = ${BASE_PATH}+'/xtsz/sdcz.action?sd = 1';
		            $.ajax({
		                cache: true,
		                type: "POST",
		                url: p,
		                dataType: "json",
		                error: function (XMLHttpRequest, textStatus, errorThrown) {
		                    alert("系统已经锁定");
		                },
		                success: function (response) {
		                   alert("系统已经锁定");
		                }
		            })
		        }
        }
     });
</script>