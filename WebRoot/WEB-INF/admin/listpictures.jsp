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
<script language="javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$(".deletePic").bind("click",function(){
		var id = $(this).attr("data-id");
		//alert(id);
			$.ajax( {
			type : "POST",
			url : "Picture_delete?id=" + id,
					dataType : "json",
					success : function(data) {
						if (data.del == "true") {
							alert("删除成功");
							window.location.reload();
						} else {
							alert("删除失败！");
						}
					},
					error : function() {
						alert("网络连接出错！");
					}
				});
		
	});

});
</script>
</head>
<%
	PageBean pagebean =(PageBean)request.getAttribute("pagebean");
	ArrayList<Picture> list  = (ArrayList<Picture>)pagebean.getList();
%>
<body>
	<div align="center">
		<h1>产品中心</h1>
		<table width="700" align="center">
			<%
		 for(int i = 0 ; i <list.size();i++){
			 
			 Picture picture = list.get(i);
		%>

			<table width="506" height="224" border="1" align="center"
				bordercolor="#0099CC" cellspacing="0">
				<tr>
					<td width="74" height="38"><span class="STYLE3">产品名称:</span></td>
					<td width="187"><%=picture.getTitle() %></td>
					<td width="210" rowspan="2"><img
											src="<%=basePath+picture.getSmallsrc() %>" width="220" height="159" /></td>
				</tr>
				<tr>
					<td height="138"><span class="STYLE3">产品简介：</span></td>
					<td><%=picture.getInfo() %></td>
				</tr>
				<tr>
					<td height="38"><span class="STYLE3">操作：</span></td>
					<td colspan="2"><a href="javascript:void(0)" class="deletePic" data-id="<%=picture.getId() %>">删除</a> 
					<a href="Admin_updatepictureinput?id=<%=picture.getId() %>">更改</a>
					</td>
				</tr>
			</table>

			<tr>
				<td><hr width="700"></td>
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

		<a href="Admin_listpictures?page=1">第一页</a> <a
			href="Admin_listpictures?page=<%=pagebean.getCurrentPage()-1 %>">上一页</a>
		<% }%>
		<% if(pagebean.getCurrentPage() != pagebean.getTotalPage() && pagebean.getTotalPage()!=0){ %>
		<a href="Admin_listpictures?page=<%=pagebean.getCurrentPage()+1 %>">下一页</a>
		<a href="Admin_listpictures?page=<%=pagebean.getTotalPage() %>" />最后一页</a>
		<% }else{%>

		下一页 最后一页
		<%} %>
	</div>
</body>
</html>