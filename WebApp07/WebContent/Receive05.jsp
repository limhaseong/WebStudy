<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//스크립릿 영역
	
	//이전 페이지(Gugudan.jsp)로부터 데이터 수신
	
	String danstr = request.getParameter("gugudan");
	
	int n=0;
	

	try
	{
		n = Integer.parseInt(danstr);
		
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
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<%for (int i=1; i<=9; i++)
	{%>
		<%=n %> * <%=i %> = <%=(n*i) %><br>

	<%}%>
</div>
</body>
</html>