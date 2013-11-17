<%@ page language="java"
	import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*"
	pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>软件学院视频站</title>
<link href="./css/web_main.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="./include/flashWrite.js"></script>
<script language="javascript" src="./include/div.js"></script>
<script language="javascript" type="text/javascript" src="./js/flash.js"></script>
<strong></strong>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
-->
</style>
</head>
<%
	News news = (News)request.getAttribute("news");
%>
<body>
	

				
					<div align="center">
						<h1><%=news.getTitle() %></h1>
					</div>
					<br/>
					<p align="left"><%=news.getContent() %></p>
			
			
</body>
</html>
