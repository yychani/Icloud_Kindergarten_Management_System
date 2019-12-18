<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	String bn = (String) request.getAttribute("bn");
	ArrayList<Children> list = (ArrayList<Children>) request.getAttribute("list");
	Teacher t = (Teacher) request.getAttribute("t");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 메인페이지</title>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
	.main {
		text-align: center;
		margin: 50 auto;
	}
	.list{
		padding: 50px;
	}
	.no {
		width: 100px !important;
		height: 30px !important;
		border-right: 1px solid black;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}
	.name {
		width: 700px !important;
		height: 30px !important;
		border-left: 1px solid black;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}
	.ui .modal {
		top:10%;
	}
	#infotable {
		height: 500px;
	}
	#infotable td {
		height: 80px;
		max-height: 30px;
	}
	#infotable td>input {
		height: 30px;
	}
</style>
</head>
<body> 
	<%@ include file="/views/common/teacherMenu.jsp" %>
	<div class="list">
		<div style="margin: 0 15%;">
 		<h1 align="center" style="text-decoration: underline; text-underline-position: under;"><%= bn %>반 원아 목록</h1>
 		</div>
		<input type="hidden" id="tno" value="<%= loginUser.getMemberNo() %>" />
		<table class="main" align="center">
			<tr>
				<th class="no">No.</th>
				<th class="name">이름</th>
			</tr>
			<% for(int i = 0; i < list.size(); i++) { %>
			<tr>
				<td class="no"><%= i + 1 %> <input type="hidden" id="cid" value="<%= list.get(i).getCId() %>" /></td>
				<td class="name"><a href="<%= request.getContextPath() %>/views/teacher/tcFeed.jsp?cid=<%= list.get(i).getCId() %>&pno=<%= list.get(i).getPno() %>"><%= list.get(i).getName() %></a></td> 
			</tr>
			<% } %>
		</table>
	</div>
	
	<div class="ui fullscreen modal">
  		<div class="header" style="text-align: center;">필수정보입력</div>
  		<div class="content">
  		<form action="" method="post" enctype="multipart/form-data" id="infoForm">
    		<table id="infotable" class="ui black table" style="width:70%; margin: 0 auto;">
    			<tr>
    				<td>현재 비밀번호</td>
    				<td><input type="password" id="currentPass" name="currentPass" /><br /><span id="currPassCheck"></span></td>
    				<td rowspan="5" style="text-align:center"><img src="<% if(t.getImgSrc() == null) { %>
																			<%=request.getContextPath() %>/images/nullUser.png
																		 <% } else { %>
																			<%=t.getImgSrc()%>
																		 <% } %>" width="300px" id="tcImg"/></td>
    			</tr>
    			<tr>
    				<td>변경할 비밀번호</td>
    				<td><input type="password" id="password" name="userPwd" /><br><span id="pass1Check"></span></td>
    			</tr>
    			<tr>
    				<td>비밀번호 확인</td>
    				<td><input type="password" id="passCheck" name="passCheck" /><br><span id="pass2Check"></span></td>
    			</tr>
    			<tr>
    				<td>주민등록번호</td>
    				<td>
    					<input type="text" id="userNumber1" name="userNumber1" maxlength=6 /> - 
    					<input type="password" id="userNumber2" name="userNumber2" maxlength=7 />
    				</td>
    			</tr>
    			<tr>
    				<td>핸드폰번호</td>
    				<td>
    					<select style="width: 20%; height:30px;" id="tel1" name="tel1">
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
    			<tr>
    				<td>이메일</td>
    				<td>
    					<input type="text" id="firstEmail" name="firstEmail">
						@ <select style="width: 30%; height: 30px; font-size: 12pt;" id="lastEmail" name="lastEmail">
						<option value="none" selected>example.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.com">hanmail.com</option>
						<option value="kakao.co.kr">kakao.co.kr</option>
						</select>
					</td>
					<td><div align="center"><input type="file" id="teacherImg" name="ex" onchange="loadImg(this)"/></div></td>
    			</tr>
    			<tr>
    				<td>교사 한줄 소개</td>
    				<td colspan="2"><input type="text" id="desc" name="desc" /></td>
    			</tr>
    		</table>
   		</form>
  		</div>
  		<div class="actions">
    		<div class="ui button" onclick="changeInfo();">변경하기</div>
  		</div>
	</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
	<script>
	$(function(){
		if(<%= loginUser.getMemberRno() %> == null) {
			$('.fullscreen.modal').modal('show');
		}
	});
	
	
	var pattern1 = /[0-9]/; // 숫자 
	var pattern2 = /[a-zA-Z]/; // 문자 
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자

	$("#password").keyup(function(){
		if (!pattern1.test($('#password').val()) || !pattern2.test($('#password').val()) || !pattern3.test($('#password').val()) || $("#password").val().length <= 8) {
			$("#pass1Check").css({"color":"tomato"},{"height":"30px"});
			$("#pass1Check").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");	
		} else {
			$("#pass1Check").css({"color":"green"});
			$("#pass1Check").html("사용가능한 비밀번호 입니다.");	
		} 
	});
	
	$("#passCheck").keyup(function(){
		if ($('#password').val() == $('#passCheck').val()) {
			$("#pass2Check").css({"color":"green"});
			$("#pass2Check").html("비밀번호가 일치합니다.");	
		} else {
			$("#pass2Check").css({"color":"tomato"});
			$("#pass2Check").html("비밀번호가 일치하지 않습니다.");	
		}
	});
	
	
	function changeInfo() {
		var passphrase = "1234";
		
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
	    
	    var form = $("#infoForm")[0];
	    var formdata = new FormData(form);
	    
	    $.ajax({
	    	url:"updateTeacherInfo.me",
	    	type:"post",
	    	processData:false,
	    	contentType:false,
	    	data:formdata,
	    	success:function(data) {
	    		if(data === '성공') {
	    			$('.fullscreen.modal').modal('hide');
	    		} else if(data === '실패') {
	    			alert("입력값을 확인해 주세요");
	    		} else if(data === '오류') {
	    			alert("처리 중 오류 발생");
	    			$('.fullscreen.modal').modal('hide');
	    		}
	    	},
	    	error:function() {
	    		console.log("실패");
	    	}
	    });
	}
	
	function loadImg(value) {
		if(value.files && value.files[0]) {
			console.log(value)
			var reader = new FileReader();
			
			reader.onload = function(e) {
				$("#tcImg").prop("src", e.target.result);
			}
			
			reader.readAsDataURL(value.files[0]);
		}
	}
	
	$("#currentPass").keyup(function() {
		var pass = $("#currentPass").val();
		
		$.ajax({
			url:"encPass.do",
			type:"post",
			data:{
				pass:pass
			},
			success:function(data) {
				if(data == "<%= loginUser.getMemberPwd() %>") {
					$("#currPassCheck").css({"color":"green"});
					$("#currPassCheck").html("비밀번호가 일치합니다.");	
				} else {
					$("#currPassCheck").css({"color":"tomato"},{"height":"30px"});
					$("#currPassCheck").html("비밀번호가 일치하지 않습니다.");	
				} 
			},
			error:function() {
				console.log("실패")
			}
		});
	});
	</script>

    <%@ include file="/views/common/footer.jsp" %>
    <%@ include file="/views/common/chat.jsp" %>
</body>
</html>