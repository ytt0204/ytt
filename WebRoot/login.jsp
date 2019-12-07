<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shoes Store - Contact Page</title>
<meta name="keywords" content="shoes store, contact, maps, addresses, contact form, free template, ecommerce, CSS, HTML" />
<meta name="description" content="Shoes Store, Contact Page, free template provided " />


<style type="text/css">
body
{

    width:100%;
    height:600px;
    background-color:green;

}

  #top{
    width:600px;
    height:400px;
    background-color:white;
    margin-left:300px;
    margin-top:80px;
     
  }
  
  .top1{
  width:300px;
  height:300px;
 margin-top:100px;
  text-align:center;
  padding-left:120px;
  index:1;
  }
  .top1 button{
  font-size:18px;
  line-height:1.6;
  padding:6px 20px;
  margin:20px 0 0 0;
  transition:all .2s;
  width:300px;
  color:#fff;
  border-radious:5px;
  border:0 solid #dec4e6;
  background:#4e7c7a;
 
  }
  </style>
</head>
<body>
<div id="top">
   <!-- <img alt="bbbu" src="images/vcd.jpeg"> -->
    <div class="top1" >
    <h2>vcd商城用户登录界面</h2>
       <form method="post" name="contact" action="LogReg.action">
       
                        <input type="hidden" name="oper" value="login"/>
                        
                        <label for="author" style="font-size: 20px">用户名:</label> <input type="text" id="author" name="author" class="required input_field" style="font-size:16px;border-radius: 5px;"/>
                        <div class="cleaner h10"></div>
                        <label for="password" style="font-size: 20px">密码:</label> <input type="text" id="password" name="password" class="required input_field" style="font-size:16px;border-radius: 5px;"/>
                        <div class="cleaner h10"></div>
                       
                    
                  <button type="submit" style="border-radius: 5px;">登录</button> 
                         <button type="reset" style="border-radius: 5px;">重置</button> 
                        <h2 style="color:pink">从登陆界面进入到<a href="register.jsp" style="color:burlywood;">注册</a></h2>
                   <h2 style="color:pink">进入到管理员登录<a href="adminlogin.jsp" style="color:burlywood;">登录</a></h2>
                    </form>
     </div>
   </div>
</body>
</html>