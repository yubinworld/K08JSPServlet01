<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>연습</title>
</head>
<body>
	<table border="1">
		<c:forEach begin=2; end="9" var="dan">
			<tr>
			<c:forEach begin=1; end="9" var="su">
				<td>
					${dan} * ${su} =${dan * su}
				</td>
			</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>