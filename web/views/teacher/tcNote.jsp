<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원아별 알림장</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
input[type=text] {
	border-radius: 10px;
	width: 100%;
	height: 30px;
}
input[type=radio] {
	margin-left:10px;
}
input[type='submit'] {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
textarea {
	border-radius: 10px;
	width: 100%;
}
select {
	width: 100px;
}
table {
	text-align: center;
	margin: 50px auto;
}
</style>
</head>
<body>
	<%@ include file="/views/common/teacherMenu.jsp" %>
 	<div style="margin: 0 15%;">
 	<h1 style="text-decoration: underline; text-underline-position: under;">원아별 알림장</h1>
 	</div>
	<form action="">
	<div style="margin: 0 30%; padding-top :10px; padding-bottom:50px">
		<span style="font-size:20px; font-weight:bold; margin-right:10px;">이름</span>
		<select name="child" id="child" style="display:inline-block;">
			<option value="박건후">박건후</option>
			<option value="윤재영">윤재영</option>
			<option value="권연주">권연주</option>
			<option value="이원경">이원경</option>
		</select>
		<h3 style="text-decoration: underline; text-underline-position: under;">특이사항</h3>
		<textarea style="resize: none;" rows="10"></textarea>
		<h3 style="text-decoration: underline; text-underline-position: under;">준비물</h3>
		<textarea style="resize: none;" rows="10"></textarea>
		<h3 style="text-decoration: underline; text-underline-position: under;">오늘 하루 건강</h3>
		<input type="radio" name="health" id="health1" value="좋음"/><label for="health1">좋음</label>
		<input type="radio" name="health" id="health2" value="보통"/><label for="health2">보통</label>
		<input type="radio" name="health" id="health3" value="나쁨"/><label for="health3">나쁨</label>
		<br /><br />
		<input type="submit" value="완료" style="float:right; border-radius:5px;"/>
	</div>
	</form>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>