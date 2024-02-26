<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//① 이전 페이지(Send09_re.jsp 또는 Send09_for.jsp)로부터 넘어온 데이터 수신
	// → userName, message
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	String message = (String)request.getAttribute("message"); //request.getAttribute("message"); 에 retrun 자료형 object
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<div>
	<h2>최종 수신 페이지(Receive09.jsp)</h2>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<p>내용 : <%=message %></p>
</div>

<!-- 포워드일 때 http://localhost:3306/WebApp07/Send09_for.jsp 클라이언트한테 보이는 URL -->

</body>
</html>