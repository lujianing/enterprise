<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*,com.qianyan.bean.*"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	PageBean pagebean =(PageBean)request.getAttribute("pagebean");
	ArrayList<Video> list  = (ArrayList<Video>)pagebean.getList();
	boolean needfresh = false;
%>
<%
	for(int i=0;i<list.size();i++){
		if(list.get(i).getCd()!=3){
			needfresh = true;
		}
	}
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
<script type="text/javascript">
<%
	if(needfresh){
%>

setTimeout("showTime()",10000);
function showTime(){
	 location.reload();
	  setTimeout("showTime()",10000);
}
<%}%>


</script>
<script language="javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  	 
  	 $(".deleteVideo").bind("click",function(){
  	 	var id = $(this).attr("data-id");
  	 	$.ajax( {
			type : "POST",
			url : "<%=basePath%>Video_delete?videoid=" + id,
			dataType : "json",
			success : function(data) {
				if (data.del == "true") {
					alert("删除成功！");
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

<body>
	<div align="center">
		<h1>视频中心</h1>
		<table width="700" align="center">
			<%
		 for(int i = 0 ; i <list.size();i++){
			 
		 	Video video = list.get(i);
		%>

			<table width="550" height="277" border="1" align="center"
				bordercolor="#0099CC" cellspacing="0">
				<tr>
					<td width="83" height="40"><span class="STYLE3">视频名称：</span></td>
					<td width="227"><%=video.getTitle() %></td>
					<td width="225" colspan="2" rowspan="4">
					
					<%
						if(video.getCd()==3){
					%>
					<a href="Admin_getvideo?id=<%=video.getId() %>">
					<img src="<%=basePath+video.getPsrc() %>" width="220" height="159" />
					</a>
					<%
						}else if(video.getCd()!=3){
					%>
					<img src="<%=basePath+"/images/loading.jpg" %>" width="220" height="159" />
					<% 
						}
					%>
					</td>
				</tr>
				<tr>
				  <td height="40"><span class="STYLE3">视频状态：</span></td>
				  <td>
				  <%
				  		if(video.getCd()==3){
				  			out.print("视频可用");
				  		}else{
				  			out.print("视频转化中");
				  		}
				  %>
				  </td>
  </tr>
				<tr>
					<td height="40"><span class="STYLE3">点击次数：</span></td>
					<td><%=video.getClick() %></td>
				</tr>
				<tr>
					<td height="40"><span class="STYLE3">下载次数：</span></td>
					<td><%=video.getDownload() %></td>
				</tr>
				<tr>
					<td height="81"><span class="STYLE3">视频简介：</span></td>
					<td colspan="3"><%=video.getVinfo() %></td>
				</tr>
				<tr>
					<td height="25"><span class="STYLE3">操作：</span></td>
					<td colspan="3"><a href="javascript:void(0)" class="deleteVideo" data-id="<%=video.getId() %>">删除</a>
					<a href="Video_updateinput?videoid=<%=video.getId() %>">更新</a>
&nbsp;					</td>
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

		<a href="Admin_listvideos?page=1">第一页</a> <a
			href="Admin_listvideos?page=<%=pagebean.getCurrentPage()-1 %>">上一页</a>
		<% }%>
		<% if(pagebean.getCurrentPage() != pagebean.getTotalPage() && pagebean.getTotalPage()!=0){ %>
		<a href="Admin_listvideos?page=<%=pagebean.getCurrentPage()+1 %>">下一页</a>
		<a href="Admin_listvideos?page=<%=pagebean.getTotalPage() %>" />最后一页</a>
		<% }else{%>

		下一页 最后一页
		<%} %>
	</div>
</body>
</html>