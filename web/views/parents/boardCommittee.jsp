<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2 {
		padding-left:30px;
	} 
</style>
</head>
<body style="overflow-x:hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<div style="margin: 0 15%;">
	<h2 style="text-decoration: underline; text-underline-position: under;"><U>유치원 운영 위원회 게시판</U></h2>
	</div>
	<%@ include file="/views/common/board.jsp" %>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>