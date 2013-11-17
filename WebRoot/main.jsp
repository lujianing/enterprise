<%@ page language="java" import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*,com.qianyan.utils.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %> 
<%
	ArrayList<News> list = (ArrayList<News>)request.getAttribute("lists");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>企业门户网站</title>
<link href="css360/style.css" rel="stylesheet" type="text/css">
<style>
.boxc h2{ height:32px; line-height:32px; border-bottom:1px solid #d7e8f1; margin:0 15px; font-size:14px; color:#0072b1; padding:0 7px;position:relative}
.boxc h2 a{color:#EB6100;}
.boxc h2 .mor{position:absolute;width:60px;top:3px;left:246px;font-size:12px;font-weight:lighter}
A.applink:hover {border: 2px dotted #DCE6F4;padding:2px;background-color:#ffff00;color:green;text-decoration:none}
A.applink       {border: 2px dotted #DCE6F4;padding:2px;color:#2F5BFF;background:transparent;text-decoration:none}
A.info          {color:#2F5BFF;background:transparent;text-decoration:none}
A.info:hover    {color:green;background:transparent;text-decoration:underline}
</style>
</head>
<body>






<div class="wrap">
	<div class="header">
		<div class="logo"><a href="index.html" target="_self"><img src="css360/logo1.png" alt="360招聘"/></a></div><!--end logo-->
		<div class="nav">
			<ul>
			<jsp:include page="menu.jsp"></jsp:include>
			</ul>		
		</div><!--end nav-->
		<jsp:include page="language.jsp"></jsp:include>
	</div><!--end header-->
	<div id="focus" class="focus">
        <div class="mpc">
            <div style="display:block"><a href="#"><img src="css360/f001x.jpg"/></a></div>
			<div><a href="#"><img src="css360/campus2013.jpg"/></a></div>
			<div><a href="#"><img src="css360/ad03.jpg"/></a></div>
			<div><a href="#"><img src="css360/ad04.jpg"/></a></div>
        </div>
        <ul>
        </ul>
    </div><!--end focus-->
	<div class="area">
		<div class="w331">
			<div class="boxt">
					<div class="boxtl"></div><div class="boxtc"></div><div class="boxtr"></div>
			</div><!--end newtag-->
			<div class="boxc">
			<h2>公司信息<div class="mor"><a href="Company_getcompanyinfo" >更多&gt;&gt;</a></div></h2>
			</div>
			<div class="newb" id="newc">
                <ul>
				<s:text name="comp.info" />
                </ul>
            </div>
		
			<!--end newb-->
			<div class="boxb">
				<div class="boxbl"></div><div class="boxbc"></div><div class="boxbr"></div>
			</div><!--end boxb-->
		</div><!--end w331-->
		<div class="w306">
			<div class="box">
				<div class="boxt">
					<div class="boxtl"></div><div class="boxtc"></div><div class="boxtr"></div>
				</div><!--end boxt-->
				<div class="boxc txt">
					<h2>联系方式</h2>
					<div class="newb" id="newc">
                <ul>
					<s:text name="comp.connectinfo" />
                </ul>
            	</div>
				</div><!--end boxc-->
				
				<div class="boxb">
					<div class="boxbl"></div><div class="boxbc"></div><div class="boxbr"></div>
				</div><!--end boxb-->
			</div><!--end box-->
		</div><!--end w306-->
		<div class="w301">
			<div class="box">
				<div class="boxt">
					<div class="boxtl"></div><div class="boxtc"></div><div class="boxtr"></div>
				</div><!--end boxt-->
				<div class="boxc news">
					<h2>公司动态</h2>
					<ul>
					<%
						for(int i = 0; i < list.size(); i++) {
							News news =list.get(i);
							String title = news.getTitle();
							if(news.getTitle().length()>20){
								title = StringUtils.substr(news.getTitle(), 20, "")+"...";
							}
					%>  
						
							<li><a href="News_getnews?id=<%=news.getId() %>" title="<%=news.getTitle() %>"><%=title %>&nbsp;&nbsp;&nbsp;&nbsp;<%=news.getUptime() %></a></li>
	      					
					<% }%>





					</ul>
				</div><!--end boxc-->
				<div class="boxb">
					<div class="boxbl"></div><div class="boxbc"></div><div class="boxbr"></div>
				</div><!--end boxb-->
			</div><!--end box-->
		</div><!--end w301-->
	</div><!--end area-->
	<div class="footer" style="border:none">		<p>XXX企业门户网站</p>
	</div><!--end footer-->
</div><!--end wrap-->
<script src="css360/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="css360/main.js" type="text/javascript"></script>
</body>
</html>
