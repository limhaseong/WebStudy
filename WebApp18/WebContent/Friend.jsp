<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">

<style type="text/css">
	a {text-decoration: none;}
</style>

<script type="text/javascript">

	function sendIt()
	{
		//확인
		//alert("함수 호출~!!!");
		
		//방법1
		var memberForm = document.getElementById("memberForm");
		
		var userName = document.getElementById("userName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if (userName.value == "")
		{
			nameMsg.style.display = "inline";
			userName.focus();
			return;
		} 
		 
		memberForm.submit();
		
		//방법2
		/* var f = document.myForm;
		
		if (!f.userName.value)
		{
			alert("이름! 쫌~!!");
			f.userName.focus();
			return;
		}
		f.submit; */
	}

</script>

</head>
<body>

<div>
	<h1>데이터 입력</h1>
	<hr />
</div>

<!-- com.test.FriendDTO -->
<!-- Friend_ok.jsp -->

<div>
	<form action="Friend_ok.jsp" method="post" name="myForm" id="memberForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" class="txt" name="userName" id="userName">
				</td>
				<td>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" class="txt" name="userAge">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" name="gender" value="남자"> 남자
					</label>
					<label>
						<input type="radio" name="gender" value="여자"> 여자
					</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label>
						<input type="checkbox" name="ideal" value="원빈"> 원빈
					</label>
					<label>
						<input type="checkbox" name="ideal" value="천우희"> 천우희
					</label>
					<label>
						<input type="checkbox" name="ideal" value="카리나"> 카리나
					</label>
					<label>
						<input type="checkbox" name="ideal" value="정우성"> 정우성
					</label>
					<label>
						<input type="checkbox" name="ideal" value="이동욱"> 이동욱
					</label>
					<label>
						<input type="checkbox" name="ideal" value="한소희"> 한소희
					</label>
					<label>
						<input type="checkbox" name="ideal" value="정해인"> 정해인
					</label>
					<label>
						<input type="checkbox" name="ideal" value="수지"> 수지
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" style="width: 100%;" onclick="sendIt()">등록</button>
				</td>
			</tr>			
		</table>
	</form>
</div>

</body>
</html>