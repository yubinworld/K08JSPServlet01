<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OtherPage.jsp</title>
</head>
<body>
<ul>
	<!-- request 영역에 저장된 변수값 출 -->
	<li>저장된 값 : ${ requestVar }</li>
	<!-- 파라미터로 절달된 값 출력. 해당 파라미터는 <param> 태그를 통해
	전달한다.  -->
	<li>매개변수 1 : ${ param.user_param1 }</li>
	<li>매개변수 2 : ${ param.user_param2 }</li>
</ul>
</body>
</html>