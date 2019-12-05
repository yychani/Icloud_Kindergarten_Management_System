<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 {
		padding-left:30px;
	}
	table{
		margin: 50px auto;
		border:none;
	}
		button {
		width: 80px;
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
<body style="overflow-x:hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<div style="margin: 0 15%;">
		<h2 style="text-decoration: underline; text-underline-position: under;">학부모 게시판</h2>
    </div>
	
	<%@ include file="/views/common/board.jsp" %>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>