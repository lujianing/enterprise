<%@ page language="java" import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*,com.qianyan.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
PageBean pagebean =(PageBean)request.getAttribute("pagebean");
ArrayList<Video> lists  = (ArrayList<Video>)pagebean.getList();
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
body{overflow-y:scroll!important;overflow-y:auto;}
</style>
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
    	<img src="<%=basePath %>css360/b005.png" />
    </div><!--end bnr-->    <div class="guide">		<a href="News_mainpage" target="_self">首页</a> &gt;
		<a href="#" target="_self">视频中心</a>
	</div><!--end guide-->
	<div class="area1">
		<div class="left">
			<div class="new">

					<div class="ntag" id="ntag">
						<ul>
							<li class="cur">点击排行</li>
						</ul>
					</div>
					<!--end ntag-->
					<div class="newc" id="newc">
						<ul>

							<%
								ArrayList<Video> listclick = (ArrayList<Video>) request
										.getAttribute("listclick");
							%>

							<%
								for (int i = 0; i < listclick.size(); i++) {
									Video videoc = listclick.get(i);
							%>
							<li><img src="images/down0<%=i + 1%>.gif" align="absmiddle"
								class="down_img" /> <a
								href="Video_getvideo?videoid=<%=videoc.getId()%>"><%=videoc.getTitle()%></a>
							</li>

							<%
								}
							%>


						</ul>
					</div>
					<!--end newc-->

<div class="ntag" id="ntag">
					<ul>
					<li class="cur">下载排行</li>
					</ul>
				</div><!--end ntag-->
				<div class="newc" id="newc">
					<ul> 
					
		<%
			ArrayList<Video> listdown = (ArrayList<Video>)request.getAttribute("listdown");
		 %>
	  
	  	<%
			for (int i = 0; i < listdown.size(); i++) {
			Video videoc =listclick.get(i);
		%> 
		<li>
				<img src="images/down0<%=i+1%>.gif" align="absmiddle" class="down_img"/>
				<a href="Video_getvideo?videoid=<%=videoc.getId() %>"><%=videoc.getTitle() %></a>
			</li>
		
		<%} %> 
			
		
		</ul>
				</div><!--end newc-->


				</div><!--end new-->
		</div><!--end left-->
		<div class="right">


			<div align="center">
					<table border="0">
						<%
    				if(lists!=null){
    					for(int i=0;i<lists.size();i++){
    					Video video = lists.get(i);
    					if(i%3==0){
    			%>
    					<tr>
    				<%} %>
						<td width="220">
							<table width="220" border="0">
								<tr>
									<td height="160"><a
										href="Video_getvideo?videoid=<%=video.getId() %>"><img
											src="<%=basePath+video.getPsrc() %>" width="220" height="159"></a>
									</td>
								</tr>
								<tr>
									<td height="21">
										<div align="center">
											<a href="Video_getvideo?videoid=<%=video.getId() %>"><%=video.getTitle()%></a>
										</div>
									</td>
								</tr>
								
							</table>

						</td>
						<%
							if(i%3==2){
						%>
								</tr>
						<%
							}
    					}
    					}
				%>
					</table>
				</div>
		

				<div align="center">
	共<font color="red"><%=pagebean.getAllRow() %> </font>条记录&nbsp; &nbsp;当前第<font color="red"><%=pagebean.getCurrentPage() %></font>页&nbsp;&nbsp;共<font color="red"><%=pagebean.getTotalPage() %> </font> 页
			<%
				if(pagebean.getCurrentPage()==1){
			%>
　　　　　　	第一页 上一页  
　　　　		<% }else{%>
　　　　		 	&nbsp;&nbsp;<a href="Video_listvideo?page=1">第一页</a>&nbsp;&nbsp;  &nbsp;&nbsp;<a href="Video_listvideo?page=<%=pagebean.getCurrentPage()-1 %>">上一页</a>  
　　　　		<% }%> 
　　　　		<% if(pagebean.getCurrentPage() != pagebean.getTotalPage() &&pagebean.getTotalPage()!=0){ %>
　　　　　　	&nbsp;&nbsp;<a href="Video_listvideo?page=<%=pagebean.getCurrentPage()+1 %>">下一页</a>&nbsp;&nbsp;  &nbsp;&nbsp;<a href="Video_listvideo?page=<%=pagebean.getTotalPage() %>"/>最后一页</a>  
　　　　		<% }else{%>  
　　　　		  	下一页 最后一页  
　　　　		<%} %>
	</div>





		</div><!--end right-->
	</div><!--end area-->
	<div class="footer">		<p><jsp:include page="../../foot.jsp"></jsp:include></p>
	</div><!--end footer-->
</div><!--end wrap-->
<script src="<%=basePath %>css360/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="<%=basePath %>css360/main.js" type="text/javascript"></script>
</body>
</html>

<%!


String substr(String str, int length, String suffix) {
	if (str == null || str.length() == 0 || length < 1) {
		return str;
	}
	if (suffix == null) {
		suffix = "";
	}
	if (suffix.length() > 0 && length > suffix.length()) {
		length = length - suffix.length();
	} else {
		suffix = "";
	}

	int lencounter = 0;
	int index = 0;
	char[] strarray = str.toCharArray();
	try {
		for (; index < strarray.length; index++) {
			char ch = strarray[index];
			int step = 1;
			if (String.valueOf(ch).getBytes("GBK").length > 1) {
				step = 2;
			}
			if ((lencounter = lencounter + step) > length) {
				index--;
				break;
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	if (index > 0 && index < str.length()) {
		str = str.substring(0, index) + suffix;
	}

	return str;
}
%>  