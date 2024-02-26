<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//JsonTest01_ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result = "";
	
	StringBuffer sb = new StringBuffer();
	
	for (int i=1; i<=5; i++)
	{
		if (i<=4)
		{
			sb.append("{\"num\":\"" + i + "\"");
			sb.append(",\"name\":\"" + name + i + "\"");
			sb.append(",\"content\":\"" + content + i + "\"},");
		}
		else
		{
			sb.append("{\"num\":\"" + i + "\"");
			sb.append(",\"name\":\"" + name + i + "\"");
			sb.append(",\"content\":\"" + content + i + "\"}");
		}
		result = sb.toString();
	}
	
	result = "[" + result + "]";
	
	out.println(result);
	
	// 방법②
	/*
	sb.append("[");
	for (int i=1; i<=5; i++)
	{
		sb.append("{\"num\":\"" + i + "\"");
		sb.append(",\"name\":\"" + name + i + "\"");
		sb.append(",\"content\":\"" + content + i + "\"}");
		
		if (i<=4)
		{
			sb.append(",");
		}
	}
	sb.append("]");
	
	result = sb.toString();
	
	out.println(result);
	*/
	
%>