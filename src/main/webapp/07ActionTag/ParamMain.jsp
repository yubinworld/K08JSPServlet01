<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* request.setCharacterEncoding("UTF-8"); */
String pValue = "방랑시인";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - param</title>
</head>
<body>
	<!-- Person클래스로 request영역에 자바빈을 생성한다. -->
	<jsp:useBean id="person" class="common.Person" scope="request" />
	<!-- setter()를 통해 멤버변수의 값을 설정한다. -->
	<jsp:setProperty name="person" property="name" value="김삿갓" />
	<jsp:setProperty name="person" property="age" value="56" />
	<!-- 다음 페이지로 포워드한다. 이때 3개의 파라미터를 전송한다. -->
	<jsp:forward page="ParamForward.jsp?param1=김병연">
		<jsp:param name="param2" value="경기도양주"/>
		<jsp:param name="param3" value="<%=pValue %>"/>
	</jsp:forward>
	<!-- 액션태그의 경우 시작태그와 종료태그를 나눠서 작성할때에는
	태그 사이에 HTML주석을 기술하면 에러가 발생한다. 따라서 HTML
	주석은 하나의 액션태그가 종료된 후 기술해야 한다. 주석은
	화면에 안보이게만 해주는 기능이라 태그 사이에 쓰면 에러발생 
	 -->
</body>  
</html>