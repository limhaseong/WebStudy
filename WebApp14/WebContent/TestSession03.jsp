<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(TestSession02.jsp)로부터 넘어온 데이터 수신
	// → userId, userPwd
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	//String userId = request.getParameter("userName");
	//String userPwd = request.getParameter("userTel");
	// 이렇게 꺼낼 수 없다.

	String userName = (String)session.getAttribute("userName");
	String userTel = (String)session.getAttribute("userTel");
	
	session.removeAttribute("userName");
	session.removeAttribute("userTel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
</head>
<body>

<div>
	<h2>이름, 전화번호, 아이디, 패스워드 출력</h2>
	<h2>(TestSession03.jsp)</h2>
	<hr>
</div>

<div>
	<h4>이름 : <%=userName %></h4>
	<h4>전화번호 : <%=userTel %></h4>
	<h4>아이디 : <%=userId %></h4>
	<h4>패스워드 : <%=userPwd %></h4>
</div>
</body>
</html>