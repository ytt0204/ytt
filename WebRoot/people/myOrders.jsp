<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shoes Store - About Us</title>
<meta name="keywords" content="shoes, about us, our store, free template, ecommerce, online shop, website templates, CSS, HTML" />
<meta name="description" content="Shoes Store, About Us, free ecommerce template provided " />
<link href="../templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="../css/ddsmoothmenu.css" />

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/ddsmoothmenu.js"></script>
<script type="text/javascript">

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


ddsmoothmenu.init({
	mainmenuid: "top_nav", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>

</head>

<body>
<c:if test="${empty sessionScope.orderlist}">
<c:redirect url="../Orders.action?oper=showmyorder"></c:redirect>
</c:if>


<div id="templatemo_body_wrapper">
<div id="templatemo_wrapper">

	<div id="templatemo_header">
    	<div id="site_title"><h1><a href="http://www.cssmoban.com">Online Shoes Store</a></h1></div>
        <div id="header_right">
        	<p>
	     		  欢迎你：| <a href="people/manageAddress.jsp">${sessionScope.uname==null?"游客":sessionScope.uname }</a> | <a href="../shopcart.jsp">我的购物车</a> | <a href="../register.jsp">注册</a> | <a href="../login.jsp">登陆</a></p>
            <p>
            	购物车商品: <strong>${cartmap.value.buycount==null?0:cartmap.value.buycount }件</strong> ( <a href="shopcart.jsp">购物车</a> )
			</p>
		</div>
        <div class="cleaner"></div>
    </div> <!-- END of templatemo_header -->
    
    <div id="templatemo_menubar">
    	<div id="top_nav" class="ddsmoothmenu">
            <ul>
                <li><a href="../index.jsp" class="selected">首页</a></li>
                <li><a href="../index.action?oper=products">商品库</a></li>    
                <li><a href="manageAddress.jsp">个人中心</a></li>
                <li><a href="../about.jsp">关于</a></li>
                <li><a href="../contact.jsp">联系我们</a></li>
            </ul>
            <br style="clear: left" />
        </div> <!-- end of ddsmoothmenu -->
        <div id="templatemo_search">
            <form action="#" method="get">
              <input type="text" value=" " name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
              <input type="submit" name="Search" value=" " alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
            </form>
        </div>
    </div> <!-- END of templatemo_menubar -->
    
    <div id="templatemo_main">
    	<div id="sidebar" class="float_l">
        	<div class="sidebar_box"><span class="bottom"></span>
            	<h3>个人信息中心</h3>   
                <div class="content"> 
                	<ul class="sidebar_list">
                    	<li class="first"><a href="myinfo.jsp">个人资料管理</a></li>
                        <li><a href="addAddressbook.jsp">添加地址薄</a></li>
                        <li><a href="manageAddress.jsp">管理地址薄</a></li>
                        <li><a href="myOrders.jsp">我的订单</a></li>

                        <li class="last"><a href="#"></a></li>
                    </ul>
                </div>
            </div>
            <div class="sidebar_box"><span class="bottom"></span>
            	<h3>热销榜 </h3>   
                <div class="content"> 
                
                <c:forEach items="${sessionScope.splist}" var="sp">
                	<div class="bs_box">
                    	<a href="index.action?oper=detail&id=${sp.pid }&cid=${sp.cid}"><img src="../${sp.imagepath }" alt="image" height="60px" width="80px"/></a>
                        <span ><a style="font-size: 12px;font-family: SimHei " href="/../index.action?oper=detail&id=${sp.pid }&cid=${sp.cid}">${sp.pname }</a></span>
                        <p class="price">${sp.price }</p>
                        <div class="cleaner"></div>
                    </div>
                
                </c:forEach>
                
                </div>
            </div>
        </div>

        <div id="content" class="float_r">
        <h1>我的订单</h1>
		        
		
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
				<td>
				<a href="../Orders.action?oper=showOrderItems&id=${oa.oid }&adid=${oa.addressid}">查看详情</a></td>
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


        </div> 
        <div class="cleaner"></div>
    </div> <!-- END of templatemo_main -->
    
    <div id="templatemo_footer">
    	<p><a href="#">Home</a> | <a href="#">Products</a> | <a href="#">About</a> | <a href="#">FAQs</a> | <a href="#">Checkout</a> | <a href="#">Contact Us</a>
		</p>

    	Copyright © 2072 <a href="#">Your Company Name</a> | Collect from <a href="http://www.cssmoban.com" target="_parent">网站模板</a>
        
    </div> <!-- END of templatemo_footer -->
    
</div> <!-- END of templatemo_wrapper -->
</div> <!-- END of templatemo_body_wrapper -->

<c:remove var="addresslist" scope="session"/>
<c:remove var="mess" scope="session"/>
</body>
</html>