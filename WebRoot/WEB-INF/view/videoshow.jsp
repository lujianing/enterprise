<%@ page language="java" import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*,com.qianyan.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	Video video = (Video)request.getAttribute("video");
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
		
	</div><!--end header-->
    <div class="bnr">
    	<img src="<%=basePath %>css360/b005.png" />
    </div><!--end bnr-->    <div class="guide">		<a href="index.html" target="_self">首页</a> &gt;
		<a href="Video_listvideo?page=1" target="_self">视频中心</a>
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
<div id="videotitle" align="center">标题:<%= video.getTitle()%></div>
<!--酷播迷你 CuPlayerMiniV2.0 代码开始--><br />
<script type="text/javascript" src="<%=basePath%>/js/swfobject.js""></script>
<div id="CuPlayer" align="center">
<strong>酷播迷你(CuPlayerMiniV2.0) 提示：你的Flash Player版本过低，请<a href="http://www.CuPlayer.com/" >点此进行播放器升级</a>！</strong></div>
<script type="text/javascript">
var so = new SWFObject("<%=basePath%>videos/tools/CuPlayerMiniV20_Black_S.swf","CuPlayer","600","450","9","#000000");
so.addParam("allowfullscreen","true");
so.addParam("allowscriptaccess","always");
so.addParam("wmode","opaque");
so.addParam("quality","high");
so.addParam("salign","lt");
so.addVariable("CuPlayerFile","<%=basePath%><%= video.getVsrc()%>");
so.addVariable("CuPlayerImage","<%=basePath%><%= video.getPsrc()%>");
so.addVariable("CuPlayerShowImage","true");
so.addVariable("CuPlayerWidth","600");
so.addVariable("CuPlayerHeight","450");
so.addVariable("CuPlayerAutoPlay","false");
so.addVariable("CuPlayerAutoRepeat","false");
so.addVariable("CuPlayerShowControl","true");
so.addVariable("CuPlayerAutoHideControl","false");
so.addVariable("CuPlayerAutoHideTime","6");
so.addVariable("CuPlayerVolume","50");
so.write("CuPlayer");	
</script>
<!--酷播迷你 CuPlayerMiniV2.0 代码结束-->


<div align="center">
			<table width="600" height="70" border="0" align="center">
  <tr>
    <td width="485"  colspan="2" rowspan="3" ><textarea name="textarea" cols="60" rows="4" disabled="disabled">视频信息：<%=video.getVinfo() %></textarea></td>
    <td>
  	<font color="#666666" size="2">播放次数：<%=video.getClick() %></font>
  	</td>
  </tr>
   <tr>
  	<td ><font color="#666666" size="2">下载次数：<%=video.getDownload() %></font></td>
  </tr>
  <tr>    
    <td><a href="download.action?fileName=<%=video.getVname() %>"><font color="#666666" size="2">点击下载</font></a></td>
  </tr>
 
</table>
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