<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shoes Store - Contact Page</title>
<meta name="keywords" content="shoes store, contact, maps, addresses, contact form, free template, ecommerce, CSS, HTML" />
<meta name="description" content="Shoes Store, Contact Page, free template provided " />
<link href="../templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="../css/ddsmoothmenu.css" />

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/ddsmoothmenu.js"></script>
<style type="text/css">
label{
font-size: 12px;
}
</style>

<script type="text/javascript">

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
<c:if test="${empty sessionScope.user}">
<c:redirect url="../LogReg.action?oper=edit"></c:redirect>
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
                        <span ><a style="font-size: 12px;font-family: SimHei " href="../index.action?oper=detail&id=${sp.pid }&cid=${sp.cid}">${sp.pname }</a></span>
                        <p class="price">${sp.price }</p>
                        <div class="cleaner"></div>
                    </div>
                
                </c:forEach>
                
                </div>
            </div>
        </div>

        <div id="content" class="float_r">
        	<h1>用户信息</h1><span style="color: red">${sessionScope.mess }</span>
            <div class="content_half float_l">
                <p></p>
                <div id="contact_form">
                   <form method="post" name="contact" action="LogReg.action">
                        <input type="hidden" name="oper" value="reg"/>
                        <label for="author" style="font-size: 12px;color: black ">用户名:</label> 
                        <input type="text" id="author" name="author" class="required input_field" value="${sessionScope.user.uname }" readonly="readonly"/>
                        <div class="cleaner h10"></div>
                        <label for="author" style="font-size: 12px;color: black ">注册时间:</label> 
                        <input type="text" id="time" name="time" class="required input_field" value="${sessionScope.user.regdate }" readonly="readonly"/>
                        <div class="cleaner h10"></div>
                        <label for="password" style="font-size: 12px;color: black ">密码:</label> <input type="text" id="password" name="password" class="required input_field" value="${sessionScope.user.upwd }"/>
                        <div class="cleaner h10"></div>
                        <label for="email" style="font-size: 12px;color: black ">邮箱:</label> <input type="text" id="email" name="email" class="validate-email required input_field" value="${sessionScope.user.email }" />
                        <div class="cleaner h10"></div>                       
                        <label for="phone" style="font-size: 12px;color: black ">电话:</label> <input type="text" name="phone" id="phone" class="input_field" value="${sessionScope.user.tel }" />
                        <div class="cleaner h10"></div>
                        <label for="address" style="font-size: 12px;color: black ">地址:</label> <input type="text" name="address" id="address" class="input_field" value="${sessionScope.user.address }" />
                        <div class="cleaner h10"></div>
         
                        <input type="submit" class="submit_btn" name="submit" id="submit" value="修改" style="font-size: 12px" />
                        
                    </form>
                </div>
            </div>
        <div class="content_half float_r">
        	<h5>Primary Office</h5>
			660-110 Quisque diam at ligula, <br />
			Etiam dictum lectus quis, 11220<br />
			Sed mattis mi at sapien<br /><br />
						
			Phone: 010-010-6600<br />
			Email: <a href="mailto:info@yourcompany.com">info@yourcompany.com</a><br/>
			
            <div class="cleaner h40"></div>
			
            <h5>Secondary Office</h5>
			120-360 Cras ac nunc laoreet,<br />
			Nulla vitae leo ac dui, 10680<br />
			Cras id sem nulla<br /><br />
			
			Phone: 030-030-0220<br />
			Email: <a href="mailto:contact@yourcompany.com">contact@yourcompany.com</a><br/>
			<br />
            Validate <a href="http://validator.w3.org/check?uri=referer" rel="nofollow">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer" rel="nofollow">CSS</a>
        </div>
        
        <div class="cleaner h40"></div>
        
        
            
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

<c:remove var="mess" scope="session"/>
</body>
</html>