<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//스크립릿 영역
	
	//이전 페이지(Gugudan.jsp)로부터 데이터 수신 → dan
	
	String danStr = request.getParameter("dan");
	
	int dan=0;
	
	String result = "";

	try
	{
		dan = Integer.parseInt(danStr);
		
		for (int i=1; i<=9; i++)
		{
			result += String.format("%d * %d = %d<br>", dan, i, dan*i);
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
		
		getServletContext().log("오류 : " + e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2>구구단 출력</h2>
	
	<div>
		<!-- 결과물 -->
		<%=result %>
	</div>
</div>
</body>
</html>