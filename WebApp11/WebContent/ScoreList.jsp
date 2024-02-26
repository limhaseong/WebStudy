<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	String memberCount = "<span id='memberCount'>전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		memberCount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th id='numTitle'>번호</th>");
		str.append("<th id='nameTitle'>이름</th>");
		str.append("<th id='kor'>국어점수</th>");
		str.append("<th id='eng'>영어점수</th>");
		str.append("<th id='mat'>수학점수</th>");
		str.append("<th id='tot'>총점</th>");
		str.append("<th id='avg'>평균</th>");
		str.append("</tr>");
		
		for (ScoreDTO dto : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='contentTd'>" + dto.getSid() + "</td>");
			str.append("<td class='contentTd'>" + dto.getName() + "</td>");
			str.append("<td class='contentTd'>" + dto.getKor() + "</td>");
			str.append("<td class='contentTd'>" + dto.getEng() + "</td>");
			str.append("<td class='contentTd'>" + dto.getMat() + "</td>");
			str.append("<td class='contentTd'>" + dto.getTot() + "</td>");
			str.append(String.format("<td class='contentTd'>%.1f</td>", dto.getAvg()));
			str.append("</tr>");
		}
		
		str.append("</table>");
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	finally
	{
		try
		{
			//데이터베이스 연결 종료
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
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

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameErr">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txt">
					<span class="errMsg" id="korErr">0 ~ 100까지 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txt">
					<span class="errMsg" id="engErr">0 ~ 100까지 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txt">
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
<br><br>

<div>
	<%=memberCount %>

	<%=str.toString() %>
</div>

</body>
</html>