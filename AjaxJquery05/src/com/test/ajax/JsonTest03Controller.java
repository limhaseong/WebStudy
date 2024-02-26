/*========================
       ServletSample.java
       - Servlet 관련 실습
========================*/

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//HttpServlet은 추상클래스 이지만 추상메소드는 없다.
public class JsonTest03Controller extends HttpServlet
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
		
		String view = "WEB-INF/view/JsonTest03.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
