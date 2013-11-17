<%@ page language="java" import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>软件学院视频站</title>
<link href="./css/web_main.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="./include/flashWrite.js"></script>
<script language="javascript" src="./include/div.js"></script>
<script language="javascript" type="text/javascript" src="./js/flash.js"></script><strong></strong>
</head>
<% 
	User user = (User)request.getAttribute("user");
%>
<body>

<div  class="shell">
<table width="495" height="300" border="0" align="center">
    <tr>
      <td width="139" height="20"><div align="right" class="STYLE1"><s:text name="user.username" />:</div></td>
      <td width="190" height="20"><label>
        <input type="text" name="name" value="<%=user.getName() %>"/>
      </label></td>
      <td width="144" height="20">&nbsp;</td>
    </tr>
   
    <tr>
      <td height="20"><div align="right" class="STYLE1"><s:text name="user.email" />：</div></td>
      <td height="20"><label>
        <input type="text" name="email" value="<%=user.getEmail() %>" />
      </label></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr>
      <td height="20"><div align="right" class="STYLE1"><s:text name="user.sex" />：</div></td>
      <td height="20"><label>
        <input type="text" name="sex" value="<%=user.getSex() %>" />
      </label></td>
      <td height="20">&nbsp;</td>
    </tr>
   
  </table>

</div>

</body>
</html>
