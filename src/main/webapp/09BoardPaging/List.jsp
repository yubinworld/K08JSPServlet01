<%@page import="utils.BoardPage"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//DB연결 및 CRUD작업을 위한 DAO객체를 생성한다.
BoardDAO dao = new BoardDAO(application);

/*
검색어가 있는 경우 클라이언트가 선택한 필드명과 검색어를 저장할
Map컬렉션을 생성한다. 
*/ 
Map<String, Object> param = new HashMap<String, Object>();
/* 검색폼에서 입력한 검색어와 필드명을 파라미터로 받아온다.
해당 <form>의 전송방식은 get, action속성은 없는 상태이므로 현재
페이지로 폼값이 전송된다. */
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
//사용자강 입력한 검색어가 있다면..
if (searchWord != null) {
	/* Map컬렉션에 컬럼명과 검색어를 추가한다. */
	param.put("searchField", searchField);
	param.put("searchWord",searchWord);
}
//Map컬렉션을 인수로 게시물의 갯수를 카운트한다.
int totalCount = dao.selectCount(param);

/************* 페이징 코드 추가부분 s ************/
//web.xml 에 설정한 컨텍스트 초기화 파라미터를 읽어와서 산술연산을 위해 
//정수(int)로 변환한다.
int pageSize = 
	Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = 
	Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

/*
전체 페이지수를 계산한다
(전체 게시물갯수 / 페이지당출력할게시물갯수) => 결과값의 올림처리
가령 게시물의 갯수가 51개라면 나눴을때의껼곽가 5.1이뙨다. 이때무조건
올림처리하여 6페이지가 나오게 된다.
만약 totalCount를 double 로 형변환 하지 않으면 정수의껼과가 나오게 되므로
6페이지가 아니라 5페이지라는 결과가 나오게 되므로 주의해야한다.
*/
int totalPage = 
	(int)Math.ceil((double)totalCount / pageSize);

/*
목록에 처음 진입했을때는 페이지 관련 파라미터가 없는 상태이므로 무조건
1page로 지정한다. 만약 파라미터 pageNum이있다면 request 내장 객체를 통해
받아온 후 페이지번호로 지정한다.
List.jsp => 이와같이 파라미터가 없는 상태일때는 null
List.jsp?pageNum => 이와같이 파라미터는 있는데 값이 없을때는 빈값으로 
	체크된다. 따라서 아래if문은 2개의 조건으로 구성해야한다.
*/
int pageNum =1;
String pageTemp =request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals(""))
	pageNum =Integer.parseInt(pageTemp);
/*
게시물의 구간을 계산한다.
각 페이지의시작번호와 종료번호를 현재페이지번호와페이지사이즈를 통해
계산한 후 DAO로 전달하기 위해 Map컬렉션에 추가한다. 
*/
int start = (pageNum -1) * pageSize + 1;
int end = pageNum * pageSize;
param.put("start", start);
param.put("end", end);


/************* 페이징 코드 추가부분 e **************/



//목록에 출력한 게시물을 추출하여 반환받는다. 
List<BoardDTO> boardLists = dao.selectListPage(param);
//자원해제
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<!-- 공통링크 -->
    <jsp:include page="../Common/Link.jsp" />
      
	<!-- 앞에서 계산해둔 전체페이지수와 파라미터를 통해얻어온 현재 
	페이지 번호를 출력한다. -->
    <h2>목록 보기(List) - 현재 페이지 : <%=pageNum %> (전체 : <%= totalPage %>)</h2>
    <!-- 검색폼 -->
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
        <!-- 목록의 내용-->
<%
//컬렉션에 입력된 데이터가 없는지 확인한다.
if (boardLists.isEmpty()) {
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
	//게시물이 있을 때
    int virtualNum = 0;
	//페이지가 적용된 가상번호를 계산하기 위해 생성한 변수 
	int countNum = 0;
	
    for (BoardDTO dto : boardLists)
    {
    	//virtualNumber = totalCount--; //전체 게시물 수에서 시작해 1씩 감소
    	//전체게시물 수 - (((현재페이지 -1) * 한 페이지출력갯수)+countNum 증가치)
        virtualNum = totalCount -(((pageNum - 1) * pageSize) + countNum++);
%>
        <tr align="center">
            <td><%= virtualNum %></td> <!-- 게시물의 가상번호 -->
            <td align="left"> <!-- 제목(+하이퍼 링크) -->
                <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
            </td>
            <!-- 작성자 아이디 -->
            <td align="center"><%= dto.getId() %></td>           
            <!-- 조회수 -->
            <td align="center"><%= dto.getVisitcount() %></td>   
            <!-- 작성일 -->
            <td align="center"><%= dto.getPostdate() %></td>    
        </tr>
<%
    }
}
%>
    </table>
   
    <table border="1" width="90%">
        <tr align="center">
        	<!-- 페이징 처리 -->
        	<td>
        		<!-- 
        		totalCount : 전체 게시물의 갯수 
        		pageSize : 한 페이지의 출력할 게시물의 갯수
        		blockPage : 한블럭당 출력할 페이지번호의 갯수
        		pageNum : 현재 페이지 번호
        		request.getRequestURI()): request 내장 객체를 통해 현재페이지의
        			HOST를 제외한 나머지 경로명을 얻어올 수 있다. 여기서 얻은
        			경로명을 통해 "경로명.jsp?pageNum=페이지번호"와 같은
        			바로가기 링크를 생성한다.
        		 -->
        		 <% System.out.println("현재경로="+ request.getRequestURI()); %>
        		<%= BoardPage.pagingStr(totalCount, pageSize,
        				blockPage, pageNum, request.getRequestURI()) %>
        	</td>
        	<!-- 글쓰기 버튼 -->
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
    
</body>

</html>