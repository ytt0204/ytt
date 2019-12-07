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

ddsmoothmenu.init({
	mainmenuid: "top_nav", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})


</script>
<style type="text/css">
#submit_add{
	display: block; 
	padding: 5px 12px; 
	text-align: center; 
	text-decoration: none; 
	font-weight: bold;
	background-color: #FFFF00; 
	border: 1px solid #fff; 
	color: #fff; 
	font-size:12px; 
	cursor: pointer;
}
</style>
</head>

<body>
<c:if test="${empty sessionScope.addresslist}">
<c:redirect url="../AddressBook.action?oper=showjiesuan"></c:redirect>
</c:if>


<div id="templatemo_body_wrapper">
<div id="templatemo_wrapper">

	<div id="templatemo_header">
    	<div id="site_title"><h1><a href="http://www.cssmoban.com">Online Shoes Store</a></h1></div>
        <div id="header_right">
        	<p>
	     		  欢迎你：| <a href="people/manageAddress.jsp">${sessionScope.uname==null?"游客":sessionScope.uname }</a> | <a href="../shopcart.jsp">我的购物车</a> | <a href="../register.jsp">注册</a> | <a href="../login.jsp">登陆</a></p>
           
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
		<form name="form2" action="../Orders.action" method="post">
		<input type="hidden" name="oper" value="jiesuan"/>

		<table width="98%" border="0" cellpadding="2" cellspacing="1"  align="center" style="margin-top:8px">
		<tr bgcolor="#E7E7E7">
			<td height="30" colspan="10" >&nbsp;地址列表&nbsp;
			<span style="color: red">${sessionScope.mess}</span></td>	  
		</tr>
			<tr align="center" bgcolor="#FAFAF1" height="22">
			<td width="6%">选择</td>
			<td width="6%">编号</td>
			<td width="6%">收货人</td>
			<td width="6%">电话</td>
			<td width="15%">地址</td>
			
			</tr>
		
			<c:forEach items="${sessionScope.addresslist}" var="ac" >
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="30" >
			
				<td><input name="addressid" type="radio" id="id" value="${ac.addressid }" class="np"/></td>
				<td>${ac.addressid }</td>
				<td>${ac.receiver}</td>
				<td>${ac.phone}</td>
				<td>${ac.address}</td>
				
			</tr>
			</c:forEach>
			
		</table>
		<div class="cleaner"></div>
		  <div id="content" class="float_r">
        	<h1></h1>
        	<table width="98%" cellspacing="0" cellpadding="5">
        	<tr bgcolor="#E7E7E7">
			<td height="25" colspan="10" >&nbsp;商品信息&nbsp;</td>
			  
		</tr>
                   	  <tr bgcolor="#FAFAF1" height="22">
                        	<th width="220" align="left">图片 </th> 
                        	<th width="180" align="left">名称 </th> 
                       	  	<th width="100" align="center">数量 </th> 
                        	<th width="60" align="right">价格 </th> 
                        	<th width="60" align="right">总价 </th> 
                        	<th width="90"> </th>
                            
                      </tr>
                      <c:forEach items="${sessionScope.cartmap}" var="cartmap">
                      	<tr>
                        	<td><img src="${cartmap.value.product.imagepath }" alt="image 1" width="100px"/></td> 
                        	<td><a href="#" > ${cartmap.value.product.pname }</a></td> 
                            <td align="center">
                            <input type="text" value="${cartmap.value.buycount }" style="width: 20px; text-align: right" onblur="updatebuycount(${cartmap.value.product.pid },this.value,${cartmap.value.product.pcount })"/> </td>
                            <td align="right">${cartmap.value.product.price }</td> 
                            <td align="right">${cartmap.value.totalprice } </td>
                            <td align="center"> 
                            <a href="ShopCart.action?oper=delbypid&pid=${cartmap.value.product.pid }">
                            <img src="images/remove_x.gif" alt="remove" /><br />删除</a> </td>
						</tr>
                      
                      </c:forEach>
                                
					</table>
                    <div style="float:right; width: 215px; margin-top: 20px;">
                   
                    <input type="submit"  name="submit" id="submit_add" value="提交" />	
                    </div>
			</div>
			
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