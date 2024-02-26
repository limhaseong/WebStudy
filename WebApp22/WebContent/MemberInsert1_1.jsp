<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO1_1"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="ob" class="com.test.MemberDTO1_1"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<%
	// MemberInsert.jsp
	
	// 5명 분 데이터 수신 → 객체 구성 → 자료구조 구성 → setAttribute()
	// 						MemberDTO
	
	// → MemberList.jsp 에서 출력
	
	String[] names = ob.getName();
	String[] tels = ob.getTel();
	String[] addr = ob.getAddr();
	
	HashMap<Integer, String> member = new HashMap<Integer, String>();
	
	for (int i=0; i<names.length; i++)
	{
		member.put(i, names[i] + " " + tels[i] + " " + addr[i]);
	}
	
	request.setAttribute("member", member);

%>
<jsp:forward page="MemberList1.jsp"></jsp:forward>