<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
out 태그 
: 영역에 저장된 변수를 출력할 때 사용한다.
escapeXml속성이 true 이면 HTMl 태그가 그대로 출력된다.
innerText()와 동일하다.
 -->
 	<!-- <i>태그가 포함된 문자열로 변수를 생성한다. -->
	<c:set var="iTag"> 
		i 태그는 <i>기울임</i>을 표현합니다.
	</c:set>
	
	<!--escapeXml속성은 true가 디폴트값이므로 HTML이 그대로 출력된다. -->
	<h4>기본 사용</h4>
	<c:out value="${ iTag }"/>

	<!-- false가 되면 HTML태그가 적용되어 출력된다. 즉 innerHTML()과 
	동일하다. -->
	<h4>escapeXml 속성</h4>
	<c:out value="${ iTag }" escapeXml="false"/>
	
	<!-- 최초 실행시에는 파라미터가 없는 상태이므로 default값이 출력된다. -->
	<h4>default 속성</h4>
	<c:out value="${ param.name }" default="이름 없음"/>
	<!-- value 속성이 null일때만 default값이 출력되고, 빈값인 경우에는
	출력되지 않는다.  -->
	<c:out value="" default="빈 문자열도 값입니다."/>
</body>
</html>