<%@ page contentType="text/html; charset=UTF-8"%>
<!-- buffer = 임시로 활용할 수 있는 기억공간
	 autoFlush = buffer가 채워지면 갱신하게 하는 거 -->
	 
<%-- <%@ page buffer="8kb" autoFlush="true" %> 기본값 --%>
<%-- <%@ page buffer="1kb" autoFlush="false" %> buffer 오버플로우 됨 → 에러 발생 --%>
<%-- <%@ page buffer="1kb" autoFlush="true" %> 채워지면 갱신하고 채워지고 갱신하고 반복함 → 정상처리 --%>
<%-- <%@ page buffer="10kb" autoFlush="false" %> 정상 처리 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
</head>
<body>

<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
	<hr>
</div>

<div>
	<h2>반복문 구성</h2>
	
	<%
	for (int i=1; i<=1000; i++)
	{
	%>1234<%
	}
	%>
	
</div>

</body>
</html>