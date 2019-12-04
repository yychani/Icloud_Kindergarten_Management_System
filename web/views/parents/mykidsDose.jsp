<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	
	<title>Document</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>


<!-- 글꼴  -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- dater picker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- timepicker2  -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<style>
.ui, .olive, .inverted, .segment, .outBox{
font-family: 'Noto Sans KR', sans-serif;
}
h1{
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
}
</style>
</head>
<body style="overflow-x: hidden">
<%@ include file="/views/common/parentsMenu.jsp"%>
		<div class="ui olive inverted segment outBox" style="margin:5% 30%;">
			<div class="ui raised segment">
			<br>
					<h1 align="center">투약의뢰서 작성</h1>	
					<form id="dosingRequest" action="<%=request.getContextPath()%>/views/parents/mykidsDoseList.jsp" onsubmit="return true">
							<table align="center" class="doesTable">
								<tr>
									<td><label>유아명 : </label></td>
									<td><div class="ui mini icon input">
											<input type="text" placeholder="유아명 입력" name="kidsName">
										</div></td>
								</tr>
								<tr>
									<td><label>증상명 : </label></td>
									<td>
										<div class="ui mini icon input">
											<input type="text" placeholder="증상명 입력" name="disease">
										</div>
									</td>
								</tr>
								<tr>
									<td><label>약의 종류 및 용량 : </label></td>
									<td>
										<div class="ui mini icon input">
											<input type="text" placeholder="약의 종류 및 용량 입력" name="medician">
										</div>
									</td>
								</tr>
								<tr>
									<td><label>약의 보관 방법 :</label></td>
									<td>
	
										<div class="ui form">
											<div class="grouped fields">
												<div class="field">
													<div class="ui radio checkbox">
														<input type="radio" name="keepMedicine" value="상온"
															id="ordinary" checked="checked"> <label
															for="ordinary">상온</label>
													</div>
	
													<div class="ui radio checkbox">
														<input type="radio" name="keepMedicine" value="냉온"
															id="freeze"> <label for="freeze">냉온</label>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td><label>투약 의뢰 기간 : </label></td>
									<td>
										<div class="ui mini icon input">
											<input type="date" id="dosingPeriodStart">~ <input
												type="date" id="dosingPeriodEnd">
										</div>
									</td>
								</tr>
								<tr>
									<td><label>투약 의뢰 시간 : </label></td>
									<td>
										<div id="dosingTimeArea" class="ui mini icon input">
											<input class="timepicker" id='dosingTime' name='dosingTime' >
											<button class="ui icon button timeplus" onclick="return false">
											<i class="plus icon"></i>
										</button>
										</div>
										
									</td>
								</tr>
								<tr>
									<td><label>비고 : </label></td>
									<td><div class="ui mini icon input">
											<input type="text" placeholder="내용 입력" name="note">
										</div></td>
								</tr>
								<tr>
									<td><label>의뢰자 : </label></td>
									<td>
										<div class="ui mini icon input">
											<input type="text" placeholder="의뢰자 이름 입력" name="requestor">
										</div>
									</td>
								</tr>
								<tr>
									<td></td>
								</tr>
							
							</table>
							<div align="center">
							<label align="center">*투약으로 인한 책임은 의뢰자에게 있습니다.</label> <br> <Br>
								<button type="submit" class="ui green basic button" >제출하기</button>

								<button type="button" class="ui teal basic button" onclick="insertDosingRequest();">투약의뢰 리스트보기</button>
							</div>
							
						</form>
							
						<script>
							function insertDosingRequest(){
								location.href="<%=request.getContextPath()%>/views/parents/mykidsDoseList.jsp";
							}
							
						</script>
			</div>
			</div>
			<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script> 
			<script>
						/* 투약시간 선택 */
						$('.timepicker').timepicker({
				timeFormat : 'h:mm p',
				interval : '10',
				minTime : '10',
				maxTime : '6:00pm',
				defaultTime : '11',
				startTime : '09:00',
				dynamic : true,
				dropdown : true,
				scrollbar : true
			}); 
			</script>
	
</body>
</html>