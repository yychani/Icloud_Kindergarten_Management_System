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

<style>
#outBox {
	/* width : 800px; */
	margin: 50px 15%;
	
}

#tableArea {
	width: 100%;
}

#no {
	width: 20px;
	text-align: center;
}

#title {
	width: 500px;
	text-align: center;
}

#writer {
	width: 120px;
	text-align: center;
}

#date {
	width: 100px;
	text-align: center;
}

#requestBtn {
	float: right;
}
</style>
</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<div style="margin: 0 15%;">
		<h1 align="center">건의/문의</h1>
	</div>
	<%--  <%@ include file="/views/common/board.jsp"%> --%>
	<div id="outBox">
		<table class="ui celled table" id="tableArea">
			<thead>
				<tr>
					<th id="no">번호</th>
					<th id="title">제목</th>
					<th id="writer">작성자</th>
					<th id="date">작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="no">3</td>
					<td id="title">24</td>
					<td id="writer">박주호</td>
					<td id="date">2019-05-05</td>
				</tr>
				<tr>
					<td id="no">2</td>
					<td id="title">26</td>
					<td id="writer">박주호</td>
					<td id="date">2019-03-29</td>
				</tr>
				<tr>
					<td id="no">1</td>
					<td id="title">24</td>
					<td id="writer">박주호</td>
					<td id="date">2019-01-02</td>
				</tr>
			</tbody>
		</table>
		<br>
		<button type="button" id="requestBtn" class="ui positive basic button"
			onclick="">문의하기</button>
	</div>


	<script>
		$(function() {
			$(".li1").addClass("on");
			$(".topMenuLi:nth-child(5)").addClass("on");

			$(".topMenuLi").mouseover(function() {
				$(".li1").removeClass("on");
				$(".topMenuLi:nth-child(5)").removeClass("on");
			});
			$(".topMenuLi").mouseleave(function() {
				$(".li1").addClass("on");
				$(".topMenuLi:nth-child(5)").addClass("on");
			});

		});
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>

</html>