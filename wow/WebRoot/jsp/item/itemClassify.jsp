<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>classify jsp</title>
    
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
     <div align="right">
      <a href="cart/showCart.action"">我的购物车</a> &nbsp&nbsp&nbsp&nbsp
      <a href="managerView/addItem.jsp">个人中心</a> &nbsp&nbsp&nbsp&nbsp
      <a href="order/selectOrder.action">我的订单</a>&nbsp&nbsp&nbsp&nbsp
      <a href="view/login.jsp">登录</a>&nbsp&nbsp&nbsp&nbsp
      <a href="view/register.jsp">注册</a>&nbsp&nbsp&nbsp&nbsp
      <br/>
      </div>
      
      <div align="center">
       <form action="item/selectItemFuzzy.action" method="post">
	        <input type="text" style="height:30px;width:200px;font-size:20px" name="fuzzyName"/> 
	        <input type="submit" style="height:30px;width:50px;font-size:20px" value="搜索"/>
       </form>
      </div>  
      <br/>
     <c:forEach  items ="${classifys}" var="classifys">
       <a href="item/ItemOrder.action?id=${classifys.firstClassify.id}&parent_id=${classifys.firstClassify.parent_id}"> 
       ${classifys.firstClassify.name}</a>  >>
       <c:forEach  items ="${classifys.secondClassify}" var="secondClassify">
        <a href="item/ItemOrder.action?id=${secondClassify.id}&parent_id=${secondClassify.parent_id}"> 
        ${secondClassify.name}</a>
       </c:forEach><br/>
       <c:forEach items="${classifys.itemPictures}" var="itemPictures">
        <a href="item/itemDetails.action?id=${itemPictures.itemPic.item_id}"><img width="60" height="60" src="${itemPictures.itemPic.url}"/>  </a> 
       </c:forEach>
       <br/>
       <br/>
       <br/>
     </c:forEach>
  </body>
</html>
