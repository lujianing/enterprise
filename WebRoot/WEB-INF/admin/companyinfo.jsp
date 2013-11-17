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
<script type="text/javascript" src="<%=basePath%>ckeditor/ckeditor.js"></script>
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
<% CompanyInfo companyinfo = (CompanyInfo)request.getAttribute("companyinfo");
		%>
<body >
	<div align="center">
	<h1>网站基本设置</h1>
	<form id="form1" name="form1" method="post" action="Company_update?id=<%=companyinfo.getId() %>">
	<%
			if(companyinfo!=null){
		%>
		<textarea name="textarea" cols="100" rows="50"><%=companyinfo.getContent() %></textarea>
		<script type="text/javascript">
		CKEDITOR.replace('textarea');
		</script>	
		<%} %>
		 <input type="submit" name="Submit" value="修改" />
		</form>
	</div>
</body>
</html>