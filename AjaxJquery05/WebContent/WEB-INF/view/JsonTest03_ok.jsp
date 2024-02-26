<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String result = (String)request.getAttribute("result");
	// setAttribute로 넘어올때 Object로 넘어옴
	// setAttribute로 넘어온 걸 getAttribute 로 받아줌
	
	String res="";
	
	StringBuffer sb = new StringBuffer();
	
	sb.append("{\"result\":\"" + result + "\"}");
	
	res = sb.toString();
	
	out.println(res);
%>