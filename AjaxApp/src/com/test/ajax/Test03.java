/*========================
       Test02.java
========================*/

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//HttpServlet은 추상클래스 이지만 추상메소드는 없다.
public class Test03 extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	//사용자의 요청(form의 method)의 따라 서블릿컨테이너에서 토스해줌
	
	//사용자의 http 프로토콜 요청이 GET 방식일 겨우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	//사용자의 http 프로토콜 요청이 POST 방식일 겨우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	//사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//GET 방식이든 POST 방식이든
		//어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// 강사님 방법
		// 이전 페이지(AjaxTest03.jsp)로부터 넘어온 데이터 수신
		// → id
		String id = request.getParameter("id");
		
		// id 가 pbg 일 경우
		// Model → DB 액션 처리 요청 → DAO (처리 요청)
		//                                  -----------
		//                                 DTO, Connection 활용
		//
		// → SELECT COUNT(*) AD COUNT FROM MEMBER WHERE ID='pdg';
		//          -------------------                     ------
		//              수신 처리                         넘겨주는 데이터
		//           --==>> 1 or 0 의 결과값
		
		// ※ DB 구성을 별도로 하지 않았기 때문에
		//    컬렉션 자료구조로 대신함~!!!
		ArrayList<String> db = new ArrayList<String>();
		db.add("superman");
		db.add("batman");
		db.add("admin");
		
		int result = 0;
		
		for (String item : db)
		{
			if (item.equals(id))
			{
				result=1;
			}
		}
		
		// 최종 result 에 1 이 남아있으면... 이미 존재하는 id
		// 1 로 바뀌지 않고 0 이 계속 남아 있으면... 존재하지 않는 id
		
		
		// 방법1 - String 으로 result 값 받을때 (1 or 0 의 결과값을 받지 않을 때)
		/*
		String result = "사용 가능한 아이디입니다.";
		
		for ( String str : db)
		{
			if(str.equals(id))
			{
				result = "중복된 아이디 입니다.";
			}
		}
		*/
		
		//방법2 - 자료구조 사용 안했을 때
		/*
		String result="";
		
		if (id.equals("superman") || id.equals("batman") || id.equals("admin"))
		{
			result = "중복된 아이디 입니다.";
		}
		else
		{
			result = "사용 가능한 아이디 입니다.";
		}
		 */
		
		// 반환할 결과값 준비
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/Test03_ok.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("Test03_ok.jsp");
		dispatcher.forward(request, response);
		
	}
}
