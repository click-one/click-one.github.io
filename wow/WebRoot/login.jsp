<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>

    <base href="<%=basePath%>">
	<title>login</title>
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
	<link rel="stylesheet" type="text/css" href="./css/login.css">
	<script type="text/javascript" data-main="./js/login" src="./js/require.js"></script>
</head>
<body>
	<div id="wrap">
		<div class="head">
			<a href="#"><img src="./image/tools/register_logo.png"></a>
			<a href="#"><img src="./image/tools/register_wel_m.png"></a>
		</div>
		<div class="main">
			<div class="mainLeft fl">
				<img src="./image/loginView.jpg">
			</div>
			<div class="mainRight fr">
				<div class="mainRightTop clear">
					<h1 class="fl">会员登录</h1>
					<div class="fr"><span></span><a href="register.jsp">立即注册</a></div>
				</div>
				<p class="tip">公共场所不建议自动登录，以防账号丢失</p>
				<div class="mainRightCont"></div>
				<ul class="ulForm">
					<form action="/wow/user/login.action" method="post">
						<li><label for="account">账号：</label><input type="text" name="username" id="account"></li>
						<li><label for="password">密码：</label><input type="password" name="password" id="password"></li>
						<li><input type="checkbox" name="check" id="check" ><span>自动登录</span><a href="#" class="fr">忘记密码？</a></li>
						<li><input type="submit" value="登录" name="btn"></li>
					</form>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>