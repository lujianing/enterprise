<%@ page language="java" import="java.util.*,com.qianyan.service.*,com.qianyan.entity.*,com.qianyan.bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	

<title>软件学院视频站</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


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

			<form  method="post" enctype="multipart/form-data" name="form" action="Picture_save">
			<div align="center">
	     <table width="525"  border="1" 	bordercolor="#0099CC" cellspacing="0" >
         
         
         
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
       </div>   
	 </form>
	
		

</body>
</html>
