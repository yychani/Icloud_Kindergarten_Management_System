<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.oracle5.member.model.vo.ReturnAgree"%>
<%
	ArrayList<ReturnAgree> list = (ArrayList<ReturnAgree>) request.getAttribute("raList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 글꼴  -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<style>
.accordion {
	background-color: rgb(255, 255, 255);
	color: #444;
    border: 1.5px solid rgb(147, 196, 34);
    border-radius: 10px;
	cursor: pointer;
	padding: 18px;
	text-align: center;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
	width: 1000px;
	font-family: 'Noto Sans KR', sans-serif;
	width: 700px;
}

.active, .accordion:hover {
	background-color: rgba(228, 247, 228, 0.306);
}

.panel {
	padding: 0 18px;
	background-color: white;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	 font-family: 'Noto Sans KR', sans-serif;
}
tr{
	height: 30px;
}
#noList{
	margin:auto auto;
	height: 450px;
    display: table-cell;
    vertical-align: middle;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 15px;
    font-weight:bold;
    color: rgb(209, 57, 57)
}
</style>


</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	
	<script>
      $(function() {
    	  $(".li:nth-child(9)").addClass("on");
    	  
          $(".topMenuLi:nth-child(1)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(9)").removeClass("on");
            $(".topMenuLi:nth-child(1)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(9)").addClass("on");
            $(".topMenuLi:nth-child(1)").addClass("on");
         });
      }); 
</script>
	
	<h1 align="center">귀가동의서 신청이력</h1>


	<div id="totalList" align="center">
	<%
	
	if( list.size() == 0){
		

	%>
	<div id="noList"><label> 신청 이력이 없습니다.</label></div>
	
	
	<%} else {
			for (ReturnAgree r : list) {
		%>
		<button class="accordion">귀가 일자 : <%=r.getApplyDate()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=r.getCName()%></button>
		<div class="panel">
			<table align="center" class="goHomeTable">

				<tr>
					<td><label>유아명 : </label></td>
					<td><label><%=r.getCName()%></label></td>
				</tr>
				<tr>
					<td><label>인솔자 명 : </label></td>
					<td><label><%=r.getGuideName()%></label></td>

				</tr>
				<tr>
					<td><label>인솔자 연락처 : </label></td>
					<td><label><%=r.getGuidePhone()%></label></td>
				</tr>
				<tr>
					<td><label>귀가 일자: </label></td>
					<td><label><%=r.getApplyDate()%></label></td>
				</tr>
				<tr>
					<td><label>귀가 시간 : </label></td>
					<td><label><%=r.getApplyTime()%></label></td>
				</tr>
				<tr>
					<td><label>신청 날짜 : </label></td>
					<td><label><%=r.getSubmitDate()%></label></td>
				</tr>
				<tr>
					<td><label>상태 : </label></td>
					<td><label><%=r.getStatus()%></label></td>
				</tr>
			</table>
		</div>
		<br>
		<%
			}}
		%>





	</div>
	<div></div>
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
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>