<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>회원 가입</title>
	<style>
		.label {
			width: 150px;
			height: 60px;
			font-size: 13pt;
			color: ligthgrey;
			font-weight: bold;
		}

		.input {
			width: 400px;
			height: 60px;
			text-align: left !important;
			vertical-align: middle !important;
		}

		.terms {
			font-size: 15pt;
		}

		button,
		.submit {
			width: 100px;
			height: 40px;
			border-radius: 10px;
			background: rgb(63, 63, 63);
			color: white;
			font-weight: bold;
			border: none;
			cursor: pointer;
		}

		.cancel {
			width: 100px;
			height: 40px;
			border-radius: 10px;
			background: rgb(177, 177, 177) !important;
            color: black !important;
			font-weight: bold;
			border: none;
			cursor: pointer;
		}

		button:hover, .submit:hover, .cancel:hover {
			background: rgb(44, 44, 44) !important;
			color: gray !important;
		}

		table {
			margin: 50px auto;
			padding-top: 30px;
			padding-left: 100px;
		}

		input[type=radio],
		input[type=checkbox] {
			width: 20px;
			height: 20px !important;
			vertical-align: middle;
		}

		input {
			border-radius: 5px;
			height: 30px !important;
			border: 1px solid rgb(77, 77, 77);
		}

		.termsView {
			overflow-y: scroll;
			width: 100%;
			height: 150px;
			background: lightgray;
			margin-top: 5px;
			padding: 15px;
		}
	</style>
</head>

<body>
	<form action="<%=request.getContextPath() %>/views/signUp/signUpKid.jsp" method="post">
		<h1 align="center" style="margin-top: 50px;">회원 가입</h1>
		<table>
			<tr>
				<td colspan="2" class="label"><label for="">아이디 : </label></td>
				<td colspan="2" class="input"><input type="text" placeholder=" ID를 입력해주세요" id="userId" name="userId"
						style="width: 80%; height: 20px"></td>
				<td><button id="test">중복 확인</button></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">비밀번호 : </label></td>
				<td colspan="2" class="input"><input type="text" placeholder=" 비밀번호를 입력해주세요" id="password"
						style="width: 90%; height: 20px"></td>
				<td rowspan="2" class="description">비밀번호는 특수문자 / 문자 / 숫자 포함 형태의
					<br>8~15자리 이내로 입력하셔야 합니다.
				</td>
			</tr>

			<tr>
				<td colspan="2" class="label"><label for="">비밀번호 확인 : </label></td>
				<td colspan="2" class="input"><input type="text" placeholder=" 비밀번호를 입력해주세요" id="passCheck"
						style="width: 90%; height: 20px"></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">이름 : </label></td>
				<td colspan="2" class="input"><input type="text" placeholder=" 이름을 입력해주세요" id="name"
						style="width: 50%; height: 20px"></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">주민등록번호 : </label></td>
				<td colspan="3" class="input"><input type="text" id="userNumber1" style="width: 25%; height: 20px"> -
					<input type="text" id="userNumber2" placeholder="주민번호 뒷자리는 암호화 되어 보관됩니다."
						style="width: 35%; height: 20px"></td>

			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">이메일 : </label></td>
				<td colspan="2" class="input"><input type="text" id="firstEmail" style="width: 40%; height: 20px"> @
					<select style="width: 50%; height: 30px; font-size: 12pt;" id="lastEmail">
						<option value="none" selected>example.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.com">hanmail.com</option>
						<option value="kakao.co.kr">kakao.co.kr</option>
					</select></td>
				<td><button style="width: 150px">인증 메일 보내기</button></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">이메일 확인 : </label></td>
				<td colspan="2" class="input"><input type="text" id="emailCheck" style="width: 40%; height: 20px">  이메일로 온 인증번호를 입력해주세요</td>
				<td class="description"></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">핸드폰 : </label></td>
				<td colspan="2" class="input"><select style="width: 20%; font-size: 12pt;" id="firstPhone">
						<option value="none" selected>01X</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select> - <input type="text" id="midPhone" style="width: 30%"> - <input type="text" id="lastPhone"
						style="width: 30%"></td>
			</tr>
		</table>
		<div style="width: 60%; margin: 50px auto;">
			<div class="terms">
				<label><i class="check icon"></i> 회원 약관</label>
			</div>
			<%@ include file="/views/common/terms1.jsp" %>
			<div style="margin-top: 5px;">
				<input type="checkbox" name="terms1"><label for="terms1">이용약관에 동의합니다.(필수)</label>
			</div>
			<div class="terms">
				<label><i class="check icon" style="margin-top: 50px;"></i>
					개인정보 수집 및 이용동의</label>
			</div>
			<%@ include file="/views/common/terms2.jsp" %>
			<div style="margin-top: 5px;">
				<input type="checkbox" name="terms1"><label for="terms1">개인정수 수집·이용에 동의합니다.(필수)</label>
			</div>
			<div class="terms">
				<label><i class="check icon" style="margin-top: 50px;"></i>
					유치원 정부 지원금 및 결제 고지</label>
			</div>
			<%@ include file="/views/common/terms3.jsp" %>
			<div style="margin-top: 5px;">
				<input type="checkbox" name="terms1"><label for="terms1">유치원 정부 지원금 및 결제 고지를 확인하였습니다.(필수)</label>
			</div>
		</div>
		<div style="margin-left: 42%; margin-bottom:50px;">
			<input type="submit" value="다음" class="submit"> <input type="button" value="취소" style="margin-left: 50px;"
				class="cancel"  onclick="location.href='<%=request.getContextPath()%>/index.jsp'">
		</div>
	</form>
	<%@ include file="/views/common/footer.jsp" %>
</body>

</html>