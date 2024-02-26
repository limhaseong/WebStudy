<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//스크립릿 영역
	
	//이전 페이지(CheckBox.jsp)로부터 데이터 수신
	// → name, memo, actor
	
	//한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
	
	//이름 데이터 수신
	String namestr = request.getParameter("name");
	
	//메모 데이터 수신		check~!! (textarea에서의 개행 \n)
	String memo = request.getParameter("memo");
	//memo = memo.replace("\n","<br>");
	memo = memo.replaceAll("\n","<br>");
	//-- JDK 1.5 이후부터 『replaceAll()』메소드 사용 가능
	//   『replaceAll()』을 통해 처리한 결과를 다시 memo 변수에 대입
	//   "안녕하세요\n반값습니다\n이윤수입니다." 
	//   → "안녕하세요<br>반값습니다<br>이윤수입니다."
	
	//이상형 데이터 수신
	//String actorarr = request.getParameter("actor"); --> (X)
	
	//※ 같은 name 속성의 값을 가진 데이터 여러 개를 받는 경우
	//   (즉, 다중 데이터로 수신하는 경우)
	//   이를 배열로 처리해야 한다. → 『getParameterValues()』
	
	String[] actorarr = request.getParameterValues("actor");
	
	//※ 배열 데이터를 수신하여 처리할 경우...
	//   수신된 데이터가 전혀 없는 경우는
	//   배열의 값 자체가 null 이 되어버리기 때문에
	//   null 에 대한 확인(검사) 과정이 필요하다. check~!!!
	
	String act = "";
	
	if(actorarr != null)
	{
		for(String item : actorarr)
		act += "[" + item + "] ";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBoxOk.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 04</h1>
	<hr>
	<p>CheckBox.jsp → CheckBoxOk.jsp
</div>

<div>
	<p>이름 : <%=namestr %></p>
	<p>메모 : <%=memo %></p>
	<p>이상형 : <%=act %></p>
</div>

</body>
</html>