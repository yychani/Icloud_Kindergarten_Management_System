<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.InetAddress"%>
<% 
	InetAddress inet = InetAddress.getLocalHost();
	String svrIP = inet.getHostAddress();
	int svrPort = request.getServerPort();
%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
			background: rgb(44, 44, 44) !important;
			color: gray !important;
		}
	</style>
</head>

<body>
	<form action="<%=request.getContextPath()%>/login.me" method="post">
		<h1 align="center" style="margin-top: 50px;">로그인</h1>
		<table class="input">
			<tr>
				<td colspan="2" style="width: 300px;">
					<div class="ui left icon input">
						<input type="text" placeholder="아이디를 입력해주세요" name="userId"> <i class="user icon"></i>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="ui left icon input">
						<input type="password" placeholder="비밀번호를 입력해주세요" name="userPwd"> <i class="lock icon"></i>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 5px 0;"><input type="checkbox" name="remember"
						style="width: 20px; height: 20px;"><label for="remember">아이디기억</label></td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 10px 0;"><a href="findId.jsp">아이디나
						비밀번호가 생각나지 않으십니까?</a></td>
			</tr>
			
			<tr align="center">
					<td colspan="2" style="padding: 10px 0;"><input type="submit" value="로그인"> <input type="button" onclick = "location.href = '<%=request.getContextPath() %>/views/signUp/signUp.jsp' " value="회원가입"
						style="margin-left: 50px;"></td>
			</tr>
		</table>
		
	</form>
	<%@ include file="/views/common/footer.jsp" %>
	
	<script>
		<% if(request.getParameter("e") != null) { %>
			$(function() {
				alert("임시 비밀번호를 이메일로 발송하였습니다.");
			});
		<% } %>
	</script>
</body>

</html>