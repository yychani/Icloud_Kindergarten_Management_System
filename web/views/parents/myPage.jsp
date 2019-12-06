<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<style>
#outBox {
	width: 800px;
	margin: 5% auto;
}

#myPageTable>td {
	width: 300px;
	height: 50px;
	/* border: 1px solid black; */
}

.ui.top.attached.header {
	font-size: large;
}

#infoChangeBtn, #psssChangeBtn {
	float: right; 
}
.ui.pointing.label{
   color: rgb(209, 57, 57);
}
</style>
</head>

<body style="overflow-x:hidden">

	   <%@ include file="/views/common/parentsMenu.jsp"%>

	<!-- <h1 align="center" style="margin-top: 50px;">내 정보</h1> -->
	<div id="outBox">
		<h5 class="ui top attached header" align="center">회원정보</h5>
		<div class="ui attached segment">
			<form method="post" onsubmit="return true">
				<table id="myPageTable">
					<tr>
						<td style="width: 50px;">아이디</td>
						<td style="width: 20px">:</td>
						<td><div class="ui input">
								<input type="text" placeholder="userId" readonly>
							</div></td>
					</tr>
					<tr>
						<td style="width: 50px;">이름</td>
						<td style="width: 20px">:</td>
						<td><div class="ui input">
								<input type="text" id="userName" placeholder="userName" readonly>
							</div></td>
					</tr>
					<tr>
						<td style="width: 50px;">주소</td>
						<td style="width: 20px">:</td>
						<td><div class="ui input">
								<input type="text" id="address" placeholder="경기도 수원시 권선구"
									readonly>
							</div></td>
					</tr>
					<tr>
						<td style="width: 50px;">이메일</td>
						<td style="width: 20px">:</td>
						<td><div class="ui input">
								<input type="email" placeholder="testEmail" readonly>@<input
									type="email" placeholder="naver.com" readonly>
							</div></td>
					</tr>
					<tr>
						<td style="width: 50px;">핸드폰</td>
						<td style="width: 20px">:</td>
						<td><div class="ui input">
								<div class="ui compact menu">
									<div class="ui simple dropdown item">
										010 <i class="dropdown icon"></i>
										<div class="menu">
											<div class="item">011</div>
											<div class="item">016</div>
											<div class="item">019</div>
										</div>
									</div>
								</div>
								-<input type="tel" placeholder="3327">-<input type="tel"
									placeholder="5305">
							</div></td>
					</tr>
				</table>
				<div class="btns">
					<button type="button" class="ui yellow basic button" align="left" onclick="location.href='<%=request.getContextPath()%>/views/parents/myPageModKid.jsp'">아이정보</button>
					<button type="button" id="psssChangeBtn"
						class="ui positive basic button" onclick="passChangeModal();">비밀번호
						변경</button>
					<button type="button" id="infoChangeBtn"
						class="ui positive basic button" onclick="InfoChangeModal();">회원정보
						수정</button>
				</div>
			</form>
		</div>

	</div>
	<!-- 회원정보 변경 모달 -->
	<div class="ui modal infoChange">
		<i class="close icon"></i>
		<div class="header" align="center">회원정보 변경</div>
		<div class="infoChangeDiv" align="center">
			<form action="" method="post">
				<br> <label>이름 </label>
				<div class="ui input">
					<input type="text" placeholder="변경할 이름">
				</div>
				<br>
				<br> <label>주소 </label>
				<div class="ui input">
					<input type="text" placeholder="변경할 주소">
				</div>
				<br>
				<br> <label>이메일 </label>
				<div class="ui input">
					<input type="email" placeholder="변경할 이메일">@<input
						type="email" placeholder="변경할 이메일">
				</div>
				<br>
				<br> <label>휴대폰 </label>
				<div class="ui input">
					<input type="tel" placeholder="">-<input type="tel"
						placeholder="">-<input type="tel" placeholder="">
				</div>
			</form>
			<br>
			<br>
		</div>
		<div class="actions">
			<div class="ui black deny button">취소</div>
			<div class="ui positive right labeled icon button">
				변경하기 <i class="checkmark icon"></i>
			</div>
		</div>
	</div>

	<!-- 비밀번호 변경 모달 -->
	<div class="ui modal passChange">
		<i class="close icon"></i>
		<div class="header" align="center">비밀번호 변경</div>
		<div class="passDiv" align="center">
			<form action="" method="post">
				<div class="currentPass">
					<br> <label>현재 비밀번호 입력</label><br> <br>
					<div class="ui input">
						<input type="password" placeholder="현재 비밀번호">
					</div>
				</div>
				<br>
				<div class="changePass">
				<div class="field" placeholder="Last Name">
    <div class="ui pointing below label">
      비밀번호는 특수문자 / 영문자 / 숫자 포함 형태의
						8~15자리 이내로 입력하셔야 합니다.
    </div>
   
  </div>
				
					<label>변경할 비밀번호 변경</label><br> <br>
					<div class="ui input">
						<input type="password" placeholder="새 비밀번호"><br>
					</div>
					<br> <br>
					<div class="ui input">
						<input type="password" placeholder="새 비밀번호 확인">
					</div>
					<br>
					<div class="ui pointing label">비밀번호는 특수문자 / 영문자 / 숫자 포함 형태의
						8~15자리 이내로 입력하셔야 합니다.</div>
				</div>
				<div class="actions">
					<br> <br>
					<div class="ui black deny button">취소</div>
					<div class="ui positive right labeled icon button">
						변경하기 <i class="checkmark icon"></i>
					</div>
					<br> <br>
				</div>
			</form>


		</div>
	</div>

	<script>
		//회원정보 수정 모달
		function InfoChangeModal() {
			$('.ui.modal.infoChange').modal('show');
		}

		//비밀번호 변경 모달
		function passChangeModal() {
			$('.ui.modal.passChange').modal('show');
		}
	</script>




	<%@ include file="/views/common/chat.jsp"%>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>