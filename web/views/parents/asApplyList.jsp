<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방과후 활동 신청 이력</title>
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
	<h1 align="center">방과후 신청 이력</h1>

	<div id="totalList" align="center">
	<%
	
	if(((ArrayList<Children>)hmap.get("cList")).size() == 0){
		

	%>
		<div id="noList"><label> 신청 이력이 없습니다.</label></div>
	
	<%} else {
			for (int i = 0; i < ((ArrayList<Children>)hmap.get("cList")).size(); i ++) {
				
		%>

		<button class="accordion">원아명 : <%= ((ArrayList<Children>)hmap.get("cList")).get(i).getName() %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 신청 일자 : <%= ((ArrayList<AsList>)hmap.get("aList")).get(i).getApplyDate() %></button>
		<div class="panel">
			<table align="center" class="goHomeTable">
				<tr>
					<td><label>신청 일자 : </label></td>
					<td><label><%= ((ArrayList<AsList>)hmap.get("aList")).get(i).getApplyDate() %></label></td>
				</tr>
				<tr>
					<td><label>승인 일자 : </label></td>
					<td><label><%= ((ArrayList<AsList>)hmap.get("aList")).get(i).getApprovalDate() %></label></td>
				</tr>
				<tr>
					<td><label>종료 일자 : </label></td>
					<td><label><%=  ((ArrayList<AsList>)hmap.get("aList")).get(i).getEndDate() %></label></td>

				</tr>
				
			</table>
		</div>
		<br>
		<%
			
		}}
		%>


		
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

	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>