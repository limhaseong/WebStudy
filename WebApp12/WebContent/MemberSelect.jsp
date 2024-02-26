<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("	<tr>");
		str.append("		<th style='width: 50px;'>번호</th>");
		str.append("		<th style='width: 100px;'>이름</th>");
		str.append("		<th style='width: 150px;'>전화번호</th>");
		str.append("		<th style='width: 200px;'>관리</th>");
		str.append("	</tr>");
		
		
		for (MemberDTO member : dao.lists())
		{
			str.append("<tr>");
			str.append("	<td>" + member.getSid() + "</td>");
			str.append("	<td>" + member.getName() + "</td>");
			str.append("	<td>" + member.getTel() + "</td>");
			str.append("	<td>");
			str.append("		<a href='MemberUpdateForm.jsp?sid=" + member.getSid() + "'>");
			str.append("		<button type='button' class='btn01'>수정</button>");
			str.append("		</a>");
			
			str.append("		<a href='javascript:memberDelete(" + member.getSid() + ", \"" + member.getName() + "\")'>");
			str.append("		<button type='button' class='btn01'>삭제</button>");
			str.append("		</a>");
			
			// memberDelete(1, '노은하')
			
			// ※ 자바스크립트에서 사용할 수 있는 따옴표의 종류
			//    ① "" ② '' ③ \"\"
			//    일반적으로 따옴표가 두 번 중첨되어 사용하게 되면
			//    ①과 ②를 사용하면 된다.
			//    하지만, 따옴표가 세 번 중첩되어 사용될 경우
			//    ③ escape 를 사용해야 한다.
			
			//<a href='javascript:memberDelete(" + member.getSid() + ", \"" + member.getName() + "\")'>");
			//"_______'________________________" + member.getSid() + "___\" + member.getName() + "\"_'_" 
			
			//1		   2		  3			   3	    2		   1
			//"________'__________\"___________\"_______'__________" 
			 
			//"____________'_________\"" + ① + "\"_________________'_________"
			
			
			str.append("	</td>");
			str.append("</tr>");
		}
		
		str.append("</table>");
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<style type="text/css">
	a {text-decoration: none;}
</style>

<script type="text/javascript">

	function memberDelete(sid, name)
	{
		// 확인
		//alert("함수 호출~!!!");
		// 확인
		//alert("번호 : " + sid);
		// 확인
		//alert("번호 : " + sid + ", 이름 : " + name);
		
		var res = confirm("번호:" + sid + ", 이름:" + name + "\n이 회원의 정보를 정말 삭제하시겠습니까?");
		
		// 확인
		//alert(res);
		//-- confirm() 함수를 통해 호출되는 창은
		//   사용자의 의사표현 결과에 따라
		//   true(확인) 또는 false(취소)를 반환하게 된다.
		
		if (res) //res==true와 같음
		{
			window.location.href="MemberDelete.jsp?sid=" + sid;
			// 창에서 "MemberDelete.jsp"을 요청하는 구문
			// get 방식
		}
	}

</script>

</head>
<body>

<div>
	<h1>회원 <span style="color: red;">명단</span> 관리 및 출력 페이지</h1>
	<hr>
</div>

<div>
	<a href="MemberScoreSelect.jsp"><button type="button">회원 성적 관리</button></a>
	<a href="MemberInsertForm.jsp"><button type="button">신규 회원 관리</button></a>
</div>
<br>

<div>
	<!-- 리스트 출력 -->
	<!-- <table class="table">
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 100px;">이름</th>
			<th style="width: 150px;">전화번호</th>
			<th style="width: 200px;">관리</th>
		</tr>
		<tr>
			<td>1</td>
			<td>희동이</td>
			<td>010-1111-1111</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>도우너</td>
			<td>010-2222-2222</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>마이콜</td>
			<td>010-3333-3333</td>
			<td>
				<a><button type="button" class="btn01">수정</button></a>
				<a><button type="button" class="btn01">삭제</button></a>
			</td>
		</tr>
	</table> 
	-->
	<%=str.toString() %>
</div>

</body>
</html>