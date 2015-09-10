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
    <script src="../../script/jquery-1.8.0.js"></script>
    <script type="text/javascript">
    $(function(){
    	var num = 0;
       $('#reduce').on('click', function(){
       		num = $(this).next().attr('value');
			$(this).next().attr('value',num);
		});
        $('#add').on('click', function(){
			$(this).attr('/wow/user/getCheckCode.action');
		}); 	
    });

    
    </script>
   
    <title>My JSP 'showCart.jsp' starting page</title>
    
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
     <h1>我的购物车</h1>
   <form action="cart/account.action" method="get">
   <table  width="100%" border=1>
     <tr><td> 全选 </td> <td>图片</td> <td>名称</td> <td>简介</td> <td>价格</td> <td>购买数量</td> <td>金额</td>  <td>操作</td></tr>
     <c:forEach  items ="${itemNumPics}" var="itemNumPic">
	     <tr>
	     <td><input type="checkbox" name="item_ids" value="${itemNumPic.item.id}"/></td>
	     <td style="text-align:center"><img width="70" height="70"src="${itemNumPic.itemPic.url}"/> </td> 
	     <td>${itemNumPic.item.name}</td> 
	     <td>${itemNumPic.item.detail}</td> 
	     <td>${itemNumPic.item.price}</td> 
	     <td><input type="button" value="-" id="reduce"/><input type="text" name="num" value="${itemNumPic.num}"/>
	         <input type="button" value="+" id="add"/>
	     </td>  
	     <td>${itemNumPic.item.price*itemNumPic.num}
	      <c:set var="totalmoney" value="${itemNumPic.item.price*itemNumPic.num + totalmoney}" scope="page"></c:set>
	     </td>
	     <td><a href="/wow/cart/deleteCartItem.action?id=${itemNumPic.item.id}&num=${itemNumPic.num}">删除</a>
	     <a href="cart/userCollect.action?id=${itemNumPic.item.id}">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp添加到收藏</a></td> 
	     </tr>
     </c:forEach>
     <tr><td><a href="/wow/cart/deleteCart.action">清空购物车</a></td>
     <td>一共的价格为：${totalmoney }</td>
     <td><a href="item/gainClassify.action">继续购物</a></td>
     <td><input type="submit" value="去结算"/></td>
   </table>
   </form>
  </body>
</html>
