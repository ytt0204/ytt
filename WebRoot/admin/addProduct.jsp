<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="images/skin.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
	window.onload=function() {
		CKEDITOR.replace('description');
	}
	</script>

  </head>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F8F9FA;
}
-->
</style>


<body>
<c:if test="${sessionScope.categorylist==null}">
<c:redirect url="Category.action?oper=list"></c:redirect>
</c:if>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" height="29" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td width="935" height="29" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
         <td height="30"><div class="titlebt">基本设置</div></td>
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
            <td class="left_txt">当前位置：基本设置
            <span style="color: red">${sessionScope.mess }</span>
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
            <td><table width="100%" height="55" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="10%" height="55" valign="middle"><img src="images/title.gif" width="54" height="55"></td>
                <td width="90%" valign="top"><span class="left_txt2">在这里，您可以根据您的网站要求，修改设置网站的</span><span class="left_txt3">基本参数</span><span class="left_txt2">！</span><br>
                          <span class="left_txt2">包括</span><span class="left_txt3">网站名称，网址，网站备案号，联系方式，网站公告，关键词，风格</span><span class="left_txt2">等以及网站</span><span class="left_txt3">会员及等级积分设置</span><span class="left_txt2">。 </span></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;商品详细信息添加</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
			<form name="form1" method="post" action="Product.action" enctype="multipart/form-data">
              <tr>
                <td width="20%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">商品名称：</td>
                <td width="3%" bgcolor="#f2f2f2">&nbsp;
                <input type="hidden" name="oper" value="add" />
                </td>
                <td width="32%" height="30" bgcolor="#f2f2f2"><input name="pname" type="text" id="pname" size="30" /></td>
                <td width="45%" height="30" bgcolor="#f2f2f2" class="left_txt">商品名称</td>
              </tr>
              <tr>
                <td height="30" align="right" class="left_txt2">商品单价：</td>
                <td>&nbsp;</td>
                <td height="30"><input type="text" name="price" size="30" /></td>
                <td height="30" class="left_txt">商品单价</td>
              </tr>

              <tr bgcolor="#f2f2f2">
                <td height="30" align="right" class="left_txt2">商品打折： </td>
                <td>&nbsp;</td>
                <td height="30"><input type="text" name="discount" size="30" /></td>
                <td height="30" class="left_txt">商品打折</td>
              </tr>
              <tr>
                <td height="30" align="right"  class="left_txt2">商品库存：</td>
                <td >&nbsp;</td>
                <td height="30" ><input type="text" name="pcount" size="30" /></td>
                <td height="30" class="left_txt">商品库存</td>
              </tr>
               <tr>
                <td height="30" align="right" class="left_txt2">商品类别：</td>
                <td>&nbsp;</td>
                <td height="30" align="left"><select name="cid">
                <c:forEach items="${sessionScope.categorylist}" var="c">
                	<option value="${c.cid }">${c.cname }</option>
      			</c:forEach>
                </select></td>
                <td height="30"><span class="left_txt">商品类别</span></td>
              </tr>
              <tr bgcolor="#f2f2f2">
                <td height="30" align="right"  class="left_txt2">商品图片：</td>
                <td >&nbsp;</td>
                <td height="30" ><input type="file" name="imagepath" /></td>
                <td height="30"  class="left_txt">商品图片</td>
              </tr>
           
              <tr bgcolor="#f2f2f2">
                <td height="30" align="right" colspan="2" class="left_txt2">&nbsp;&nbsp;是否上架：&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="hot" checked="checked" value="上架" /></td>
               
                <td height="30" align="left" class="left_txt2">&nbsp;&nbsp;&nbsp;是否促销：
                <input type="checkbox" name="state" value="促销" /></td>
                <td height="30" ><span class="left_txt">是否上架，是否促销。</span></td>
              </tr>
                <tr bgcolor="#f2f2f2">
                <td height="30" align="right"  class="left_txt2">商品描述：</td>
                <td >&nbsp;</td>
                <td height="30" colspan="2"><textarea cols="25" name="description"></textarea></td>
                
              </tr>

              <tr>
                <td height="17" colspan="4" align="right" >&nbsp;</td>
              </tr>
              <tr>
                <td height="30" colspan="4" align="right" class="left_txt2"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
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
              <input type="submit" value="添加商品" /></td>
              <td width="6%" height="30" align="right">&nbsp;</td>
              <td width="44%" height="30" align="left"><input type="reset" value="取消设置" name="B12" /></td>
            </tr>

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
<c:remove var="categorylist" scope="session"/>
<c:remove var="mess" scope="session"/>
</body>
