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

<style>
.outBox {
	width: 500px;
	margin: 5% auto;
}

.ui.medium.image {
	width: 200px;
	height: auto;
}

.ui.yellow.label {
	font-size: medium;
}

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
	/* left: 18%; */
	/* overflow: auto; */
	/* padding: 20px; */
	
}

element.style {
	align: center;
}

article>header {
	height: 50px;
	border-bottom: 2px solid #79807c;
}

article>header .title {
	float: left;
	font-size: 1.3rem;
	font-weight: 600;
	/* margin-left: 20%; */
}

article section .chart {
	height: 400px;
}
</style>

</head>
<body>

	<%@ include file="/views/common/parentsMenu.jsp"%>

	<h2 class="ui header">내 아이 정보</h2>

	<div class="outBox">
		<div class="ui olive inverted segment mykidInfo" align="center">
			<div class="ui raised segment">
				<br>
				<br> <img class="ui medium circular image"
					src="<%=request.getContextPath()%>/images/건후.jpg"><br> <a class="ui yellow image label"> 박건후
					<div class="detail">해바라기반</div>
				</a><br>
				<br>
				<p>나이 : 만 3 세</p>
				<p>키 : 88.5 cm</p>
				<p>몸무게 : 15.2kg</p>
				<p>특이사항 : 다문화가정</p>
				<br>
				<br>
			</div>
		</div>
	</div>

	<div style="margin: 0 auto; width: fit-content;">
		<article align="center" style="width: 1200px">
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.15.0/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"></script>

	<script>
		var data1 = {
			datasets : [ {
				backgroundColor : "rgba(56,175,91,.1)",
				borderColor : "rgba(56,175,91,1)",
				pointBackgroundColor : "rgba(56,175,91,1)",
				data : [ 1100, 1200, 935, 990, 1050, 1030, 1040 ],
				label : "남아 평균 키"
			}, {
				backgroundColor : "rgba(234,142,57,.1)",
				borderColor : "rgba(234,142,57,1)",
				pointBackgroundColor : "rgba(234,142,57,1)",
				data : [ 1300, 1200, 1000, 1200, 1100, 1150, 1180 ],
				label : "내나이 키"
			}, {
				backgroundColor : "rgba(236,72,127,.1)",
				borderColor : "rgba(236,72,127,1)",
				pointBackgroundColor : "rgba(236,72,127,1)",
				data : [ 1400, 1350, 1250, 1250, 1350, 1500, 1550 ],
				label : "유아 평균 몸무게"
			}, {
				backgroundColor : "rgba(236,72,127,.1)",
				borderColor : "rgba(236,72,127,1)",
				pointBackgroundColor : "rgba(236,72,127,1)",
				data : [ 1200, 1350, 1250, 1250, 100, 1500, 1550 ],
				label : "내 아이 몸무게"
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









	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>