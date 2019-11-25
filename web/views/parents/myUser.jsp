<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>내 정보</title>
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
			background: rgb(177, 177, 177);
			color: black;
			font-weight: bold;
			border: none;
			cursor: pointer;
		}

		button:hover, .submit:hover, .cancel:hover {
			background: rgb(241, 241, 188) !important;
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
<body style="overflow-x:hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<form action="<%=request.getContextPath() %>" method="post">
		<h1 align="center" style="margin-top: 50px;">내 정보</h1>
		<table>
			<tr>
				<td colspan="2" class="label"><label for="">아이디 : </label></td>
				<td colspan="2" class="input"><input type="text"  id="userId" name="userId"
						style="width: 80%; height: 20px; background:rgb(224, 224, 224)" readonly></td>
				<td rowspan="3" style="width: 200px; height: 200px">
                <div class="kidFace" style="vertical-align: middle;"><img class="kidFace hidden" id="kidFace"
                            style="width: 119px; height: 157px; margin: 23px 40px;"></div>
                </td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">비밀번호 : </label></td>
				<td colspan="2" class="input"><input type="text" placeholder=" 비밀번호 입니다 임시" id="password"
						style="width: 90%; height: 20px; background:rgb(224, 224, 224)" readonly></td>
				<td rowspan="2" class="description">
				</td>
			</tr>

			<tr>
				<td colspan="2" class="label"><label for="">이름 : </label></td>
				<td colspan="2" class="input"><input type="text" placeholder=" 박주호" id="name"
						style="width: 50%; height: 20px;  background:rgb(224, 224, 224)" readonly></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">주민등록번호 : </label></td>
				<td colspan="3" class="input"><input type="text" id="userNumber1" style="width: 25%; height: 20px; background:rgb(224, 224, 224)"> -
					<input type="text" id="userNumber2" 
						style="width: 35%; height: 20px; background:rgb(224, 224, 224)" readonly></td>

			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">이메일 : </label></td>
				<td colspan="2" class="input"><input type="text" id="firstEmail" style="width: 40%; height: 20px; background:rgb(224, 224, 224)"> @
					<select style="width: 50%; height: 30px; font-size: 12pt; background:rgb(224, 224, 224)" id="lastEmail">
						<option value="none" selected>example.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.com">hanmail.com</option>
						<option value="kakao.co.kr">kakao.co.kr</option>
					</select></td>
				
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">핸드폰 : </label></td>
				<td colspan="2" class="input"><select style="width: 20%; font-size: 12pt; background:rgb(224, 224, 224)" id="firstPhone">
						<option value="none" selected>01X</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
					</select> - <input type="text" id="midPhone" style="width: 30%; background:rgb(224, 224, 224)" readonly> - <input type="text" id="lastPhone"
						style="width: 30%"></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">성별 : </label></td>
				<td colspan="2" class="input"><input type="text" name="gender" style="background:rgb(224, 224, 224)" readonly>
				</td>
			</tr>
		</table>
		<div style="margin-left: 42%; margin-bottom:50px;">
			<input type="button" value="수정하기" class="submit" onclick="location.href='myUserMod.jsp'"> <input type="button" value="취소" style="margin-left: 50px;"
				class="cancel"  onclick="location.href='/index.jsp'">
		</div>
</form>
	<script>
    $(function() {
        $(".li1").addClass("on");
        $(".topMenuLi:nth-child(5)").addClass("on");

        $(".topMenuLi").mouseover(function() {
           $(".li1").removeClass("on");
           $(".topMenuLi:nth-child(5)").removeClass("on");
        });
        $(".topMenuLi").mouseleave(function() {
           $(".li1").addClass("on");
           $(".topMenuLi:nth-child(5)").addClass("on");
        });

     }); 
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>

</html>