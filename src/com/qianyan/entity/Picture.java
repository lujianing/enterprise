package com.qianyan.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="picture")
public class Picture {
	private int id;
	private String title;
	private String info;
	private String pname;
	private String src;
	private String smallsrc;
	private String uptime;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="title",length=50,nullable=true)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name="info",length=1000,nullable=true)
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	@Column(name="pname",length=50,nullable=false)
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	@Column(name="src",length=255,nullable=false)
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	
	@Column(name="smallsrc",length=255,nullable=false)
	public String getSmallsrc() {
		return smallsrc;
	}
	public void setSmallsrc(String smallsrc) {
		this.smallsrc = smallsrc;
	}
	
	@Column(name="uptime",length=50,nullable=false)
	public String getUptime() {
		return uptime;
	}
	public void setUptime(String uptime) {
		this.uptime = uptime;
	}
}
