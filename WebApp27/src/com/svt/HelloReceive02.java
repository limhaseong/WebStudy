/*========================
       ServletSample.java
       - Servlet 관련 실습
========================*/

package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//HttpServlet은 추상클래스 이지만 추상메소드는 없다.
public class HelloReceive02 extends HttpServlet
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
		
		// 서블릿 관련 코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		String title = "결과 수신 페이지";
		String subTitle = "HelloReceive02.java";
		String docType = "<!DOCTYPE html>";
		
		out.print(docType + "\n"
				+ "<html>\n"
				+ "<head><title>" + title + "</title></head>\n"
				+ "<body bgcolor=\"f0f0f0\">\n"
				+ "<div><h1>" + title + "</h1>\n"
				+ "<h2>" + subTitle + "</h2>\n"
				+ "<hr></div>\n"
				+ "<div>\n"
				+ "<ul>\n"
				+ "<li><b>First Name : </b>" + request.getParameter("firstName") + "</li>\n"
				+ "<li><b>last Name : </b>" + request.getParameter("lastName") + "</li>\n"
				+ "</ul>\n"
				+ "</div>\n"
				+ "</body>\n"
				+ "</html>\n");
	}
}
