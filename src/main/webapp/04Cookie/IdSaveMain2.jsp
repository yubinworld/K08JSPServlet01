<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
//페이지가 실행되면 loginId라는 쿠키를 읽어온다.
String loginId = CookieManager.readCookie(request, "loginId");

//'아이디저장' 체크박스에 체크를 하기위한 변수 생성
String cookieCheck = "";
if (!loginId.equals("")) {
	cookieCheck = "checked";
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie - 아이디 저장하기</title>
</head>
<body>
	<h2>관심사</h2>
	
	<form action="IdSave2.jsp" method="post">
	<!-- 
	IdSave2.jsp 파일에는
	IdSaveMain2 에서 입력한
	//정치 연예 스포츠 > 체크박스 
	//프로그래머  디자이너 퍼블리셔  > radio
	readonly 속성 추가
	 -->
		<input type="checkbox" name="inter" value="pol"/>
		정치
		<input type="checkbox" name="inter" value="ent"/>
		연예
		<input type="checkbox" name="inter" value="spo"/>
		스포츠
		
		<br /><br />
		<input type="radio" name="por" value="pro"/>
		프로그래머
		<input type="radio" name="por" value="dig"/>
		디자이너
		<input type="radio" name="por" value="pub"/>
		퍼블리셔
		<br /><br />
		<input type="submit" value="전송하기"/>
	</form>
</body>
</html>