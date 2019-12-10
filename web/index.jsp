<%@page import="com.oracle5.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member) session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>메인 화면</title>
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
	<h1 align="center" style="margin-top: 50px;">메인화면</h1>
	<%
		if (loginUser == null) {
	%>
	
	<div align="center">
		<button
			onclick="location.href='<%=request.getContextPath()%>/views/signUp/login.jsp'">로그인화면</button>
		<button
			onclick="location.href='<%=request.getContextPath()%>/test.jsp'">
			메뉴 테스트</button>
	</div>
	<%
		} else {
	%>
	<div align="center">
		<h1><%=loginUser.getMemberName()%>님 어서오세요!
		</h1>
		<button
			onclick="location.href=<%if (loginUser.getUType().equals("교사")) {
					if (loginUser.getMemberId().equals("admin")) {%>
										'<%=request.getContextPath()%>/views/president/preMain.jsp'
									<%} else {%>
										'<%=request.getContextPath()%>/views/teacher/tcMain.jsp'
									<%}
				} else if (loginUser.getUType().equals("학부모")) {%>
										'<%=request.getContextPath()%>/views/parents/parMain.jsp'
							<%}%>">메인으로
			이동하기</button>
	</div>
	<%
		}
	%>
	<%@ include file="/views/common/footer.jsp"%>
</body>

</html>