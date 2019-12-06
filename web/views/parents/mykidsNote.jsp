<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
#outBox {
	margin: 0 20%;
}
</style>


</head>
<body>
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h1 align="center">내아이 알림장</h1>



	<div class="ui olive segment" id="outBox" align="center">
		<br>
		<h2>해바라기 반 알림장</h2>
		<p>박건후</p>
		<div class="ui mini icon input">
			<input type="date" id="today">
		</div>
		<div class="ui piled segment">
			<h4 class="ui header">원장님 알림사항</h4>
			<p>안녕하세요 떡잎유치원 원장 ㅇㅇㅇ입니다. 20xx년 xx월 xx일 ~ 로 현장학습 예정입니다. 가정통신문
				참조하시어 참가여부 회신 부탁드립니다.</p>
		</div>

		<div class="ui piled segment">
			<h4 class="ui header">선생님 알림사항</h4>
			<p>오늘 하루는 아이 감각 키우기 활동을 했어요~ 많은 자연물들과 사물들을 만져보며 감각을 느껴보는 시간을
				가졌답니다!~</p>
		</div>

		<div class="ui piled segment">
			<h4 class="ui header">건후 하루 특이사항</h4>
			<p>오늘 하루는 아이 감각 키우기 활동을 했어요~ 많은 자연물들과 사물들을 만져보며 감각을 느껴보는 시간을
				가졌답니다!~</p>
		</div>

		<div class="ui piled segment">
			<h4 class="ui header">준비물</h4>
			<p>준비물 : 개인 수채화 물감 12색 , 파레트 , 수채화 붓 (물통은 유치원에 준비되어 있습니다) 다음주 월요일
				까지 준비물에 이름써서 준비해 주시면 감사하겠습니다.</p>
		</div>

		<div class="ui piled segment">
			<h4 class="ui header">오늘 하루 컨디션</h4>
			<div class="ui form">
				<div class="grouped fields">
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="example2" checked="checked"> <label>좋음</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="example2"> <label>보통</label>
						</div>
					</div>
					<div class="field">
						<div class="ui radio checkbox">
							<input type="radio" name="example2"> <label>나쁨</label>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
	<br>
	<Br>

	<!-- 날짜 선택 -->
	<script>
		$function()
		{
			var rangeDate = 31; // set limit day
			var setSdate, setEdate;
			$("#today").datepicker({
				dateFormat : 'yy-mm-dd',
				minDate : 0,
			});

			$('#datepicker').datepicker('setDate', 'today');

		}
		
		//메뉴바 고정
		$(function() {
		    $(".li1").addClass("on");
		    $(".topMenuLi:nth-child(4)").addClass("on");

		    $(".topMenuLi").mouseover(function() {
		       $(".li1").removeClass("on");
		       $(".topMenuLi:nth-child(4)").removeClass("on");
		    });
		    $(".topMenuLi").mouseleave(function() {
		       $(".li1").addClass("on");
		       $(".topMenuLi:nth-child(4)").addClass("on");
		    });

		 }); 
	</script>

</body>
</html>