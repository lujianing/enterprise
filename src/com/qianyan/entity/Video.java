package com.qianyan.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="video")
public class Video implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;			//
	private String title;	
	private String vsrc;	//FLV对应的路径
	private String psrc;	//视频对应的图片 对应路径	
	private String vinfo;	
	private String uptime;	//上传时间
	private int cd;	//视频的状态的标记  1代表视频转换flv过成功； 2代表转换与截图成功 ；3代表视频的转换处理圆满完成   转换、截图、修复
	private int click;		//点击次数
	private int download;	//下载次数
	private String vname;
	
//	private int typeid;
	
	
	



	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(nullable=false,length=40)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(nullable=false,length=255)
	public String getVsrc() {
		return vsrc;
	}

	public void setVsrc(String vsrc) {
		this.vsrc = vsrc;
	}

	@Column(nullable=false,length=255)
	public String getPsrc() {
		return psrc;
	}

	public void setPsrc(String psrc) {
		this.psrc = psrc;
	}

	@Column(nullable=true,length=500)
	public String getVinfo() {
		return vinfo;
	}

	public void setVinfo(String vinfo) {
		this.vinfo = vinfo;
	}

	@Column(nullable=true,length=60)
	public String  getUptime() {
		return uptime;
	}

	public void setUptime(String  uptime) {
		this.uptime = uptime;
	}


	


	public int getCd() {
		return cd;
	}

	public void setCd(int cd) {
		this.cd = cd;
	}

/*	public int getTypeid() {
		return typeid;
	}

	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}*/

	public int getClick() {
		return click;
	}

	public void setClick(int click) {
		this.click = click;
	}

	public int getDownload() {
		return download;
	}

	public void setDownload(int download) {
		this.download = download;
	}
	
	@Column(length=60)
	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	@Override
	public String toString() {
		return "Video [id=" + id + ", title=" + title + ", vsrc=" + vsrc
				+ ", psrc=" + psrc + ", vinfo=" + vinfo + ", uptime=" + uptime
				+ ", cd=" + cd +  "]";
	}
	
	
}