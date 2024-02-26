<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//결과값 변수
	String str="";
	double avg;
	
	//데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	//쿼리문 준비(select)
	String sql="SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID";
	
	//작업 객체 생성 및 쿼리문 실행
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	//결과 ResultSet 에 대한 처리 → 반복문 구성
	str += "<table class='table'>";
	str += "<tr>";
	str += "<th id='numTitle'>번호</th>";
	str += "<th id='nameTitle'>이름</th>";
	str += "<th id='kor'>국어점수</th>";
	str += "<th id='eng'>영어점수</th>";
	str += "<th id='mat'>수학점수</th>";
	str += "<th id='tot'>총점</th>";
	str += "<th id='avg'>평균</th>";
	str += "</tr>";
	
	while (rs.next())
	{
		str += "<tr>";
		str += "<td class='contentTd'>" + rs.getString("SID") + "</td>";
		str += "<td class='contentTd'>" + rs.getString("NAME") + "</td>";
		str += "<td class='contentTd'>" + rs.getString("KOR") + "</td>";
		str += "<td class='contentTd'>" + rs.getString("ENG") + "</td>";
		str += "<td class='contentTd'>" + rs.getString("MAT") + "</td>";
		str += "<td class='contentTd'>" + rs.getString("TOT") + "</td>";
		//str += "<td>" + rs.getString("AVG") + "</td>";
		avg = Double.parseDouble(rs.getString("AVG"));
		str += String.format("<td class='contentTd'>%.1f</td>", avg);
		str += "</tr>";
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	input {width: 200px;}
	button {width: 208px; height: 50px; font-weight: bold;}
	.errMsg {font-size: small; color: red; display: none;}
	.contentTd {text-align: center;}
</style>

<script type="text/javascript">

	function formCheck()
	{
		//alert("함수 호출~!!!");
		var userName = document.getElementById("userName");
		var uKor = document.getElementById("kor");
		var uEng = document.getElementById("eng");
		var uMat = document.getElementById("mat");
		
		var nameErr = document.getElementById("nameErr");
		var korErr = document.getElementById("korErr");
		var engErr = document.getElementById("engErr");
		var matErr = document.getElementById("matErr");
		
		nameErr.style.display = "none";
		korErr.style.display = "none";
		engErr.style.display = "none";
		matErr.style.display = "none";
		
		if (userName.value == "")
		{
			nameErr.style.display = "inline";
			return false;
		}
		
		if (uKor.value < 0 || uKor.value > 100 || uKor.value == "")
		{
			korErr.style.display = "inline";
			return false;
		}
		
		if (uEng.value < 0 || uEng.value > 100 || uEng.value == "")
		{
			engErr.style.display = "inline";
			return false;
		}
		
		if (uMat.value < 0 || uMat.value > 100 || uMat.value == "")
		{
			matErr.style.display = "inline";
			return false;
		}
		
		return true;
	}

</script>

</head>
<body>

<!-- 
	○ WebApp09
	
	   - 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	     총점과 평균을 계산하여 리스트를 출력해줄 수 있는 프로그램을 구현한다.
	   - 리스트 출력 시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
	   - 데이터베이스 연동하여 처리한다.
	     (TBL_SCORE, SCORESEQ 활용)
	   - 즉, 성적 처리 프로그램을 데이터베이스 연동하여
	     JSP 로 구성할 수 있도록 한다.
	     
	   
	   ---------------------------------------------------------------------
	   성적 처리
	   
	   이름(*)	[ textbox ] → 이름 입력 확인
	   국어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	   영어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	   수학점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	   
	   < 성적 추가 >  		→ button
	   
	   번호		이름		국어점수  영어점수  수학점수		총점		평균
	    1	   임하성	   90		80		  70		xxx		xx.x
	    2      이윤수 	   80		70		  60		xxx		xx.x
	    
	    ---------------------------------------------------------------------
	    
	○ WebApp09_scott.sql
	   ScoreList.jsp
	   ScoreInsert.jsp
	   com.util.DBConn.java
 -->

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="textbox" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameErr">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="textbox" id="kor" name="kor" class="txt">
					<span class="errMsg" id="korErr">0 ~ 100까지 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="textbox" id="eng" name="eng" class="txt">
					<span class="errMsg" id="engErr">0 ~ 100까지 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="textbox" id="mat" name="mat" class="txt">
					<span class="errMsg" id="matErr">0 ~ 100까지 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button type="submit" id="btnAdd" class="btn control">성적 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>

<div>
	<!-- 성적 처리 결과 -->
	<%=str %>
</div>

</body>
</html>