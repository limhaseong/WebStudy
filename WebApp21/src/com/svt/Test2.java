/*========================
       Test2.java
========================*/

package com.svt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//HttpServlet은 추상클래스 이지만 추상메소드는 없다.
public class Test2 extends HttpServlet
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
		
		// 이 메소드를 호출하는 주체 = 서블릿 컨테이너
		// 일을 수행하게 하는 곳 = web.xml
		
		
		// 서블릿 관련 코딩
		
		// 한글 깨짐 방지 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지(Test2.jsp)로부터 넘어온 데이터 수신
		// → name, age
		
		// 데이터 수신
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		// 업무 처리
		String str = "이름은 " + name + "이며, 나이는 " + age + "세 입니다.";
		
		// 처리한 업무 넘기기
		request.setAttribute("result", str);
		//-- 포워딩하는 페이지에 값을 넘기기 위한 준비(설정)
		//   즉, str 값을 result 라는 이름으로 Test2_result.jsp 페이지로
		//   넘기기 위한 준비
		
		// 포워딩~!!!
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Test2_result.jsp");
		dispatcher.forward(request, response);
	}
}
