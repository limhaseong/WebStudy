<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(TestSession01.jsp)로부터 넘어온 데이터 수신
	// → userName, userTel
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	// check~!!!
	// 추가~!!!	
	session.setAttribute("userName", userName);
	session.setAttribute("userTel", userTel);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<script type="text/javascript">

	function sendIt()
	{
		//확인
		//alert("함수 호출~!!!");
		
		var f = document.myForm;
		
		if (!f.userId.value)
		{
			alert("아이디를 입력해야 합니다~!!!");
			f.userId.focus();
			return;
		}
		
		if (!f.userPwd.value)
		{
			alert("패스워드를 입력해야 합니다~!!!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
	}

</script>

</head>
<body>

<div>
	<h1>아이디와 패스워드(TestSession02.jsp)</h1>
	<hr>
</div>

<div>
	<table>
		<tr>
			<td>
				<form action="TestSession03.jsp" method="post" name="myForm">
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="userId" class="txt">
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<input type="text" name="userPwd" class="txt">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn" style="width: 100%;" onclick="sendIt()">로그인</button>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</div>

</body>
</html>