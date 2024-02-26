<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- 반복문 필요(다중 선택으로 넘어온 결과값을 출력하기 위한 처리 -->
<%
	String result="";
	
	if (ob.getIdeal() != null)
	{
		//방법1
		for (int i=0; i<ob.getIdeal().length; i++)
		{
			result += ob.getIdeal()[i] + " ";
		}
		
		//방법2
		/* for (String temp : ob.getIdeal())
		{
			result += temp + " ";
		} */
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
</head>
<body>

<div>
	<h1>등록 수신결과 확인</h1>
	<hr />
</div>

<!-- <div>
	<h2>이름 : 홍길동</h2>
	<h2>나이 : 21</h2>
	<h2>성별 : 남자</h2>
	<h2>이상형 : 한소희 정해인</h2>
</div> -->

<div>
	<!-- 내용 -->
	<h2>작성된 내용</h2>
	<h3>이름(*) : <%=ob.getUserName() %></h3>
	<h3>나이 : <%=ob.getUserAge() %></h3>
	<h3>성별 : <%=ob.getGender() %></h3>
	<h3>이상형 : <%=result %></h3>
</div>

</body>
</html>