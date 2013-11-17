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
	Video video = (Video)request.getAttribute("video");
%>
<body>

		 	<div  class="shell">
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

</div>

</body>
</html>
