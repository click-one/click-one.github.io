 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>
    
    <script type="text/javascript">
   
	function change(){
		// 重新加载验证码图片 
		// 方法二：如果图片缓存
		document.getElementById("myimg").src = "${pageContext.request.contextPath}/user/getCheckCode.action?"+new Date().getTime(); 
	}
	
	
	function responseJson(){
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath }/user/insertUser.action',
		//请求是key/value这里不需要指定contentType，因为默认就 是key/value类型
		//contentType:'application/json;charset=utf-8',
		//数据格式是json串，商品信息
		data:'username=click&password=123456789',
		error:function(){
			alert("这里出错了");
		},
		success:function(data){//返回json结果
			alert("姓名是："+data.username+data.password+data.gender+data.activeTime);
		}
		
	})
	
}
	
</script>

  </head>
  
  <body>
    <form  method ="post" action="/wow/user/insertUser.action" >
      <table>
        <tr><td>用户名</td><td><input type="text" name="username"></td></tr>
        <tr><td>密码</td><td><input type="password" name="password"/></td></tr>
        <tr><td>确认密码</td><td><input type="password" name="repassword"/></td></tr>
        <tr><td>验证邮箱</td><td><input type="text" name="email"/></td></tr>
        <tr><td>手机</td><td><input type="text" name="telphone"/></td></tr>
        <tr><td>验证码</td><td><input type="text" name="checkcode" />
           <img src="${pageContext.request.contextPath}/user/getCheckCode.action"
           onclick="change()" id="myimg" style="cursor: pointer;"/></td></tr>
        <tr><td colspan="2"><input type="submit" value="注册" "/></td></tr>
        <!--
          onclick="responseJson()
      --></table>
    </form>
  </body>
</html>
