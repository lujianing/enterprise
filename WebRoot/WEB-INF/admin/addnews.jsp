<%@ page language="java" contentType="text/html; charset=UTF-8" 
    import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*,com.qianyan.bean.*"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
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

<body >
	
	<h1>添加新闻</h1>
	<form id="form1" name="form1" method="post" action="News_add">

						标题：<input type="text" name="title" size="100" height="20" /> <br>
						内容：
						<textarea name="content" id="content" maxlength="100"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('content');
						</script>
						<br> 
						<input type="checkbox" name="sendmail" value="1" />群发邮件<br>
						<input type="submit" name="Submit" value="提交" />

					</form>
	
</body>
</html>