<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendButton").click(function()
		{
			// 테스트
			//alert("확인~!!!");

			var params = "su1=" + $.trim($("#su1").val()) + "&su2=" + $.trim($("#su2").val()) + "&oper=" + $.trim($("#oper").val());

			$.ajax(
			{
				type:"POST"
				, url:"ajaxtest03ok.do"
				, data:params					// url 지정 페이지로 넘길 값		// check~!!!
				, success:function(args)
				{
					$("#result").html(args);
				}
				, beforeSend:showRequest		// beforeSend도 동작 기능이므로 함수를 안쓰려면
												//beforeSend:function(){}으로 해야된다. 그냥 true / false 만은 불가능함.
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
	});
	
	function showRequest()
	{
		if (!$.trim($("#su1").val()))
		{
			alert("첫 번째 정수를 입력해야 합니다.");
			$("#su1").focus();
			
			return false;
		}
		
		if (!$.trim($("#su2").val()))
		{
			alert("두 번째 정수를 입력해야 합니다.");
			$("#su2").focus();
			
			return false;
		}
		
		return true;
	}
</script>

</head>
<body>

<div>
	<h1>jQuery 의 post() 활용 실습</h1>
	<hr />
</div>

<div>
	<input type="text" id="su1" class="txt txtNum" />
	
	<select id="oper">
		<option value="add">덧셈</option>
		<option value="sub">뺄셈</option>
		<option value="mul">곱셈</option>
		<option value="div">나눗셈</option>
	</select>
	
	<input type="text" id="su2" class="txt txtNum" />
	
	<input type="button" value=" = " id="sendButton" class="btn"/>
</div>
<br>

<div id="result">
</div>
<br>
<br>

<div>
	<input type="radio" name="rdo">rdo1
	<input type="radio" name="rdo">rdo2
</div>

<div>
	<input type="checkbox" name="chk">chk1
	<input type="checkbox" name="chk">chk2
</div>

<div>
	<input type="text">
</div>


</body>
</html>