<%@ page language="java" import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*,com.qianyan.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	

<title>软件学院视频站</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/web_main.css" rel="stylesheet" type="text/css" />
<link href="./css/default.css" rel="stylesheet"
	type="text/css" />
<script language="javascript" src="/include/flashWrite.js"></script>
<script language="javascript" src="/include/div.js"></script>
<script language="javascript" type="text/javascript" src="/js/flash.js"></script><strong></strong>

<script type="text/javascript" src="./js/swfupload.js"></script>
<script type="text/javascript" src="./js/swfupload.queue.js"></script>
<script type="text/javascript" src="./js/fileprogress.js"></script>
<script type="text/javascript" src="./js/handlers.js"></script>
<!-- 初始化swfupload 对象-->
<script type="text/javascript">
	var upload1, upload2;
//	var username = document.getElementsByName("username");
	window.onload = function() {
		upload1 = new SWFUpload({
			// Backend Settings
			
			
			upload_url : "Picture_saveauto",
			post_params : {
				"picSESSID" : "songhao"
			},
			file_post_name : "file",
			// File Upload Settings
			file_size_limit : "204800", // 1MB
			file_types : "*.jpg;*.gif;*.png;*.bmp",
			file_types_description : "图片文件",
			file_upload_limit : "10",
			file_queue_limit : "0",

			// Event Handler Settings (all my handlers are in the Handler.js file)
			file_dialog_start_handler : fileDialogStart,
			file_queued_handler : fileQueued,
			file_queue_error_handler : fileQueueError,
			file_dialog_complete_handler : fileDialogComplete,
			upload_start_handler : uploadStart,
			upload_progress_handler : uploadProgress,
			upload_error_handler : uploadError,
			upload_success_handler : uploadSuccess,
			upload_complete_handler : uploadComplete,

			// Button Settings
			button_image_url : "images/XPButtonUploadText_61x22.png",
			button_placeholder_id : "spanButtonPlaceholder1",
			button_width : 61,
			button_height : 22,

			// Flash Settings
			flash_url : "js/swfupload.swf",

			custom_settings : {
				progressTarget : "fsUploadProgress1",
				cancelButtonId : "btnCancel1"
			},

			// Debug Settings
			debug : false
		});

		

	}
</script>
</head>

<body>
<base href="<%=basePath%>">
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
	  	<a href="Picture_upload">普通上传</a><br/>
	  	<a href="Picture_autoupload">快速上传</a>
	    
	    </div>
		<div class="left_content_bottom"></div>
 
		 <!--end down_template-->
         <!--start down_flash-->
          <!--start down_flash-->
		 
    </div>
	
	
	
	<div id="body_right">
	 
	  <!--start advertising--><!--end advertising-->
      <!--start class-->
		<div align="center">
		
	  </div>
	  <!--end class-->
	  <!--start template-->
	   <div class="right_content_top"></div>
	   <div class="right_content_main">
		 <div class="right_content_title"><img src="images/arrow_01.gif" class="title_img" />图片上传　　　　　<font color="#FFFF00">共2010个</font>	   </div>
		 
		 <div class="right_content">
			<form action="Photo_saveauto" method="post" name="thisform"
			enctype="multipart/form-data">
			
			<table>
				<tr valign="top">
					
					
					
					
					<td>
						<div>
							<div class="fieldset flash" id="fsUploadProgress1">
								<span class="legend">图片上传区</span>
							</div>
							<div style="padding-left: 5px;">
								<span id="spanButtonPlaceholder1"></span> <input id="btnCancel1"
									type="button" value="取消上传"
									onclick="cancelQueue(upload1);" disabled="disabled"
									style="margin-left: 2px; height: 22px; font-size: 8pt;" /> <br />
							</div>
							<div>
								<a href="Picture_listpictures?page=1">返回</a>
							</div>
						</div>
					</td>
					
				</tr>
			</table>
		</form>
	
		 </div>
	   </div>
	  <div class="right_content_bottom"><img src="images/right_content_bottom.gif"></div>
	  <!--end template-->
	 
	 
	  
	  

	</div>
	<div class="no_float"></div>
</div>
<!--end master_body-->

<!--start master_foot-->
<div id="master_foot">
	  <div class="foot_menu">| 关于我们 | 联系我们 | 隐私条款 | 广告服务 | 网站导航 | 客户服务 |</div>
	  <div class="foot_copyright">南阳理工学院软件学院<br />
	  大学生科技创新基地 前研工作室 鲁家宁
	  <br />
	    &copy;2012 前研工作室版权所有</div>
</div>
<!--end master_foot-->
</body>
</html>
