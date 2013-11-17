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

<script language="javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$(".leftmenu").bind("click",function(){
		$(".leftmenu").each(function(){
			$(this).removeClass("cur");
		});
		$(this).addClass("cur");
		
		$(".comp_info").each(function(){
			$(this).hide();
		});
		
		var id = $(this).attr("data-id");
		
		$(".c"+id).show();
	});
});
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
    	<img src="<%=basePath %>css360/b008.png" />
    </div><!--end bnr-->    <div class="guide">		<a href="index.html" target="_self">首页</a> &gt;
		<a href="#" target="_self">关于我们</a>
	</div><!--end guide-->
	<div class="area1">
		<div class="left">
			<div class="menu">
				<ul>
				<li><a href="javascript:void(0)" class="leftmenu cur" data-id="1">公司介绍</a></li>
				<li><a href="javascript:void(0)" class="leftmenu" data-id="2">公司动态</a></li>
				<li><a href="javascript:void(0)" class="leftmenu" data-id="3">公司大事记</a></li>
				<li><a href="javascript:void(0)" class="leftmenu" data-id="4">企业文化</a></li>
				<li><a href="javascript:void(0)" class="leftmenu" data-id="5">薪酬福利</a></li>
			
				</ul>
			</div><!--end menu-->
		</div><!--end left-->
		<div class="right">

			<div class="comp_info c1">
			<% CompanyInfo companyinfo = (CompanyInfo)request.getAttribute("companyinfo");
			if(companyinfo!=null){
			%>
				<%=companyinfo.getContent() %>
			<%} %>
			</div>
			
			<div class="comp_info c2"  style="display: none;">
				<div class="list">
			<ul>




			
		
		
			<li><span>2013-02-16</span>
				<a href="News_getnews?id=18" title="阿四大四大">
				阿四大四大
				</a>
			</li>
		
	
		
			<li><span>2013-02-16</span>
				<a href="News_getnews?id=17" title="test">
				test
				</a>
			</li>
		
	
		
			<li><span>2013-02-16</span>
				<a href="News_getnews?id=16" title="我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们我们">
				我们我们我们我们我们我们我们我们我们我们我们我...
				</a>
			</li>
		
	
		
			<li><span>2013-02-16</span>
				<a href="News_getnews?id=15" title="公司的发放到撒范德萨发大厦">
				公司的发放到撒范德萨发大厦
				</a>
			</li>
		
	
		
			<li><span>2013-02-16</span>
				<a href="News_getnews?id=14" title="萨达的是范德萨发多少分多少">
				萨达的是范德萨发多少分多少
				</a>
			</li>
		
	
		
			<li><span>2013-02-16</span>
				<a href="News_getnews?id=13" title="按时大声大声道萨达">
				按时大声大声道萨达
				</a>
			</li>
		
	
		
			<li><span>2013-02-16</span>
				<a href="News_getnews?id=12" title="【2012年度工作计划】关于我公司2012年财政预算计划">
				【2012年度工作计划】关于我公司2012年财政预算计划
				</a>
			</li>
		
	
		
			<li><span>2013-02-16</span>
				<a href="News_getnews?id=11" title="【2012年度工作计划】关于我公司2012年财政预算计划">
				【2012年度工作计划】关于我公司2012年财政预算计划
				</a>
			</li>
		
	
		
			<li><span>2013-02-16</span>
				<a href="News_getnews?id=10" title="【2012年度工作计划】关于我公司2012年财政预算计划">
				【2012年度工作计划】关于我公司2012年财政预算计划
				</a>
			</li>
		
	
		
			<li><span>2013-02-16</span>
				<a href="News_getnews?id=9" title="【2012年度工作计划】关于我公司2012年财政预算计划">
				【2012年度工作计划】关于我公司2012年财政预算计划
				</a>
			</li>
		
	
	</ul>

				
	</div>


			</div>
			
			
			<div class="comp_info c3"  style="display: none;">
				<div class="content">
				<div class="dsj">
					<div class="dsjt"></div>







                    <div class="text">


<dl class="list-date clearfix"><dt>2012年12月</dt><dd>
360安全卫士9.0版本开启内测，开启云端安全新时代。
</dd></dl>
<dl class="list-date clearfix"><dt>2012年12月13日至14日</dt><dd>
国际最为知名的网络信息安全会议之一360SyScan首次登陆中国北京，360与SyScan共同携手推动互联网信息安全产业发展，汇聚更加前沿的新安全技术力量，为中国安全行业提供与世界接轨交流的平台。
</dd></dl>


<dl class="list-date clearfix"><dt>2012年11月</dt><dd>
360杀毒4.0正式版发布，新版本启用第二代QVM人工智能引擎，使杀毒软件对新型病毒的拦截效率得到革命性提升。在这一新版中，360杀毒改进了宏病毒实时监控逻辑--使用360自主研发的超轻量级宏病毒引擎实时监控宏病毒，另外进一步提升了版本的稳定性。
</dd></dl>

<dl class="list-date clearfix"><dt>2012年11月</dt><dd>
360浏览器发布透明化运动，推出“个人信息使用日志”DNT保护功能，加大保护用户隐私力度。360安全浏览器推出“个人信息使用日志”，通过此功能，用户能够检测到跨站跟踪、Cookies跟踪等行为，这是国内首家支持“禁止跟踪”（DNT，Do Not Track）功能的浏览器。同时，这也代表了中国浏览器隐私保护水平达到国际领先标准。
</dd></dl>


<dl class="list-date clearfix"><dt>2012年10月</dt><dd>
2012年10月，全新360安全浏览器6.0版发布，6.0版安全浏览器独创四驱加速引擎，Chromium 21和IE双核智能切换；完美支持HTML5，带来炫酷体验；全面支持Chrome应用扩展，极大丰富上网体验；这一改进，也将全面加速HTML5在中国的普及进程。
</dd></dl>

<dl class="list-date clearfix"><dt>2012年9月</dt><dd>
2012年9月，360公司与中关村电子城签约，将入驻中关村电子城国际电子总部。奇虎360斥资13.84亿人民币(2.18亿美元)在北京朝阳区购买总面积69205平方米的办公楼。</dd></dl>


<dl class="list-date clearfix"><dt>2012年9月</dt><dd>
360搜索正式发布so.com独立域名，S代表Safe(安全)，O代表Open(开放)。360搜索立志成为"干净、安全、可信任"的搜索引擎，让用户拥有搜索的选择权。</dd></dl>

<dl class="list-date clearfix"><dt>2012年9月</dt><dd>
IE多版本浏览器曝出高危漏洞，德国政府及多家安全机构呼吁用户临时更换浏览器，360安全卫士和360安全浏览器均无需升级即可防御此漏洞。</dd></dl>

<dl class="list-date clearfix"><dt>2012年8月</dt><dd>
360搜索低调上线，集成在360安全网址导航“综合搜索”开放平台中，为用户提供通用网页搜索服务。</dd></dl>


<dl class="list-date clearfix"><dt>2012年8月</dt><dd>
360杀毒发布4.0“云动版”。新版本启用第二代QVM人工智能引擎，使杀毒软件对新型病毒的拦截效率得到革命性提升。</dd></dl>

<dl class="list-date clearfix"><dt>2012年8月</dt><dd>
奇虎360公司宣布与中关村电子城签约，将入驻中关村电子城国际电子总部，购买其国际电子总部3#地和2#楼A座和B座，地上建筑面积共约6.92万平方米。</dd></dl>




	</div>














				</div><!--end dsj-->
			</div>


			</div>
			
			<div class="comp_info c4" style="display: none;">
				<div class="qywh">
				<ul>
				
				<li><strong>我们的愿景：</strong>成为全球最受网民尊敬的互联网安全服务公司</li>
				<li><strong>我们的使命：</strong>让网民安全上网</li>
				<li><strong>360核心价值观：</strong>用户至上、创业心态、持续创新、不断反思、 开放协作</li>
				</ul>
				<p><strong>用户至上：</strong></p>
				<p>为用户创造价值；</p>
				<p>坚决维护用户利益；</p>
				<p>尊重用户知情权与选择权；</p>
				<p>为用户提供简单易用的产品；</p><br>
				<p><strong>创业心态：</strong></p>
				<p>我们做的是一份事业而非一份工作；</p>
				<p>结果导向；</p>
				<p>用心做事；</p>
				<p>速度制胜；</p><br>
				<p><strong>持续创新：</strong></p>
				<p>互联网行业需要有颠覆精神；</p>
				<p>鼓励和支持原创；</p>
				<p>提倡微创新；</p>
				<p>向用户和竞争对手学习；</p><br>
				<p><strong>不断反思：</strong></p>
				<p>不断进行批评与自我批评；</p>
				<p>不断发现问题，解决问题；</p>
				<p>追求极致，将一个点做深做透；</p><br>
				<p><strong>开放协作：</strong></p>
				<p>有战斗的精神；</p>
				<p>有大局观；</p>
				<p>杜绝本位主义；</p>
				<p>灵活的变位和调整；</p>
				<p>分工协作、及时补位支援；</p><br>
				<p><strong>360核心价值观的五个“第一”：</strong></p>
				<p>利益选择上用户第一</p>
				<p>个人发展上心态第一</p>
				<p>产品设计上创新第一</p>
				<p>人才培养上反思第一</p>
				<p>团队运作上协作第一</p>
			</div>
			</div>
			
			<div class="comp_info c5"  style="display: none;">
				<div class="imgText" style="padding-left:80px;padding-top:20px;padding-bottom:80px;">
				<ul>
				<li><img src="http://w.qhimg.com/images/v2/site/hr/salary.jpg"></li>
				</ul>
			</div>
				
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