<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String idstr = request.getParameter("userId");
	String pwdstr = request.getParameter("password");
	String namestr = request.getParameter("userName");
	String telstr = request.getParameter("userTel");
	
	String genstr = request.getParameter("gender");
	
	String gender = "";
	if(genstr.equals("M"))
		gender = "남자";
	else if (genstr.equals("F"))
		gender = "여자";
	else
		gender = "확인불가";
	
	String citystr = request.getParameter("city");
	String[] substr = request.getParameterValues("sub");
	
	String subject = "";
	
	if(substr != null)
	{
		for(String item : substr)
		subject += "[" + item + "] ";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<%=idstr %><br>
	<%=pwdstr %><br>
	<%=namestr %><br>
	<%=telstr %><br>
	<%=gender %><br>
	<%=citystr %><br>
	<%=subject %><br>
</div>

</body>
</html>