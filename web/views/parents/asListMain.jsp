<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.cta-100 {
  
  padding-left: 8%;
  padding-top: 7%;
}
.col-md-4{
    
}
.container{
    margin-left: auto;
    padding-left: 30px;
}

.white {
  color: #fff !important;
}
.mt{float: left;margin-top: -20px;padding-top: 20px;}
.bg-blue-ui {
  background-color: #708198 !important;
}
figure img{width:300px;}

#blogCarousel {
  padding-bottom: 100px;
}

.blog .carousel-indicators {
  left: 0;
  top: -50px;
  height: 50%;
}


/* The colour of the indicators */

.blog .carousel-indicators li {
  background: #708198;
  border-radius: 50%;
  width: 8px;
  height: 8px;
}

.blog .carousel-indicators .active {
  background: #0fc9af;
}




.item-carousel-blog-block {
  outline: medium none;
  padding: 15px;
}

.item-box-blog {
  border: 1px solid #dadada;
  text-align: center;
  
  padding: 20px;
}

.item-box-blog-image {
  position: relative;
}

.item-box-blog-image figure img {
  margin-left:110%;
  width: 100%;
  height: auto;
}

.item-box-blog-date {
  position: absolute;
  z-index: 5;
  padding: 4px 20px;
  top: -20px;
  right: 8px;
  background-color: #41cb52;
}

.item-box-blog-date span {
  color: #fff;
  display: block;
  text-align: center;
  line-height: 1.2;
}

.item-box-blog-date span.mon {
  font-size: 18px;
}

.item-box-blog-date span.day {
  font-size: 16px;
}

.item-box-blog-body {
  padding: 10px;
}

.item-heading-blog a h5 {
  margin: 0;
  line-height: 1;
  text-decoration:none;
  transition: color 0.3s;
}

.item-box-blog-heading a {
    text-decoration: none;
}

.item-box-blog-data p {
  font-size: 13px;
}

.item-box-blog-data p i {
  font-size: 12px;
}

.item-box-blog-text {
  height: 100px;
  overflow: hidden;
}

.mt-10 {
  float: left;
  margin-top: -10px;
  padding-top: 10px;
}

.btn.bg-blue-ui.white.read {
  cursor: pointer;
  padding: 4px 20px;
  float: left;
  margin-top: 10px;
}

.btn.bg-blue-ui.white.read:hover {
  box-shadow: 0px 5px 15px inset #4d5f77;
}
figure {
   
   width:150px;
   height:150px;
}
</style>
</head>


<body style="overflow-x:hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<div style="margin: 0 15%;">
	<h2 style="text-decoration: underline; text-underline-position: under;"><U>방과후 프로그램</U></h2>
	</div>
	<%-- <div id="div1">
		<table align="center">
			<tr>
				<td colspan="2"><h4>음악 프로그램</h4></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath() %>/images/as1.PNG"></td>
				<td>말하기, 노래부르기, 신체표현, 악기연주 등 다양한 음악활동을 통해 기초 음악 개념을형성하고<br>
					몸으로 자연스럽게 리듬을 느끼는 음악 프로그램 입니다.</td>
			</tr>
			<tr>
				<td colspan="2"><h4>다양한 언어 프로그램</h4></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath() %>/images/as2.PNG"></td>
				<td>언어 습득의 기본단계와 유아의 특성을 반영 하여 알파벳 모양을 흥미롭게 익히며 기초과정을 완성하고<br>
					다양한 언어를 처음 접하는 유아들이 즐겁게 배울 수 있도록 하는 프로그램</td>
			</tr>
			<tr>
				<td colspan="2"><h4>놀이 프로그램</h4></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath() %>/images/as3.PNG"></td>
				<td>다양한 신체단련활동을 통해 성장 발달에 도움이 되는 놀이 프로그램을 통해<br>
					근육발달과 지구력을 키울수 있는 활동</td>
			</tr>
			<tr>
				<td colspan="2"><h4>예술 프로그램</h4></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath() %>/images/as4.PNG"></td>
				<td>만들고 그리며 노는 과정에서 아이의 마음이 가장 자유롭게 펼쳐지도록 창의표현, 생각을 이끌어 내는 <br>
					아이들의 이야기 미술 프로그램</td>
			</tr>
		</table>
	</div> --%>
	<%@ include file="/views/parents/asList.jsp" %>
	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>