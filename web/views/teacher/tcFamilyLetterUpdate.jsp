<%@page import="java.util.ArrayList"%>
<%@page import="com.oracle5.common.model.vo.Attachment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oracle5.board.model.vo.Board"%>
    <%
    	Board b = (Board) request.getAttribute("b"); 
    ArrayList<Attachment> list = new ArrayList<>();
	if((ArrayList<Attachment>) request.getAttribute("list") != null){
		list = (ArrayList<Attachment>) request.getAttribute("list");
	}
     %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>가정통신문</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
input[type=text] {
	border-radius: 10px;
	width: 100%;
	height: 30px;
}
input[type='submit'], input[type='reset'] {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
	button {
	width: 80px;
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
	 $(".li:nth-child(5)").addClass("on");
 
		$(".topMenuLi:nth-child(1)").addClass("on");

	 $(".topMenuLi").mouseover(function() {
			 $(".li:nth-child(5)").removeClass("on");
			 $(".topMenuLi:nth-child(1)").removeClass("on");
	});

	 $(".topMenuLi").mouseleave(function() {
	   $(".li:nth-child(5)").addClass("on");
		$(".topMenuLi:nth-child(1)").addClass("on");
	});
}); 
</script>
</head>
<body>
	<%@ include file="/views/common/teacherMenu.jsp" %>
	<div style="margin: 0 15%;">
 	<h1 style="text-decoration: underline; text-underline-position: under;">가정통신문 수정 </h1>
 	</div>
 	<form id="updateForm" method="post">
 	<div style="margin: 50px 25%; margin-bottom: 20px;">
	<h3 style="text-underline-position: under; width: 100%;">제목</h3>
	<div class="ui fluid icon input">
		<input type="text" id="title" name="title" value="<%=b.getTtitle()%>">
	</div>
	
	<br />
	
	<input type="hidden" name="userNo" value="<%=loginUser.getMemberNo()%>">
	<input type="hidden" name="tid" value="<%=b.getTid()%>">
	
	<div class="ui form">
		<div class="field">
			<h3 style="text-underline-position: under;">내용</h3>
			<textarea style="resize: none; width: 100%;" rows="25" id="content" name="content"
			  ><%=b.getTcont() %></textarea>
		</div>
		<% 
			for(Attachment at : list){
		%>
		<div class="Imgscr"><img alt="" style="width: 100%;"src="<%=request.getContextPath() %>/uploadFiles/<%=at.getChangeName() %>"></div>
		<%} %>
		
	</div>
	<br>
	<div align="right">
		<button onclick="complete()">작성완료</button>
		<button onclick="deleteTcL()">삭제하기</button>
	</div>
	<script>
		function complete(){
			$("#updateForm").attr("action","<%=request.getContextPath()%>/updateTFLetter.tbo");
		}
		function deleteTcL(){
			$("#updateForm").attr("action","<%=request.getContextPath()%>/deleteTFLetter.tbo")
		}
	</script>
	
	 
	 <br><br>
</div>
</form>
 	
    <%@ include file="/views/common/footer.jsp" %>
    <%@ include file="/views/common/chat.jsp" %>