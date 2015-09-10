<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addItem.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <form action="item/addItem.action" method="post" enctype="multipart/form-data">
     <table>
        <tr><td>商品名称:</td><td><input type="text" name="name"/></td></tr>
        <tr><td>上传图片:</td><td><input type="file" name="item_pic"/></td></tr> 
        <tr><td>商品价格:</td><td><input type="text" name="price"/></td></tr>
        <tr><td>商品描述:</td><td><textarea name="detail"></textarea></td></tr>
        <tr><td>打折信息:</td><td><input type="text" name="discount"/></td></tr>
        <tr><td>上市时间：</td><td><input type="text" name="createTime"/></td></tr>
        <tr><td>商品产地:</td><td><input type="text" name="area"/></td></tr>
        <tr><td>商品类别:</td><td></td></tr>
        <tr><td ><input type="submit" value="添加"/></td></tr>
        
        
     </table>
   </form>
  </body>
</html>
