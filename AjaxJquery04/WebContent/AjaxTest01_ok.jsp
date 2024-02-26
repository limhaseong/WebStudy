<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	//AjaxTest01_ok.jsp
	
	// 방법 ①
	/*
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	*/
%>
<!-- 방법 ① -->
<%-- 
이름 : <b><%=name %></b>
<br>
내용 : <b><%=content %></b>
 --%>
 
 이름 : <b>${param.name }</b>
 <br>
 내용 : <b>${param.content }</b>
 <br>