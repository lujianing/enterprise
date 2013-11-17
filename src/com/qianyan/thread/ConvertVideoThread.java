package com.qianyan.thread;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.qianyan.entity.Video;
import com.qianyan.service.VideoService;

public class ConvertVideoThread extends ActionSupport implements Runnable {
	
	public Thread thread;
	
	private VideoService videoservice;
	private Video video;
	private String upFilePath;
	private String flvFilePath;
	private String cutPicPath;
	private String serverPath;
	
	public VideoService getVideoservice() {
		return videoservice;
	}

	
	public void setVideoservice(VideoService videoservice) {
		this.videoservice = videoservice;
	}

	public Video getVideo() {
		return video;
	}


	public void setVideo(Video video) {
		this.video = video;
	}


	public String getUpFilePath() {
		return upFilePath;
	}


	public void setUpFilePath(String upFilePath) {
		this.upFilePath = upFilePath;
	}


	public String getFlvFilePath() {
		return flvFilePath;
	}


	public void setFlvFilePath(String flvFilePath) {
		this.flvFilePath = flvFilePath;
	}


	public String getCutPicPath() {
		return cutPicPath;
	}


	public void setCutPicPath(String cutPicPath) {
		this.cutPicPath = cutPicPath;
	}


	public String getServerPath() {
		return serverPath;
	}


	public void setServerPath(String serverPath) {
		this.serverPath = serverPath;
	}


	public ConvertVideoThread() {
		thread = new Thread(this);
	}
	
	
	public void run() {
		boolean istrue =false;
		istrue = convertVideo(upFilePath, flvFilePath, cutPicPath);
		if(istrue){
			video.setCd(3);
			videoservice.updateVideo(video);
		}

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
		String ffmpegPath = serverPath+"videos/tools" + "/ffmpeg.exe"; // 获取在web.xml中配置的转换工具（ffmpeg.exe）的存放路径
		// 创建一个List集合来保存转换视频文件为flv格式的命令
		String flvmdiPath = serverPath+"videos/tools" + "/flvmdi.exe";
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
		String ffmpegPath = serverPath+"videos/tools" + "/ffmpeg.exe"; // 获取在web.xml中配置的转换工具（ffmpeg.exe）的存放路径
		
		
		
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
