package com.qianyan.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.qianyan.bean.PageBean;
import com.qianyan.entity.Video;

import com.qianyan.service.VideoService;
import com.qianyan.thread.ConvertVideoThread;
import com.qianyan.utils.DateTime;

/**
 * video的action 负责控制转发 以及表单的提交 实现接口ServletResponseAware ,ServletRequestAware
 * 自动注入 author：鲁家宁
 * */
public class VideoAction extends ActionSupport implements ServletResponseAware,
		ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String message;
	private File file;
	private String fileFileName; // 文件�?
	private String fileContentType; // 文件类型
	private HttpServletRequest request;
	private HttpServletResponse response;
	private String title;
	private String vinfo;
	private int typeid;
	private int videoid;
	private int page;

	private VideoService videoservice;

	public VideoService getVideoservice() {
		return videoservice;
	}

	@Resource(name = "videoservice")
	public void setVideoservice(VideoService videoservice) {
		this.videoservice = videoservice;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getVinfo() {
		return vinfo;
	}

	public void setVinfo(String vinfo) {
		this.vinfo = vinfo;
	}

	public int getTypeid() {
		return typeid;
	}

	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}

	public int getVideoid() {
		return videoid;
	}

	public void setVideoid(int videoid) {
		this.videoid = videoid;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	/* 自动注入 */
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	/* 自动注入 */
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public String addvideo() {
		return "addvideo";
	}

	public String mainpage() {
		ArrayList<Video> lists = (ArrayList<Video>) videoservice.listVideo(4);
		request.setAttribute("lists", lists);

		// 最新更新
		ArrayList<Video> listten = (ArrayList<Video>) videoservice
				.listVideo(10);
		request.setAttribute("listten", listten);

		// 点击排行
		ArrayList<Video> listclick = (ArrayList<Video>) videoservice
				.listVideoByClick(10);
		request.setAttribute("listclick", listclick);

		// 下载排行
		ArrayList<Video> listdown = (ArrayList<Video>) videoservice
				.listVideoByDownload(10);
		request.setAttribute("listdown", listdown);

		return "mainpage";
	}

	public String add() {
		// 第一步：先检查视频格式
		// System.out.println(fileContentType);
		String format = fileFileName.substring(
				fileFileName.lastIndexOf(".") + 1, fileFileName.length());
		if (!checkFormat(format.trim())) {
			message = "您上传的视频文件格式不正确，请选择正确的视频格式";
			return "error";
		}

		// 第二步：写文件
		String serialName = String.valueOf(System.currentTimeMillis());// 设置存储名字
		String upfilePath = ServletActionContext.getServletContext()
				.getRealPath("/videos/") + "/upload/" + fileFileName; // 设置上传到服务器文件路径
																		
		String flvpath = ServletActionContext.getServletContext().getRealPath(
				"/videos/")
				+ "/flv/" + serialName + ".flv";
		String cutPicPath = ServletActionContext.getServletContext()
				.getRealPath("/videos/") + "/pic/" + serialName + ".jpg";

		File tarFile = new File(upfilePath);
		try {
			writeFile(file, tarFile);
		} catch (IOException e) {
			System.out.println("写文件失败");
			message = "文件上传到服务器失败！！";
			e.printStackTrace();
			return "error";
		}
		
		
		Video video = new Video();
		video.setTitle(title);
		video.setVinfo(vinfo);


		video.setClick(0);
		video.setDownload(0);
		video.setVname(serialName + ".flv");

		video.setUptime(DateTime.getDateTime());
		video.setVsrc("/videos/flv/" + serialName + ".flv");
		video.setPsrc("/videos/pic/" + serialName + ".jpg");
		video.setCd(1); // 3代表要求格式
		videoservice.addVideo(video);
	
		
		boolean istrue =false;
		if(!format.equalsIgnoreCase("flv")){  //不是flv
			System.out.println("视频需要类型转化");
			ConvertVideoThread cvt = new ConvertVideoThread();
			cvt.setVideoservice(videoservice);
			cvt.setVideo(video);
			cvt.setCutPicPath(cutPicPath);
			cvt.setFlvFilePath(flvpath);
			cvt.setUpFilePath(upfilePath);
			cvt.setServerPath(ServletActionContext.getServletContext().getRealPath("/"));
			cvt.thread.start();
			message = "上传视频成功,等待视频类型转化";
		}
		else{				//是flv 仅仅需要截图
			istrue = cutpic(upfilePath, flvpath, cutPicPath);
			
			File flvFile = new File(flvpath);
			try {
				writeFile(file, flvFile);
			} catch (IOException e) {
				System.out.println("写文件失败");
				message = "文件上传到服务器失败！！";
				e.printStackTrace();
				return "error";
			}
			video.setCd(3); // 3代表要求格式
			videoservice.updateVideo(video);
			message = "上传flv文件成功";
		}
		
		
		
		return "addvideoSucc";

		

	}

	/*
	 * 检查类型 ?flv必须写成这种格式 写成flv格式判断不正�?
	 */
	public boolean checkFormat(String format) {
		boolean result = false;
		String[] el = { "avi", "asf", "asx", "3gp", "mpg", "mov", "mp4", "wmv",
				"octet-stream", "x-flv", "flv" };
		for (int i = 0; i < el.length; i++) {
			if (format.equals(el[i])) {
				result = true;
				break;
			}
		}
		return result;
	}

	/**
	 * 写文件
	 * 
	 */
	private void writeFile(File src, File tar) throws IOException {
		InputStream inputStream = new FileInputStream(src);
		OutputStream outputStream = new FileOutputStream(tar);
		byte[] content = new byte[1024];
		while (inputStream.read(content) > 0) {
			outputStream.write(content);
		}
		outputStream.close();
		inputStream.close();
	}

	/*
	 * 列出全部视频
	 */
	public String listvideo() {
		
		PageBean pagebean = videoservice.queryForPage(6, page, "desc"," where v.cd=3");
		request.setAttribute("pagebean", pagebean);
		
		// 点击排行
				ArrayList<Video> listclick = (ArrayList<Video>) videoservice
						.listVideoByClick(10);
				request.setAttribute("listclick", listclick);

				// 下载排行
				ArrayList<Video> listdown = (ArrayList<Video>) videoservice
						.listVideoByDownload(10);
				request.setAttribute("listdown", listdown);
				
		return "listvideo";
	}

	/*
	 * 列出全部视频
	 */
	public String getvideo() {
		
		// 点击排行
		ArrayList<Video> listclick = (ArrayList<Video>) videoservice
				.listVideoByClick(10);
		request.setAttribute("listclick", listclick);

		// 下载排行
		ArrayList<Video> listdown = (ArrayList<Video>) videoservice
				.listVideoByDownload(10);
		request.setAttribute("listdown", listdown);
		

		Video video = videoservice.getVideoByID(videoid);
		if (video == null) {
			message = "视频未找到";
			return "error";
		}
		request.setAttribute("video", video);
		return "getvideo";
	}

	/*
	 * 删除视频 调用service 在servce层进行文件删�?
	 */

	public void delete() throws IOException {
		boolean success = true;
		if (!videoservice.deleteByID(videoid)) {
			message = "删除视频失败";
			success =false;
		}
		message = "删除成功";
		response.getWriter().print("{\"del\":\""+success+"\"}");
	}

	public String updateinput() {
		Video video = videoservice.getVideoByID(videoid);
		if (video == null) {
			message = "视频未找到";
			return "error";
		}
		request.setAttribute("video", video);
		return "videoupdateinput";

	}

	public String update() {
		Video video = videoservice.getVideoByID(videoid);
		if (video == null) {
			message = "视频未找到";
			return "error";
		}
		video.setTitle(title);
		video.setVinfo(vinfo);
		if (!videoservice.updateVideo(video)) {
			message = "视频更新失败";
			return "error";
		}
		message = "视频更新成功";
		return "videoupdatesuccess";

	}

	/**
	 * @功能：①转换上传的视频为FLV格式；②从上传的视频中截图。
	 * @参数：①upFilePath： 用于指定要转换格式的文件路径；以及用来指定要截图的视频。<br>
	 * @参数：②flvFilePath：用于指定转换为FLV格式后的文件的保存路径。<br>
	 * @参数：③cutPicPath： 用于指定截取的图片的保存路径
	 * @返回：boolean型值
	 */
	private boolean convertVideo(String upFilePath, String flvFilePath,
			String cutPicPath) {
		String ffmpegPath = ServletActionContext.getServletContext()
				.getRealPath("/videos/tools") + "/ffmpeg.exe"; // 获取在web.xml中配置的转换工具（ffmpeg.exe）的存放路径
		// 创建一个List集合来保存转换视频文件为flv格式的命令
		String flvmdiPath = ServletActionContext.getServletContext()
				.getRealPath("/videos/tools") + "/flvmdi.exe";
		List<String> convert = new ArrayList<String>();
		convert.add(ffmpegPath); // 添加转换工具路径
		convert.add("-i"); // 添加参数＂-i＂，该参数指定要转换的文件
		convert.add(upFilePath); // 添加要转换格式的视频文件的路径
		convert.add("-qscale");
		convert.add("6");
		convert.add("-ab");
		convert.add("64");
		convert.add("-acodec");
		convert.add("mp3");
		convert.add("-ac");
		convert.add("2");
		convert.add("-ar");
		convert.add("22050");
		convert.add("-r");
		convert.add("24");
		convert.add("-y"); // 添加参数＂-y＂，该参数指定将覆盖已存在的文件
		convert.add(flvFilePath);

		// 创建一个List集合来保存从视频中截取图片的命令
		List<String> cutpic = new ArrayList<String>();
		cutpic.add(ffmpegPath);
		cutpic.add("-i");
		cutpic.add(upFilePath); // 同上（指定的文件即可以是转换为flv格式之前的文件，也可以是转换的flv文件）
		cutpic.add("-y");
		cutpic.add("-f");
		cutpic.add("image2");
		cutpic.add("-ss"); // 添加参数＂-ss＂，该参数指定截取的起始时间
		cutpic.add("2"); // 添加起始时间为第9秒
		cutpic.add("-t"); // 添加参数＂-t＂，该参数指定持续时间
		cutpic.add("0.001"); // 添加持续时间为1毫秒
		cutpic.add("-s"); // 添加参数＂-s＂，该参数指定截取的图片大小
		cutpic.add("350*240"); // 添加截取的图片大小为350*240
		cutpic.add(cutPicPath); // 添加截取的图片的保存路径
		
		//开启FLV格式视频的修复进程（Flv格式的转换过程中 文件头‘metadata’可能存在损失，利用flvmdi工具注入头信息）
		List<String> flvRepair = new ArrayList<String>(); //修复时间问题
		flvRepair.add(flvmdiPath);
		flvRepair.add(flvFilePath);
		flvRepair.add(flvFilePath); // 同上（指定的文件即可以

		boolean mark = true;
		ProcessBuilder builder = new ProcessBuilder();
		try {
			Process p;
			builder.command(convert);
			p =builder.start();
			doWaitFor(p);
			builder.command(cutpic);
			p =builder.start();
			doWaitFor(p);
			builder.command(flvRepair);  //修复时间
			p =builder.start();
			doWaitFor(p);
		} catch (Exception e) {
			mark = false;
			System.out.println(e);
			e.printStackTrace();
		}
		return mark;
	}
	
	private boolean cutpic(String upFilePath, String flvFilePath,
			String cutPicPath){
		String ffmpegPath = ServletActionContext.getServletContext()
				.getRealPath("/videos/tools") + "/ffmpeg.exe"; // 获取在web.xml中配置的转换工具（ffmpeg.exe）的存放路径
		
		
		
		// 创建一个List集合来保存从视频中截取图片的命令
		List<String> cutpic = new ArrayList<String>();
		cutpic.add(ffmpegPath);
		cutpic.add("-i");
		cutpic.add(upFilePath); // 同上（指定的文件即可以是转换为flv格式之前的文件，也可以是转换的flv文件）
		cutpic.add("-y");
		cutpic.add("-f");
		cutpic.add("image2");
		cutpic.add("-ss"); // 添加参数＂-ss＂，该参数指定截取的起始时间
		cutpic.add("2"); // 添加起始时间为第9秒
		cutpic.add("-t"); // 添加参数＂-t＂，该参数指定持续时间
		cutpic.add("0.001"); // 添加持续时间为1毫秒
		cutpic.add("-s"); // 添加参数＂-s＂，该参数指定截取的图片大小
		cutpic.add("350*240"); // 添加截取的图片大小为350*240
		cutpic.add(cutPicPath); // 添加截取的图片的保存路径
		
		
		boolean mark = true;
		ProcessBuilder builder = new ProcessBuilder();
		try {
			Process p;
			System.out.println("视频正在截图"+upFilePath);
			builder.command(cutpic);
			p =builder.start();
			doWaitFor(p);
			System.out.println("视频截图结束"+cutPicPath);

		} catch (Exception e) {
			mark = false;
			System.out.println(e);
			e.printStackTrace();
		}
		return mark;		
	
	}
	
	public static int doWaitFor(Process p) {
		int exitValue = -1; // returned to caller when p is finished
		try {

			InputStream in = p.getInputStream();
			InputStream err = p.getErrorStream();
			boolean finished = false; // Set to true when p is finished

			while (!finished) {
				try {
					while (in.available() > 0) {
						// Print the output of our system call
						Character c = new Character((char) in.read());
					}
					while (err.available() > 0) {
						// Print the output of our system call
						Character c = new Character((char) err.read());
					}

					// Ask the process for its exitValue. If the process
					// is not finished, an IllegalThreadStateException
					// is thrown. If it is finished, we fall through and
					// the variable finished is set to true.
					exitValue = p.exitValue();
					finished = true;
				} catch (IllegalThreadStateException e) {
					// Process is not finished yet;
					// Sleep a little to save on CPU cycles
					Thread.currentThread().sleep(500);
				}
			}
		} catch (Exception e) {
			// unexpected exception! print it out for debugging...
		}

		// return completion status to caller
		return exitValue;
	}
}
