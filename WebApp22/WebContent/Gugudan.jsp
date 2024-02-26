<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core)를 활용한 구구단 출력</h1>
	<hr />
</div>

<div>
	<form>
		원하는 단 입력
		<input type="text" name="dan" class="txt">
		<br><br>
		
		<button type="submit" class="btn">결과 확인</button>
	</form>
</div>
<br>

<div>
	<!-- 결과처리 -->
	<%-- ${param.dan } --%>
	
	<c:if test="${!empty param.dan }">
		<ul>
			<c:forEach var="su" begin="1" end="9" step="1">
			<li>
				${param.dan } * ${su } = ${param.dan * su }
			</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<!-- 방법2 -->
	<%-- <c:if test="${!empty param.dan }">
		<c:set var="result" value="1"></c:set>
		
		<c:forEach var="i" begin="1" end="9" step="1">
			<c:set var="result" value="${param.dan * i }"></c:set>
			<p>${param.dan } * ${i } = ${result }</p>
		</c:forEach>
	</c:if> --%>
</div>

</body>
</html>