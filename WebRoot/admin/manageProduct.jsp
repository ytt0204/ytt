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
<form name="form2" action="Product.action" method="post">
<input type="hidden" name="oper" value="delpl"/>

<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
<tr bgcolor="#E7E7E7">
	<td height="25" colspan="15" >&nbsp;商品列表&nbsp;
	<span style="color: red">${sessionScope.mess}</span></td>
	  
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22">
	<td width="3%">全选</td>
	<td width="4%">编号</td>
	<td width="6%">名称</td>
	<td width="5%">单价</td>
	<td width="5%">折扣</td>
	<td width="5%">库存</td>
	<td width="6%">类别</td>
	<td width="6%">更新者</td>
	<td width="5%">点击量</td>
	<td width="5%">销售量</td>
	<td width="6%">更新时间</td>
	<td width="5%">是否促销</td>
	<td width="5%">是否上架</td>
	
	<td width="8%">操作</td>
</tr>

	<c:forEach items="${sessionScope.plist}" var="p" varStatus="s">
		<tr align='center' onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="30" >
	
		<td><input name="pid" type="checkbox" id="id" value="${p.pid }" class="np"></td>
		<td>${p.pid }</td>
		<td>${p.pname }</td>
		<td>${p.price }</td>
		<td>${p.discount }</td>
		<td>${p.pcount }</td>
		<td>${p.category.cname }</td>
		<td>${p.author }</td>
		<td>${p.clickcount}</td>
		<td>${p.sellcount }</td>
		<td>${p.posttime }</td>
		<td>${p.hot }</td>
		<td>${p.state }</td>	
		
<!-- 		<td><img src="../${p.imagepath}" width="200px"/></td>  -->
		<td><a href="Product.action?oper=findbyid&id=${p.pid }">修改</a> | 
		<a href="javascript:delbyid('Product.action?oper=delbyid&id=${p.pid }')">删除</a></td>
	</tr>
	</c:forEach>

   
<tr bgcolor="#FAFAF1">
<td height="28" colspan="15">
	&nbsp;
	<a href="javascript:selAll()" class="coolbg">全选</a>
	<a href="javascript:noSelAll()" class="coolbg">取消</a>

	<a href="javascript:delArc()" class="coolbg">&nbsp;删除&nbsp;</a>
</td>
</tr>
<tr align="right" bgcolor="#EEF4EA">
	<td height="36" colspan="15" align="center"><!--翻页代码 -->
	
	<a href="Product.action?oper=showall&page=1" class="coolbg">首页</a>&nbsp;
	<c:choose >
		<c:when test="${sessionScope.pageBean.currentpage>1}">
		<a href="Product.action?oper=showall&page=${sessionScope.pageBean.currentpage-1 }" class="coolbg">上一页</a>&nbsp;
		</c:when>
		<c:otherwise>
		<a class="coolbg">上一页</a>&nbsp;
		</c:otherwise>
	</c:choose>
	<c:forEach var="index" begin="1" end="${sessionScope.pageBean.pagecount}">
		<a href="Product.action?oper=showall&page=${index }" class="coolbg">${index }</a>&nbsp;
	</c:forEach>
	<c:choose >
		<c:when test="${sessionScope.pageBean.currentpage<sessionScope.pageBean.pagecount}">
		<a href="Product.action?oper=showall&page=${sessionScope.pageBean.currentpage+1 }" class="coolbg">下一页</a>&nbsp;
		</c:when>
		<c:otherwise>
		<a class="coolbg">下一页</a>&nbsp;
		</c:otherwise>
	</c:choose>
	
	<a href="Product.action?oper=showall&page=${sessionScope.pageBean.pagecount }" class="coolbg">末页</a>&nbsp;
	<span>当前页：<input type="text" value="${sessionScope.pageBean.currentpage }" size="2" readonly="readonly"/></span>
	<span>总页数：<input type="text" value="${sessionScope.pageBean.pagecount }" size="2" readonly="readonly"/></span>
	</td>	
</tr>
</table>

</form>
<!--  搜索表单  -->

<c:remove var="mess" scope="session"/>
<c:remove var="pageBean" scope="session"/>
<c:remove var="plist" scope="session"/>
</body>
</html>