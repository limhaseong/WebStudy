<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 정규표현식 공부하기
replace, replaceAll, ... -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBox.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 04</h1>
	<hr>
	<p>CheckBox.jsp → CheckBoxOk.jsp
</div>

<div>
	<form action="CheckBoxOk.jsp" method="post">
		이름 <input type="text" name="name" class="txt">
		<br><br>
		
		메모<br>
		<textarea rows="5" cols="30" name="memo"></textarea>
		<br><br>
		
		이상형<br>
		<label><input type="checkbox" name="actor" value="조휴일">조휴일</label>
		<label><input type="checkbox" name="actor" value="유재석">유재석</label>
		<label><input type="checkbox" name="actor" value="류진">류진</label>
		<label><input type="checkbox" name="actor" value="윈터">윈터</label>
		<label><input type="checkbox" name="actor" value="정우성">정우성</label>
		<br>
		
		<label><input type="checkbox" name="actor" value="차은우">차은우</label>
		<label><input type="checkbox" name="actor" value="카리나">카리나</label>
		<label><input type="checkbox" name="actor" value="서강준">서강준</label>
		<label><input type="checkbox" name="actor" value="박은빈">박은빈</label>
		<label><input type="checkbox" name="actor" value="고윤정">고윤정</label>
		
		<br><br>
		
		<input type="submit" value="전송하기" class="btn control" style="width: 200px;">
	</form>
</div>

</body>
</html>