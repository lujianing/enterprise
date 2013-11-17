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
	PageBean pagebean =(PageBean)request.getAttribute("pagebean");
	ArrayList<User> list  = (ArrayList<User>)pagebean.getList();
	User admin = (User)session.getAttribute("admin");
%>
<body >
	<div align="center">
	<h1>用户中心</h1>
	<table width="700" align="center">
		<%
		 for(int i = 0 ; i <list.size();i++){
			 
		 	User user = list.get(i);
		%>
		<tr>
			<td width="150" height="28"><a href="Admin_getuser?id=<%=user.getId() %>"><%=user.getName() %></a>
			<%
				if(user.getPower()>0){
			%>
			(管理员)
			<%} %>
			 </td>
			<td width="150"><a href="Admin_deleteuser?id=<%=user.getId() %>">删除</a></td>
			<%if(admin.getPower()>5){
			%>
			<td width="200"><a href="Admin_addadmin?id=<%=user.getId() %>">提升为管理员</a></td>
			<td width="200"><a href="Admin_deleteadmin?id=<%=user.getId() %>">取消管理员</a></td>
			<%} %>
		</tr>
		<tr>
			<td height="4" colspan="4"><hr></td>
		</tr>
		<%
		 }
		%>
	</table>
	
	共<font color="red"><%=pagebean.getAllRow() %> </font>条记录   
　　　　		当前第<font color="red"><%=pagebean.getCurrentPage() %></font>页  
　　　　  		共<font color="red"><%=pagebean.getTotalPage() %> </font> 页<br/>
			<%
				if(pagebean.getCurrentPage()==1){
			%>
　　　　　　	第一页 上一页  
　　　　		<% }else{%>
　　　　		 
　　　　　　		<a href="Admin_listusers?page=1">第一页</a>  
　　　　　　		<a href="Admin_listusers?page=<%=pagebean.getCurrentPage()-1 %>">上一页</a>  
　　　　		<% }%> 
　　　　		<% if(pagebean.getCurrentPage() != pagebean.getTotalPage()){ %>
　　　　　　	<a href="Admin_listusers?page=<%=pagebean.getCurrentPage()+1 %>">下一页</a>  
　　　　　　	<a href="Admin_listusers?page=<%=pagebean.getTotalPage() %>"/>最后一页</a>  
　　　　		<% }else{%>  
　　　　		  
　　　　　　		下一页 最后一页  
　　　　		<%} %>
	</div>
</body>
</html>