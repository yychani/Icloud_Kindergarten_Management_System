<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- timepicket-->
<link rel='stylesheet' type='text/css'href='css/timepicki.css'/>
<!-- <script type='text/javascript'src='js/jquery.js'></script> -->
<script type='text/javascript'src='js/timepicki.js'></script>
<script type='text/javascript'src='js/jquery.js'> 
	$('#timepicker').timepicki(); 
</script>
<!-- timepicker2  -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<style>
td {
	border: 1px solid black;
}
.ui-datepicker-trigger{
	height:20px;
	width:20px;
}
</style>
</head>
<body>

	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h1 align="center">내아이 귀가동의서</h1>
	<form>
		<table align="center">
			<tr>
				<td align="center"><h1>귀가 동의서</h1></td>
			</tr>
			<tr>
				<td align="center"><h3>*유아의 귀가 시 아래의 보호자에게 인도하여 주십시오.</h3>
					<p>아래의 보호자 이외의 다른 사람에게 인계할 경우 사전에 반드시 연락을 취하겠습니다.</p></td>
			</tr>
			<tr>
				<td><label>유아명 : </label> <input type="text" name="kidsName"
					placeholder="유아명 입력"></td>

			</tr>
			<tr>
				<td><label>보호자 명 : </label><input type="text"
					name="parentsName" placeholder="보호자 성명 입력">
					<p>(법정대리인 명)</p></td>
			</tr>
			<tr>
				<td><label>인솔자 연락처 : </label>
				<input type="tel" name="phone" id="phone"></td>
			</tr>
			<tr>
				<td>일자: <input type="text" id="datepicker"></td>
			</tr>
			<tr>
				<td><label>귀가 요청 시간 : </label><input class="timepicker" id='timepicker' type='text' name='timepicker'/></td>
			</tr>
			
			
			
			<script>
			$('.timepicker').timepicker({
			    timeFormat: 'h:mm p',
			    interval: '10',
			    minTime: '10',
			    maxTime: '6:00pm',
			    defaultTime: '11',
			    startTime: '09:00',
			    dynamic: true,
			    dropdown: true,
			    scrollbar: true
			});
				$(function() {
					//input을 datepicker로 선언
					$("#datepicker")
							.datepicker(
									{
										dateFormat : 'yy-mm-dd' //Input Display Format 변경
										,
										showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
										,
										showMonthAfterYear : true //년도 먼저 나오고, 뒤에 월 표시
										,
										changeYear : true //콤보박스에서 년 선택 가능
										,
										changeMonth : true //콤보박스에서 월 선택 가능                
										,
										showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
										,
										buttonImage : "<%= request.getContextPath() %>/images/calendar.png" <%--"<img style="width:80px; height:80px;" src="<%=request.getContextPath()%>/images/calendar.png">" --%> /*  "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" */ //버튼 이미지 경로
										,
										buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
										,
										buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
										,
										yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
										,
										monthNamesShort : [ '1', '2', '3', '4',
												'5', '6', '7', '8', '9', '10',
												'11', '12' ] //달력의 월 부분 텍스트
										,
										monthNames : [ '1월', '2월', '3월', '4월',
												'5월', '6월', '7월', '8월', '9월',
												'10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
										,
										dayNamesMin : [ '일', '월', '화', '수',
												'목', '금', '토' ] //달력의 요일 부분 텍스트
										,
										dayNames : [ '일요일', '월요일', '화요일',
												'수요일', '목요일', '금요일', '토요일' ] //달력의 요일 부분 Tooltip 텍스트
										,
										minDate : "0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
										,
										maxDate : "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
									});

					//초기값을 오늘 날짜로 설정
					$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
				});
			</script>

		</table>
	</form>
</body>
</html>