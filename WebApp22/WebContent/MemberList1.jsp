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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) 문제 해결</h1>
	<h2>회원 명단 출력</h2>
	<hr />
</div>

<div>
	<!-- 5명의 이름, 전화번호, 주소 출력 -->

		<c:forEach var="i" items="${member }">
			${i.key+1 }번 회원 : ${i.value }<br>
		</c:forEach>

</div>

</body>
</html>