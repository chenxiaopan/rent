<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'doRegs.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var t = 3; //设置一个跳转秒数

	$(function() {
		time = setInterval("count()", 1000); //定义一个定时器
		$("#timeCount").html(t); //显示当前的秒数
	});

	function count() {
		t--; //秒数自减
		if (t >= 0) {
			$("#timeCount").html(t); //刷新当前的秒数，重新显示秒数

		} else {
			clearInterval(time);//这个可以不用，因为页面都要跳转了，要了也没多大差别
			document.location.href = "page/login.jsp"; // 设置跳转的链接
		}

	}
</script>
</head>

<body>
	<h2>
		注册成功！<span id="timeCount">3</span>秒后转到登录界面！
	</h2>
</body>
</html>
