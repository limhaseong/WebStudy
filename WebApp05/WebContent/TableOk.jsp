<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//스크립릿 영역
	
	//이전 페이지(Table.jsp)로부터 전송된 데이터 수신
	// → su1, su2
	
	String str1 = request.getParameter("su1");
	String str2 = request.getParameter("su2");
	
	int n1 = 0;
	int n2 = 0;
	
	//테이블 안에서 1씩 증가시켜 나갈 변수 선언 및 초기화
	int n=0;
	
	try
	{
		n1 = Integer.parseInt(str1);
		n2 = Integer.parseInt(str2);
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
<title>TableOk.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 05</h1>
	<hr>
	<p>Table.jsp → TableOk.jsp
</div>

<div>
	<table border="1">
		<%
		for (int i=0; i<n2; i++)
		{
		%>
			<tr>
				<%
				for (int j=0; j<n1; j++)
				{
				%>
					<td style="width: 40px; text-align: center;"><%=++n %></td>
				<%
				}
				%>
			</tr>
		<%
		}
		%>
	</table>
</div>


</body>
</html>