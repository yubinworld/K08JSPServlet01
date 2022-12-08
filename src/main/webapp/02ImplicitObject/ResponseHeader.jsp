<%@ page import="java.util.Collection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

/* 
응답 헤더에 추가할 값 준비

get방식으로 전송된 폼 값을 날짜형식을 통해 타임스탬프로 변경한다.
getTime() : 날짜를 1970년부터 지금까지의 흘러간 시간을 초단위로
	반환해서 보여준다.
	
응답헤더에 날짜를 지정하는 경우 대한민국은 세계표준시 +09 즉 9시간이
느리므로 9시간을 더해줘야 정상적인 날짜가 출력된다. 만약 9시 이전의
시간으로 설정되면 어제날짜가 출력된다.
*/
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
long add_date = s.parse(request.getParameter("add_date")).getTime();
System.out.println("add_date="+add_date);

//숫자형식으로 전송된 값은 정수로 변환한다.
int add_int = Integer.parseInt(request.getParameter("add_int"));

/*문자형은 그대로 사용하면 된다. 서버로 전송된 파라미터는 모두
String타입으로만 받을 수 있다.*/
String add_str = request.getParameter("add_str");

/* 
응답 헤더에 값 추가

addDateHeader(헤더명, long타입의 타임스템프) 
	: 응답헤더에 날짜형식을 추가하는 경우 long타입의 타임스템프로
	변환한 후 추가해야한다.
*/
//날짜형식의 응답헤더 추가
response.addDateHeader("myBirthday", add_date);
//정수형식의 응답헤더 추가 (동일한 헤더명으로 2개를 추가함)
response.addIntHeader("myNumber", add_int);
response.addIntHeader("myNumber", 1004); // 추가
//문자열형식의 응답헤더 추가
response.addHeader("myName", add_str);
//기존의 응답헤더를 '안중근'으로 수정한다.
response.setHeader("myName", "안중근"); // 작성

%>
<html>
<head><title>내장 객체 - response</title></head>
<body>
    <h2>응답 헤더 정보 출력하기</h2>
    <%
    //getHeaderNames()을 통해 응답헤더명 전체를 얻어온다.
    Collection<String> headerNames = response.getHeaderNames();
    //확장 for문으로 반복한다.
    for (String hName : headerNames) {
    	//헤더명을 통해 헤더값을 얻어와서 출력한다.
        String hValue = response.getHeader(hName);
    %>
        <li><%= hName %> : <%= hValue %></li>
    <%
    } 
    /* 
    첫번째 출력결과에서 myNumber라는 헤더명이 2번 출력뇌되는데 이때
    동일한 값 8282가 출력된다. 이것은 getHrsfrt() 메서드의 특성으로
    처음 입력한 헤더값만 출력되게된다.
    */
    %>
    
    <h2>myNumber만 출력하기</h2>
    <%
    /* 
    myNumber라는 헤더명으로 2개의 값을 추가했으므로 아래에서는 각각의
    값이 정상적으로 출력된다. 즉 add계열의 메서드는 헤더명을 동일하게
    사용하다라도 헤더값은 정상적으로 추가횐다.
    */
   Collection<String> myNumber = response.getHeaders("myNumber");
   for (String myNum : myNumber) {
   %>
   	  <!-- 8282, 1004 순서대로 출력된다. -->
      <li>myNumber : <%= myNum %></li> 
   <%
   }
   /* 
   이처럼 응답헤더는 개발자가 원하는 값을 추가할 수 있으므로
   프로그램이 여러가지 형태로 응용할 수 있다.
   */
   %>
</body>
</html>