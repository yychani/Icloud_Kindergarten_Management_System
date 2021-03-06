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
	}
	.name {
		width: 700px !important;
		height: 30px !important;
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
	#pwdChange {
		top:25%;
		left:27%;
	}
	.ui.small.modal {
		width:730px !important;
	}
	.ui.labeled.icon.button>.icon:before {
		top: 67% !important; 
	}
	#tb {
		text-align: center;
	}
	#tbarea {
		width:60%;
		margin: 0 20%;
	}
	a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	#tb a:hover { color: orangered !important;}
</style>
</head>
<body> 
	<%@ include file="/views/common/teacherMenu.jsp" %>
	<div class="list">
		<h1 align="center">해바라기반 원아 목록</h1>
	</div>
		<input type="hidden" id="tno" value="<%= loginUser.getMemberNo() %>" />
		<div id="tbarea">
		<table id="tb" class="main ui celled table" align="center">
			<tr style="background:#e3fad0; height:50px">
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
	
	<div class="ui fullscreen modal" id="infomodal">
  		<div class="header" style="text-align: center;">필수 정보 입력</div>
  		<div class="content">
  		<form action="" method="post" enctype="multipart/form-data" id="infoForm">
    		<table id="infotable" class="ui black table" style="width:1200px; margin: 0 auto;">
    			<tr>
    				<td>변경할 비밀번호</td>
    				<td style="width:720px"><div class="ui input"><input type="password" id="password" name="userPwd" /><span id="pass1Check" style="line-height: 2.5em; margin-left:20px"></span></div></td>
    				<td rowspan="4" style="text-align:center"> <img src="<% if(t.getImgSrc() == null) { %>
																			<%=request.getContextPath() %>/images/nullUser.png
																		 <% } else { %>
																			<%=t.getImgSrc()%>
																		 <% } %>" width="300px" id="tcImg"></td>
    			</tr>
    			<tr>
    				<td>비밀번호 확인</td>
    				<td><div class="ui input"><input type="password" id="passCheck" name="passCheck" /><span id="pass2Check" style="line-height: 2.5em; margin-left:20px"></span></div></td>
    			</tr>
    			<tr>
    				<td>핸드폰번호</td>
    				<td>
    					<div class="ui input" style="width:10%">
	    					<select style="width:100%; height:37.89px; border-radius:4px; font-size:14px; padding-left: 10px;" id="tel1" name="tel1">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
						</div>
						 - <div class="ui input"><input type="text" id="tel2" name="tel2" maxlength="4" style="width: 30%"></div>
						 - <div class="ui input"><input type="text" id="tel3" name="tel3" maxlength="4" style="width: 30%"></div>
					<input type="hidden" id="tel21" name="tel21">
					<input type="hidden" id="tel31" name="tel31"></td>
    			</tr>
    			<tr>
    				<td>이메일</td>
    				<td>
    				<div class="ui input">
    					<input type="text" id="firstEmail" name="firstEmail">
    					</div>
						@ <select style="width:25%; height:37.89px; border-radius:4px; font-size:14px; padding-left: 10px;" id="lastEmail" name="lastEmail">
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
    				<td><div class="ui input"><input type="text" id="desc" name="desc" style="width:100%" /></div></td>
    				<td style="width:340px"><div align="center"><div class="ui secondary button" id="selectImg">사진선택</div><input type="file" id="teacherImg" name="ex" onchange="loadImg(this)"/></div></td>
    			</tr>
    		</table>
   		</form>
  		</div>
  		<div class="actions">
    		<div class="ui positive button" onclick="changeInfo();">변경하기</div>
  		</div>
	</div>

	<div class="ui small modal" id="pwdChange">
	  <i class="close icon"></i>
	  <div class="header">
	    	비밀번호 변경
	  </div>
	  <div class="image content" style="display:inline-block; padding:1.25rem 1.5rem">
    	<div class="ui input">
    		<input type="hidden" name="rno" id="rno" value="<%= loginUser.getMemberRno() %>"/>
	    	<span style="line-height: 37px;">변경할 비밀번호 : </span> &nbsp;&nbsp;
	    	<input type="password" id="password1" name="userPwd" /> &nbsp;&nbsp;
	    	<span style="line-height: 37px;" id="pass1Check1"></span>
    	</div>
	    <br />
	    <br />
	    <div class="ui input">
	    	<span style="line-height: 37px;">비밀번호 확인 : </span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	<input type="password" id="passCheck1" /> &nbsp;&nbsp;
	    	<span style="line-height: 37px;" id="pass2Check1"></span>
	    </div>
	  </div>
	  <div class="actions">
	    <div class="ui positive right labeled icon button" id="okbtn">
	      	확인
	      <i class="checkmark icon"></i>
	    </div>
	  </div>
	</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
	<script> 
    $(function() {
    	<% if(loginUser.getMemberRno() != null) {%>
    	if('<%= loginUser.getMemberRno() %>' != 'null' && <%= loginUser.getMemberRno().endsWith("~") %>) {
    		alert("임시 비밀번호로 로그인 하셨습니다.\n비밀번호를 변경해주세요.");
    		$('#pwdChange').modal('show');
    	}
    	<% } %>
    });
     
	 $(document).ready(function(){
        $("#passCheck1").keypress(function (e) {
         	if (e.which == 13){
         		$('#pwdChange').modal('hide');
         		updatePwd();
         	}
     	});
 	});
 
    $("#okbtn").click(function() {
    	updatePwd();
    });
    
    function updatePwd() {
    	var rno = $("#rno").val();
    	$.ajax({
    		url:"<%= request.getContextPath() %>/updatePwd.me",
    		type:"post",
    		data: {
    			mno:<%= loginUser.getMemberNo() %>,
    			rno:rno,
    			userPwd:$("#password1").val()
    		},
    		success:function(data) {
    			if(data == 't') {
    	console.log(rno);
    				alert("변경완료")
    			}
    		},
    		error:function() {
    			console.log("실패")
    		}
    	});
    }
    
    
	$(function(){
		if('<%= loginUser.getMemberRno() %>' == 'null' || '<%= loginUser.getMemberRno() %>' == "") {
			$('.fullscreen.modal').modal('show');
		}
	});
	
	$(function() {
		$("#teacherImg").hide();
	});
	
	$("#selectImg").click(function () {
		$("#teacherImg").click();
	}) ;
	
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
	
	$("#password1").keyup(function(){
		if (!pattern1.test($('#password1').val()) || !pattern2.test($('#password1').val()) || !pattern3.test($('#password1').val()) || $("#password1").val().length <= 8) {
			$("#pass1Check1").css({"color":"tomato"},{"height":"30px"});
			$("#pass1Check1").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");	
		} else {
			$("#pass1Check1").css({"color":"green"});
			$("#pass1Check1").html("사용가능한 비밀번호 입니다.");	
		} 
	});
	
	$("#passCheck1").keyup(function(){
		if ($('#password1').val() == $('#passCheck1').val()) {
			$("#pass2Check1").css({"color":"green"});
			$("#pass2Check1").html("비밀번호가 일치합니다.");	
		} else {
			$("#pass2Check1").css({"color":"tomato"});
			$("#pass2Check1").html("비밀번호가 일치하지 않습니다.");	
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