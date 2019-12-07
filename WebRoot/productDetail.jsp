<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shoes Store - Product Detail</title>
<meta name="keywords" content="shoes store, product detail, free template, ecommerce, online shop, website templates, CSS, HTML" />
<meta name="description" content="Shoes Store, Product Detail, free ecommerce template provided " />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">



</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "top_nav", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>

<script type="text/javascript" src="js/jquery-1-4-2.min.js"></script> 
<link rel="stylesheet" href="css/slimbox2.css" type="text/css" media="screen" /> 
<script type="text/JavaScript" src="js/slimbox2.js"></script> 


</head>

<body>


<div id="templatemo_body_wrapper">
<div id="templatemo_wrapper">

		<div id="templatemo_header">
    	<div id="site_title"><h1><a href="http://www.cssmoban.com">Online Shoes Store</a></h1></div>
        <div id="header_right">
        	<p>
	     		  欢迎你：| <a href="people/manageAddress.jsp">${sessionScope.uname==null?"游客":sessionScope.uname }</a> | <a href="shopcart.jsp">我的购物车</a> | <a href="register.jsp">注册</a> | <a href="login.jsp">登陆</a></p>
            
		</div>
        <div class="cleaner"></div>
    </div> <!-- END of templatemo_header -->
    
    <div id="templatemo_menubar">
    	<div id="top_nav" class="ddsmoothmenu">
            <ul>
                <li><a href="index.jsp" class="selected">首页</a></li>
                <li><a href="index.action?oper=products">商品库</a></li>    
                <li><a href="people/manageAddress.jsp">个人中心</a></li>
                <li><a href="about.jsp">关于</a></li>
                <li><a href="contact.jsp">联系我们</a></li>
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
	<div class="copyrights"><a href="http://www.cssmoban.com/"  title="网页模板">网页模板</a></div>
    
    <div id="templatemo_main">
    	<div id="sidebar" class="float_l">
        	<div class="sidebar_box"><span class="bottom"></span>
            	<h3>商品类别</h3>   
                <div class="content"> 
                	<ul class="sidebar_list">
                    		
                    	<c:forEach items="${sessionScope.categorylist}" var="category" varStatus="s">
                    	<li class='${s.first?"first":"" }${s.last?"last":""}'>
                    	<a href="index.action?oper=categoryproduct&cid=${category.cid }">${category.cname }</a></li>
                    	</c:forEach>

                    </ul>
                </div>
            </div>
            <div class="sidebar_box"><span class="bottom"></span>
            	<h3>热销榜 </h3>   
                <div class="content"> 
                
                <c:forEach items="${sessionScope.splist}" var="sp">
                	<div class="bs_box">
                    	<a href="index.action?oper=detail&id=${sp.pid }&cid=${sp.cid}"><img src="${sp.imagepath }" alt="image" height="60px" width="80px"/></a>
                        <span ><a style="font-size: 12px;font-family: SimHei " href="index.action?oper=detail&id=${sp.pid }&cid=${sp.cid}">${sp.pname }</a></span>
                        <p class="price">${sp.price }</p>
                        <div class="cleaner"></div>
                    </div>
                
                </c:forEach>
                
                </div>
            </div>
        </div>
        <div id="content" class="float_r">
        	<h1>商品详情</h1>
            <div class="content_half float_l">
        	<a  rel="lightbox[portfolio]" href="${sessionScope.product.imagepath }"><img src="${sessionScope.product.imagepath }" alt="image" /></a>
            </div>
            <div class="content_half float_r">
                <table>
              	    <tr style="height: ">
                        <td>名称:</td>
                        <td>${sessionScope.product.pname }</td>
                    </tr>
                    <tr>
                        <td width="160">价格:</td>
                        <td>${sessionScope.product.price }</td>
                    </tr>
                    <tr>
                        <td>库存:</td>
                        <td>${sessionScope.product.pcount gt 0?"有货":"无货" }</td>
                    </tr>
                    <tr>
                        <td>类别:</td>
                        <td>${sessionScope.product.category.cname }</td>
                    </tr>
                    
       <!--              <tr>
                    	<td>数量:</td>
                        <td><input type="text" value="1" style="width: 20px; text-align: right" /></td>
                    </tr>--> 
                </table>
                <div class="cleaner h20"></div>

                <a href="ShopCart.action?oper=add&pid=${sessionScope.product.pid }" class="addtocart"></a>

			</div>
            <div class="cleaner h30"></div>
            
            <h5>商品描述</h5>
            <p>${sessionScope.product.description }</p>	
            
          <div class="cleaner h50"></div>
            
            <h3>同类商品</h3>
            
            <c:forEach items="${sessionScope.sameproducts}" var="p" varStatus="s">
        	
            <div class='product_box ${s.count % 3==0?"no_margin_right":"" }'>
            	<a href="index.action?oper=detail&id=${p.pid }&cid=${p.cid}"><img src="${p.imagepath }" alt="" /></a>
                <h6>${p.pname }</h6>
                <p class="product_price">${p.price }</p>
                <a href="ShopCart.action?oper=add&pid=${p.pid }" class="addtocart"></a>
                <a href="index.action?oper=detail&id=${p.pid }&cid=${p.cid}" class="detail"></a>
            </div>        	
               <c:if test="${s.count % 3 ==0}">
    			<div class="cleaner"></div>
    		</c:if>  	
             </c:forEach>
            
              
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


</body>
</html>