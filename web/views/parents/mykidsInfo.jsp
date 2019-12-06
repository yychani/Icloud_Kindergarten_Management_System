<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 글꼴  -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<style>
/* 내 아이 정보 박스 */
body {
	margin: 0;
	padding: 0;
	/*  font-family:sans-serif; */
	font-family: 'Noto Sans KR', sans-serif;
	background: #fbfbfb;
	overflow-x: hidden;
}

.card {
	position: absolute;
	left: 50%;
	top: 60%;
	transform: translate(-50%, -50%);
	width: 300px;
	min-height: 300px;
	height: 400px;
	background: #fff;
	box-shadow: 0 20px 50px rgba(0, 0, 0, .1);
	border-radius: 10px;
	transition: 0.5s;
}

.card:hover {
	box-shadow: 0 30px 70px rgba(0, 0, 0, .2);
}

.card .box {
	position: absolute;
	top: 50%;
	left: 0;
	transform: translateY(-50%);
	text-align: center;
	padding: 20px;
	box-sizing: border-box;
	width: 100%;
}

.card .box .img {
	width: 120px;
	height: 120px;
	margin: 0 auto;
	border-radius: 50%;
	overflow: hidden;
}

.card .box .img img {
	width: 100%;
	height: 100%;
}

.card .box h2 {
	font-size: 15px;
	color: #262626;
	margin: 20px auto;
}

.card .box h2 span {
	font-size: 18px;
	background: #8ad633;
	color: #fff;
	display: inline-block;
	padding: 4px 10px;
	border-radius: 15px;
}

.card .box p {
	color: #262626;
	font-size: 13px;
}

/* 
.card .box ul {
	margin: 0;
	padding: 0;
}

.card .box ul li {
	list-style: none;
	float: left;
}

.card .box ul li a {
	display: block;
	color: #aaa;
	margin: 0 10px;
	font-size: 20px;
	transition: 0.5s;
	text-align: center;
}

.card .box ul li:hover a {
	color: #e91e63;
	transform: rotateY(360deg);
} */

/* 그래프 */
@import
	url(https://fonts.googleapis.com/css?family=Dosis:300|Lato:300,400,600,700|Roboto+Condensed:300,700|Open+Sans+Condensed:300,600|Open+Sans:400,300,600,700|Maven+Pro:400,700)
	;

@import
	url("https://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css")
	;

* {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

/* html, body {
	 background-color: #202B33;
  color: #738491; 
	font-family: "Open Sans";
	font-size: 16px;
	-webkit-font-smoothing: antialiased;
	 overflow: hidden; 
}  */
article {
	/* position: absolute;
  top: 0;
  bottom: 0;
  right: 0; */
	left: 18%;
	/* overflow: auto; */
	/* padding: 20px; */
}
element.style{
	align:center;
}

article>header {
	height: 50px;
	border-bottom: 2px solid #79807c;
}

article>header .title {
	float: left;
	font-size: 1.3rem;
	font-weight: 600;
	margin-left: 20%;
}

article section .chart {
	height: 400px;
}
</style>
</head>

<body>
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<br>
	<h1 align="center">내아이 정보</h1>
	<div style="height: 500px;">
		<div class="card">
			<div class="box">
				<div class="img">
					<img src="<%=request.getContextPath()%>/images/건후.jpg">
				</div>
				<h2>
					<span>박건후</span><br> <br>해바라기반
				</h2>
				<p>나이 : 만 3 세</p>
				<p>키 : 88.5 cm</p>
				<p>몸무게 : 15.2kg</p>
				<p>특이사항 : 다문화가정</p>


			</div>
		</div>
	</div>
	<div>
		<article align="center" style="width:1200px">
			<header>
				<div class="title">신체 발달 그래프</div>
			</header>
			<section>
				<div class="chart">
					<canvas id="c1" align="center" width="800" height="200"></canvas>
				</div>
			</section>
		</article>
	</div>


	<!-- 내아이 정보 박스 -->

	<!-- 그래프 -->




	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.15.0/umd/popper.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"></script>

	<script>
		var data1 = {
			datasets : [ {
				backgroundColor : "rgba(56,175,91,.1)",
				borderColor : "rgba(56,175,91,1)",
				pointBackgroundColor : "rgba(56,175,91,1)",
				data : [ 1100, 1200, 935, 990, 1050, 1030, 1040 ],
				label : "1번"
			}, {
				backgroundColor : "rgba(234,142,57,.1)",
				borderColor : "rgba(234,142,57,1)",
				pointBackgroundColor : "rgba(234,142,57,1)",
				data : [ 1300, 1200, 1000, 1200, 1100, 1150, 1180 ],
				label : "2번"
			}, {
				backgroundColor : "rgba(236,72,127,.1)",
				borderColor : "rgba(236,72,127,1)",
				pointBackgroundColor : "rgba(236,72,127,1)",
				data : [ 1400, 1350, 1250, 1250, 1350, 1500, 1550 ],
				label : "3번"
			}, {
				backgroundColor : "rgba(236,72,127,.1)",
				borderColor : "rgba(236,72,127,1)",
				pointBackgroundColor : "rgba(236,72,127,1)",
				data : [ 1200, 1350, 1250, 1250, 100, 1500, 1550 ],
				label : "4번"
			} ],
			labels : [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
					"Saturday", "Sunday" ]
		}

		var options1 = {
			scaleFontColor : "rgba(255,255,255,0.7)",
			scaleLineColor : "rgba(0,0,0,0)",
			scaleGridLineColor : "rgba(255,255,255,0.1)",
			scaleFontFamily : "Open Sans",
			scaleFontSize : 14,
			bezierCurve : true,
			scaleShowLabels : true,
			pointDotRadius : 6,
			animation : true,
			scaleShowGridLines : true,
			datasetFill : true,
			responsive : true
		}

		// new Chart(c1.getContext("2d")).Line(data1,options1);
		new Chart(c1.getContext("2d"), {
			type : 'line',
			data : data1,
			options : options1,
		});
		
		
		
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