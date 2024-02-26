/*========================
       Test1.java
========================*/

package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//HttpServlet은 추상클래스 이지만 추상메소드는 없다.
public class Test1 extends HttpServlet
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
		
		// ①
		/*
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name : " + "홍길동" + "</h1>");
		pw.println("<h1>age : " + 19 + "</h1>");
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		*/
		
		
		// ②
		/*
		String name = "길현욱";
		int age = 21;
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		*/
		
		
		// ③
		// 외부로부터 데이터를 가져올 수 있는 장점이 있음
		//-- 컨테이너가 서블릿을 초기화 할 때
		//   서블릿 당 하나씩 ServletConfig 을 생성하게 된다.
		ServletConfig config = getServletConfig();
		
		// 『web.xml』에 『<init-param>』
		// web.xml로 부터 데이터를 가져올 수 있음.
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		/*
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		*/
		
		// ④ 추가
		// 『ServletContext』
		//-- ServletConfig 는 서블릿에 대한 환경을 설정하는 과정에서
		//   필요한 값들을 전달하는 형태로 주로 사용된다면...
		//   ServletContext 는 서블릿에서 사용되는 컨텍스트를
		//   구성하는 형태로 활용된다.
		ServletContext context = getServletContext();
		
		String type = context.getInitParameter("type");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		
		pw.println("<h1>type : " + type + "</h1>");
		
		pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
	}
}
