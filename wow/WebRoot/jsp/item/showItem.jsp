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
    
    <title>My JSP 'showItem.jsp' starting page</title>
    
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
  
                          排序方式:
         &nbsp&nbsp&nbsp&nbsp<a href="item/ItemOrder.action?id=${id}&parent_id=${parent_id}&sortId=1&sortName=1&fuzzyName=${fuzzyName}&pNum=${pageBean.pNum}">价格降序</a>
         &nbsp&nbsp&nbsp&nbsp<a href="item/ItemOrder.action?id=${id}&parent_id=${parent_id}&sortId=2&sortName=1&fuzzyName=${fuzzyName}&pNum=${pageBean.pNum}">价格升序</a>
         &nbsp&nbsp&nbsp&nbsp<a href="item/ItemOrder.action?id=${id}&parent_id=${parent_id}&sortId=1&sortName=2&fuzzyName=${fuzzyName}&pNum=${pageBean.pNum}">上市时间降序</a>
         &nbsp&nbsp&nbsp&nbsp<a href="item/ItemOrder.action?id=${id}&parent_id=${parent_id}&sortId=2&sortName=2&fuzzyName=${fuzzyName}&pNum=${pageBean.pNum}">上市时间升序</a> 
         &nbsp&nbsp&nbsp&nbsp<a href="item/ItemOrder.action?id=${id}&parent_id=${parent_id}&sortId=1&sortName=3&fuzzyName=${fuzzyName}&pNum=${pageBean.pNum}"> 销量排行降序</a>
         &nbsp&nbsp&nbsp&nbsp<a href="item/ItemOrder.action?id=${id}&parent_id=${parent_id}&sortId=2&sortName=3&fuzzyName=${fuzzyName}&pNum=${pageBean.pNum}">销量排行升序</a>
         &nbsp&nbsp&nbsp&nbsp<a style="color:red"  href="item/gainClassify.action">返回到主页</a>
        <br/>
        ${parent_id}
        <br/>
        ${id}
    <c:if test="${empty pageBean.itemPictures}">
                 <h2>该商品还未上架！！！敬请期待</h2>
    </c:if>
    
   <br/> 
    <c:if test="${!empty pageBean.itemPictures}">
    <c:forEach  items ="${pageBean.itemPictures}" var="itemPictures">
    <a href="#">
      <img width="200" height="200" src="${itemPictures.itemPic.url}"/>
    </a>
        <h3 > 名称：${itemPictures.item.name} 价格：${itemPictures.item.price}
                                          商品描述：${itemPictures.item.detail}  产地：${itemPictures.item.area}
                   上市时间:<fmt:formatDate value="${itemPictures.item.createTime}" type="date"/> 
                  销量:${itemPictures.item.saleCount}
                   
        </h3>
      <br/>
    </c:forEach>
    </c:if>
    
    <div style="margin-left:800px">
    <c:if test="${!empty pageBean.totalRecordNum}">
      <c:if test="${pageBean.totalPageNum != 1}"><!--    如果查询出来的数据不为空并且数据大于一页时，则显示分页栏-->
      	        <c:if test="${pageBean.pNum != 1}">
				<a href="item/ItemOrder.action?id=${id}&parent_id=${parent_id}&sortId=1&sortName=3&fuzzyName=${fuzzyName}&pNum=${pageBean.pNum-1 }">上一页</a>
				</c:if>
				
				<!-- 当前页为中心前后各显示10页 -->
				<c:set var="begin" value="1" scope="page" />
				<c:set var="end" value="${pageBean.totalPageNum}" scope="page" />
				
				<!-- 判断前面有没有10页 -->
				<c:if test="${pageBean.pNum-10>0}">
					<c:set var="begin" value="${pageBean.pNum-10}" scope="page" />
				</c:if>
				
				<!-- 判断后面有没有10页 -->
				<c:if test="${pageBean.pNum+10 < pageBean.totalPageNum}">
					<c:set var="end" value="${pageBean.pNum + 10}" scope="page" />
				</c:if>
				
				<!-- 当前页不显示链接 -->
				<c:forEach begin="${begin}" end="${end}" var="i">
					<c:if test="${pageBean.pNum==i}">
						${i }
					</c:if>
					<c:if test="${pageBean.pNum!=i}">
						<a href="item/ItemOrder.action?id=${id}&parent_id=${parent_id}&sortId=1&sortName=3&fuzzyName=${fuzzyName}&pNum=${i }">${i } </a>
					</c:if>	
				</c:forEach>
				
				<!-- 显示尾页 -->
				<c:if test="${pageBean.pNum == pageBean.totalPageNum}">
					
				</c:if>
				
				<c:if test="${pageBean.pNum != pageBean.totalPageNum}">
					<a href="item/ItemOrder.action?id=${id}&parent_id=${parent_id}&sortId=1&sortName=3&fuzzyName=${fuzzyName}&pNum=${pageBean.pNum + 1 }">下一页</a>
					
			    </c:if>
		</c:if>
	</c:if>
    </div>
  </body>
</html>
