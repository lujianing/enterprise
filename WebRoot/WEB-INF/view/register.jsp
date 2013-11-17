<%@ page language="java" import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*,com.qianyan.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>企业门户网站</title>
<link href="./css360/style.css" rel="stylesheet" type="text/css">

<style>
.joblist dl {border-bottom:1px dashed #ddd; padding:15px 5px 15px 30px}
.joblist dt {font-size:14px; padding-bottom:5px}
.newc li.listall a{color:#0033CC;font-weight:bold;}
A.applink:hover {border: 2px dotted #DCE6F4;padding:2px;background-color:#ffff00;color:green;text-decoration:none}
A.applink       {border: 2px dotted #DCE6F4;padding:2px;color:#2F5BFF;background:transparent;text-decoration:none}
A.info          {color:#2F5BFF;background:transparent;text-decoration:none}
A.info:hover    {color:green;background:transparent;text-decoration:underline}
</style>

<link rel="stylesheet"	href="./formValidator/css/validationEngine.jquery.css" type="text/css" />
<link rel="stylesheet" href="./formValidator/css/template.css"	type="text/css" />
<script src="./formValidator/jquery.js" type="text/javascript"></script>
<script src="./formValidator/js/jquery.validationEngine-cn.js"	type="text/javascript"></script>
<script src="./formValidator/js/jquery.validationEngine.js" 	type="text/javascript"></script>
<script type="text/javascript" src="./js/jquery.form.2.6.7.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$("#form1").validationEngine({
		validationEventTriggers : "blur", //触发的事件  validationEventTriggers:"keyup blur",
		inlineValidation : true,//是否即时验证，false为提交表单时验证,默认true
		success : false,//为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
		promptPosition : "topRight",//提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
	//failure : function() { alert("验证失败，请检查。");  }//验证失败时调用的函数
	//success : function() { callSuccessFunction() },//验证通过时调用的函数
	});
});

function doSubmit(){
	
	if($("#user").val() ==null || $("#user").val() ==""){
		alert("用户名不能为空！");
		return false;
	}
	if($("#password").val() ==null || $("#password").val() ==""){
		alert("密码不能为空！");
		return false;
	}
	
	if( $("#password").val() != $("#password2").val() ){
		alert("密码和确认密码不一致！");
		return false;
	}
	
	
	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if($("#email").val() ==null || $("#email").val() ==""){
		alert("邮件不能为空！");
		return false;
	}
	
	if(!myreg.test($("#email").val())){
		alert("请填写正确邮箱！");
		return false;
	}
		
	
	
	$('#form1').ajaxSubmit({
		cache:false,
		resetForm:false,
		contentType:"application/x-www-form-urlencoded; charset=utf-8",
		beforeSubmit: function(a,f,o) {
			 },
		success:  function(data){
			alert("注册成功！");	
			$("#user").val("");
			$("#password").val("") ;
			$("#password2").val("") ;
			$("#email").val("") ;
			$("#sex").val("") ;
			
		} ,
		error:  function(data){						
				alert('数据处理失败，请稍后再试。');
		} 
	});
}




</script>
</head>
<body class="subpage">




<div class="wrap">
	<div class="header">
		<div class="logo"><a href="index.html" target="_self"><img src="./css360/logo1.png" alt="360招聘"/></a></div><!--end logo-->
		<div class="nav">
			<ul>
				<jsp:include page="../../menu.jsp"></jsp:include>
			</ul>		
		</div><!--end nav-->
		<a href="Main_changlocal?language=cn" class="hdrr">中文</a><a href="Main_changlocal?language=en" class="hdr">English</a>
	</div><!--end header-->
    <div class="bnr">
    	<img src="./css360/b009.png" />
    </div><!--end bnr-->    <div class="guide">		<a href="News_mainpage" target="_self">首页</a> &gt;
		<a href="#" target="_self">注册</a>
	</div><!--end guide-->
	
	<div class="area1" style="background:none">
		<div align="center">
	   <h1 style="color: blue;"><font size="5"><s:text name="user.title" /></font></h1>
	  </div>
	  
	  
		<form id="form1" name="form1" method="post" action="User_save">
  <table width="495" height="300" border="0" align="center">
    <tr>
      <td width="139" height="20"><div align="right" class="STYLE1"><font size="4"><s:text name="user.username" />:</font></div></td>
      <td width="190" height="20"><label>
        <input type="text" name="name" class="validate[required,custom[noSpecialCaracters],length[6,11],ajax[ajaxUser]]" id="user"  style="width:300px;height: 30px;font-size: 15px"/>
      </label></td>
      <td width="144" height="20">&nbsp;</td>
    </tr>
    <tr>
      <td height="20"><div align="right" class="STYLE1"><font size="4"><s:text name="user.password" />:</font></div></td>
      <td height="20"><label>
        <input type="password" name="password" id="password" class="validate[required,length[6,11]] text-input"  style="width:300px;height: 30px;font-size: 15px"/>
      </label></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr>
      <td height="20"><div align="right" class="STYLE1"><font size="4"><s:text name="user.repassword" />:</font></div></td>
      <td height="20"><label>
        <input type="password" name="repassword" id="password2" class="validate[required,confirm[password]] text-input"  style="width:300px;height: 30px;font-size: 15px"/>
      </label></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr>
      <td height="20"><div align="right" class="STYLE1"><font size="4"><s:text name="user.email" />：</font></div></td>
      <td height="20"><label>
        <input type="text" name="email" id="email" class="validate[required,custom[email]] text-input"  style="width:300px;height: 30px;font-size: 15px" />
      </label></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr>
      <td height="20"><div align="right" class="STYLE1"><font size="4"><s:text name="user.sex" />：</font></div></td>
      <td height="20"><label>
        <input type="radio" name="sex" class="sex" value="男" />
     <font size="4"><s:text name="user.sex.male" /> </font>
      <input type="radio" name="sex" class="sex" value="女" />
     <font size="4"> <s:text name="user.sex.female" /></font>
      </label></td>
      <td height="20">&nbsp;</td>
    </tr>
    <tr>
      <td height="20"><label>
        
        <div align="center">
          <input type="button" onclick="doSubmit()" name="Submit" value="<s:text name="user.register" />" />
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
</form>	
	</div><!--end area-->
	<div class="footer">		<p><jsp:include page="../../foot.jsp"></jsp:include></p>
	</div><!--end footer-->
</div><!--end wrap-->

</body>
</html>

