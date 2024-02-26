<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//스크립릿 영역
	
	//이전 페이지(Gugudan.jsp)로부터 데이터 수신 → dan
	
	//방법1
/* 	String dandan = request.getParameter("dan");
	
	String sum = "";

	try
	{
		int dancho = Integer.parseInt(dandan);
		
		for(int i=1; i<=9; i++)
		{
			sum += "<br>" + dancho + " * " + i + " = " + (dancho*i);
			
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
		
		getServletContext().log("오류 : " + e.toString());
	} */
	
	//방법2
	String danstr = request.getParameter("dan");
	
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
<title>GugudanOk.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 02</h1>
	<hr>
	<p>Gugudan.jsp → GugudanOk.jsp</p>
</div>
<!-- html 주석문 -->
<%-- jsp 주석문(서블릿 컨테이너 눈에 안보이게 함) --%>

<!-- 방법1 -->
<%-- <div>
	<h2>[<%=dandan %>단]</h2>
	<h2>결과 <%=sum %></h2>
</div> --%>

<!-- 방법2 -->
<%-- <%
	for (int i=1; i<=9; i++)
	{
		out.print(n + " * " + i + " = " + (n*i) + "<br>");
	}
%> --%>


	<%for (int i=1; i<=9; i++)
	{%>
		<%=n %> * <%=i %> = <%=(n*i) %><br>       <!-- 여기 부분은 html -->

	<%}%>
 

</body>
</html>