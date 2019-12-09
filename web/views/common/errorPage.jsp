<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String msg = (String) request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body {
		background: rgb(255, 248, 150);
	}
	#errorArea {
		margin: 210px auto; 
		background: white;
		width: 450px;
		height: 200px;
		border-radius: 10px;
		padding-top: 100px;
		box-shadow: 10px 10px 50px 10px rgba(58, 58, 58, 0.5);
	}
		button {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div id="errorArea" align="center">
		<h1 align="center" style="vertical-align: middle;"><%=msg%></h1>
		<button onclick="history.go(-1)">돌아가기</button>
	</div>
</body>
</html>

</html>