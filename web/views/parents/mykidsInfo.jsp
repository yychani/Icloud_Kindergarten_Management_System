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
#cNameSelect{
	width:80px;
	height:34px;
	border-radius:4px;
}
</style>



 
</head>
<body>

	<%@ include file="/views/common/parentsMenu.jsp"%>
	
<script>
      $(function() {
    	  $(".li:nth-child(1)").addClass("on");
    	  
          $(".topMenuLi:nth-child(1)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(1)").removeClass("on");
            $(".topMenuLi:nth-child(1)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(1)").addClass("on");
            $(".topMenuLi:nth-child(1)").addClass("on");
         });
      }); 
</script>

	<div align="center">
		<h2 class="ui header">내 아이 정보</h2>
		<select class="ui dropdown" id="cNameSelect"></select>
	</div>
		

	<div class="outBox">
		<div class="ui olive inverted segment mykidInfo" align="center">
			<div class="ui raised segment">
				<img class="ui medium circular image" id="kidImg"
					src=""><br> <a class="ui yellow image label"><label id="kidName"></label>
					<div class="detail" id="kidBan"></div>
				</a><br>
				<br>
				<label>나이 : 만 </label><label id="kidAge"></label><br>
				<label>키 : </label><label id="recentHeight"></label><br>
				<label>몸무게 : </label><label id="recentWeight"></label><br>
				<label>특이사항 : </label><label id="desc"></label>
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
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
	    
	 <script>
	 $(function(){
			cId = 0;
			$.ajax({
				url:"<%=request.getContextPath()%>/pCName.me",
				type:"get",
				success:function(data){

					$select = $("#cNameSelect");
					$select.find("option").remove();
					
					for(var key in data){
						var $option = $("<option>");
						$option.val(data[key].cId);
						$option.text(data[key].name);
						$select.append($option);
					}
					$("#cNameSelect").trigger("change");
				},
				error:function(data){
					console.log("failㅠㅠ");
				}
			});
		});

	 $(function(){
		 $(document).on("change", "#cNameSelect", function(){
 			$("#kidName").text("");
 			$("#kidAge").text("");
 			$("#recentHeight").text("");
			$("#recentWeight").text("");
			$("#desc").text("");
			$("#kidBan").text("");
			height = [0];
			weight = [0];
			date = [];

			 var cId = $("#cNameSelect").val();
			 bList = "";

			 $.ajax({
					url: "<%=request.getContextPath()%>/myKidsInfo.me",
					data:{cId},
					type:"get",
					success:function(data){

						$("#kidName").text(data.c.name);
						$("#kidImg").attr("src", '<%= request.getContextPath() %>/uploadFiles/'+ data.c.imgSrc);
						$("#kidAge").text(data.c.cId + " 세");
						
						if(Object.keys(data).length == 4){
							$("#recentHeight").text(data.b.height + " cm");
							$("#recentWeight").text(data.b.weight + " kg");
						}else {
							$("#recentHeight").text("");
							$("#recentWeight").text("");
						}
						$("#desc").text(data.c.description);
						$("#kidBan").text(data.ban.banName + "반");
						bList = data.bList;
						
						
						for(var i = 0; i < bList.length; i++){
							height[i] = bList[i].height;
							weight[i] = bList[i].weight;
							date[i] = bList[i].biDate;
						}
						

						var data1 = {
								datasets : [ {
									backgroundColor : "rgba(56,175,91,.1)",
									borderColor : "rgba(56,175,91,1)",
									pointBackgroundColor : "rgba(56,175,91,1)",
									data : height,
									label : "키"
								}, {
									backgroundColor : "rgba(234,142,57,.1)",
									borderColor : "rgba(234,142,57,1)",
									pointBackgroundColor : "rgba(234,142,57,1)",
									data : weight,
									label : "몸무게"
								}],
								labels : date
								
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

							new Chart(c1.getContext("2d"), {
								type : 'line',
								data : data1,
								options : options1
							});
						
						
					},
					error:function(data){
						console.log("내아이 정보 불러오기 실패");
					}
				 });
		 });
	 });
	 
	 </script>   
	    








	<%@ include file="/views/common/chat.jsp"%>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>