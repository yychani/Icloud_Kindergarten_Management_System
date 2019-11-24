<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table[type=input] {
	margin: 50px auto;
	padding-top: 30px;
}

table {
	margin: 50px auto;
}

div {
	width: 100% !important;
	margin: 5px 0;
}

input[type=submit], input[type=button] {
	width: 100px;
	height: 40px;
	border-radius: 10px;
	background: rgb(63, 63, 63);
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
}

input[type=submit]:hover, input[type=button]:hover {
	background: rgb(241, 241, 188) !important;
	color: gray !important;
}
</style>
</head>

<body>
	<h1 align="center" style="margin-top: 50px;">로그인</h1>
	<div align="center">
	<button
		onclick="location.href='<%=request.getContextPath()%>/views/signUp/login.jsp'">로그인화면</button>
	<button

		onclick="location.href='<%=request.getContextPath()%>/views/teacher/tcMain.jsp'"> 

		메뉴 테스트</button></div>
	<%@ include file="/views/common/footer.jsp"%>
</body>

</html>