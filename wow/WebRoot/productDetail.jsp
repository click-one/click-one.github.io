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
	<meta charset="UTF-8">
	<title>果蔬缤纷</title>
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
	<link rel="stylesheet" type="text/css" href="./css/common.css">
	<link rel="stylesheet" type="text/css" href="./css/productDetail.css">
</head>
<body>
	<!--header-->
	<div id="header">
		<div class="loginBar fl">
			<span>欢迎来果蔬缤纷&nbsp;请</span><a href="#" class="login">登录</a><span class="dividing"></span><a href="#" class="register">注册</a>
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
					<ul class="detailsList">
						<li class="product_1">
							<div class="kinds">
								<a href="#"><i></i>进口水果</a>
							</div>
							<dl class="kindsDl">
								<dt class="fl kindsDt">推荐</dt>
								<dd class="fl kindsDd"><a href="#">百香果</a><a href="#">榴莲</a><a href="#">柑橘类</a></dd>
							</dl>
							<div class="moreDetailLisrt">
								<dl>
									<dd>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
									</dd>									
								</dl>
							</div>
						</li>
						<li class="product_2">
							<div class="kinds">
								<a href="#"><i></i>国产水果</a>
							</div>
							<dl class="kindsDl">
								<dt class="fl kindsDt">推荐</dt>
								<dd class="fl kindsDd"><a href="#">番石榴</a><a href="#">柑橘类</a><a href="#">梨类</a></dd>
							</dl>
							<div class="moreDetailLisrt">
								<dl>
									<dd>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
									</dd>									
								</dl>
							</div>
						</li>
						<li class="product_3">
							<div class="kinds">
								<a href="#"><i></i>新鲜蔬菜</a>
							</div>
							<dl class="kindsDl">
								<dt class="fl kindsDt">推荐</dt>
								<dd class="fl kindsDd"><a href="#">豆角类</a><a href="#">叶菜类</a><a href="#">瓜类</a></dd>
							</dl>
							<div class="moreDetailLisrt">
								<dl>
									<dd>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
									</dd>									
								</dl>
							</div>
						</li>
						<li class="product_4">
							<div class="kinds">
								<a href="#"><i></i>粮油副食</a>
							</div>
							<dl class="kindsDl">
								<dt class="fl kindsDt">推荐</dt>
								<dd class="fl kindsDd"><a href="#">杂粮类</a><a href="#">大米类</a><a href="#">花生油</a></dd>
							</dl>
							<div class="moreDetailLisrt">
								<dl>
									<dd>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
									</dd>									
								</dl>
							</div>
						</li>
						<li class="product_5">
							<div class="kinds">
								<a href="#"><i></i>肉禽蛋奶</a>
							</div>
							<dl class="kindsDl">
								<dt class="fl kindsDt">推荐</dt>
								<dd class="fl kindsDd"><a href="#">家禽</a><a href="#">猪肉类</a><a href="#">蛋类</a></dd>
							</dl>
							<div class="moreDetailLisrt">
								<dl>
									<dd>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
									</dd>									
								</dl>
							</div>
						</li>
						<li class="product_6">
							<div class="kinds">
								<a href="#"><i></i>休闲食品</a>
							</div>
							<dl class="kindsDl">
								<dt class="fl kindsDt">推荐</dt>
								<dd class="fl kindsDd"><a href="#">蜂蜜</a><a href="#">玫瑰系列</a><a href="#">坚果</a></dd>
							</dl>
							<div class="moreDetailLisrt">
								<dl>
									<dd>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
										<a href="">百香果</a>
									</dd>									
								</dl>
							</div>
						</li>
					</ul>
				</a>
			</li>
			<li class="fl otherList list"><a href="item/showRollPic.action" class="listA">首页</a></li>
			<li class="fl otherList list"><a href="#" class="listA">新鲜蔬菜</a></li>
			<li class="fl otherList list"><a href="#" class="listA">果乐缤纷</a></li>
			<li class="fl otherList list"><a href="#" class="listA">优惠专区</a></li>
			<li class="fl otherList list"><a href="#" class="listA">用户留言</a></li>
		</ul>

		<div class="cartBar fl">
			<span class="cartIcon">&#xe015;</span>
			<span class="cartText">购物车中有</span>
			<strong class="cartNumber">23</strong>
			<span class="cartText">商品</span>
			<a href="#" class="cartGo">去结算</a>
		</div>
	</div>
	<!--productDetail description start-->
	<div id="detail">
		<div class="detailLeft fl">

			<div class="detailLeftTop">
				<div class="detailImg fl">
					<div class="bigImg">
						<!--中图，鼠标放上有遮罩的图片-->
						<img src="${itemDetailsRef.itemPicture.itemPic.url}" class="hoverImg">
						<!--遮罩层-->
						<div id="zhezhao"></div>
						<!--查看的大图-->
						<div id="outsideBigImg">
							<img src="${itemDetailsRef.itemPicture.itemPic.url}" class="outSideimg">
						</div>
					</div>
					<!--下面一行排列的小图-->
					<ul class="smallImgs clear">
					<c:forEach items="${itemDetailsRef.itemInfoPics}" var="itemInfoPics">
					  <li class="fl"><img src="${itemInfoPics.url}" alt=""></li>
					</c:forEach>
						
					</ul>
				</div>
				<div class="detailContent fl">
				
					<div class="detailTop">
						<h1>${itemDetailsRef.itemPicture.item.name}</h1>
						<p>${itemDetailsRef.itemPicture.item.detail}</p>
					</div>
					<div class="detailPrice">
						<dl class="detailNowPrice">
							<dt>现价：</dt>
							<dd>
								<em>￥</em>
								<span>
								<fmt:formatNumber type="number" value="${itemDetailsRef.itemPicture.item.price*itemDetailsRef.itemPicture.item.discount} " maxFractionDigits="2"/>
								</span>
							</dd>
						</dl>
						<dl class="detailOldPrice clear">
							<dt class="fl">原价：</dt>
							<dd class="fl">
								<em>￥</em>
								<span>${itemDetailsRef.itemPicture.item.price}</span>
							</dd>
						</dl>
					</div>
					<ul class="detailNum">
						<li class="fl"><span class="spanLabel">月销量</span><span class="spanCount">${itemDetailsRef.itemPicture.item.saleCount}</span></li>
						<li class="fl"><span class="spanLabel">累计评价</span><span class="spanCount">${itemDetailsRef.totalComment}</span></li>
						<li class="fl lastLi"><span class="spanLabel">库存</span><span class="spanCount stock">${itemDetailsRef.itemPicture.item.repertory}</span></li>
					</ul>
					<div class="buttonNumCart"  onselectstart="return false">
						<form method="post" action="">
							<div class="cartsNumber">
								<span class="purchesNum">购买数量：</span>
								<input type="text" value="1" name="num" >
								<input type="hidden" value="${itemDetailsRef.itemPicture.item.id}" name="id" >
								<span class="btns">
									<span class="plus">&#x32;</span>
									<span class="decrease">&#x33;</span>
								</span>
							</div>
							<div class="purchesBtn">
								<button class="atOnceBtn">立即购买</button>
								<button class="plusCart"><em>&#xe015;</em>加入购物车</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--商品简介和买家评价-->
			<div class="detailCont">
				<ul class="tabBar">
					<li class="descriptionTabBar fl addTabBar"><a href="javascript:void(0)">商品简介</a></li>
					<li class="evaluationTabBar fl"><a href="javascript:void(0)">累计评价<em>${itemDetailsRef.totalComment}</em></a></li>
				</ul>
				<div class="tabBarContent">
					<div class="descriptionTabBarCont">
						<img data-src="./image/description/mangoDescription_1.png">
						<img data-src="./image/description/mangoDescription_2.png">
						<img data-src="./image/description/mangoDescription_3.png">
						<img data-src="./image/description/mangoDescription_4.png">
						<img data-src="./image/description/mangoDescription_5.png">
					</div>
					<div class="evaluationTabBarCont">
						<div class="evaluationTabBarContOption">
							<table class="tableOption">
								<thead>
									<tr>
										<th>评价心得</th>
										<th>顾客满意度</th>
										<th>评论者</th>
									</tr>
								</thead>
								<tbody>
<!-- 									<tr>
										<td>这个水果很好吃，果然很好吃。</td>
										<td>
											<span class="star">
												<span></span>
												<span></span>
												<span></span>
												<span></span>
												<span></span>
										    </span>
										</td>
										<td>
											<a href="javascript:;">小杨</a><br />
											<a href="javascript:;">2014-09-23</a>
										</td>
									</tr>
									<tr>
										<td>这个水果很好吃，果然很好吃。</td>
										<td>
											<span class="star">
												<span></span>
												<span></span>
												<span></span>
												<span></span>
												<span></span>
										    </span>
										</td>
										<td>
											<a href="javascript:;">小杨</a><br />
											<a href="javascript:;">2014-09-23</a>
										</td>
									</tr> -->
									
								</tbody>
							</table>
						</div>
						
						<!--分页-->
						<div class="evaluationTabBarContPage" id="contPage">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="detailRight fl">
			<h2>热销产品</h2>
			
			<c:forEach items="${itemDetailsRef.hotSell}" var="hotSell"> 
			  <a href="itemDetails/itemDetails.action?id=${hotSell.item.id}">
				<div class="sameProducts">
					<img src="${hotSell.itemPic.url}">
					<p> ${hotSell.item.name} ${hotSell.item.detail}</p>
				</div>
			   </a>
			</c:forEach>
			
		</div>
	</div>
	<!--footer start-->
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
<script type="text/javascript" data-main="./js/productDetail" src="./js/require.js"></script>
</html> 