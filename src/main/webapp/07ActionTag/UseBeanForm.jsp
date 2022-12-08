<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
	<h2>액션 태그로 폼값 한 번에 받기</h2>
	<!-- 
	폼값을 전송하는 페이지에서 input태그에 name 속성과 이를
	저장할 DTO객체의 멤버변수명이 반드시 일치해야하고, 또한
	값 설정을 위한 setter/getter 메서드가 반드시 정의되어
	있어야한다.
	 -->
	<form method="post" action="UseBeanAction.jsp">
		이름 : <input type="text" name="name"/> <br />
		나이 : <input type="text" name="age"/> <br />
		<input type="submit" value="폼값 전송" />
	</form>
</body>
</html>