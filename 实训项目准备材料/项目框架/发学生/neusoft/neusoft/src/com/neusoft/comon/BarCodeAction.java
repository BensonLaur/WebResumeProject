package com.neusoft.comon;

import java.io.ByteArrayInputStream;

import com.neusoft.util.CreateBarcodeUtil;
import com.opensymphony.xwork2.ActionSupport;

public class BarCodeAction extends ActionSupport {
	private static final long serialVersionUID = 7911407157686855989L;
	private ByteArrayInputStream inputStream;
	private String id;
	
	public String getBarCode(){
		CreateBarcodeUtil barcodeUtil=CreateBarcodeUtil.Instance();
		this.setInputStream(barcodeUtil.createBarCode(id));
		return SUCCESS;
	}
	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
