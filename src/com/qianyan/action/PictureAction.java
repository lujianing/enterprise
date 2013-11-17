package com.qianyan.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.qianyan.bean.PageBean;
import com.qianyan.entity.Picture;
import com.qianyan.service.PictureService;
import com.qianyan.utils.DateTime;
import com.qianyan.utils.ImageUtils;

public class PictureAction extends ActionSupport implements
		ServletResponseAware, ServletRequestAware {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private int id;
	private String title;
	private String info;
	private String pname;
	private String src;
	private String smallsrc;
	private String uptime;
	private int page; // 分页第几页
	private File[] file;
	private String[] fileFileName;
	private String[] fileContentType;

	private PictureService pictureservice;
	private String message;
	private Picture picture;

	public PictureService getPictureservice() {
		return pictureservice;
	}

	@Resource(name = "pictureservice")
	public void setPictureservice(PictureService pictureservice) {
		this.pictureservice = pictureservice;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getSmallsrc() {
		return smallsrc;
	}

	public void setSmallsrc(String smallsrc) {
		this.smallsrc = smallsrc;
	}

	public String getUptime() {
		return uptime;
	}

	public void setUptime(String uptime) {
		this.uptime = uptime;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;

	}

	public File[] getFile() {
		return file;
	}

	public void setFile(File[] file) {
		this.file = file;
	}

	public String[] getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String[] fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String[] getFileContentType() {
		return fileContentType;
	}

	public Picture getPicture() {
		return picture;
	}

	public void setPicture(Picture picture) {
		this.picture = picture;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void setFileContentType(String[] fileContentType) {
		this.fileContentType = fileContentType;
	}
	
	public String upload(){
		return "pictureupload";
	}
	
	public String autoupload(){
		return "autoupload";
	}

	/**
	 * 用于实现上传功能 普通上传
	 */
	public String save() throws Exception {
		Picture picture = new Picture();
		for (int i = 0; i < file.length; i++) {

			// 类型判断 可以通过过滤器判断
			String[] types = { ".bmp", ".jpg", ".gif", ".png" };

			System.out.println(fileFileName[i]);
			String fileext = fileFileName[i].substring(
					fileFileName[i].lastIndexOf("."), fileFileName[i].length());
			System.out.println(fileext);

			if (!fileext.equalsIgnoreCase(".bmp")
					&& !fileext.equalsIgnoreCase(".jpg")
					&& !fileext.equalsIgnoreCase(".gif")
					&& !fileext.equalsIgnoreCase(".png")) {
				message = "图片类型不符合要求";
				return "error";

			}
			// 上传路径
			String root = ServletActionContext.getRequest().getRealPath(
					"/picture/bigpic");
			String smallroot = ServletActionContext.getRequest().getRealPath(
					"/picture/smallpic");

			String filetempname = System.currentTimeMillis() + fileext;
			String bigaddress = root + "/" + filetempname;
			String smalladdress = smallroot + "/" + filetempname;

			String bigsqladddress = "picture/bigpic/" + filetempname;
			String smallsqladdress = "picture/smallpic/" + filetempname;

			File deskFile = new File(bigaddress);
			InputStream is = new FileInputStream(file[i]);
			OutputStream os = new FileOutputStream(deskFile);
			byte[] bytefer = new byte[400];
			int length = 0;
			// 文件上传
			while ((length = is.read(bytefer)) > 0) {
				os.write(bytefer, 0, length);
			}
			os.close();
			is.close();

			// 创建小图片 在查看相册时 看到的是压缩的图片 节省带宽
			ImageUtils.createSmallPhoto(bigaddress, smalladdress);

			// 存储的为相片在服务器的路径
			// photo.setPhotoaddress(photoaddress);
			picture.setSrc(bigsqladddress);
			picture.setPname(fileFileName[i]);
/*			picture.setTitle(title);
			picture.setInfo(info);*/
			picture.setSmallsrc(smallsqladdress);
			picture.setUptime(DateTime.getDateTime());

			// photo.setPhototime((new Date()).toString());

			pictureservice.save(picture);

		}

		message = "图片上传成功";
		return "savePicSucc";
	}

	/**
	 * 自动上传 不用return return前台ajax上传现实有错误 现在加过滤器了 貌似也有报错 但是能上传
	 * */
	public void saveauto() throws Exception {
		// TODO Auto-generated method stub
		// 实现上传
		Picture picture = new Picture();
		for (int i = 0; i < file.length; i++) {
			// 类型判断 可以通过过滤器判断
			String[] types = { ".bmp", ".jpg", ".gif", ".png" };

			String fileext = fileFileName[i].substring(
					fileFileName[i].lastIndexOf("."), fileFileName[i].length());

			// 上传路径
			String root = ServletActionContext.getServletContext().getRealPath(
					"/picture/bigpic");
			String smallroot = ServletActionContext.getServletContext().getRealPath(
					"/picture/smallpic");

			String filetempname = System.currentTimeMillis() + fileext;
			String bigaddress = root + "/" + filetempname;
			String smalladdress = smallroot + "/" + filetempname;

			String bigsqladddress = "picture/bigpic/" + filetempname;
			String smallsqladdress = "picture/smallpic/" + filetempname;

			File deskFile = new File(bigaddress);
			InputStream is = new FileInputStream(file[i]);
			OutputStream os = new FileOutputStream(deskFile);
			byte[] bytefer = new byte[400];
			int length = 0;
			// 文件上传
			while ((length = is.read(bytefer)) > 0) {
				os.write(bytefer, 0, length);
			}
			os.close();
			is.close();

			// 创建小图片 在查看相册时 看到的是压缩的图片 节省带宽
			ImageUtils.createSmallPhoto(bigaddress, smalladdress);

			// 存储的为相片在服务器的路径
			// photo.setPhotoaddress(photoaddress);
			
			picture.setSrc(bigsqladddress);
			picture.setPname(fileFileName[i]);
	/*		picture.setTitle(title);
			picture.setInfo(info);*/
			picture.setSmallsrc(smallsqladdress);
			picture.setUptime(DateTime.getDateTime());

			// photo.setPhototime((new Date()).toString());

			pictureservice.save(picture);

		}

	}
	
	public void delete() throws IOException{
		pictureservice.deleteById(Picture.class, id);
		message="删除成功";
		response.getWriter().print("{\"del\":\"true\"}");
	}
	
	public String updateinput(){
		picture = pictureservice.findById(Picture.class, id);
		return "picupdateinput";
	}
	
	public String update(){
		picture.setInfo(info);
		picture.setTitle(title);
		pictureservice.update(picture);
		return "updatePicSucc";
	}
	
	public String listpictures(){
		PageBean pagebean = pictureservice.queryForPage(8, page, "desc");
		request.setAttribute("pagebean", pagebean);
		return "listpictures";
	}
	
	public String listbynum(){
		List<Picture> pictures =pictureservice.listbynum(50, "desc");
		request.setAttribute("pictures", pictures);
		return "listbynum";
	}
	
	public String getpicture(){
		Picture picture = pictureservice.findById(Picture.class, id);
		request.setAttribute("picture", picture);
		return "getpicture";
	}
	
	public String pictureupdate(){
		Picture picture = pictureservice.findById(Picture.class, id);
		picture.setTitle(title);
		picture.setInfo(info);
		pictureservice.update(picture);
		message="更新成功";
		return "pictureupdateSucc";
	}

}
