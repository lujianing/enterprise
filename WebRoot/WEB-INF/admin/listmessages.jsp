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
	url : "<%=basePath%>Message_delete?id=" + id,
			dataType : "json",
			success : function(data) {
				if (data.del == "true") {
					alert("删除成功！");
					$("#" + id).remove();
					$("." + id + "hr").remove();
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
.STYLE3 {
	color: #0066FF;
	font-size: 14px;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
</style>

</head>
<%
	PageBean pagebean =(PageBean)request.getAttribute("pagebean");
	ArrayList<Message> list  = (ArrayList<Message>)pagebean.getList();
%>
<body>
	<div align="center">
		<h1>留言信息</h1>
		<table width="700" align="center">
			<%
		 for(int i = 0 ; i <list.size();i++){
			 
		 	Message message = list.get(i);
		%>
			
			<table width="650" height="180" border="1" align="center"
				bordercolor="#0099CC" cellspacing="0" id="<%=message.getId() %>">
				<tr height="30">
					<td width="79"><span class="STYLE3">标题：</span></td>
					<td colspan="3"><%=message.getTitle() %></td>
				    <td><span class="STYLE3">操作：</span></td>
				    <td><input type="button"
					onclick="del(<%=message.getId() %>)" value="删除" /></td></td>
				</tr>
				<tr height="30">
					<td><span class="STYLE3">用户名：</span></td>
					<td width="100"><%=message.getName() %></td>
					<td width="80"><span class="STYLE3">邮箱：</span></td>
					<td width="139"><%=message.getMail() %></td>
					<td width="62"><span class="STYLE3">电话：</span></td>
					<td width="146"><%=message.getPhone() %></td>
				</tr>

				<tr height="120">
					<td height="90"><span class="STYLE3">内容：</span></td>
					<td colspan="5"><%=message.getContent() %></td>
				</tr>
			</table>
			
			<tr class="<%=message.getId() %>hr">
				<td class="<%=message.getId() %>hr" ><hr class="<%=message.getId() %>hr" width="700"></td>
			</tr>
			<%
		 }
		%>
		</table>

		共<font color="red"><%=pagebean.getAllRow() %> </font>条记录 当前第<font
			color="red"><%=pagebean.getCurrentPage() %></font>页 共<font
			color="red"><%=pagebean.getTotalPage() %> </font> 页<br />
		<%
				if(pagebean.getCurrentPage()==1){
			%>
		第一页 上一页
		<% }else{%>

		<a href="Admin_listmessages?page=1">第一页</a> <a
			href="Admin_listmessages?page=<%=pagebean.getCurrentPage()-1 %>">上一页</a>
		<% }%>
		<% if(pagebean.getCurrentPage() != pagebean.getTotalPage()){ %>
		<a href="Admin_listmessages?page=<%=pagebean.getCurrentPage()+1 %>">下一页</a>
		<a href="Admin_listmessages?page=<%=pagebean.getTotalPage() %>" />最后一页</a>
		<% }else{%>

		下一页 最后一页
		<%} %>
	</div>
</body>
</html>