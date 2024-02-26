<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 클라이언트가 볼 수 없으므로 꾸밀 필요 없음. 로직에만 집중 가능
	
	//Forward10.jsp
	
	//이전 페이지(Send10.jsp)로부터 넘어온 데이터 수신
	//→ num1, calResult, num2
	
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String calResult = request.getParameter("calResult");
	
	int num1=0;
	int num2=0;
	String result="";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if (calResult.equals("1")) 			//더하기
		{
			result = String.format("%d + %d = %d", num1, num2, (num1+num2));
		}
		else if (calResult.equals("2"))		//빼기
		{
			result = String.format("%d - %d = %d", num1, num2, (num1-num2));
		}
		else if (calResult.equals("3"))		//곱하기
		{
			result = String.format("%d * %d = %d", num1, num2, (num1*num2));
		}
		else if (calResult.equals("4"))		//나누기
		{
			result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));
		}
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	// 요청에 내용 추가
	request.setAttribute("resultStr", result);
	//setAttribute로 적재한 것은 getAttribute으로 꺼낸다.
	//Receive10.jsp 참고
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward10.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<!-- JSP 액션 태그를 활용한 forward 처리 -->
<jsp:forward page="Receive10.jsp"></jsp:forward>

</body>
</html>