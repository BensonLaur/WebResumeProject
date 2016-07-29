package com.neusoft.util;

import java.io.File;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;

import com.neusoft.comon.init.PropertiesUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * zhangsb 2012-4-3
 **/

public class UploadAction extends ActionSupport implements ServletContextAware {

	private static final long serialVersionUID = -7138359346671648301L;

	private File upload;
	private String fileName;
	private String imageUrl;
	private ServletContext context;
	private Integer index;
	

	public String initUpload() throws Exception {
		return SUCCESS;
	}

	public String upload() throws Exception {
		String message = null;
		if (upload != null) {
			String targetDirectory = ServletActionContext.getServletContext().getRealPath("/")
			 + File.separator + PropertiesUtil.get("uploadPath");
			new File(targetDirectory).mkdir();
			File target = new File(targetDirectory, fileName);
			FileUtils.copyFile(upload, target);
			message = "上传成功";	
		}
		addActionMessage(message);
		return SUCCESS;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public ServletContext getContext() {
		return context;
	}

	public void setContext(ServletContext context) {
		this.context = context;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setServletContext(ServletContext context) {
		this.context = context;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}
}
