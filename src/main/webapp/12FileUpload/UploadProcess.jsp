<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
//파일업로드를 위한 디렉토리의 물리적경로(절대경로)를 얻어온다.
//물리적 경로가 필요한 이유는 운영체제에 따라 경로를 포현하는 방식이
//다르기 때문이다.
String saveDirectory = application.getRealPath("/Uploads");
//업로드할 파일의 최대용량제한(1mb로 지정함)
int maxPostSize = 1024 * 1000;
//인코딩 방식 지정
String encoding = "UTF-8";

try{
	/*
	앞에서 준비한 3개의 인수와 request 내장객체까지를 이용해서
	MultipartRequest 객체를 생성한다. 해당 객체가 정상적으로 생성되면
	파일 업로드는 완료된다.
	*/
	MultipartRequest mr = new MultipartRequest(request, saveDirectory,
												maxPostSize, encoding);		 
/*	
	String fileName = mr.getFilesystemName("attachedFile");	
	String ext = fileName.substring(fileName.lastIndexOf("."));
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	String newFileName = now + ext;
	
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newfileName);
	oldFile.renameTo(newFile);
	
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	if(cateArray == null){
		cateBuf.append("선택없");
	}
	else {
		for(String s : cateArray){
			cateBuf.append(s+",");
		}
	}
	response.sendRedirect("FileList.jsp");
*/
}
catch (Exception e){
	/* 파일 업로드에 실패한 경우에는 request 영역에 에러메세지ㅡㄹ
	저장한 후 업로드폼으로 포워드한다.*/
	e.printStackTrace();
	request.setAttribute("errorMessage", "파일 업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp")
		.forward(request, response);
}
%>