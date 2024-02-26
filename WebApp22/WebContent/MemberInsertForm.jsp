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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: center;}
</style>
</head>
<body>

<div>
	<h2>JSTL 코어(Core)를 활용한 회원 정보 입력</h2>
	<hr />
</div>

<div>
	<form action="MemberInsert.jsp" method="post">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
				<c:set var="i" value="1"></c:set>
				<c:forEach var="a" begin="1" end="5" step="1">
					<input type="text" name="name${i }">
					<c:set var="i" value="${i+1 }"></c:set>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
				<c:set var="i" value="1"></c:set>
				<c:forEach var="a" begin="1" end="5" step="1">
					<input type="text" name="tel${i }">
					<c:set var="i" value="${i+1 }"></c:set>
				</c:forEach>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
				<c:set var="i" value="1"></c:set>
				<c:forEach var="a" begin="1" end="5" step="1">
					<input type="text" name="addr${i }">
					<c:set var="i" value="${i+1 }"></c:set>
				</c:forEach>
				</td>
			</tr>
		</table>
	
	
		<%-- <c:forEach var="member" begin="1" end="5" step="1">
			이　　름 : <input type="text" class="txt" name="name"><br>
			전화번호 : <input type="text" class="txt" name="tel"><br>
			주　　소 : <input type="text" class="txt" name="addr"><br><br>
		</c:forEach>  --%>
		
		<button type="submit" class="btn" style="width: 200px; font-size: 16pt;">입력</button>
	</form>
	
</div>







<!-- <div>
	<form action="MemberInsert.jsp" method="post">
		(이름, 전화번호, 주소) * 5명 분
		→ submit 액션 처리
		<table class="table">
			<tr>
				<th>이름1</th>
				<td><input type="text" name="name" class="txt"></td>
			</tr>
			<tr>
				<th>전화번호1</th>
				<td><input type="text" name="tel" class="txt"><br></td>
			</tr>
			<tr>
				<th>주소1</th>
				<td><input type="text" name="addr" class="txt"><br></td>
			</tr>
			<tr>
				<th>이름2</th>
				<td><input type="text" name="name" class="txt"></td>
			</tr>
			<tr>
				<th>전화번호2</th>
				<td><input type="text" name="tel" class="txt"><br></td>
			</tr>
			<tr>
				<th>주소2</th>
				<td><input type="text" name="addr" class="txt"><br></td>
			</tr>
			<tr>
				<th>이름3</th>
				<td><input type="text" name="name" class="txt"></td>
			</tr>
			<tr>
				<th>전화번호3</th>
				<td><input type="text" name="tel" class="txt"><br></td>
			</tr>
			<tr>
				<th>주소3</th>
				<td><input type="text" name="addr" class="txt"><br></td>
			</tr>
			<tr>
				<th>이름4</th>
				<td><input type="text" name="name" class="txt"></td>
			</tr>
			<tr>
				<th>전화번호4</th>
				<td><input type="text" name="tel" class="txt"><br></td>
			</tr>
			<tr>
				<th>주소4</th>
				<td><input type="text" name="addr" class="txt"><br></td>
			</tr>
			<tr>
				<th>이름5</th>
				<td><input type="text" name="name" class="txt"></td>
			</tr>
			<tr>
				<th>전화번호5</th>
				<td><input type="text" name="tel" class="txt"><br></td>
			</tr>
			<tr>
				<th>주소5</th>
				<td><input type="text" name="addr" class="txt"><br></td>
			</tr>
		</table>
		<button type="submit" class="btn">결과 확인</button>
	</form>
</div> -->

</body>
</html>