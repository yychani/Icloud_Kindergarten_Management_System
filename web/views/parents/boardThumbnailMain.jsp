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
    $(".li1").addClass("on");
    $(".topMenuLi:nth-child(2)").addClass("on");

    $(".topMenuLi").mouseover(function() {
       $(".li1").removeClass("on");
       $(".topMenuLi:nth-child(2)").removeClass("on");
    });
    $(".topMenuLi").mouseleave(function() {
       $(".li1").addClass("on");
       $(".topMenuLi:nth-child(2)").addClass("on");
    });

 }); 
</script>   
<style>
 .writing > button {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
</style>
</head>
<body style="overflow-x:hidden">
	
	<%@include file="/views/common/parentsMenu.jsp" %>
	<div style="margin: 0 15%;">
		<h1 style="text-decoration: underline; text-underline-position: under;">아이들 사진</h1>
	</div>
	<%@ include file="/views/common/board.jsp" %>
	
	
	
	
	
	<%@ include file="/views/common/chat.jsp"%>
	<%@include file="/views/common/footer.jsp" %>
</body>
</html>