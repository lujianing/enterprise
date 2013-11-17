<%@ page language="java" import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*,com.qianyan.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>企业门户网站</title>
<link href="<%=basePath %>css360/style.css" rel="stylesheet" type="text/css">
<style>
.joblist dl {border-bottom:1px dashed #ddd; padding:15px 5px 15px 30px}
.joblist dt {font-size:14px; padding-bottom:5px}
.newc li.listall a{color:#0033CC;font-weight:bold;}
A.applink:hover {border: 2px dotted #DCE6F4;padding:2px;background-color:#ffff00;color:green;text-decoration:none}
A.applink       {border: 2px dotted #DCE6F4;padding:2px;color:#2F5BFF;background:transparent;text-decoration:none}
A.info          {color:#2F5BFF;background:transparent;text-decoration:none}
A.info:hover    {color:green;background:transparent;text-decoration:underline}
</style>

<script type="text/javascript" src="./ckeditor4/ckeditor.js"></script>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery.form.2.6.7.js"></script>
<script type="text/javascript">
function doSubmit(){
//	alert(1);
	if($("#name").val() ==null || $("#name").val() ==""){
		alert("名字不能保存！");
		return false;
	}
/*	if($("#title").val() ==null || $("#title").val() ==""){
		alert("标题不能保存！");
		return false;
	}*/
	if($("#phone").val() ==null || $("#phone").val() ==""){
		alert("手机号不能保存！");
		return false;
	}
	
	 var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if($("#mail").val() ==null || $("#mail").val() ==""|| !myreg.test($("#mail").val()) ){
		alert("邮件不能保存！");
		return false;
	}
	var checkContent =CKEDITOR.instances.content.getData();
	
	if(checkContent==null || checkContent=="" ){
		alert("内容不能保存！");
		return false;
	}
	$('#content').val(checkContent);
	
	$('#form1').ajaxSubmit({
		cache:false,
		resetForm:false,
		contentType:"application/x-www-form-urlencoded; charset=utf-8",
		beforeSubmit: function(a,f,o) {
			 },
		success:  function(data){
			alert("提交成功！");
			$("#name").val("");
	//		$("#title").val("") ;
			$("#mail").val("") ;
			$("#content").val("") ;
			$("#phone").val("");
		//	document.form1.reset();
			CKEDITOR.instances.content.setData(' ');  
		//	location.reload();
			
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
		<div class="logo"><a href="index.html" target="_self"><img src="<%=basePath %>css360/logo1.png" alt="360招聘"/></a></div><!--end logo-->
		<div class="nav">
			<ul>
				<jsp:include page="../../menu.jsp"></jsp:include>
			</ul>		
		</div><!--end nav-->
		<jsp:include page="../../language.jsp"></jsp:include>
		
	</div><!--end header-->
    <div class="bnr">
    	<img src="<%=basePath %>css360/b004.jpg" />
    </div><!--end bnr-->    <div class="guide">		<a href="News_mainpage" target="_self">首页</a> &gt;
		<a href="#" target="_self">联系我们</a>
	</div><!--end guide-->
	<br/>
	<div class="area1" style="background:none">
		
		<form id="form1" name="form1" method="post" action="Message_add">

						
						<font size="4">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</font><input type="text" id="name" name="name" size="100" height="40" style="width:600px;height: 30px;font-size: 15px"/> <br/><br/>
						<font size="4">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</font><input type="text" id="mail" name="mail" size="100" height="40" style="width:600px;height: 30px;font-size: 15px"/><br/> <br/>
						<font size="4">联系方式：</font><input type="text" name="phone" id="phone" size="100" height="40" style="width:600px;height: 30px;font-size: 15px"/><br/> <br/>
						
						<textarea name="content" id="content" maxlength="100" style="width: 600"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('content',{width:800});
							
						</script>
						<br> <input type="button" onclick="doSubmit()" id="submit" name="Submit" value="提交" />

					</form>
	
	</div><!--end area-->
	<div class="footer">		<p><jsp:include page="../../foot.jsp"></jsp:include></p>
	</div><!--end footer-->
</div><!--end wrap-->

</body>
</html>

