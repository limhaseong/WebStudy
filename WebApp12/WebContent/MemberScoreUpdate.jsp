<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberScoreUpdate.jsp
	
	// 이전 페이지(MemberScoreUpdateForm.jsp)로부터 넘어온 데이터 수신
	// → sid, kor, eng, mat
	
	request.setCharacterEncoding("UTF-8");
	
	String sid = request.getParameter("sid");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	//MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		MemberScoreDTO score = new MemberScoreDTO();
		
		score.setSid(sid);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		
		dao.modify(score);
		
		//위 메소드 호출 결과 반환값을 활용한 분기 처리 가능~!!!
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 클라이언트에 MemberScoreSelect.jsp 페이지를 다시 요청할 수 있도록 안내~!!!
	response.sendRedirect("MemberScoreSelect.jsp");
%>