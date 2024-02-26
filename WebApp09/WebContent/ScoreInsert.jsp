<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	String uName = request.getParameter("userName");
	String uKor = request.getParameter("kor");
	String uEng = request.getParameter("eng");
	String uMat = request.getParameter("mat");
	
	//쿼리문 준비(insert)
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %s, %s, %s)", uName, uKor, uEng, uMat);
	
	//DB 액션 처리 → 작업 객체 생성 및 쿼리문 수행
	Statement stmt = conn.createStatement();
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if (result < 1)
	{
		// 입력 액션 처리가 정상적으로 이루어지지 않은 경우(입력이 안됐을 때)
		response.sendRedirect("Error.jsp");
		//-- 내가 잘 아는 에러 페이지를 소개시켜줄께...
	}
	else
	{
		// 입력 액션 처리가 정상적으로 이루어진 경우
		response.sendRedirect("ScoreList.jsp");
		//-- 이 페이지로 오기 전에 네가 머물던 리스트 페이지 주소를
		//   새롭게 다시 요청해서 찾아가봐~!!!
		//   네가 입력하려는 내용이 추가된 상태로 리스트의 내용이 바뀌어 있을꺼야...
	}
%>