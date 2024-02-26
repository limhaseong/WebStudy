<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//int nowYear = 2023;
	//int nowMonth = 12;
	
	//Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 오늘 날짜 가져오기
	int nowYear = cal.get(Calendar.YEAR); //2023
	int nowMonth = cal.get(Calendar.MONTH) + 1; //12
	int nowDay = cal.get(Calendar.DAY_OF_MONTH); //11
	
	// 이전 페이지(SendAndReceive08.jsp)로부터 넘어온 데이터 수신
	// → year, month
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	// 표시할 달력의 년, 월
	int year = nowYear;
	int month = nowMonth;
	
	if (strYear!=null)
	{
		year = Integer.parseInt(strYear);
	}
	if (strMonth!=null)
	{
		month = Integer.parseInt(strMonth);
	}
	
	// 이전과 이후 구성
	int preYear = year;
	int preMonth = month-1;
	
	if (preMonth < 1)
	{
		preYear = year-1;
		preMonth = 12;
	}
	
	int nextYear = year;
	int nextMonth = month+1;
	
	if (nextMonth > 12)
	{
		nextYear = year + 1;
		nextMonth = 1;
	}
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	// (만년 달력)--------------------------------------------------------------------------
	int [] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	if(year%4==0 && year%100!=0 || year%400==0)
	{
		months[1]=29;
	}
	
	int nalsu;
	
	String[] weekName = {"일","월","화","수","목","금","토"};
	
	nalsu = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
	
	for(int i=0; i<month-1; i++)
	{
	  nalsu += months[i];
	}
	nalsu ++;
	
	int week = nalsu%7;
	int lastDay = months[month-1];
	
	String calStr = "";
	calStr += "<table border=1>";
	calStr += "<tr>";
	for(int i=0; i<weekName.length; i++)
	{
	  if(i==0)
	  {
	     calStr += "<th style='color:red;'>" + weekName[i] + "</th>";
	  }
	  else if(i==6)
	  {
	     calStr += "<th style='color:blue;'>" + weekName[i] + "</th>";
	  }
	  else
	  {
	     calStr += "<th>" + weekName[i] + "</th>";
	  }
	}

	calStr +="</tr>";
	
	calStr += "<tr>";

	for(int i=1; i<=week; i++)
	{
	  calStr += "<td></td>";
	}
	
	for(int i =1; i<=lastDay; i++)
	{
	  week++;


	if(year ==nowYear && month==nowMonth && i ==nowDay&& week%7==0)
	{
	   calStr += "<td class='nowSat' >"+i+"</td>";
	}

	  else if(year ==nowYear && month==nowMonth && i ==nowDay&& week%7==1)
	  {
	     calStr += "<td class='nowSun' >"+i+"</td>";
	  }

	  else if(year ==nowYear && month==nowMonth && i ==nowDay)
	  {
	     calStr += "<td class='now' >"+i+"</td>";
	  }

	  else if(week%7==0)
	  {
	     calStr += "<td class='sat' style='color:blue'>"+i+"</td>";
	  }

	  else if(week%7==1)
	  {
	     calStr += "<td class='sun' style='color:red'>"+i+"</td>";
	  }

	  else
	  {
	     calStr += "<td>"+i+"</td>";
	  }

	  if(week%7 ==0)
	     calStr += "</tr><tr>";
	}

	
	for(int i=1; i<=week; i++,week++)
	{	
	   if(week%7==0)
	   {
		   break;
	   }
	   calStr+="<td></td>";
	   
	}
	
	calStr +="</tr>";
	
	calStr +="</table>";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08_2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	a {text-decoration: none;}
</style>

<script type="text/javascript">

</script>

</head>
<body>

<!-- 
	○ 데이터 송수신 실습 08
	
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
	   - submit 버튼 없이 이벤트 처리를 한다.
	   
	     ◀ 2023년 12월 ▶
	   
	   --------------------------------------
	   --------------------------------------
	   --------------------------------------
	   --------------------------------------
	   --------------------------------------
	   
	   - 『◀』이나 『▶』 클릭 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구현한다.
	   
	   - 사용자의 최초 요청 주소는
	     http://localhost:3306/WebApp07/SendAndReceive08_2.jsp 로 한다.
	     
	○ SendAndReceive08_2.jsp 
 -->
 
<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>


<div>
	<form>
		<table>
			<tr>
				<td>
					<a href="SendAndReceive08_2.jsp?year=<%=preYear %>&month=<%=preMonth %>">◀</a>
					<%-- <span><%=nowYear %>년 <%=nowMonth %>월</span> --%>
					<span><%=year %>년 <%=month %>월</span>
					<a href="SendAndReceive08_2.jsp?year=<%=nextYear %>&month=<%=nextMonth %>">▶</a>
				</td>
			</tr>
		</table>
		<br>
	</form>
</div>

<div>
<%=calStr %>
</div>

</body>
</html>