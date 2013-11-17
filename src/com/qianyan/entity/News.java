package com.qianyan.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="news")
public class News implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	private int id;			//
	private String title;		
	private String content;	
	private String uptime;	//上传时间
	private int click;		//点击次数
//	private NewsType newstype;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="title",length=255,nullable=false)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(nullable=true,length=20000)
	public String getContent() {
		return content;
	}
	
	
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(length = 100 ,nullable = false)
	public String getUptime() {
		return uptime;
	}
	public void setUptime(String uptime) {
		this.uptime = uptime;
	}
	
	@Column(nullable=false,length=10)
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
	
/*	@ManyToOne()
	@JoinColumn(name="typeid")
	public NewsType getNewstype() {
		return newstype;
	}
	
	public void setNewstype(NewsType newstype) {
		this.newstype = newstype;
	}*/
	
}
