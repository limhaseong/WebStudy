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
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendButton").click(function()
		{
			// 테스트
			//alert("확인~!!!");

			// data 구성
			var params = "title=" + $.trim($("#title").val()) + "&content=" + $.trim($("#content").val());

			$.ajax(
			{
				type:"POST"
				, url:"ajaxtest04ok.do"
				, data:params					// url 지정 페이지로 넘길 값		// check~!!!
				, dataType:"xml"				// 넘겨 받을 값 					// check~!!!
				, success:function(args)
				{
					var out="";
					
					$(args).find("records").each(function() //each = 각각 접근하게 한다.
					{
						var records = $(this);			//record 하나
						var num = records.attr("num");
						var title = $(this).find("title").text();
						var content = $(this).find("content").text();
						
						out += "<br>==============================";
						out += "<br> id = " + num;
						out += "<br> title = " + title;
						out += "<br> content = " + content;
						out += "<br>==============================";
					}); 		
					
					$("#resultDiv").html(out);
					
					$("#title").val("");
					$("#content").val("");
					$("#title").focus();
				}
				, beforeSend:showRequest		// true / false로 속성값을 받는다. → showRequest()로 안받는 거 확인   // check~!!!
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
		});
	});
	
	function showRequest()
	{
		if (!$.trim($("#title").val()))
		{
			alert("제목을 입력해야 합니다.");
			$("#title").focus();
			
			return false;
		}
		
		if (!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			
			return false;
		}
		
		return true;
	}

</script>

</head>
<body>

<div>
	<h1>jQuery 의 ajax() 활용 실습</h1>
	<p>xml control</p>
	<hr />
</div>

<div>
	제목 <input type="text" id="title" class="txt">
	<br><br>
	
	내용 <input type="text" id="content" class="txt">
	<br><br>
	
	<input type="button" value="등록하기" id="sendButton" class="btn">
</div>
<br>

<div id="resultDiv">
<!-- 
>> id=1
- title=테스트
- content=반갑습니다.

>> id=2
- title=테스트
- content=반갑습니다.
-->
</div>

</body>
</html>