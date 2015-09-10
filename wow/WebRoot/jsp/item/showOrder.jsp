<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的订单</title>
    
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
    <a style="color:red"  href="item/gainClassify.action">返回到主页</a>
    </div>
    <table width="100%" border=1>
      <tr><td>订单商品</td><td>收货人</td><td>订单金额</td><td>下单时间</td><td>订单状态</td></tr>
       <c:forEach items="${orderRef}" var="orderRef">
      <tr>
      <td>
        <c:forEach items="${orderRef.orderDetailsPic}" var="orderDetailsPic">
          <img width="40" height="40"src="${orderDetailsPic.url}"/><strong style="color:red">*${orderDetailsPic.item_num}</strong> 
        </c:forEach>
      </td>
      
      <td>${orderRef.order.consignee}</td>
      <td>${orderRef.order.totalPrice}</td>
      <td><fmt:formatDate value="${orderRef.order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
      <td>${orderRef.order.state}</td>
      </tr>
      </c:forEach>
    </table>
  </body>
</html>
