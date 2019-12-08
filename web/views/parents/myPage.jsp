<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.oracle5.member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginMember");
%>
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
#kidInfoBtn{
	float:left;
}
#leaveBtn{
	float: right;
}

.ui.pointing.label {
	color: rgb(209, 57, 57);
}
</style>
</head>

<body style="overflow-x: hidden">

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
						<td><%= loginUser.getMemberId() %></td>
					</tr>
					<tr>
						<td style="width: 50px;">이름</td>
						<td style="width: 20px">:</td>
						<td><%= loginUser.getMemberName() %></td>
					</tr>
					<tr>
						<td style="width: 50px;">주소</td>
						<td style="width: 20px">:</td>
						<td><div class="ui input">
								<input type="text" id="address" value="" readonly>
							</div></td>
					</tr>
					<tr>
					<% 
					/* 이메일 & 전화번호 split */
					String email[] = loginUser.getEmail().split("@");
					String phone[] = loginUser.getPhone().split("-");
					%>
						<td style="width: 50px;">이메일</td>
						<td style="width: 20px">:</td>
						<td><%= email[0]%>@<%= email[1] %></td>
					</tr>
					<tr>
						<td style="width: 50px;">핸드폰</td>
						<td style="width: 20px">:</td>
						<td><%= phone[0] %>-<%= phone[1] %>-<%= phone[2] %></td>
					</tr>
				</table>
				<div class="btns" align="center">
					<button type="button" id="kidInfoBtn" class="ui yellow basic button"
						onclick="location.href='<%=request.getContextPath()%>/views/parents/myPageModKid.jsp'">아이정보</button>
					<button type="button" id="psssChangeBtn"
						class="ui positive basic button" onclick="passChangeModal();">비밀번호
						변경</button>
					<button type="button" id="infoChangeBtn"
						class="ui positive basic button" onclick="InfoChangeModal();">회원정보
						수정</button>
						<button type="button" class="ui grey basic button" id="leaveBtn" onclick="leaveModal();">탈퇴하기</button>
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
				<br> <br> <label>주소 </label>
				<div class="ui input">
					<input type="text" placeholder="변경할 주소">
				</div>
				<br> <br> <label>이메일 </label>
				<div class="ui input">
					<input type="email" placeholder="변경할 이메일">@<input
						type="email" placeholder="변경할 이메일">
				</div>
				<br> <br> <label>휴대폰 </label>
				<div class="ui input">
					<input type="tel" placeholder="">-<input type="tel"
						placeholder="">-<input type="tel" placeholder="">
				</div>
			</form>
			<br> <br>
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
			<form id="passChangeForm" action="<%=request.getContextPath()%>/passChange.me" method="post" onsubmit="return true;">
			<input type="hidden" value="<%= loginUser.getMemberId() %>" name="userId">
				<div class="currentPass">
					<br> <label>현재 비밀번호 입력</label><br> <br>
					<div class="ui input">
						<input type="password" name="currentPass" placeholder="현재 비밀번호">
					</div>
				</div>
				<br>
				<div class="changePass">
					<div class="field" placeholder="Last Name">
						<div class="ui pointing below label"><label id="passREX">비밀번호는 특수문자 / 영문자 / 숫자
							포함 형태의 8~15자리 이내로 입력하셔야 합니다.</label></div>

					</div>

					<label>변경할 비밀번호 변경</label><br> <br>
					<div class="ui input">
						<input type="password" id="changePass1" name="changePass1" placeholder="새 비밀번호"><br>
					</div>
					<br> <br>
					<div class="ui input">
						<input type="password" id="changePass2" name="changePass2" placeholder="새 비밀번호 확인">
					</div>
					<br>
					<div class="ui pointing label" id="passCheck"><label id="passCheck"></label></div>
				</div>
				<div class="actions">
					<br> <br>
					<div class="ui black deny button">취소</div>
					<button type="submit" onclick="passInvalidate();">변경하기</button>
					<div class="ui positive right labeled icon button" onclick="passInvalidate();">
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
		//비밀번호 정규식 확인
		$("#changePass1").keydown(function(){
			if (!pattern1.test($('#changePass1').val()) || !pattern2.test($('#changePass1').val()) || !pattern3.test($('#changePass1').val())) {
				console.log("비밀번호 정규식 비일치");
				$("#passREX").css({"color":"tomato"});
				$("#passREX").html("비밀번호는 8자리 이상 문자, 숫자, <br>특수문자로 구성하여야 합니다.");	
				inval_Arr[2] = false;
			} else {
				console.log("비밀번호 정규식 일치");
				$("#passREX").css({"color":"green"});
				$("#passREX").html("사용가능한 비밀번호 입니다.");	
				inval_Arr[2] = true;
			} 
			console.log($(this).val());
		});
		
		
		//비밀번호 일치 확인
		$("#changePass2").keyup(function(){
			if ($('#changePass1').val() == $('#changePass2').val()) {
				console.log("비빌번호 일치");
				$("#passCheck").css({"color":"green"});
				$("#passCheck").html("비밀번호가 일치합니다.");	
				inval_Arr[3] = true;
			} else if ($('#changePass1').val() != $('#changePass2').val()){
				console.log("비밀번호 불일치");
				$("#passCheck").css({"color":"tomato"});
				$("#passCheck").html("비밀번호가 일치하지 않습니다.");	
				inval_Arr[3] = false;
			}
		});
		
		//비밀번호 변경 버튼
		function passInvalidate(){
			console.log("변경하기 버튼 클릭");
			if($('#changePass1').val() != $('#changePass2').val()){
				alert("비밀번호가 일치하지 않습니다");
				console.log("비밀번호 불일치");
				$('#changePass1').val("");
				$('#changePass2').val("");
				$('#passCheck').val("");
				return false;
			}else if($('#changePass1').val() == $('#changePass2').val()){
				if(pattern1.test($('#changePass1').val()) || pattern2.test($('#changePass1').val()) || pattern3.test($('#changePass1').val())){
					$("#passChangeForm").submit;
					console.log("비밀번호 일치& 정규식 통과");
					return true;
				}
				
			};	
		}
		
	</script>




	<%@ include file="/views/common/chat.jsp"%>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>