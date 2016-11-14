<#-- 自定义的分页指令。
Auth: yulei, 2015.9.23
属性说明：
   pageNo      当前页号(int类型)
   pageSize    每页要显示的记录数(int类型)
   toURL       点击分页标签时要跳转到的目标URL(string类型)
   recordCount 总记录数(int类型)
   OtherParameter  OtherParameter="name='zhangsan',paswor='123456'"
   -->
<#macro pager pageNo pageSize recordCount toURL OtherParameter>  
  <#-- 定义局部变量pageCount保存总页数 -->
  <#assign pageCount=((recordCount + pageSize - 1) / pageSize)?int>  
	<#if recordCount==0><#return/></#if>
<#-- 页号越界处理 -->
  <#if (pageNo > pageCount)>
    <#assign pageNo=pageCount>
  </#if>
  <#if (pageNo < 1)>
    <#assign pageNo=1>
  </#if>
<#-- 输出分页表单 -->
<#if (recordCount > pageSize)>
<div class="pagination">
<form method="post" action="" name="qPagerForm">
<#-- 把请求中的所有参数当作隐藏表单域(无法解决一个参数对应多个值的情况) -->
<input type="hidden" name="pageNo" value="${pageNo}"/>
<input type="hidden" name="pageSize" value="${pageSize}"/>
<input type="hidden" name="recordCount" value="${recordCount}"/>
<#if OtherParameter != "">
<#list OtherParameter?split(",") as vo> 
   <#assign p=vo?index_of("=")/>
   <#assign len=vo?length/>
   <input type="hidden" name='${vo?substring(0,p)}' value='${vo?substring(p+1,len)}'/>
</#list> 

</#if>
<#-- 上一页处理 -->
  <#if (pageNo == 1)>
<span class="disabled">&laquo;&nbsp;上一页</span>
  <#else>
<a href="javascript:void(0)" onclick="turnOverPage(${pageNo - 1})">上一页</a>
  </#if>
<#-- 如果前面页数过多,显示... -->
	<#assign start=1>
	<#if (pageNo > 5)>
    <#assign start=(pageNo - 3)>
<a href="javascript:void(0)" onclick="turnOverPage(1)">1</a>&hellip;
	</#if>
<#-- 显示当前页号和它附近的页号 -->
	<#assign end=(pageNo + 3)>
	<#if (end > pageCount)>
		<#assign end=pageCount>
	</#if>
  <#list start..end as i>
    <#if (pageNo==i)>
<span class="current">${i}</span>
    <#else>
<a href="javascript:void(0)" onclick="turnOverPage(${i})">${i}</a>      
    </#if>
  </#list>
<#-- 如果后面页数过多,显示... -->
  <#if (end < pageCount - 1)>
&hellip;  
  </#if>
  <#if (end < pageCount)>
<a href="javascript:void(0)" onclick="turnOverPage(${pageCount})">${pageCount}</a>
  </#if>
<#-- 下一页处理 -->
  <#if (pageNo == pageCount)>
<span class="disabled">下一页&nbsp;&raquo;</span>
  <#else>
<a href="javascript:void(0)" onclick="turnOverPage(${pageNo + 1})">下一页</a>
  </#if>
  <span class="total">共${recordCount}条</span>  
</form>
<script language="javascript">
  function turnOverPage(no){
    var qForm=document.qPagerForm;
    if(no>'${pageCount}'){no='${pageCount}';}
    if(no<1){no=1;}
    qForm.pageNo.value=no;
    qForm.action="${toURL}";
    qForm.submit();
  }
</script>
</div> 
</#if>
</#macro>  