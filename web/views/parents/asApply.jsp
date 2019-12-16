<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.oracle5.member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방과후 신청</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<style>
/* .btnArea {
	width: 500px;
	margin: 5% auto;
} */

.outBox {
	/* magin: 10% 20%; */
	margin:10% auto;
	width: 800px;
}
#waiting, #complete{
	background:white;
}

.ui.steps .step.active:after{
	background:white;
}
.title{
	color: #4183c4;
}
</style>

</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>


<div class="outBox" align="center">
	<div class="ui steps" align="center">
		<div class="step">
			<i class="edit outline icon"></i>
			<div class="content">
				<div class="title">방과후 신청</div>
				<div class="description">*매달 신청</div>
			</div>
		</div>
		<div class="active step"  id="waiting">
			<i class="hourglass half icon"></i>
			<div class="content">
				<div class="title">승인 대기</div>
				<div class="description">*승인이 완료되면 매달 1일 방과 후 시작</div>
			</div>
		</div>
		<div class="active step" id="complete">
			<i class="handshake outline icon"></i>
			<div class="content">
				<div class="title">승인 완료</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="btnArea" align="center">
		<button id="asApplyBtn" class="ui olive button" onclick="asApply();">방과 후 신청하기</button>
	</div>
</div>

<!-- 방과 후 신청 버튼 모달 -->
<div class="ui basic modal"  align="center">
  <div class="ui icon header">
    <i class="hand point right outline icon"></i>
    다음 달 방과 후 신청을 하시겠습니까?
  </div>
  <p>원아명을 입력해주세요</p>
  <form action="<%=request.getContextPath()%>/asRequest.me" method="post">
  <input type="hidden" value="<%=loginUser.getMemberNo()%>"
					name="userNo">
	<div class="ui input" align="center">
  <input type="text" name="kidName">
</div>
  <div class="actions" align="center">
    <div class="ui red basic cancel inverted button">
      <i class="remove icon"></i>
      취소
    </div>
      <button type="submit" class="ui inverted green basic button"><i class="checkmark icon"></i>신청</button>
  </div>
  </form>
</div>

<script>
	function asApply(){
		$('.ui.basic.modal')
		  .modal('show')
		;
	}
	
	//메뉴바 고정
	$(function() {
	    $(".li1").addClass("on");
	    $(".topMenuLi:nth-child(3)").addClass("on");

	    $(".topMenuLi").mouseover(function() {
	       $(".li1").removeClass("on");
	       $(".topMenuLi:nth-child(3)").removeClass("on");
	    });
	    $(".topMenuLi").mouseleave(function() {
	       $(".li1").addClass("on");
	       $(".topMenuLi:nth-child(3)").addClass("on");
	    });

	 }); 

</script>



	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>