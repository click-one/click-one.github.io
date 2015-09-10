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
    
    <title>来结账</title>
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
  <c:if test="${empty itemNumPics}">
        <h2>亲，你还没有选择任何商品，<a href="cart/showCart.action">返回购物车</a>,选择商品</h2>
  </c:if>
  
  <c:if test="${!empty itemNumPics}">
    <form action="order/submitOrder.action" method="post">
                   请选择收货人地址：<input type="text" name="address"/>  <a href="">编辑</a>&nbsp&nbsp&nbsp<a href="">新增地址</a><br/>
                   联系电话号码:&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="telphone"/><br/>
                   收货人姓名:&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="consignee"/><br/>
                    支付方式：<input type="radio" name="payment" value="" />微信支付
            <input type="radio" name="payment" value="" />支付宝支付
            <input type="radio" name="payment" value="" />中国银行支付
            <input type="radio" name="payment" value="" />中国工商银行支付<br/>
                   货物清单
      <table  width="100%" border=1>
      <tr> <td>图片</td> <td>名称</td>  <td>价格</td> <td>购买数量</td> <td>金额</td>  </tr>
      <c:forEach  items ="${itemNumPics}" var="itemNumPic">
	     <tr>
	     
	     <td style="text-align:center"><img width="70" height="70"src="${itemNumPic.itemPic.url}"/>
	         <input type="hidden" value="${itemNumPic.item.id}" name="id" />
	      </td> 
	     
	     <td><input style="border:0px" type="text" value="${itemNumPic.item.name}" readonly="readonly"/></td> 
	     <td><input style="border:0px" type="text" value="${itemNumPic.item.price}" readonly="readonly"/></td> 
	     <td>
	     <input type="hidden" name="item_ids" value="${itemNumPic.item.id}"/>
	     <input style="border:0px" type="text" name="item_nums" value="${itemNumPic.num}"readonly="readonly" /></td> 
	     <td><input style="border:0px" type="text" value="${itemNumPic.item.price*itemNumPic.num}" readonly="readonly"/>
	      <c:set var="totalmoney" value="${itemNumPic.item.price*itemNumPic.num + totalmoney}" scope="page"></c:set>
	     </td>
	   
	     </tr>
     </c:forEach>
   </table>
   <br/>
       添加订单备注:
   <textarea rows="2" cols="60" name="note"></textarea>
      <br/><br/><br/><br/><br/><br/>
                  应付总额: ${totalmoney}  &nbsp&nbsp 
                  <input type="submit" value="提交订单"/>
  </form>
  </c:if>
  </body>
</html>
