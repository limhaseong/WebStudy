<%@ page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	// Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	//달력객체로 부터 얻어온 현재값들. 
	//현재 년 , 월,일 수신->현재의 년,월,일 확인
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) + 1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	//화면에 표시할(그릴) 달력의 년,월
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 최초는 선택..하지 않기 때문에 null이므로 현재 날짜로 이어진다
	// sYear = 받아온 값, sMonth = 받아온 값
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	String yOptions="";
	for(int year=(selectYear-10); year<=(selectYear+10); year++)
	{
	  // 상황1. 페이지 최초 요청 --> sYear 는 null, 현재 년도와 옵션값이 같을때
	  // 상황2. 페이지 최초 요청 아닐 때 
	  // 상황3. 나머지 
	  
	  if(sYear==null && year==nowYear)
	  {
	     yOptions += "<option value='"+year+"'selected='selected'>"+year+"</option>";
	  }
	  else if(sYear!=null && Integer.parseInt(sYear)==year)
	  {
	     yOptions += "<option value='"+year+"'selected='selected'>"+year+"</option>";
	  }
	  else
	  {
	     yOptions += "<option value='"+year+"'>"+year+"</option>";   
	  }
	}

	String mOptions = "";
	for(int month=1; month<=12; month++)
	{
	  // 상황1. 페이지 최초 요청 --> sMonth 는 null, 현재 년도와 옵션값이 같을때
	  // 상황2. 페이지 최초 요청 아닐 때 
	  // 상황3. 나머지 
	  if(sMonth==null && month==nowMonth)
	  {
	     mOptions += "<option value='"+month+"'selected='selected'>"+month+"</option>";
	  }
	  else if(sMonth!=null && Integer.parseInt(sMonth)==month)
	  {
	     mOptions += "<option value='"+month+"'selected='selected'>"+month+"</option>";
	  }
	  else
	  {   
	     mOptions += "<option value='"+month+"'>"+month+"</option>";
	
	  }
	}

	// 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산
	// (만년 달력)--------------------------------------------------------------------------
	int [] months = {31,28,31,30,31,30,31,31,30,31,30,31};
	if(selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
	{
		months[1]=29;
	}
	
	int nalsu;
	
	String[] weekName = {"일","월","화","수","목","금","토"};
	
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	for(int i=0; i<selectMonth-1; i++)
	{
	  nalsu += months[i];
	}
	nalsu ++;
	
	int week = nalsu%7;
	int lastDay = months[selectMonth-1];
	
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


	if(selectYear ==nowYear && selectMonth==nowMonth && i ==nowDay&& week%7==0)
	{
	   calStr += "<td class='nowSat' >"+i+"</td>";
	}

	  else if(selectYear ==nowYear && selectMonth==nowMonth && i ==nowDay&& week%7==1)
	  {
	     calStr += "<td class='nowSun' >"+i+"</td>";
	  }

	  else if(selectYear ==nowYear && selectMonth==nowMonth && i ==nowDay)
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
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function calendar(obj)
	{
		obj.submit();
	}

</script>

</head>
<body>

<%--
<%=nowYear %>
<%=nowMonth %>
<%=nowDay %> 
--%>

<!-- 
	○ 데이터 송수신 실습 07
	   
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 페이지 레이아웃은 연도와 월을 입력받아
	     화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   - 전송한 내용을 스스로 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 연도 선택 기본 구성은 현재의 연도를 기준으로
	     이전 10년, 이후 10년 으로 구성한다.
	     (기본적으로 만년달력 형태로 구성하는데
	      현재의 연, 월은 달력 객체로부터 확인할 수 있도록 한다.)
	   - 월 선택 기본 구성은 1월 부터 12월 까지로 구성한다.
	   
	   	   2013
	   		 :
	     [ 2023 ▼ ] 년 [ 12 ▼ ] 월
	         :
	       2033
	   ------------------------------
	   ------------------------------
	   ------------------------------
	   ------------------------------
	   
	   - 연도 select 나 월 select 의 내용이 변화되면
	     해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	   
	   - 사용자의 최초 요청 주소는
	     http://localhost:3306/WebApp07/SendAndReceive07.jsp 로 한다.
	     
	○ SendAndReceive07.jsp
 -->
 
<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<div>
	<form action="" method="post">
		<select id="year" name="year" onchange="calendar(this.form)">
		<%=yOptions %>
		</select> 년
		<select id="month" name="month" onchange="calendar(this.form)">
		<%=mOptions %>
		</select> 월
	</form>
</div>
<br>

<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=calStr %>
</div>

</body>
</html>