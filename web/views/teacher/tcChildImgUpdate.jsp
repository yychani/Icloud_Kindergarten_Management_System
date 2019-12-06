<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<script>
  $(function() {

	$(".li:nth-child(1)").addClass("on");

		$(".topMenuLi:nth-child(4)").addClass("on");

		$(".topMenuLi").mouseover(function() {
			$(".li:nth-child(1)").removeClass("on");
			$(".topMenuLi:nth-child(4)").removeClass("on");
		});

		$(".topMenuLi").mouseleave(function() {
			$(".li:nth-child(1)").addClass("on");
			$(".topMenuLi:nth-child(4)").addClass("on");
		});

		$("#boardWrite").click("click", function() {
			location.href = "tcChildImgMain.jsp";
		});
	});
</script>
</head>
<body>
	<%@include file="/views/common/teacherMenu.jsp"  %>
	<%@ include file="/views/common/boardWrite.jsp" %>
	<%@ include file="/views/common/chat.jsp" %>
	<%@include file= "/views/common/footer.jsp" %>
</body>
</html>