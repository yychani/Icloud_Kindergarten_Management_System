<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원아관리</title>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    <script>
      $(function() {
    	  $(".li:nth-child(9)").addClass("on");
    	  
          $(".topMenuLi:nth-child(2)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(9)").removeClass("on");
            $(".topMenuLi:nth-child(2)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(9)").addClass("on");
            $(".topMenuLi:nth-child(2)").addClass("on");
         });
      }); 
</script>
<style>
	.imgDetail {
		display:inline-block;
		overflow:hidden;
		margin:20px;
		width:250px;
		height:250px;
		text-align:center;
		position:relative;
	}
	.imgDetail img {
		position:absolute;
		max-width:80%; 
		max-height:80%;
		width:auto; 
		height:auto;
		margin:auto;
        top:0; bottom:0; left:0; right:0;
	}
	.detail {
		border: 1px solid black;
		border-radius: 20px; 
		background : lightgray;
		display:inline-block; 
		width:250px; 
		height:250px; 
		overflow: hidden;
		margin:20px;
	}
	.childbutton {
		float:right;
	}
</style>
</head>
<body> 
	<%@ include file="/views/common/teacherMenu.jsp" %>
	<div style="margin: 0 15%;">
 	<h1  align="center" style="text-decoration: underline; text-underline-position: under;">박건후 상세정보</h1>
 	</div>
 	<hr width="60%" />
 	<div class="outerDetail" style="margin:20px 20%; padding:10px; height:300px;">  	
		<div class="imgDetail" >
		<img src="<%= request.getContextPath() %>/images/img.jpg" alt=""/>
		</div>
	
	<div class="detail" >
		<table style="text-align:left; margin:0 auto; margin-top:40px;">
			<tr>
				<td>이름 : 박건후</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>반 : 해바라기반</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>키 : 88.5cm</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>몸무게 : 15.2kg</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>특이사항 : 다문화가정</td>
			</tr>
		</table>
	</div>
	<div class="detail">
		<table style="text-align:left; margin:0 auto; margin-top:40px;">
			<tr>
				<td>부모님 이름 : 박주호</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>관계 : 부</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>연락처 : 010-1111-1111</td>
			</tr>
		</table>
	</div>
	</div>
	<hr width="60%"/>
	<div style="margin:0 20%; height:40px">
		<input type="button" class="childbutton" value="생활기록부" onclick="location.href='tcChildRecodeBook.jsp'"/>
		<p class="childbutton">&nbsp;&nbsp;</p>
		<input type="button" class="childbutton" value="유아관찰표" onclick="location.href='tcChildObserve.jsp'"/>
	</div>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>