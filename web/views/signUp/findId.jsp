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
	<title>아이디 찾기</title>
	<style>
		table[type=input] {
			margin: 50px auto;
			padding-top: 30px;
		}

		table {
			margin: 50px auto;
		}

		#idForm, #emailForm {
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

<body style="overflow-y:hidden">
		<h1 align="center" style="margin-top: 50px;">아이디 찾기</h1>
		<table class="input">
			<tr>
				<td colspan="2" style="width: 300px;">
					<div class="ui left icon input" id="idForm">
						<input type="text" placeholder="이름를 입력해주세요" id="userName" name="userName" autocomplete="off"> <i class="user icon"></i>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="ui left icon input" id="emailForm">
						<input type="email" placeholder="이메일을 입력해주세요" id="userEmail" name="userEmail"> <i class="envelope icon"></i>
					</div>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2" style="padding: 10px 0;">
					<button class="ui secondary button" onclick="find_id()">확인</button>
					<button class="ui button" type="button" onclick="location.href = 'findPwd.jsp'" style="margin-left: 50px;">비밀번호 찾기</button>
					<button class="ui button" type="button" onclick="location.href='login.jsp'">이전으로</button>
				</td>
			</tr>
		</table>
		
		
		<div class="ui mini modal">
		  <i class="close icon"></i>
		  <div class="header">
		    결과
		  </div>
		   <div class="content" id="content">
		    
		  </div>
		  <div class="actions">
		    <div class="ui black deny button" id="failbtn" style="display:none;">
		      	취소
		    </div>
		    <div class="ui positive right labeled icon button" onclick="location.href='login.jsp'" id="succesbtn" style="display:none;">
		     	 확인
		      <i class="checkmark icon"></i>
		    </div>
		  </div>
		</div>
		
		
		
		<script>
		$(document).ready(function(){
	        $("#userEmail").keypress(function (e) {
	         	if (e.which == 13){
	         		$('#pwdChange').modal('hide');
	         		find_id();
	         	}
	     	});
	 	});
		
			function find_id() {
				var userName = $("#userName").val();
				var userEmail = $("#userEmail").val();
				
				$.ajax({
					url:"<%= request.getContextPath() %>/findId.do",
					type:"post",
					data:{
						userName:userName,
						userEmail:userEmail
					},
					success:function(data) {
						if(data != null){
							data = data.replace(data.charAt(data.length / 2), "*");
							$("#content").text(data);
							$("#succesbtn").show();
						} else {
							$("#content").text("찾으시는 아이디가 없습니다.");
							$("#failbtn").show();
						}
					},
					error:function(){
						console.log("실패")
					}
				});
				
				open_modal();
			}
			function open_modal(){
				$('.mini.modal').modal('show');
			}
		</script>
	<%@ include file="/views/common/footer.jsp" %>
</body>

</html>