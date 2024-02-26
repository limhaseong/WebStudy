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
public class PostTest02OkController extends HttpServlet
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
		
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
		String oper = request.getParameter("oper");
		
		
		String result = "";
		
		
		if (oper.equals("add"))
		{
			result = String.format("%d + %d = %d", su1, su2, (su1+su2));
		}
		else if (oper.equals("sub"))
		{
			result = String.format("%d - %d = %d", su1, su2, (su1-su2));
		}
		else if (oper.equals("mul"))
		{
			result = String.format("%d * %d = %d", su1, su2, (su1*su2));
		}
		else if (oper.equals("div"))
		{
			result = String.format("%d / %d = %.2f", su1, su2, ((double)su1/su2));
		}
		
		// 반환할 결과값 준비
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/PostTest02_ok.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("PostTest02_ok.jsp");
		dispatcher.forward(request, response);
	}
}