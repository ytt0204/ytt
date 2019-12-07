<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shoes Store - Contact Page</title>
<meta name="keywords" content="shoes store, contact, maps, addresses, contact form, free template, ecommerce, CSS, HTML" />
<meta name="description" content="Shoes Store, Contact Page, free template provided " />

<style>
 #top{
 background-color:cornsilk;
 height: 600px;
 margin-top: 0px;
  }
.top1{
  width:400px;
  height:400px;
 background-color: pink;
  text-align:center;
  margin-left:420px;
  padding-top: 100px;
  }
  .enlarge{
      font-size: 18px;
      border-radius: 5px;
      margin-bottom:20px;
  }
 
  </style>
</head>

<body>

<div id="top">
    <div class="top1">
    <h2>vcd商城用户注册界面</h2>
    <form method="post" name="contact" action="LogReg.action">
        <input type="hidden" name="oper" value="reg"/>
        <label for="author" >用户名:</label> <input type="text" id="author" name="author" class="enlarge" />
        <div class="cleaner h10"></div>
        <label for="password" >密码:</label> <input type="text" id="password" name="password" class="enlarge" />
        <div class="cleaner h10"></div>
        <label for="email" >邮箱:</label> <input type="text" id="email" name="email" class="enlarge" />
        <div class="cleaner h10"></div>                       
        <label for="phone">电话:</label> <input type="text" name="phone" id="phone" class="enlarge" />
        <div class="cleaner h10"></div>
        <label for="address" >地址:</label> <input type="text" name="address" id="address" class="enlarge" />
        <div class="cleaner h10"></div>

        <input type="submit"  name="submit" id="submit" value="注册" class="enlarge"/>
        
    </form>
     </div>
   </div>
</body>
</html>