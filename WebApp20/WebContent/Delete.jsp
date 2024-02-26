<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 이전 페이지(Article.jsp)로부터 넘어온 데이터 수신
	// → num, pageNum
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	BoardDTO dto = dao.getReadData(num);
	
	DBConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function sendIt()
	{
		//alert("확인");
		
		f = document.myForm;
		
		str = f.pwd.value;
		
		if (str == <%=dto.getPwd() %> )
		{
			alert("삭제가 완료되었습니다.");
			
			f.action = "<%=cp %>/Delete_ok.jsp";
		}
		else
		{
			alert("비밀번호가 일치하지 않습니다.");
		}
		f.submit();
	}

</script>

</head>
<body>

<div>
	<form action="" method="post" name=myForm>
		<input type="hidden" name="num" value="<%=dto.getNum() %>">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<input type="password" name="pwd" size="35" maxlength="10" class="boxTF">
		<input type="button" value="삭제" class="btn2" onclick="sendIt()">
		<input type="button" value="삭제취소" class="btn2" onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum %>'">
	</form>
</div>

</body>
</html>