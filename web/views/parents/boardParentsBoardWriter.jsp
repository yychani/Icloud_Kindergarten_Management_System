<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학부모 게시판 작성</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
input[type=text] {
	border-radius: 10px;
	width: 100%;
	height: 30px;
}
input[type='submit'] {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
textarea {
	border-radius: 10px;
}
</style>
<script>
$(function() {
	  $(".li:nth-child(3)").addClass("on");
	  
  $(".topMenuLi:nth-child(3)").addClass("on");
 
  $(".topMenuLi").mouseover(function() {
    $(".li:nth-child(3)").removeClass("on");
    $(".topMenuLi:nth-child(3)").removeClass("on");
 });

  $(".topMenuLi").mouseleave(function() {
    $(".li:nth-child(3)").addClass("on");
    $(".topMenuLi:nth-child(3)").addClass("on");
 });
}); 
</script>

</head>
<body>
	<%@ include file="/views/common/parentsMenu.jsp" %>
	<div style="margin: 0 15%;">
 	<h1 style="text-decoration: underline; text-underline-position: under;">학부모 게시판 작성</h1>
 	</div>
 	<form action="<%= request.getContextPath() %>/insert.pbo" method="post" encType="multipart/form-data">
 	<%@ include file="/views/common/boardWrite.jsp"%>
 	</form>
 	   <%@ include file="/views/common/footer.jsp" %>
 	<%@ include file="/views/common/chat.jsp" %>
 
</body>