<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.net.InetAddress"%>
<% InetAddress inet = InetAddress.getLocalHost();
		String svrIP = inet.getHostAddress();
		int svrPort = request.getServerPort();%>
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

button, .submit {
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

input[type=radio], input[type=checkbox] {
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
<script>
	$(function() {
		$("#emailCheck").click(function(){
			var fisrtEmail = $("#firstEmail").val();
			var lastEmail = $("#lastEmail").val();
			var email = fisrtEmail + "@" + lastEmail;
				$.ajax({
					url : '<%=request.getContextPath()%>/emailCheck.do',
					type : 'post',
					data : {email:email},
					success : function(data) {
						alert(email + "로 인증번호를 전송하였습니다.")
						$("#emailCheckTextConfirm").val(data);
					},
					error : function(data) {
						alert("메일 전송에 실패하였습니다.")
					}
				});
			});

		$("#idCheckBtn").click(function() {
			var userId = $("#userId").val();
			$.ajax({
				url : "/main/userIdCheck.me",
				type : "post",
				data : {userId:userId},
				success : function(data) {
					$("#idCheck").html(data);
				}
			});
		});
	});
</script>
</head>

<body>
	<form action="<%=request.getContextPath()%>/insertParent.me" method="post" onsubmit="return validate();">
		<h1 align="center" style="margin-top: 50px;">회원 가입</h1>
		<table>
			<tr>
				<td colspan="2" class="label"><label for="">아이디 : </label></td>
				<td colspan="2" class="input"><input type="text" placeholder=" ID를 입력해주세요" id="userId" name="userId" style="width: 80%; height: 20px"></td>
				<td><button id="idCheckBtn" onclick="return false;">중복 확인</button></td>
			</tr>
			<tr>
				<td colspan="2"></td>
				<td colspan="2" align="left" id="idCheck" style="height: 9px; padding: 0;"></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">비밀번호 : </label></td>
				<td colspan="2" class="input"><input type="password" placeholder=" 비밀번호를 입력해주세요" id="password" name="userPwd" style="width: 90%; height: 20px"></td>
				<td rowspan="2" class="description">비밀번호는 특수문자 / 영문자 / 숫자 포함 형태의 <br>8~15자리 이내로 입력하셔야 합니다.
				</td>
			</tr>
			<tr>
				<td colspan="2"></td>
				<td colspan="2" align="left" style="height: 9px; padding: 0;"><span id="pass1Check"></span></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">비밀번호 확인 : </label></td>
				<td colspan="2" class="input"><input type="password" placeholder=" 비밀번호를 입력해주세요" id="passCheck" style="width: 90%; height: 20px"></td>
			</tr>
			<tr>
				<td colspan="2"></td>
				<td colspan="2" align="left" style="height: 9px; padding: 0;"><span id="pass2Check"></span></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">이름 : </label></td>
				<td colspan="2" class="input"><input type="text" placeholder=" 이름을 입력해주세요" id="name" name="name" style="width: 50%; height: 20px"></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">주민등록번호 : </label></td>
				<td colspan="3" class="input"><input type="text" id="userNumber1" name="userNumber1" maxlength="6" style="width: 25%; height: 20px">
				 - <input type="password" id="userNumber2" name="userNumber2" maxlength="7" placeholder="주민번호 뒷자리는 암호화 되어 보관됩니다." style="width: 35%; height: 20px"></td>

			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">주소 : </label></td>
				<td colspan="2" class="input"><input type="text" placeholder="주소를 입력해주세요" id="address" name="address" style="width: 80%; height: 20px">
					<input type="hidden" id="address1" name="address1"></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">이메일 : </label></td>
				<td colspan="2" class="input"><input type="text" id="firstEmail" name="firstEmail" style="width: 40%; height: 20px">
					@ <select style="width: 50%; height: 30px; font-size: 12pt;" id="lastEmail" name="lastEmail">
						<option value="none" selected>example.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.com">hanmail.com</option>
						<option value="kakao.co.kr">kakao.co.kr</option>
				</select></td>
				<td><button style="width: 150px" onclick="return false;" id="emailCheck">인증 메일 보내기</button></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">이메일 확인 : </label></td>
				<td colspan="3" class="input"><input type="text" id="emailCheckText" style="width: 40%; height: 20px">
				 이메일로 온 인증번호를 입력해주세요</td>
				<td class="description"><input type="hidden" id="emailCheckTextConfirm"></td>
			</tr>
			<tr>
				<td colspan="2" class="label"><label for="">핸드폰 : </label></td>
				<td colspan="2" class="input"><select style="width: 20%; font-size: 12pt;" id="tel1" name="tel1">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
				</select> - <input type="text" id="tel2" name="tel2" maxlength="4" style="width: 30%">
				 - <input type="text" id="tel3" name="tel3" maxlength="4" style="width: 30%">
					<input type="hidden" id="tel21" name="tel21">
					<input type="hidden" id="tel31" name="tel31"></td>
			</tr>
		</table>
		<div style="width: 60%; margin: 50px auto;">
			<div class="terms">
				<label><i class="check icon"></i> 회원 약관</label>
			</div>
			<%@ include file="/views/common/terms1.jsp"%>
			<div style="margin-top: 5px;">
				<input type="checkbox" name="terms1"><label for="terms1">이용약관에
					동의합니다.(필수)</label>
			</div>
			<div class="terms">
				<label><i class="check icon" style="margin-top: 50px;"></i>
					개인정보 수집 및 이용동의</label>
			</div>
			<%@ include file="/views/common/terms2.jsp"%>
			<div style="margin-top: 5px;">
				<input type="checkbox" name="terms1"><label for="terms1">개인정수
					수집·이용에 동의합니다.(필수)</label>
			</div>
			<div class="terms">
				<label><i class="check icon" style="margin-top: 50px;"></i>
					유치원 정부 지원금 및 결제 고지</label>
			</div>
			<%@ include file="/views/common/terms3.jsp"%>
			<div style="margin-top: 5px;">
				<input type="checkbox" name="terms1"><label for="terms1">유치원
					정부 지원금 및 결제 고지를 확인하였습니다.(필수)</label>
			</div>
		</div>
		<div style="margin-left: 42%; margin-bottom: 50px;">
			<input type="button" id="signupBtn" value="다음" class="submit">
			<input type="button" value="취소" style="margin-left: 50px;"
				class="cancel"
				onclick="location.href='<%=request.getContextPath()%>/index.jsp'">
		</div>
	</form>
	<%@ include file="/views/common/footer.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
	<script>
		checked = $("input:checkbox[name=terms1]:checked").length;

		$("input:checkbox[name=terms1]").change(function() {
			checked = $("input:checkbox[name=terms1]:checked").length;
			if (checked == 3) {
				$("#signupBtn").attr("type", "submit");
			}
		});

		$("#signupBtn").click(function() {
			if (checked != 3) {
				alert("약관에 동의해주세요.");
			}
		});

		// 비밀번호 정규식
		var pattern1 = /[0-9]/; // 숫자 
		var pattern2 = /[a-zA-Z]/; // 문자 
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
		var tel1J = /^01([0|1|6|7|8|9]?)$/;
		var tel2J = /^[0-9]{3,4}$/;
		var tel3J = /^[0-9]{4}$/;
		var rno1 = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
		var rno2 = /^[1-4][0-9]{6}$/;
		
		var inval_Arr = new Array(10).fill(false);
		
		$("#idCheckBtn").click(function(){
			if($("#userId").val() != ""){
				inval_Arr[0] = true;
			}else {
				inval_Arr[0] = false;
			}
		});
		$("#emailCheck").click(function(){
			if($("#firstEmail").val() != ""){
				inval_Arr[9] = true;
			}else {
				inval_Arr[9] = false;
			}
		});
		$("#password").keydown(function(){
			if (!pattern1.test($('#password').val()) || !pattern2.test($('#password').val()) || !pattern3.test($('#password').val())) {
				$("#pass1Check").css({"color":"tomato"});
				$("#pass1Check").html("비밀번호는 8자리 이상 문자, 숫자, <br>특수문자로 구성하여야 합니다.");	
				inval_Arr[2] = false;
			} else {
				$("#pass1Check").css({"color":"green"});
				$("#pass1Check").html("사용가능한 비밀번호 입니다.");	
				inval_Arr[2] = true;
			} 
		});
		$("#passCheck").keyup(function(){
			if ($('#password').val() == $('#passCheck').val()) {
				$("#pass2Check").css({"color":"green"});
				$("#pass2Check").html("비밀번호가 일치합니다.");	
				inval_Arr[3] = true;
			} else {
				$("#pass2Check").css({"color":"tomato"});
				$("#pass2Check").html("비밀번호가 일치하지 않습니다.");	
				inval_Arr[3] = false;
			}
		});
		
		function validate() {
			var msg = "입력한 정보들을 다시 한번 확인해주세요";
			
			if(tel1J.test($("#tel1").val()) && tel2J.test($("#tel2").val()) && tel3J.test($("#tel3").val())){
				inval_Arr[8] = true;
			}else {
				inval_Arr[8] = false;
				msg = "올바른 전화번호를 입력해주세요!";
			}
			if($("#emailCheckText").val() == $("#emailCheckTextConfirm").val()){
				inval_Arr[7] = true;
			}else {
				inval_Arr[7] = false;
				msg = "이메일 인증번호가 일치하지 않습니다!";
			}
			if($("#address").val() != ""){
				inval_Arr[6] = true;
			}else {
				inval_Arr[6] = false;
				msg = "주소를 입력해주세요!";
			}
			if(rno1.test($("#userNumber1").val()) && rno2.test($("#userNumber2").val())){
				inval_Arr[5] = true;
			}else {
				inval_Arr[5] = false;
				msg = "올바른 주민등록번호를 입력해주세요!";
			}
			if($("#name").val() != ""){
				inval_Arr[4] = true;
			}else {
				inval_Arr[4] = false;
				msg = "이름을 입력해주세요!";
			}
			if($("#check").attr("value") == false) {
				inval_Arr[1] = false;
			}else {
				inval_Arr[1] = true;
			}
			var validAll = true;
			for(var i = 0; i < inval_Arr.length; i++){
				if(inval_Arr[i] == false){
					validAll = false;
				}
			}
			
			var address = $("#address").val(); 
		    var passphrase = "1234";
		    var encrypt1 = CryptoJS.AES.encrypt(address, passphrase);
		    var decrypted1 = CryptoJS.AES.decrypt(encrypt1, passphrase);
		 
		    // 암호화 이전의 문자열은 toString 함수를 사용하여 추출할 수 있다.
		    var address1 = decrypted1.toString(CryptoJS.enc.Utf8);
		    
		    $("#address1").val(encrypt1);
		    
		    var tel2 = $("#tel2").val(); 
		    var encrypt2 = CryptoJS.AES.encrypt(tel2, passphrase);
		    var decrypted2 = CryptoJS.AES.decrypt(encrypt2, passphrase );
		 
		    // 암호화 이전의 문자열은 toString 함수를 사용하여 추출할 수 있다.
		    var tel21 = decrypted2.toString(CryptoJS.enc.Utf8);
		    
		   	$("#tel21").val(encrypt2);
		    
		    var tel3 = $("#tel3").val(); 
		    var encrypt3 = CryptoJS.AES.encrypt(tel3, passphrase);
		    var decrypted3 = CryptoJS.AES.decrypt(encrypt3, passphrase );
		 
		    // 암호화 이전의 문자열은 toString 함수를 사용하여 추출할 수 있다.
		    var tel31 = decrypted3.toString(CryptoJS.enc.Utf8);
		    
		    $("#tel31").val(encrypt3);
		    
			if(validAll){ // 유효성 모두 통과
				return true;
			} else{
				alert(msg);
				return false;
			}
		}
	</script>
</body>

</html>