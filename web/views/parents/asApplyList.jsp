<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
	width: 1000px;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	background-color: white;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
}
</style>

</head>
<body style="overflow-x: hidden">

	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h1 align="center">방과후 신청 리스트</h1>

	<div id="totalList" align="center">
		<button class="accordion">2019-10-20</button>
		<div class="panel">

				<table align="center" class="doesTable">
					<tr>
						<td><label>유아명 : </label></td>
						<td><label>박건후</label></td>
					</tr>
					<tr>
						<td><label>증상명 : </label></td>
						<td><label>감기</label>
						</td>
					</tr>
					<tr>
						<td><label>약의 종류 및 용량 : </label></td>
						<td><label>해열제 및 감기약 식후 한알씩</label>
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
								<input class="timepicker" id='dosingTime' name='dosingTime'>
								<button class="ui icon button timeplus" onclick="return false">
									<i class="plus icon"></i>
								</button>
							</div>

						</td>
					</tr>
					<tr>
						<td><label>비고 : </label></td>
						<td><label>약먹기 싫어하는데 잘 달래서 먹여주세요~~</label></td>
					</tr>
					<tr>
						<td><label>의뢰자 : </label></td>
						<td><label>박주호</label>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>

				</table>

		</div>

		<button class="accordion">2019-10-01</button>
		<div class="panel">
				<table align="center" class="doesTable">
					<tr>
						<td><label>유아명 : </label></td>
						<td><label>박건후</label></td>
					</tr>
					<tr>
						<td><label>증상명 : </label></td>
						<td><label>감기</label>
						</td>
					</tr>
					<tr>
						<td><label>약의 종류 및 용량 : </label></td>
						<td><label>해열제 및 감기약 식후 한알씩</label>
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
								<input class="timepicker" id='dosingTime' name='dosingTime'>
								<button class="ui icon button timeplus" onclick="return false">
									<i class="plus icon"></i>
								</button>
							</div>

						</td>
					</tr>
					<tr>
						<td><label>비고 : </label></td>
						<td><label>약먹기 싫어하는데 잘 달래서 먹여주세요~~</label></td>
					</tr>
					<tr>
						<td><label>의뢰자 : </label></td>
						<td><label>박주호</label>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>

				</table>
		</div>

		<button class="accordion">2019-09-17</button>
		<div class="panel">
				<table align="center" class="doesTable">
					<tr>
						<td><label>유아명 : </label></td>
						<td><label>박건후</label></td>
					</tr>
					<tr>
						<td><label>증상명 : </label></td>
						<td><label>감기</label>
						</td>
					</tr>
					<tr>
						<td><label>약의 종류 및 용량 : </label></td>
						<td><label>해열제 및 감기약 식후 한알씩</label>
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
								<input class="timepicker" id='dosingTime' name='dosingTime'>
								<button class="ui icon button timeplus" onclick="return false">
									<i class="plus icon"></i>
								</button>
							</div>

						</td>
					</tr>
					<tr>
						<td><label>비고 : </label></td>
						<td><label>약먹기 싫어하는데 잘 달래서 먹여주세요~~</label></td>
					</tr>
					<tr>
						<td><label>의뢰자 : </label></td>
						<td><label>박주호</label>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>

				</table>
		</div>
	</div>
	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			});
		}
		
		// 메뉴바 고정 
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

	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>