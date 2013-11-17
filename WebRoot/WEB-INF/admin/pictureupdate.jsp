<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*,com.qianyan.bean.*"
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>Insert title here</title>
<style type="text/css">
.STYLE3 {
	color: #0066FF;
	font-size: 14px;
}
</style>
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
	Picture picture =(Picture)request.getAttribute("picture");
	 
%>
<body>
	<div align="center">
		<h1>产品图片修改</h1>
		<form name="form1" method="post" action="Admin_pictureupdate" >
			
		
			<table width="506" height="224" border="1" align="center"
				bordercolor="#0099CC" cellspacing="0">
				<tr>
					<td width="74" height="38"><span class="STYLE3">产品名称:</span></td>
					<td width="187"><input type="text" name="title" value=" <%=picture.getTitle() %>" /></td>
					<td width="210" rowspan="2"><input type="hidden" name="id" value="<%=picture.getId() %>">
					<img src="<%=basePath+picture.getSmallsrc() %>" width="220" height="159" /></td>
				</tr>
				<tr>
					<td height="138"><span class="STYLE3">产品简介：</span></td>
					<td><textarea name="info" cols="20" rows="5"><%=picture.getInfo() %></textarea></td>
				</tr>
				<tr>
					<td height="38"><span class="STYLE3">操作：</span></td>
					<td colspan="2"><input type="submit" value="修改" />
					</td>
				</tr>
			</table>

		</form>	

		
	</div>
</body>
</html>