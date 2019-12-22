<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.InetAddress"%>
<% InetAddress inet = InetAddress.getLocalHost();
		String svrIP = inet.getHostAddress();
		int svrPort = request.getServerPort();%>
<!DOCTYPE html>
<html>

<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
	<meta charset="UTF-8">
	<title>비밀번호 찾기</title>
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
	<form action="<%=request.getContextPath()%>/findPwd.me" method="post" id="findPwdForm">
		<h1 align="center" style="margin-top: 50px;">비밀번호 찾기</h1>
		<table class="input">
			<tr>
				<td colspan="2" style="width: 300px;">
					<div class="ui left icon input">
						<input type="text" placeholder="아이디를 입력해주세요" name="userId" id="userId" autocomplete="off"> <i class="id card outline icon"></i>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="ui left icon input">
						<input type="text" placeholder="이름을 입력해주세요" name="userName" id="userName" autocomplete="off"> <i class="user icon"></i>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="ui left icon input">
						<input type="email" placeholder="이메일을 입력해주세요" name="email"> <i class="envelope icon"></i>
					</div>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2" style="padding: 10px 0;">
					<button class="ui secondary button" type="submit">확인</button>
					<button class="ui button" type="button" onclick="location.href = 'login.jsp'" style="margin-left: 50px;">취소</button>
				</td>
			</tr>
			
		</table>
		
	</form>
	<%@ include file="/views/common/footer.jsp" %>
</body>

</html>