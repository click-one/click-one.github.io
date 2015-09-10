<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'itemDetails.jsp' starting page</title>
    
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
   <form action="/wow/cart/addItemToCart.action" method="post">
     
       <div>
         <img height="200px" width="200px" src="${itemPicture.itemPic.url}"/>
       </div>
       <input type="hidden" name="item_id" value="${itemPicture.itemPic.item_id}">
                       数量：<input type="text" name="num"/><br/>
       <input type="submit" value="加入购物车"/>
       <input type="button" value="收藏该商品"/>
       
     
     
   </form>
   
   <a href="/wow/cart/showCart.action">查看购物车</a>
  </body>
</html>
