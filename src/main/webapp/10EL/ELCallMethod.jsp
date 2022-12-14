<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="mytag" uri ="/WEB-INF/MytagLib.tld"%>
<%
//정적메서드가 아닌 일반적인 메서드는 객체를 통해 호출해야 하므로
//객체를 생성한 후 EL에서 접근할 수 있도록 영역에 저장한다. 
MyELClass myclass = new MyELClass(); 
pageContext.setAttribute("myClass", myclass);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 일반적인 메서드 호출 -->
	<h3>영역에 저장 후 메서드 호출하기</h3>
	001225-3000000 => ${ myClass.getGender("001225-3000000") } <br />
	001225-2000000 => ${ myClass.getGender("001225-2000000") } <br />
	
	<!-- 정적메서드의 경우 객체생성없이 클래스명으로 직접 호출할 수 있다. -->
	<h3>클래스명을 통해 정적 메서드 호출하기</h3>
	${ MyELClass.showGugudan(7) }

	<h3>JSP 코드를 ㅌㅇ해 메서드 호출하기</h3>
	<%
	out.print(MyELClass.isNumber("백20") ? "숫자임": " 숫자아님");
	out.println ("<br />");
	
	boolean isNumStr = MyELClass.isNumber("120");
	if(isNumStr == true){
		out.print("숫자입니다.");
		
	}else{
		out.print("숫자가 아닙니다.");
		
	}
	%>	
	
	<h3>TLD 파일 등록 후 정적 메서드 호출하기</h3>
	<ul>
		<li>mytag:isNumber("100") => ${ mytag:isNumber("100") }</li>
		<li>mytag:isNumber("이백") => ${ mytag:isNumber("이백") }</li>
	</ul>
</body>
</html>