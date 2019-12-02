<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 투약리스트 카드  -->
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
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

#testbutton {
	background-color: #87c541;
	border: none;
}

#box {
	float: left;
}
</style>

</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h1 align="center">내아이 투약의뢰서 리스트</h1>
	<!-- Cards container -->
	<div class="container text-center">
		<div class="row">

			<!-- Card #1, Starter -->
			<div id="box" class="col-lg-4 col-md-6 col-sm-10 pb-4 d-block">
				<div class="pricing-item"
					style="box-shadow: 0px 0px 30px -7px rgba(0, 0, 0, 0.29);">
					<!-- Indicator of subscription type -->
					<div class="pt-4 pb-3">
						<h4>2019-03-29</h4>
					</div>
					<!-- Price class -->
					<!-- <div class="pricing-price pb-1 text-primary color-primary-text ">
                        <h1 style="font-weight: 1000; font-size: 3.5em;">
                            <span style="   font-size: 25px;">2019-03-29</span>
                        </h1>
                    </div> -->
					<!-- Perks of said subscription -->
					<div class="pricing-description">
						<ul class="list-unstyled mt-3 mb-4">
							<li class="pl-3 pr-3">증상명 : 감기</li>
							<li class="pl-3 pr-3">약의 종류 및 용량 : 해열제</li>

						</ul>
					</div>
					<!-- Button -->
					<div class="pricing-button pb-4">
						<button type="button" class="btn btn-lg btn-primary w-75"
							id="testbutton">자세히 보기</button>
					</div>
				</div>
			</div>

			<!-- Card #2, Intermediate -->
			<div class="col-lg-4 col-md-6 col-sm-10 pb-4 d-block">
				<div class="pricing-item"
					style="box-shadow: 0px 0px 30px -7px rgba(0, 0, 0, 0.29);">
					<!-- Indicator of subscription type -->
					<div class="pt-4 pb-3">
						<h4>2019-03-29</h4>
					</div>
					<!-- Price class -->
					<!-- <div class="pricing-price pb-1 text-primary color-primary-text ">
			<h1 style="font-weight: 1000; font-size: 3.5em;">
				<span style="   font-size: 25px;">2019-03-29</span>
			</h1>
		</div> -->
					<!-- Perks of said subscription -->
					<div class="pricing-description">
						<ul class="list-unstyled mt-3 mb-4">
							<li class="pl-3 pr-3">증상명 : 감기</li>
							<li class="pl-3 pr-3">약의 종류 및 용량 : 해열제</li>

						</ul>
					</div>
					<!-- Button -->
					<div class="pricing-button pb-4">
						<button type="button" class="btn btn-lg btn-primary w-75"
							id="testbutton">자세히 보기</button>
					</div>
				</div>
			</div>
			
				<div class="col-lg-4 col-md-6 col-sm-10 pb-4 d-block">
				<div class="pricing-item"
					style="box-shadow: 0px 0px 30px -7px rgba(0, 0, 0, 0.29);">
					<!-- Indicator of subscription type -->
					<div class="pt-4 pb-3">
						<h4>2019-03-29</h4>
					</div>
					<!-- Price class -->
					<!-- <div class="pricing-price pb-1 text-primary color-primary-text ">
			<h1 style="font-weight: 1000; font-size: 3.5em;">
				<span style="   font-size: 25px;">2019-03-29</span>
			</h1>
		</div> -->
					<!-- Perks of said subscription -->
					<div class="pricing-description">
						<ul class="list-unstyled mt-3 mb-4">
							<li class="pl-3 pr-3">증상명 : 감기</li>
							<li class="pl-3 pr-3">약의 종류 및 용량 : 해열제</li>

						</ul>
					</div>
					<!-- Button -->
					<div class="pricing-button pb-4">
						<button type="button" class="btn btn-lg btn-primary w-75"
							id="testbutton">자세히 보기</button>
					</div>
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