package com.qianyan.action;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.qianyan.entity.Video;
import com.qianyan.service.VideoService;
public class DownloadAction extends ActionSupport {

	private String inputPath;//struts2框架注入的原始文件保存路径
	private String fileName;//要下载的文件名
	private VideoService videoservice;
	
	public VideoService getVideoservice() {
		return videoservice;
	}
	
	@Resource(name="videoservice")
	public void setVideoservice(VideoService videoservice) {
		this.videoservice = videoservice;
	}
	
	public String getInputPath() {
		return inputPath;
	}

	public void setInputPath(String inputPath) {
		this.inputPath = inputPath;
	}
	
	public String getFileName() {
		System.out.println("getFileName():"+fileName);
		return fileName;
	}

	public void setFileName(String fileName) {
		System.out.println("转码前：setFileName():"+fileName);
		try {//对接受的中文文件名进行转码，否则找不到文件所在的输出流
			this.fileName =new String(fileName.getBytes("ISO-8859-1"),"gbk");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//this.fileName=fileName;
		System.out.println("转码后setFileName():"+this.fileName);
	}
	
	public InputStream getTargetFile(){
		System.out.println("getTargetFile():"+fileName);
		return ServletActionContext.getServletContext().getResourceAsStream(inputPath+fileName);
	}	
	
	/*下载名字*/
	public String getDownloadFileName(){
		
			Video video =videoservice.findByName(this.fileName);
			String downloadChineseFileName = video.getTitle()+".flv";
			System.out.println("转码前：getDownloadFileName:"+downloadChineseFileName);
		try {// 如果下载文件名为中文，对文件名再次转码，否则根据struts.xlm的contentDisposition位置设置，下载文件弹出的对话框不能正确显示文件中文名
			downloadChineseFileName =new String(downloadChineseFileName.getBytes(),"ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println("转码后：getDownloadFileName:"+downloadChineseFileName);
		return downloadChineseFileName;
	}
	
	@Override
	public String execute() throws Exception {
		Video video =videoservice.findByName(this.fileName);
		videoservice.getandupdatedown(video.getId());
		
		return SUCCESS;
	}
}
