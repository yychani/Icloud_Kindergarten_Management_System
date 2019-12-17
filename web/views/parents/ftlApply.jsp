<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.oracle5.member.model.vo.FieldLearning"%>
<%
	FieldLearning fl = (FieldLearning) request.getAttribute("fl");
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

<!-- 글꼴  -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

   
<style>
.ui.card {
	margin: 5% auto !important;
}

tr {
	height: 30px;
}

.header {
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
}

#caution {
	color: rgb(209, 57, 57);
}

.ui.modal>.actions {
	background: #f9fafb;
	padding: 1rem 1rem;
	border-top: 1px solid rgba(34, 36, 38, .15);
	text-align: center;
	margin: auto auto;
}
</style>

</head>

<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	 <script>
      $(function() {
    	  $(".li:nth-child(9)").addClass("on");
    	  
          $(".topMenuLi:nth-child(5)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(9)").removeClass("on");
            $(".topMenuLi:nth-child(5)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(9)").addClass("on");
            $(".topMenuLi:nth-child(5)").addClass("on");
         });
      }); 
</script>

	<div class="ui card" align="center">
		<div class="content">
			<div class="header">현장 체험학습</div>
		</div>
		<div class="content">
			<div class="ui small feed">
				<div class="event">
					<div class="content">
						<div class="summary" align="center">
							<table>
								<tr>
									<td>일시 :</td>
									<td><%= fl.getFtlDate() %></td>
								</tr>
								<tr>
									<td>장소 :</td>
									<td><%= fl.getField() %></td>
								</tr>
								<tr>
									<td>참가비 :</td>
									<td><%= fl.getFtlPay() %> 원</td>
								</tr>
								<tr>
									<td>준비물 :</td>
									<td><%= fl.getMaterials() %></td>
								</tr>
							</table>
							<p id="caution">*자세한 사항은 공지사항을 참조해주세요.</p>
						</div>
					</div>
				</div>


			</div>
		</div>
		<div class="extra content">
			<button class="ui button" onclick="modalPop();">신청하기</button>
		</div>
	</div>

	<!-- 신청하기 버튼 모달 -->
	<div class="ui mini modal">
	
		<div class="ui icon header">현장체험 학습을 신청하시겠습니까?</div>
		<form id="kidNameForm" action="<%=request.getContextPath()%>/ftlApply.me" onsubmit="return ftlSubmit();">
		<div class="content" align="center">
		<br><br><br>
			<div class="ui input">
				
					<p>원아명 :</p>
					<input type="text" placeholder="원아명 입력" id="kidName" name="kidName">
				
			</div>
		</div>
		<div class="actions" align="center">
		<br><br>
			<div class="ui buttons" align="center">
				<button class="ui button">취소</button>
				<div class="or"></div>
				<button type="submit" class="ui positive button">신청</button>
			</div>
			<br><br><br>
		</div>
		</form>
	</div>

	<script>
		//모달팝업
		function modalPop() {
			$('.mini.modal').modal('show');
		}

		//신청하기 버튼
		function ftlSubmit() {
			if($("#kidName").val()==""){
				alert("원아명을 입력해주세요.");
				return false;
			} else {
				return true;
			}
		}
	</script>






	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>