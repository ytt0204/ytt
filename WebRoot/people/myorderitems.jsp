<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shoes Store - Shopping Cart</title>
<meta name="keywords" content="shoes store, shopping cart, free template, ecommerce, online shop, website templates, CSS, HTML" />
<meta name="description" content="Shoes Store, Shopping Cart, online store template " />
<link href="../templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="../css/ddsmoothmenu.css" />

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/ddsmoothmenu.js">



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
<script type="text/javascript">
function updatebuycount(pid,buycount,pcount){
	if(buycount>0&&buycount<=pcount){
		var url="ShopCart.action?oper=updatebuycount&pid="+pid+"&buycount="+buycount;
		location.href=url;
	}else{
		alert("数量不能小于1，也不能多于库存");
	}
}

</script>

</head>

<body>



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
        	<h1>订单详情表</h1>
        	<table width="680px" cellspacing="0" cellpadding="5">
                   	  <tr bgcolor="#ddd">
                        	<th width="220" align="left">图片 </th> 
                        	<th width="180" align="left">名称 </th> 
                       	  	<th width="100" align="center">数量 </th> 
                        	<th width="60" align="right">价格 </th> 
                        	<th width="60" align="right">总价 </th> 
                        	<th width="90"> </th>
                            
                      </tr>
                      <c:forEach items="${sessionScope.cartmap}" var="cartmap">
                      	<tr>
                        	<td><img src="${cartmap.value.product.imagepath }" alt="image 1" /></td> 
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
                    
					<p><a href="jiesuan.jsp">购物车结算</a></p>
                    <p><a href="javascript:history.back()">继续购物</a></p>
                    	
                    </div>
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