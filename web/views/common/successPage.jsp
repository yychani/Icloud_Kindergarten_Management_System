<%@page import="com.oracle5.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/* String msg = (String) session.getAttribute("msg");  */
	int successCode = Integer.parseInt(request.getParameter("successCode"));

	System.out.println("successCode : " + successCode);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		successCode = <%=successCode%>;
		console.log(successCode);
		
		var msg = "";
		var path = "<%=request.getContextPath()%>/index.jsp";
		if(successCode == 1) {
			msg = "회원가입에 성공하셨습니다.";
		} else if(successCode == 2){
			msg = "로그아웃 하셨습니다.";
			path = "<%=request.getContextPath()%>/index.jsp";
		} else if(successCode == 3){
			msg = "정보 수정이 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/views/member/memberUpdateForm.jsp";
		} else if(successCode == 4){
			msg = "회원 탈퇴가 완료 되었습니다.";
			path = "<%=request.getContextPath()%>/index.jsp";
		}

		alert(msg);
		location.href = path;
	</script>
	<%-- <h1 align="center"><%=msg %></h1> --%>
	<h3 align="center">
		<a href="<%=request.getContextPath()%>/index.jsp">메인화면으로 가기</a>
	</h3>
</body>
</html>