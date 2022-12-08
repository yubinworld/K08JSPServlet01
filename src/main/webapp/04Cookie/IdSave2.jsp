<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");


String inter = request.getParameter("inter");
String por = request.getParameter("por");
String[] favo = request.getParameterValues("inter");

String favoStr = "";

	if(favo != null){
		for(int i = 0; i < favo.length; i++){
			favoStr += favo[i] + " "; 
		}
	}
%>
<ul>
	<li>관심사항 : <%= favo %></li>
	<li>관심사 : <%= por %></li>
</ul>
</body>
</html>