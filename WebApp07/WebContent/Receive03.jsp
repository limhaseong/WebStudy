<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//스크립릿 영역
	
	//이전페이지(Send03.html)로부터 넘어온 데이터 수신
	//→ su1, su2, cho
	
	request.setCharacterEncoding("UTF-8");

	String sus1 = request.getParameter("su1");
	String sus2 = request.getParameter("su2");
	String choi = request.getParameter("cho");
	
	int n1 = 0;
	int n2 = 0;
	
	String tot = "";
	
	
	try
	{
		n1 = Integer.parseInt(sus1);
		n2 = Integer.parseInt(sus2);
		
		if (choi.equals("+"))
		{
			tot = String.valueOf(n1 + n2);
		}
		else if (choi.equals("-"))
		{
			tot = String.valueOf(n1 - n2);
		}
		else if (choi.equals("*"))
		{
			tot = String.valueOf(n1 * n2);
		}
		else if (choi.equals("/"))
		{
			//tot = String.valueOf(n1 / (double)n2); 가 아닌
			tot = String.format("%.1f", n1/(double)n2);
		}
		else
		{
			tot = "확인불가";
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	span {color: blue; font-weight: bold; font-size: 15pt;}
	#tot {color: red;}
</style>

</head>
<body>

<div>
	입력하신 <span><%=n1 %></span>와(과) <span><%=n2 %></span>의 연산 결과는 <span><%=tot %></span> 입니다.
</div>

</body>
</html>