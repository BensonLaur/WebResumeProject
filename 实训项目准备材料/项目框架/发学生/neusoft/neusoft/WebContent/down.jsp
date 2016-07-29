<%@page language="java" contentType="application/x-msdownload"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.neusoft.comon.init.PropertiesUtil"%>
<%
	response.reset();//可以加也可以不加  
	out.clear();
	out = pageContext.pushBody();
	response.setContentType("application/x-download");

	String filename = request.getParameter("fileName");
	String path = application.getRealPath("/" + PropertiesUtil.get("uploadPath"));

	String filedownload = path  + java.io.File.separator
			+ filename;
	System.out.println(filedownload);
	// 取得文件的后缀名。
	String ext = filename.substring(filename.lastIndexOf(".") + 1);

	String filedisplay = URLEncoder.encode("简历-"
			+ request.getParameter("name") + "." +ext, "UTF-8");
	response.addHeader("Content-Disposition", "attachment;filename="
			+ filedisplay);

	java.io.OutputStream outp = null;
	java.io.FileInputStream in = null;
	try {
		outp = response.getOutputStream();
		in = new FileInputStream(filedownload);

		byte[] b = new byte[1024];
		int i = 0;

		while ((i = in.read(b)) > 0) {
			outp.write(b, 0, i);
		}
		//    
		outp.flush();
	} catch (Exception e) {
		System.out.println("Error!");
		e.printStackTrace();
	} finally {
		if (in != null) {
			in.close();
			in = null;
		}
	}
%>
