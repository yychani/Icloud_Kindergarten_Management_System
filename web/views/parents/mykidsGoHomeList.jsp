<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 글꼴  -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
	
	<!-- 시멘틱ui -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

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
	<h1 align="center">귀가동의서 리스트</h1>


<div id="totalList" align="center">
	<button class="accordion ui positive basic button">2019-10-20</button>
	<div class="panel">
		<table align="center" class="goHomeTable">

							<tr>
								<td><label>유아명 : </label></td>
								<td>
									<label>박건후</label>
								</td>
							</tr>
							<tr>
								<td><label>보호자 명 : </label></td>
								<td>
									<label>박주호</label>
								</td>

							</tr>
							<tr>
								<td><label>인솔자 연락처 : </label></td>
								<td>
									<label>010-3327-5305</label>
								</td>
							</tr>
							<tr>
								<td><label>일자: </label></td>
								<td>
									<label>2019-10-12</label>
								</td>
							</tr>
							<tr>
								<td><label>귀가 요청 시간 : </label></td>
								<td>
									<label>11:40 AM</label>
								</td>
							</tr>
		</table>
	</div>

	<button class="accordion">2019-10-01</button>
	<div class="panel">
		<table align="center" class="goHomeTable">

							<tr>
								<td><label>유아명 : </label></td>
								<td>
									<label>박건후</label>
								</td>
							</tr>
							<tr>
								<td><label>보호자 명 : </label></td>
								<td>
									<label>박주호</label>
								</td>

							</tr>
							<tr>
								<td><label>인솔자 연락처 : </label></td>
								<td>
									<label>010-3327-5305</label>
								</td>
							</tr>
							<tr>
								<td><label>일자: </label></td>
								<td>
									<label>2019-10-12</label>
								</td>
							</tr>
							<tr>
								<td><label>귀가 요청 시간 : </label></td>
								<td>
									<label>11:40 AM</label>
								</td>
							</tr>
		</table>
	</div>

	<button class="accordion">2019-09-17</button>
	<div class="panel">
		<table align="center" class="goHomeTable">

							<tr>
								<td><label>유아명 : </label></td>
								<td>
									<label>박건후</label>
								</td>
							</tr>
							<tr>
								<td><label>보호자 명 : </label></td>
								<td>
									<label>박주호</label>
								</td>

							</tr>
							<tr>
								<td><label>인솔자 연락처 : </label></td>
								<td>
									<label>010-3327-5305</label>
								</td>
							</tr>
							<tr>
								<td><label>일자: </label></td>
								<td>
									<label>2019-10-12</label>
								</td>
							</tr>
							<tr>
								<td><label>귀가 요청 시간 : </label></td>
								<td>
									<label>11:40 AM</label>
								</td>
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
	</script>
<%@ include file="/views/common/chat.jsp"%>
</body>
</html>