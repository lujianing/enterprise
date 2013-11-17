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
<style type="text/css">
<!--
.STYLE1 {color: #0033FF}
-->
</style>
<link href="./css/web_main.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="./include/flashWrite.js"></script>
<script language="javascript" src="./include/div.js"></script>
<script language="javascript" type="text/javascript" src="./js/flash.js"></script><strong></strong>
</head>

<body>
<!--start master_head-->
<div id="master_head">
	<div class="head_logo">

	</div>
	<div class="head_advertising"></div>
    <div class="no_float"></div>
</div>
<!--end master_head-->

<!--start master_menu-->
<jsp:include page="/menu.jsp"></jsp:include>

<!--end master_menu-->

<!--start master_body-->
<div id="master_body">
	<div id="body_left">
	  	 
		 <!--start tutorial-->
		 <div class="left_content_title"><img src="images/arrow_01.gif" class="title_img" />公司简介</div>
		 <div class="left_content_top"></div>
	  <div class="left_content_main">
	  	左边
	    
	    </div>
		<div class="left_content_bottom"></div>
 
		 <!--end down_template-->
         <!--start down_flash-->
         <div class="left_content_main"></div>
		 <!--end down_flash-->
    </div>
	
	
	
	<div id="body_right">
	 
	  <!--start advertising--><!--end advertising-->
      <!--start class-->
		<div align="center">
	   <h1 style="color: blue;"><s:text name="user.title" /></h1>
	  </div>
	  <!--end class-->
	  <!--start template-->
	   <div class="right_content_top"></div>
	   <div class="right_content_main">
		 
		 <div class="right_content">
		 <div align="center"><s:fielderror cssStyle="color:red;"/></div>
			<form id="form1" name="form1" method="post" action="User_save">
  <table width="495" height="300" border="0" align="center">
    <tr>
      <td width="139" height="20"><div align="right" class="STYLE1"><s:text name="user.username" />:</div></td>
      <td width="190" height="20"><label>
        <input type="text" name="name" />
      </label></td>
      <td width="144" height="20">&nbsp;</td>
    </tr>
    <tr>
      <td height="20"><div align="right" class="STYLE1"><s:text name="user.password" />:</div></td>
      <td height="20"><label>
        <input type="password" name="password" />
      </label></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr>
      <td height="20"><div align="right" class="STYLE1"><s:text name="user.repassword" />:</div></td>
      <td height="20"><label>
        <input type="password" name="repassword" />
      </label></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr>
      <td height="20"><div align="right" class="STYLE1"><s:text name="user.email" />：</div></td>
      <td height="20"><label>
        <input type="text" name="email" />
      </label></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr>
      <td height="20"><div align="right" class="STYLE1"><s:text name="user.sex" />：</div></td>
      <td height="20"><label>
        <input type="radio" name="sex" value="男" />
     <s:text name="user.sex.male" /> 
      <input type="radio" name="sex" value="女" />
      <s:text name="user.sex.female" />
      </label></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr>
      <td height="20"><label>
        
        <div align="center">
          <input type="submit" name="Submit" value="<s:text name="user.register" />" />
          </div>
      </label></td>
      <td height="20"><label>
        
        <div align="center">
          <input type="reset" name="Submit2" value="<s:text name="user.reset" />" />
          </div>
      </label></td>
      <td height="20">&nbsp;</td>
    </tr>
  </table>
</form>		 </div>
	   </div>
	  <div class="right_content_bottom"><img src="images/right_content_bottom.gif"></div>
	  <!--end template-->
	 
	 
	  
	  

	</div>
	<div class="no_float"></div>
</div>
<!--end master_body-->

<!--start master_foot-->
<jsp:include page="/foot.jsp"></jsp:include>
<!--end master_foot-->
</body>
</html>
