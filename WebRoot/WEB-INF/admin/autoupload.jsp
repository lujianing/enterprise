<%@ page language="java" import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*,com.qianyan.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	

<title>软件学院视频站</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="./css/default.css" rel="stylesheet"
	type="text/css" />

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
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
-->
</style>
</head>

<body>
<base href="<%=basePath%>">
	<div align="center">
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
</body>
</html>
