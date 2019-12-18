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
<title>내 정보 보기</title>
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
	#infotable {
		height: 500px;
	}
	#infotable td {
		height: 100px;
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
	<br /><br />
	
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
	      		취소
    		</div>
	    	<div class="ui green ok inverted button" onclick="checkpass()">
	      		<i class="checkmark icon"></i>
	      		확인
	    	</div>
  		</div>
	</div>
	
	
	<div class="ui fullscreen modal" id="infomodal">
  		<div class="header" style="text-align: center;">회원정보수정</div>
  		<div class="content">
  		<form action="" method="post" enctype="multipart/form-data" id="infoForm">
    		<table id="infotable" class="ui black table" style="width:70%; margin: 0 auto;">
    			<tr>
    				<td>변경할 비밀번호</td>
    				<td><input type="password" id="password" name="userPwd" /><br><span id="pass1Check"></span></td>
    				<td rowspan="4" style="text-align:center"> <img src="<% if(t.getImgSrc() == null) { %>
																			<%=request.getContextPath() %>/images/nullUser.png
																		 <% } else { %>
																			<%=t.getImgSrc()%>
																		 <% } %>" width="300px" id="tcImg"></td>
    			</tr>
    			<tr>
    				<td>비밀번호 확인</td>
    				<td><input type="password" id="passCheck" name="passCheck" /><br><span id="pass2Check"></span></td>
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
    			</tr>
    			<tr>
    				<td>교사 한줄 소개</td>
    				<td><input type="text" id="desc" name="desc" /></td>
    				<td><div align="center"><input type="file" id="teacherImg" name="ex" onchange="loadImg(this)"/></div></td>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
    <script>
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
		
    	function showModal() {
    		$(".basic.modal").modal('show');
    	}
    	
    	function checkpass() {
    		var pass = $("#currentPass1").val();
    		
    		$.ajax({
    			url:"encPass.do",
    			type:"post",
    			data:{
    				pass:pass
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
    	 	if(tel2 == "") {
    	 		$("#tel21").val(tel2);
    	 	} else {
	    	    var encrypt2 = CryptoJS.AES.encrypt(tel2, passphrase);
	    	    
	    	   	$("#tel21").val(encrypt2);
    	 	}
    	    
    	    var tel3 = $("#tel3").val(); 
    	    if(tel3 == ""){
    	    	$("#tel31").val(tel3);
    	    } else {
	    	    var encrypt3 = CryptoJS.AES.encrypt(tel3, passphrase);
	    	    
	    	    $("#tel31").val(encrypt3);
    	    }
    	    
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
    	    			location.reload();
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
    </script>
</body>
</html>