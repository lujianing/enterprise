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
<script language="javascript" src="/include/flashWrite.js"></script>
<script language="javascript" src="/include/div.js"></script>
<script language="javascript" type="text/javascript" src="/js/flash.js"></script>

<script type="text/javascript">
    function addMore(){
    var td = document.getElementById("more");
    var br= document.createElement("br");
    var input= document.createElement("input");
    var button= document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "移除...";
    
    
    button.onclick = function(){
      td.removeChild(br);
      td.removeChild(input);
      td.removeChild(button);
    }
   
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
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
			<form  method="post" enctype="multipart/form-data" name="form" action="Picture_save">
	     <table width="525" border="0">
         
         
         
         <tr>
           <td height="20"><b>选择相片：</b></td>
           <td id="more"><input name="file" type="file" id="file" maxlength="20"><input type="button" name="more.." value="增加..." onClick="addMore()"></td>
         </tr>
        
         
         <tr>
           <td height="20">&nbsp;</td>
           <td>             
               <input type="submit" name="Submit"  value="上传" >
             &nbsp;&nbsp;
               <input type="reset" name="Submit2" value="重置">
             &nbsp;&nbsp;
               <input type="button" name="Submit3" value="返回" onClick="javascript:window.location.href='Picture_listpictures?page=1';">
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
