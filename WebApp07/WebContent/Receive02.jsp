<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//스크립릿 영역
	
	//이전 페이지(Send02.html)로부터 넘어온 데이터 수신
	// → name, kor, eng, mat
	
	request.setCharacterEncoding("UTF-8");

	String namestr = request.getParameter("name");
	String korstr = request.getParameter("kor");
	String engstr = request.getParameter("eng");
	String matstr = request.getParameter("mat");
	
	int n1 = 0;
	int n2 = 0;
	int n3 = 0;
	int sum = 0;
	double avg = 0;
	
	String res = "";
	
	try
	{
		n1 = Integer.parseInt(korstr);
		n2 = Integer.parseInt(engstr);
		n3 = Integer.parseInt(matstr);
		
		sum = n1 + n2 + n3;
		avg = (double)sum/3;
		
		res = String.format("%.1f",avg);
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
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {color: blue; font-weight: bold; font-size: 15pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>

<div>
	<h2>점수 확인</h2>
	<span><%=namestr %></span>님 성적 처리가 완료되었습니다.<br>
	회원님의 점수는 국어:<span><%=n1 %></span>점, 영어:<span><%=n2 %></span>점, 수학:<span><%=n3 %></span>점 입니다.<br>
	총점은 <span><%=sum %></span>점, 평균은 <span><%=res %><!-- String.format("%.1f",avg)을 바로 넣어도 가능 --></span>점 입니다.<br>
</div>

</body>
</html>