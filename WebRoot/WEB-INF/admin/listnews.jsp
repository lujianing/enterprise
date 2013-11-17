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
<script language="javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript">


function del(id){
$.ajax( {
	type : "POST",
	url : "<%=basePath%>News_delete?id=" + id,
			dataType : "json",
			success : function(data) {
				if (data.del == "true") {
					alert("删除成功！");
					$("#" + id).remove();
					$("#" + id + "hr").remove();
				} else {
					alert("删除失败！");
				}
			},
			error : function() {
				alert("网络连接出错！");
			}
		});
	}

	
</script>
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
	ArrayList<News> list  = (ArrayList<News>)pagebean.getList();
%>
<body >
	<div align="center">
	<h1>新闻中心</h1>
	<table width="700" align="center">
		<%
		 for(int i = 0 ; i <list.size();i++){
			 
		 	News news = list.get(i);
		%>
		<tr id="<%=news.getId() %>">
			<td width="558" height="28"><a href="Admin_getnews?id=<%=news.getId() %>"><%=news.getTitle() %></a> </td>
			<td width="207"><input type="button"
					onclick="del(<%=news.getId() %>)" value="删除" /></td>
		</tr>
		<tr id="<%=news.getId() %>hr">
			<td height="4" colspan="2"><hr></td>
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
　　　　		 
　　　　　　		<a href="Admin_listnews?page=1">第一页</a>  
　　　　　　		<a href="Admin_listnews?page=<%=pagebean.getCurrentPage()-1 %>">上一页</a>  
　　　　		<% }%> 
　　　　		<% if(pagebean.getCurrentPage() != pagebean.getTotalPage()){ %>
　　　　　　	<a href="Admin_listnews?page=<%=pagebean.getCurrentPage()+1 %>">下一页</a>  
　　　　　　	<a href="Admin_listnews?page=<%=pagebean.getTotalPage() %>"/>最后一页</a>  
　　　　		<% }else{%>  
　　　　		  
　　　　　　		下一页 最后一页  
　　　　		<%} %>
	</div>
</body>
</html>