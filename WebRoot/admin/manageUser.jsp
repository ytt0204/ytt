<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.xshop.bean.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/base.css">
<script language="javascript">
function editstate(uname,state){
	if(window.confirm("您确定要更改状态吗")){
		location.href="../LogReg.action?oper=state&name="+uname+"&state="+state;
	}
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
	<td height="25" colspan="10" >&nbsp;商品列表&nbsp;
	<span style="color: red">${sessionScope.mess}</span></td>
	  
</tr>
<tr align="center" bgcolor="#FAFAF1" height="22">
	<td width="10%">全选</td>
	<td width="10%">用户名</td>
	<td width="10%">密码</td>
	<td width="10%">注册时间</td>
	<td width="10%">邮箱</td>
	<td width="10%">电话</td>
	<td width="10%">地址</td>
	<td width="10%">状态</td>
	<td width="20%">操作</td>
</tr>

	<c:forEach items="${sessionScope.userlist}" var="u" >
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="30" >
	
		<td><input name="cid" type="checkbox" id="id" value="${u.uname }" class="np"></td>
		<td>${u.uname}</td>
		<td>${u.upwd }</td>
		<td>${u.regdate}</td>
		<td>${u.email}</td>
		<td>${u.tel}</td>
		<td>${u.address}</td>
		<td>${u.state}</td>
		<td><a href="../LogReg.action?oper=state&name=${u.uname}&state=0">正常</a>|
		<a href="../LogReg.action?oper=state&name=${u.uname}&state=1">禁用</a></td>
	</tr>
	</c:forEach>

   
<tr bgcolor="#FAFAF1">
<td height="28" colspan="10">
	&nbsp;
	<a href="javascript:selAll()" class="coolbg">全选</a>
	<a href="javascript:noSelAll()" class="coolbg">取消</a>

	<a href="javascript:delArc()" class="coolbg">&nbsp;删除&nbsp;</a>
</td>
</tr>
<tr align="right" bgcolor="#EEF4EA">
	<td height="36" colspan="8" align="center"><!--翻页代码 -->
	
	
	</td>	
</tr>
</table>

</form>
<!--  搜索表单  -->

<c:remove var="mess" scope="session"/>
<c:remove var="categorylist" scope="session"/>
<c:remove var="pageBean" scope="session"/>
</body>
</html>