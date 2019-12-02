<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 투약 카드  -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!-- 글꼴  -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<style>

h1 {
	font-family: 'Noto Sans KR', sans-serif;
	margin-top: 5%;
	margin-bottom: 5%;
	font-weight: bold;
}

h4 {
	font-weight: bolder;
	font-size: medium;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

#testbutton {
	background-color: #87c541;
	border: none;
	margin: 10px;
}

.pricing-item text-center {
	margin: 20%;
	width: 600px;
}

span {
	font-weight: bold;
	font-size: 500px;
	color: #87c541;
}

.doesTable td {
	height: 40px;
	/* vertical-align:center;	 */
	vertical-align: middle;
}

label {
	margin: 0 0;
}

</style>

</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h1 align="center">내아이 투약의뢰서 작성</h1>
	<!-- Cards container -->
	<div class="container text-center">
		<div class="row">

			<!-- Card #1, Starter -->
			<div id="box" class="col-lg-8 col-md-8 col-sm-10 pb-4 d-block m-auto">
				<div class="pricing-item"
					style="box-shadow: 0px 0px 30px -7px rgba(0, 0, 0, 0.29);">
					<!-- Indicator of subscription type -->
					<div class="pt-4 pb-3">
						<h4>2019-03-29</h4>
					</div>
					<!-- Price class -->
					<div class="pricing-price pb-1 text-primary color-primary-text ">
						<h1 style="font-weight: 1200; font-size: 3.5em;">
							<span style="font-size: 45px;">투약의뢰서</span>
						</h1>
					</div>
					<!-- Perks of said subscription -->
					<form>
						<table align="center" class="doesTable">
							<tr>
								<td><label>유아명 : </label></td>
								<td><input type="text" name="kidsName" placeholder="유아명 입력"></td>
							</tr>
							<tr>
								<td><label>증상명 : </label></td>
								<td><input type="text" name="disease" placeholder="증상명 입력"></td>
							</tr>
							<tr>
								<td><label>약의 종류 및 용량 : </label></td>
								<td><input type="text" name="medician"
									placeholder="약의 종류 및 용량 입력"></td>
							</tr>
							<tr>
								<td><label>약의 보관 방법 :</label></td>
								<td><input type="radio" name="keepMedicine" value="상온"
									id="ordinary"> <label for="ordinary">상온</label> &nbsp; &nbsp;&nbsp;&nbsp;<input
									type="radio" name="keepMedicine" value="냉온" id="freeze"><label
									for="freeze">냉온</label></td>
							</tr>
							<tr>
								<td><label>투약 의뢰 기간 : </label></td>
								<td><input type="text" name="dosingPeriod"
									placeholder="투약의뢰 기간 입력"></td>
							</tr>
							<tr>
								<td><label>투약 의뢰 시간 : </label></td>
								<td><input type="text" name="dosingTime"
									placeholder="투약의뢰 시간 입력"></td>
							</tr>
							<tr>
								<td><label>비고 : </label></td>
								<td><input type="text" name="note" placeholder="내용 입력"></td>
							</tr>
							<tr>
								<td><label>의뢰자 : </label></td>
								<td><input type="text" name="requestor"
									placeholder="의뢰자 이름 입력"></td>
							</tr>
							<tr>
								<td></td>
							</tr>

						</table>
						<label align="center">*투약으로 인한 책임은 의뢰자에게 있습니다.</label>
						<br><Br>
						
						<!-- Button -->
					<div class="pricing-button pb-4">
						<button type="button" class="btn btn-lg btn-primary w-75"
							id="testbutton">제출하기</button>
						<button type="button" class="btn btn-lg btn-primary w-75"
							id="testbutton"
							onclick="location.href='<%=request.getContextPath()%>/views/parents/mykidsDoseList.jsp'"
							value="투약의뢰서리스트">투약의뢰서 리스트보기</button>
					</div>
					</form>
					
				</div>
			</div>



			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.bundle.min.js"
				integrity="sha384-pjaaA8dDz/5BgdFUPX6M/9SUZv4d12SUPF0axWc+VRZkx5xU3daN+lYb49+Ax+Tl"
				crossorigin="anonymous"></script>

			<script src="https://code.jquery.com/jquery-3.3.1.min.js"
				integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
				crossorigin="anonymous"></script>
</body>
</html>