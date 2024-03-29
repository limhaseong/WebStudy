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
<title>Test6_result.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h2>JSTL 코어(Core) forEach문 실습</h2>
	<h3>자료구조 활용</h3>
	<hr />
</div>

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
		
		<!--
		forEach 문 입력시
		 for (MemberDTO dto : lists)
		 → lists 먼저 쓰고 lists의 자료형은 MemberDTO이므로 자료형 작성 후 변수명 설정
		 → JSTL도 똑같음 items로 얻어올 데이터 적고 변수명 설정
		 --> 
		
		<!-- 컬렉션 객체 접근용(출력용) 반복문 구성 -->
		<!-- 자료구조로 넘어올땐 items 기억 -->
		<c:forEach var="dto" items="${lists }">
		<tr>
			<td style="text-align: center;">${dto.name }</td>
			<td style="text-align: center;">${dto.age }</td>
		</tr>
		</c:forEach>
		
	</table>
</div>

</body>
</html>