<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
     <base href="<%=basePath%>">
	<title>果蔬缤纷</title>
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
	<link rel="stylesheet" type="text/css" href="./css/index.css">
	<link rel="stylesheet" type="text/css" href="./css/common.css">
	<script type="text/javascript" data-main="./js/index" src="./js/require.js"></script>
</head>
<body>
	<!--header-->
	<div id="header">
		<div class="loginBar fl">
		    <c:if test="${empty sessionScope.user}">
		      <span>欢迎来果蔬缤纷&nbsp;请</span><a href="login.jsp" class="login">登录</a><span class="dividing"></span><a href="register.jsp" class="register">注册</a>
		    </c:if>
		      
		    <c:if test="${!empty sessionScope.user}">
		     <span>亲爱的${sessionScope.user.username}欢迎来果蔬缤纷&nbsp;</span><span class="dividing"></span><a href="register.jsp" class="register">个人中心</a>
		     <span class="dividing"></span><a href="user/logout.action" class="register">登出</a>
		    </c:if>
			
		</div>
		<div class="memberLink fr">
			<a href="#">收藏网站</a><span class="dividing"></span><a href="#">我的订单</a><span class="dividing"></span><a href="#">会员中心</a><span class="dividing"></span><a href="#">帮助中心</a>
		</div>
		<div class="headerMain">
			<div class="logo fl">
				<a href="#"><img src="./image/tools/logo.jpg" title="果蔬缤纷"></a>
			</div>
			<div class="search fl">
				<div class="searchForm">
					<input type="text" name="searchText" placeholder="蔬菜、水果、香蕉" class="searchText">
					<input type="button" class="searchBtn" value="搜索" >
				</div>
				<div class="hotKeywords">
					<span class="hot">热门搜索：</span>
					<a href="#">奇异果</a>
					<a href="#">苹果</a>
					<a href="#">芒果</a>
					<a href="#">香蕉</a>
					<a href="#">榴莲</a>
					<a href="#">西瓜</a>
					<a href="#">梨</a>
				</div>
			</div>
			<div class="callPhone fr">
				<img src="./image/tools/phone.jpg">
			</div>
		</div>
	</div>
	<!--nav start-->
	<div id="nav">
		<ul class="navList fl">
			<li class="fl allList list">
				<a href="javascript:void(0)" class="listA">
					所有商品分类
					<ul class="detailsList"></ul>
				</a>
			</li>
			<li class="fl otherList list"><a href="item/showRollPic.action" class="listA">首页</a></li>
			<li class="fl otherList list"><a href="#" class="listA">农先生</a></li>
			<li class="fl otherList list"><a href="#" class="listA">菜阿姨</a></li>
			<li class="fl otherList list"><a href="#" class="listA">送货郎</a></li>
			<li class="fl otherList list"><a href="#" class="listA">用户留言</a></li>
		</ul>

		<div class="cartBar fr">
			<span class="cartIcon">&#xe015;</span>
			<span class="cartText">购物车中有</span>
			<strong class="cartNumber">23</strong>
			<span class="cartText">商品</span>
			<a href="#" class="cartGo">去结算</a>
		</div>
	</div>
	<!-- 轮播图 -->
	<div id="slider">
			  <c:forEach items="${rollPic}" var="rollPic">
            <a href="#"><img src="${rollPic.url}" alt=""></a>		
        </c:forEach>	
		<ul class="imgBtn">

			<li class="fl"></li>
			<li class="fl"></li>
			<li class="fl"></li>
			<li class="fl"></li>
			<li class="fl"></li>
		 </ul>
	</div>

	<!--discount start-->
	<div id="discount">
		<div class="offToday discountAll fl">
			<div class="discountTop">
				<strong>今日半价</strong>
				<small>50% OFF TODAY</small>				
			</div>
			<div class="discoutContent">
				<ul class="discountContentUl">
					<li class="discountCont_1"></li>
					<li class="discountCont_2"></li>
					<li class="discountCont_3"></li>
				</ul>
			</div>
		</div>
		<div class="recommend discountAll fl">
			<div class="discountTop">
				<strong>每日推荐</strong>
				<small>RECOMMENDATION</small>				
			</div>
			<div class="recommendContent">
				<div class="recommendContentList">

				</div>
				<div class="recommendContentList">
		
				</div>
			</div>
		</div>
		<div class="seckill discountAll fl">
			<div class="discountTop">
				<strong>天天秒杀</strong>
				<small>EVERY DAY SPIKE</small>				
			</div>
			<div class="seckillContent">
				<div class="seckillContentList">
				</div>
				<div class="seckillContentList">
				</div>
			</div>
		</div>
	</div>
	<!--content start-->
	<div id="guarantee"></div>
	<div id="footer">
		<div class="footerTop clear">
			<ul class="fl">
				<li class="liFirst">关于我们</li>
				<a href=""><li>人才招聘</li></a>
			</ul>
			<ul class="fl">
				<li class="liFirst">客户服务</li>
				<a href=""><li>联系我们</li></a>
			</ul>
			<ul class="fl">
				<li class="liFirst">帮助中心</li>
				<a href=""><li>配送方式</li></a>
				<a href=""><li>支付方式</li></a>
				<a href=""><li>售后服务</li></a>
			</ul>
			<ul class="fl">
				<li class="liFirst">会员中心</li>
				<a href=""><li>收藏列表</li></a>
				<a href=""><li>会员中心</li></a>
				<a href=""><li>历史订单</li></a>
			</ul>
		</div>
		<div class="footerBottom">
			<span>Copyright 2015果乐缤纷 www.guolebinfen.com Inc. AllRights Reserved. 京ICP备130443637号</span>
		</div>
	</div>
</body>	
</html> 