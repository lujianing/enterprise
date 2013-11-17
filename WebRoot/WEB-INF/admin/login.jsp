<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<<jsp:useBean id="loginadmin" scope="session" class="com.qianyan.entity.User"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<LINK href="./admincss/xtree.css" type=text/css rel=stylesheet>
<LINK href="./admincss/User_Login.css" type=text/css rel=stylesheet>
<script language="JavaScript">
function login(){
    
    document.form.action="Admin_logincheck";
    document.form.submit();
}

</script>
</head>
<body id=userlogin_body>
<base href="<%=basePath%>">
	<FORM method="post" name="form">
	<DIV id=user_login>
		<DL>
			<DD id=user_top>
				<UL>
					<LI class=user_top_l></LI>
					<LI class=user_top_c></LI>
					<LI class=user_top_r></LI>
				</UL>
			<DD id=user_main>
				<UL>
					<LI class=user_main_l></LI>
					<LI class=user_main_c>
						<DIV class=user_main_box>
							<UL>
								<LI class=user_main_text>用户名：</LI>
								<LI class=user_main_input><INPUT class=TxtUserNameCssClass
									id=TxtUserName maxLength=20 name=name value="<%=loginadmin.getName()!=null?loginadmin.getName():"" %>"></LI>
							</UL>
							<UL>
								<LI class=user_main_text>密码：</LI>
								<LI class=user_main_input><INPUT class=TxtPasswordCssClass
									id=TxtPassword type=password name=password></LI>
							</UL>
							<ul>
								<LI class=user_main_input ><font color="red"><s:property value="message"/></font></LI>
							</ul>
						</DIV>
					</LI>
					<LI class=user_main_r><INPUT class=IbtnEnterCssClass
						id=IbtnEnter
						style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px"
						onclick='login()'
						type=image src="./admincss/user_botton.gif" ></LI>
				</UL>
			<DD id=user_bottom>
				<UL>
					<LI class=user_bottom_l></LI>
					<LI class=user_bottom_c></LI>
					<LI class=user_bottom_r></LI>
				</UL>
			</DD>
		</DL>
	</DIV>
	

	</FORM>
</body>
</html>