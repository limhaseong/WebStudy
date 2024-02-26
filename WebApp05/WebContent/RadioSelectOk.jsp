<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//스크립릿 영역
	
	//이전 페이지(RadioSelect.jsp)로부터 데이터 수신
	//→ name, gender, major, hobby
	
	//한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8"); 		//check~!!!
	
	String vName = request.getParameter("name");				// 텍스트박스... 단일값 수신
	String vGender = request.getParameter("gender");			// 라디오버튼... 단일값 수신
	String vMajor = request.getParameter("major");				// 선택상자...   단일값 수신
	//String[] vHobby = request.getParameter("hobby");			// 선택상자...   다중 데이터 수신
	String[] vHobby = request.getParameterValues("hobby");		// 선택상자...   다중 데이터 수신
	//-- 다중 선택이 가능한 선택상자일 경우...
	//   『getParameterValues()』로 데이터 수신
	//   → 배열 반환
	
	// name 수신 및 처리 → 특이사항 없음~!!
	
	// gender 수신 및 처리
	String gender = "";
	if(vGender.equals("M"))
		gender = "남자";
	else if (vGender.equals("W"))
		gender = "여자";
	else
		gender = "확인불가";
	
	// major 수신 및 처리 → 특이사항 없음~!!
	
	//hobby 수신 및 처리
	String hob = "";
	
	if(vHobby != null)
	{
		for(String item : vHobby)
		hob += "[" + item + "] ";
	}
	
	/* for (int i=0; i<vHobby.length; i++)
	{
		hob += vHobby[i] + "<br>";
	} */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelectOk.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 03</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelectOk.jsp</p>
</div>

<div>
	<p>이름 : <%=vName %></p>
	<p>성별 : <%=gender %></p>
	<p>전공 : <%=vMajor %></p>
	<p>취미 : <%=hob %></p>
</div>
</body>
</html>