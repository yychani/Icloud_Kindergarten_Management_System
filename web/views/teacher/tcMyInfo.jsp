<%@page import="com.oracle5.member.model.vo.Teacher"%>
<%@page import="com.oracle5.wrapper.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	Teacher t = (Teacher) request.getAttribute("t");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<script>
	$(function() {
		  $(".li:nth-child(1)").addClass("on");
		  
	    $(".topMenuLi:nth-child(5)").addClass("on");
	   
	    $(".topMenuLi").mouseover(function() {
	      $(".li:nth-child(1)").removeClass("on");
	      $(".topMenuLi:nth-child(5)").removeClass("on");
	   });
	  
	    $(".topMenuLi").mouseleave(function() {
	      $(".li:nth-child(1)").addClass("on");
	      $(".topMenuLi:nth-child(5)").addClass("on");
	   });
	}); 
</script>
<style>
	#infomodal {
		top:10%;
	}
	#passmodal {
		left:25%;
		top:30%;
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
	<div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">내 정보 보기</h1>
    </div>
    <div class="ui card" style="margin:0 auto;" id="card1">
	  <div class="image">
	    <img src="<% if(t.getImgSrc() == null) { %>
					<%=request.getContextPath() %>/images/nullUser.png
				<% } else { %>
					<%=t.getImgSrc()%>
			<% } %>">
	  </div>
	  <div class="content">
	    <a class="header"><%= loginUser.getMemberName() %></a>
	    <div class="meta">
	      <span class="date">Joined in <%= t.getTEntDate() %></span>
	    </div>
	    <div class="description">
	      <%= t.getTDescription() %>
	    </div>
	  </div>
	  <div class="extra content">
	    <button class="ui button" onclick="showModal()">수정하기</button>
	  </div>
	</div>
	
	
	<div class="ui basic modal" id="passmodal">
  		<div class="ui icon header">
	    	<i class="key icon"></i>
	   	 	현재 비밀번호를 입력해주세요.
  		</div>
  		<div class="content ui input" align="center">
  			<input type="password" id="currentPass1" name="currentPass1" />
  		</div>
  		<div class="actions">
    		<div class="ui red basic cancel inverted button">
	      		<i class="remove icon"></i>
	      		No
    		</div>
	    	<div class="ui green ok inverted button" onclick="checkpass()">
	      		<i class="checkmark icon"></i>
	      		Yes
	    	</div>
  		</div>
	</div>
	
	
	<div class="ui fullscreen modal" id="infomodal">
  		<div class="header" style="text-align: center;">필수정보입력</div>
  		<div class="content">
  		<form action="" method="post" enctype="multipart/form-data" id="infoForm">
    		<table id="infotable" class="ui black table" style="width:70%; margin: 0 auto;">
    			<tr>
    				<td>현재 비밀번호</td>
    				<td><input type="password" id="currentPass" name="currentPass" /></td>
    				<td rowspan="4" style="text-align:center"><img src="/main/images/nullUser.png" width="300px" /></td>
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
	
	
    <%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
    <script>
    	function showModal() {
    		$(".basic.modal").modal('show');
    	}
    	
    	function checkpass() {
    		var pass = $("#currentPass1").val();
    		
    		$.ajax({
    			url:"encPass.do",
    			type:"post",
    			data:{
    				pass
    			},
    			success:function(data) {
    				if(data == "<%= loginUser.getMemberPwd() %>") {
    					$('.fullscreen.modal').modal('show');
    				}
    			},
    			error:function() {
    				console.log("실패")
    			}
    		});
    	}
    	
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
</body>
</html>