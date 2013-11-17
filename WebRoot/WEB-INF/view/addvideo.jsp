<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加视频</title>
       
	<meta http-equiv="keywords" content=""/>
	<meta http-equiv="description" content=""/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

  </head>
  
  <body>
  
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#D1DDAA" align="center">
<tr>
 <td height="26">
  <table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td align="center">相关操作
 </td>
 </tr>
</table>
</td>
</tr>
</table>
  <form action="Video_add" method="post" enctype="multipart/form-data" name="form">
    <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
	<tr bgcolor="#E7E7E7">
	<td height="24" colspan="10" align="center">&nbsp;添加视频信息&nbsp;</td>
	</tr>
	
      <tr>
        <td width="80" height="40">选择视频：</td>
        <td bgcolor="#FFFFFF"><input name="file" type="file"  >&nbsp;&nbsp;&nbsp;*(上传的视频只能是avi,asf,asx,3gp,mpg,mov,mp4,wmv,flv格式) </td>
      </tr>
      
      <tr>
        <td width="80" height="40">视频标题：</td>
        <td bgcolor="#FFFFFF"><input name="title" type="text" ></td>
      </tr>
	  
	  <tr>
        <td width="80" height="40">视频类别：</td>
        <td bgcolor="#FFFFFF"><select name="typeid">
          <option value="1">教学视频</option>
          <option value="2">娱乐视频</option>
        </select>        </td>
	  </tr>
	  
      <tr>
        <td width="80" height="40">视频描述：</td>
        <td bgcolor="#FFFFFF"><textarea name="vinfo" rows="5" cols="60"></textarea></td>
      </tr>
      <tr>
        <td width="80" height="40" bgcolor="#FFFFFF">&nbsp;</td>
        <td bgcolor="#FFFFFF">
			<input type="submit" name="Submit" value=" 上传视频 ">
			&nbsp;&nbsp;
			<input type="reset" name="Reset" value=" 重新选择 "></td>
      </tr> 
	</table>
</form>
  </body>
</html>
