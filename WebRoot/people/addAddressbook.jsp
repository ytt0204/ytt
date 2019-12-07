<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shoes Store - Check Out</title>
<meta name="keywords" content="shoes store, check out, free template, ecommerce, online shop, website templates, CSS, HTML" />
<meta name="description" content="Shoes Store, Check Out, free ecommerce template provided " />
<link href="../templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="../css/ddsmoothmenu.css" />

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/ddsmoothmenu.js"></script>
<style type="text/css">

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
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" height="29" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td width="935" height="29" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
         <td height="30"></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td height="71" valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="138" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="10" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="left_txt">
            <span style="color: red">${sessionScope.mess } </span>
            </td>
          </tr>
          <tr>
            <td height="20"><table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
              <tr>
                <td></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;添加地址</td>
              </tr>
            </table></td>
          </tr>
          <tr>
          <form name="form1" method="post" action="../AddressBook.action">
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
			
              <tr height="60">
                <td width="20%"  align="right" bgcolor="#f2f2f2" class="left_txt2">收货人：</td>
                <td width="3%" bgcolor="#f2f2f2">&nbsp;
                <input type="hidden" name="oper" value="add" /></td>
                <td width="32%"  bgcolor="#f2f2f2"><input name="receiver" type="text" id="receiver" size="30" /></td>
                <td width="45%"  bgcolor="#f2f2f2" class="left_txt">&nbsp;收货人</td>
              </tr height="60">
				<tr height="60">
                <td height="30" align="right" class="left_txt2">&nbsp;电话：</td>
                <td>&nbsp;</td>
                <td height="30"><input type="text" name="phone" size="30" /></td>
                <td height="30" class="left_txt">&nbsp;电话</td>
              </tr>

              <tr bgcolor="#f2f2f2" height="60">
                <td height="30" align="right" class="left_txt2">&nbsp;地址： </td>
                <td>&nbsp;</td>
                <td height="30"><input type="text" name="address" size="30" /></td>
                <td height="30" class="left_txt">&nbsp;地址</td>
              </tr>

              <tr>
                <td height="30" colspan="4" align="right" class="left_txt2">
                <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
                  <tr>
                    <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
    
            </table></td>
          </tr>
        </table>
			
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
			        
            <tr>
              <td width="50%" height="30" align="center">
              <input type="submit" value="添加地址薄" /></td>
              <td width="6%" height="30" align="right">&nbsp;</td>
              <td width="44%" height="30" align="left"><input type="reset" value="重置" name="B12" /></td>
            </tr>
		</form>
          </table></td>
      </tr>
    </table></td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
      <td height="17" valign="top" background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17" /></td>
    <td background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
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