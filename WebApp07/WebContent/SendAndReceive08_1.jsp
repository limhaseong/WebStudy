<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//자기 자신 페이지(SendAndReceive08.jsp)로부터 넘어온 데이터 수신
	// → year, month
	String selectYear = request.getParameter("year");
	String selectMonth = request.getParameter("month");

	//Calendar 객체 생성
	Calendar cal = Calendar.getInstance();

	//현재 년 , 월, 일 확인 -> 현재의 년,월,일 확인
	int nowYear = cal.get(Calendar.YEAR); //2023
	int nowMonth = cal.get(Calendar.MONTH) + 1; //12
	int nowDay = cal.get(Calendar.DAY_OF_MONTH); //11
	
	//표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int sYear = nowYear;
	int sMonth = nowMonth;
	
	// 페이지에 대한 요청이 최초 요청이 아닐 경우
	// → Line 6~7 을 통해 수신한 데이터로 표시할 달력의 년, 월 구성
	//String sYear = request.getParameter("year");
	//String sMonth = request.getParameter("month");
	if (selectYear != null || selectMonth != null)
	{
		sYear = Integer.parseInt(selectYear);
		sMonth = Integer.parseInt(selectMonth);
	}
	
	if(selectMonth != null && Integer.parseInt(selectMonth) > 12)
	{
		sMonth=1;
		sYear=sYear+1;
	}
	else if(selectMonth != null && Integer.parseInt(selectMonth) < 1)
	{
		sMonth=12;
		sYear=sYear-1;
	}
	
	String hrefBefore = String.format("http://localhost:3306/WebApp07/SendAndReceive08.jsp?year=%d&month=%d", sYear, (sMonth-1));
	String hrefAfter = String.format("http://localhost:3306/WebApp07/SendAndReceive08.jsp?year=%d&month=%d", sYear, (sMonth+1));
	
	cal.set(sYear, sMonth-1, 1);
	int weekday = cal.get(Calendar.DAY_OF_WEEK);
	int lastday = cal.getActualMaximum(Calendar.DATE);
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인 필요
	// (만년 달력)
	
	// 각 달의 마지막 날짜 배열 구성
	int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	
	// 윤년인지 평년인지 확인
	if(sYear%4==0 && sYear%100!=0 || sYear%400==0)
	{
		months[1]=29;
	}
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항복 배열 구성
	String[] weekNames = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	
	// 현재 년도 → 입력받은 년도 이전 년도까지의 날 수 계산
	nalsu = (sYear-1)*365 + (sYear-1)/4 - (sYear-1)/100 + (sYear-1)/400;
	
	// 현재 월 → 입력받은 월의 이전 월까지의 날 수 추가
	for(int i=0; i<sMonth-1; i++)
	{
	  nalsu += months[i];
	}
	nalsu ++; 	// + 1
	
	int week = nalsu%7; 					//-- 요일 변수
	int lastDay = months[sMonth-1]; 	//-- 마지막 날짜 변수
	
	//System.out.println(week);
	//--==> 5
	
	// 달력 그리기 -----------------------------------------------------------------------------
	
	String calStr = "";
	calStr += "<table border='1'>";			//-- start table
	
	// 요일 이름 발생
	calStr += "<tr>";
	for (int i=0; i<weekNames.length; i++)
	{
		if (i==0)	//-- 일요일
		{
			calStr += "<th style='color: red;'>" + weekNames[i] + "</th>";
		}
		else if (i==6)	//-- 토요일
		{
			calStr += "<th style='color: blue;'>" + weekNames[i] + "</th>";
		}
		else		//-- 평일
		{
			calStr += "<th>" + weekNames[i] + "</th>";
		}
	}
	calStr += "</tr>";
	
	// 빈 칸 공백 td 발생
	calStr += "<tr>";
	for (int i=1; i<=week; i++)
	{
		calStr += "<td></td>";
	}
	
	// 날짜 td 발생
	for (int i=1; i<=lastDay; i++)
	{
		week++; 	//-- 날짜가 하루씩 찍힐 때 마다(구성이 이루어질 때 마다)
		  			//   요일도 함께 1씩 증가할 수 있도록 처리
		  			
		if (sYear==nowYear && sMonth==nowMonth && i==nowDay && week%7==0)
		{
			// 토요일인 오늘
			calStr += "<td class='nowSat'>" + i + "</td>";
		}
		else if (sYear==nowYear && sMonth==nowMonth && i==nowDay && week%7==1)
		{
			// 일요일인 오늘
			calStr += "<td class='nowSun'>" + i + "</td>";
		}
		else if (sYear==nowYear && sMonth==nowMonth && i==nowDay)
		{
			// 평일인 오늘
			calStr += "<td class='now'>" + i + "</td>";
		}
		else if (week%7==0)
		{
			// 오늘이 아닌 토요일(그냥 토요일이기만 하면)
			calStr += "<td class='sat'>" + i + "</td>";
		}
		else if (week%7==1)
		{
			// 오늘이 아닌 일요일(그냥 일요일이기만 하면)
			calStr += "<td class='sun'>" + i + "</td>";
		}
		else
		{
			// 오늘이 아닌 평일
			calStr += "<td>" + i + "</td>";
		}
		
		if (week%7==0)
		{
			calStr += "<tr></tr>";
		}
	}
	
	
	// 빈 칸 공백 td 발생
	for (int i=0; i<=week; i++, week++)
	{
		if (week%7==0)
		{
			break;
		}
		calStr += "<td></td>";
	}
	
	if (week%7!=0)
	{
		calStr += "</tr>";
	}
	
	calStr += "</table>";					//-- end table
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function formCalendar()
	{
		// 유효성 검사가 필요할 경우 삽입할 수 있는 영역~!!!
		
		//...
		
		document.calendar.submit();
	}

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
	     http://localhost:3306/WebApp07/SendAndReceive08_1.jsp 로 한다.
	     
	○ SendAndReceive08_1.jsp 
 -->
 
<div>
	<form action="" method="get">
		<a href=<%=hrefBefore %> onclick="formCalendar()">◀</a>
		<%=sYear %>
		년
		<%=sMonth %>
		월
		<a href=<%=hrefAfter %> onclick="formCalendar()">▶</a>
	</form>
</div>

<div>
	<%=calStr %>
</div>

</body>
</html>