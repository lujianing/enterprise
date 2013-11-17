<%@ page language="java" import="java.util.*,com.qianyan.entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatevideo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <% 
	Video video = (Video)request.getAttribute("video");
%>
  <body>
    <form action="Video_update?videoid=<%=video.getId()%>" method="post"  name="form">
    <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr bgcolor="#E7E7E7">
	<td height="24" colspan="10" align="center">&nbsp;更新视频信息&nbsp;</td>
	</tr>
	   
      <tr>
        <td width="80" height="40">视频标题：</td>
        <td bgcolor="#FFFFFF"><input name="title" type="text" id="title" value="<%= video.getTitle() %>"/></td>
      </tr>
      <tr>
        <td width="80" height="40">视频描述：</td>
        <td bgcolor="#FFFFFF"><textarea name="vinfo" rows="5" cols="60"><%= video.getVinfo() %></textarea> </td>
      </tr>
      <tr>
        <td width="80" height="40" bgcolor="#FFFFFF">&nbsp;</td>
        <td bgcolor="#FFFFFF">
			<input type="submit" name="Submit" value="修改信息 ">
			&nbsp;&nbsp;
			<input type="reset" name="Reset" value="重置"></td>
      </tr> 
	</table>
</form>
  </body>
</html>
