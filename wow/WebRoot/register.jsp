<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>注册</title>
	<link rel="stylesheet" type="text/css" href="./css/reset.css">
	<link rel="stylesheet" type="text/css" href="./css/register.css">
	<script type="text/javascript" data-main="./js/register" src="./js/require.js"></script>
</head>
<body>
	<div id="wrap">
		<div class="head">
			<a href="#"><img src="./image/tools/register_logo.png"></a>
			<a href="#"><img src="./image/tools/register_wel_m.png"></a>
		</div>
		<div class="main clear">
			<div class="mainLeft fl clear">
				<h2>新用户注册</h2>
				<form action="/wow/user/insertUser.action" class="formInfo" method="post">
					<div>
						<label for="user"><b>*</b>用户名：</label><input type="text" id="user" class="allsInput" maxlength="20" name="username">
						<span class="successIcon"></span>
						<div class="additionalInfo"><p>4-20位字符，支持汉字、字母、数字及"-"、"_"组合</p></div>
						<div class="loading"></div>
					</div>
					<div>
						<label for="pass"><b>*</b>密码：</label><input type="password" id="pass" class="allsInput" maxlength="20" name="password">
						<p><span>密码强度：</span><b class="pwdstrength"></b></p>
						<span class="successIcon"></span>
						<div class="additionalInfo"><p>6到20位字符，建议由字母，数字和符号两种以上的组合</p></div>
					</div>
					<div>
						<label for="confirmPass"><b>*</b>确认密码：</label><input type="password" id="confirmPass" class="allsInput" name="confirmPass" >
						<span class="successIcon"></span>
						<div class="additionalInfo"><p>请再次输入密码</p></div>
					</div>
					<div>
						<label for="mail"><b>*</b>邮箱：</label><input type="text" id="mail" class="allsInput"  name="email">
						<span class="successIcon"></span>
						<div class="additionalInfo"><p>请输入正确邮箱号</p></div>
						<ul id="autoEmail"></ul>
					</div>
					<div>
						<label for="phone"><b>*</b>手机：</label><input type="text" id="phone" class="allsInput" name="telphone">
						<span class="successIcon"></span>
						<div class="additionalInfo"><p>请输入正确手机号</p></div>
					</div>
					<div>
						<label for="verificationCode"><b>*</b>验证码：</label><input type="text" id="verificationCode" class="allsInput" name="verificationCode" >
						<div id="createCode"><img src="/wow/user/getCheckCode.action" id="changeImg"  /></div>
						<span class="successIcon"></span>
						<div class="additionalInfo"><p>请输入验证码</p></div>
						<p id="verification_code">验证码错误</p>
						<div class="loading"></div>
					</div>
					<div>
						<input type="checkbox" id="check" name="check"><strong>我已阅读并同意<a href="#" >《三农网用户注册协议》</a></strong>
					</div>
					<div>
						<input type="submit" id="btn" name="btn" value="立即注册" disabled="disabled">
					</div>
				</form>
			</div>
			<div class="mainRight fr clear">
				<a href="login.jsp"><strong>登录</strong></a>
			</div>
		</div>
	</div>
</body>
</html>