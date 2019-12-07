<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.xshop.bean.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/base.css">
<script language="javascript">
function search(){
	document.forms.search.submit();
}
function delArc(){
	if(window.confirm("您确定要删除吗")){
		document.forms.form2.submit();
	}
}
function delbyid(url){
	if(window.confirm("您确定要删除吗")){
		location.href=url;
	}
}
function selAll()
{
	for(i=0;i<document.form2.id.length;i++)
	{
		if(!document.form2.id[i].checked)
		{
			document.form2.id[i].checked=true;
		}
	}
}
function noSelAll()
{
	for(i=0;i<document.form2.id.length;i++)
	{
		if(document.form2.id[i].checked)
		{
			document.form2.id[i].checked=false;
		}
	}
}
</script>
</head>
<body leftmargin="8" topmargin="8" >

<!--  内容列表   -->
<form name="form2" action="Category.action" method="post">
<input type="hidden" name="oper" value="delpl"/>

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="25" colspan="10" >&nbsp;订单列表&nbsp;
	<span style="color: red">${sessionScope.mess}</span></td>
	  
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22">
	<td width="6%">全选</td>
	<td width="10%">编号</td>
	<td width="6%">总价</td>
	<td width="6%">下单时间</td>
	<td width="10%">商品名</td>
	<td width="6%">状态</td>
	<td width="6%">用户名</td>
	<td width="6%">地址编号</td>
	<td width="10%">操作</td>
</tr>

	<c:forEach items="${sessionScope.orderlist}" var="oa" >
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="30" >
	
		<td><input name="oid" type="checkbox" id="id" value="${oa.oid }" class="np"></td>
		<td>${oa.oid }</td>
		<td>${oa.totalprice}</td>
		<td>${oa.posttime}</td>
		<td>${oa.pname}</td>
		<td>${oa.state}</td>
		<td>${oa.username}</td>
		<td>${oa.addressid}</td>
		<td><a href="../Orders.action?oper=findOrderItems&id=${oa.oid }&adid=${oa.addressid}">修改状态</a> | 
		<a href="../Orders.action?oper=findOrderItems&id=${oa.oid }&adid=${oa.addressid}">查看详情</a></td>
	</tr>
	</c:forEach>

   
<tr bgcolor="#FAFAF1">
<td height="28" colspan="10">
	&nbsp;
	<a href="javascript:selAll()" class="coolbg">全选</a>
	<a href="javascript:noSelAll()" class="coolbg">取消</a>

</td>
</tr>
<tr align="right" bgcolor="#EEF4EA">
	<td height="36" colspan="8" align="center"><!--翻页代码 -->
	
	<a href="Admin.action?oper=showall&page=1" class="coolbg">首页</a>&nbsp;
	<c:choose >
		<c:when test="${sessionScope.pageBean.currentpage>1}">
		<a href="Admin.action?oper=showall&page=${sessionScope.pageBean.currentpage-1 }" class="coolbg">上一页</a>&nbsp;
		</c:when>
		<c:otherwise>
		<a class="coolbg">上一页</a>&nbsp;
		</c:otherwise>
	</c:choose>
	<c:forEach var="index" begin="1" end="${sessionScope.pageBean.pagecount}">
		<a href="Admin.action?oper=showall&page=${index }" class="coolbg">${index }</a>&nbsp;
	</c:forEach>
	<c:choose >
		<c:when test="${sessionScope.pageBean.currentpage<sessionScope.pageBean.pagecount}">
		<a href="Admin.action?oper=showall&page=${sessionScope.pageBean.currentpage+1 }" class="coolbg">下一页</a>&nbsp;
		</c:when>
		<c:otherwise>
		<a class="coolbg">下一页</a>&nbsp;
		</c:otherwise>
	</c:choose>
	
	<a href="Admin.action?oper=showall&page=${sessionScope.pageBean.pagecount }" class="coolbg">末页</a>&nbsp;
	<span>当前页：<input type="text" value="${sessionScope.pageBean.currentpage }" size="2" readonly="readonly"/></span>
	<span>总页数：<input type="text" value="${sessionScope.pageBean.pagecount }" size="2" readonly="readonly"/></span>
	</td>	
</tr>
</table>

</form>
<!--  搜索表单  -->

<c:remove var="mess" scope="session"/>
<c:remove var="orderlist" scope="session"/>
<c:remove var="pageBean" scope="session"/>
</body>
</html>