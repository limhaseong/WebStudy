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
	<form action="MemberInsert1_1.jsp" method="post">
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
</div>

</body>
</html>