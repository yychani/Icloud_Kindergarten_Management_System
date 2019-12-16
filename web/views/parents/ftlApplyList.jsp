<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현장체험학습 신청이력</title>

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
</style>	
	
	
</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h1 align="center">현장체험학습 신청이력</h1>
	<br><br>
	<div id="totalList" align="center">

	<%
			for (int i = 0; i < ((ArrayList<FieldLearning>)hmap.get("flList")).size(); i++) {
		%>

		<button class="accordion"> 일자 :  <%= ((ArrayList<FieldLearning>)hmap.get("flList")).get(i).getFtlDate() %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원아명 : <%= ((ArrayList<Children>)hmap.get("cList")).get(i).getName() %></button>
		<div class="panel">
			<table align="center" class="goHomeTable">
				<tr>
					<td><label>일자 : </label></td>
					<td><label><%= ((ArrayList<FieldLearning>)hmap.get("flList")).get(i).getFtlDate() %></label></td>
				</tr>
				<tr>
					<td><label>장소 : </label></td>
					<td><label><%= ((ArrayList<FieldLearning>)hmap.get("flList")).get(i).getField() %></label></td>
				</tr>
				<tr>
					<td><label>비용 : </label></td>
					<td><label><%= ((ArrayList<FieldLearning>)hmap.get("flList")).get(i).getFtlPay() %></label></td>

				</tr>
				<tr>
					<td><label>준비물 : </label></td>
					<td><label><%= ((ArrayList<FieldLearning>)hmap.get("flList")).get(i).getMaterials() %></label></td>
				</tr>
				<tr>
					<td><label>납부 확인 여부: </label></td>
					<td><label><%= ((ArrayList<Participation>)hmap.get("pList")).get(i).getPayment() %></label></td>
				</tr>
				<tr>
					<td><label>참석 여부 : </label></td>
					<td><label><%= ((ArrayList<Participation>)hmap.get("pList")).get(i).getAttend()%></label></td>
				</tr>
			</table>
		</div>
		<br>
		<%
			}
		%>
	

	</div><br><br>
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