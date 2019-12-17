<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	String bn = (String) request.getAttribute("bn");
	ArrayList<Children> list = (ArrayList<Children>) request.getAttribute("list");
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
	#infotable td {
		height: 30px;
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
				<td class="name"><a href="<%= request.getContextPath() %>/views/teacher/tcFeed.jsp?cid=<%= list.get(i).getCId() %>"><%= list.get(i).getName() %></a></td> 
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
    				<td><input type="password" id="currentPass" name="currentPass" /></td>
    				<td rowspan="5" style="text-align:center"><img src="/main/images/nullUser.png" width="300px" /></td>
    			</tr>
    			<tr>
    				<td>변경할 비밀번호</td>
    				<td><input type="password" id="password" name="userPwd" /></td>
    			</tr>
    			<tr>
    				<td>비밀번호 확인</td>
    				<td><input type="password" id="userPwd2" name="userPwd2" /></td>
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
					<td><div align="center"><input type="file" id="teacherImg" name="ex"/></div></td>
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
	</script>

    <%@ include file="/views/common/footer.jsp" %>
    <%@ include file="/views/common/chat.jsp" %>
</body>
</html>