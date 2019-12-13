<%@page import="com.oracle5.common.model.vo.Attachment"%>
<%@page import="com.oracle5.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Board b = (Board) request.getAttribute("b");
    	Attachment a = new Attachment();
    	if((Attachment) request.getAttribute("a") != null){
    		a = (Attachment) request.getAttribute("a");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원 공지사항 detail</title>
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
textarea {
	border-radius: 10px;
}
button {
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
<script>
      $(function() {
    	  $(".li:nth-child(3)").addClass("on");
    	  
          $(".topMenuLi:nth-child(1)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(3)").removeClass("on");
            $(".topMenuLi:nth-child(1)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(3)").addClass("on");
            $(".topMenuLi:nth-child(1)").addClass("on");
         });
      }); 
</script>
</head>
<body>
	<%@ include file="/views/common/presidentMenu.jsp" %>
	<div style="margin: 0 15%;">
	<h1 style="text-decoration: underline; text-underline-position: under;">원 공지사항 </h1>
 	</div>
 	<form id="updateForm" method="post">
 	<div id="hansol" align="right" style="margin-right:22%;">작성자  <%=b.getName() %> 조회수  <%=b.getTcount() %> 작성일 <%=b.getTtime() %></div>
 	<div style="margin: 50px 25%; margin-bottom: 20px;">
	<h3 style="text-underline-position: under; width: 100%;">제목</h3>
	<div class="ui fluid icon input">
		<input type="text" id="title" name="title" style="border:0;" value="<%=b.getTtitle()%>" >
	</div>
	
	<br />
	
	<input type="hidden" name="userNo" value="<%=loginUser.getMemberNo()%>">
	<input type="hidden" name="tid" value="<%=b.getTid()%>">
	
	<div class="ui form">
		<div class="field">
			<h3 style="text-underline-position: under;">내용</h3>
			<textarea style="resize: none; width: 100%; border:0;" rows="25" id="content" name="content"
			  ><%=b.getTcont() %></textarea>
		</div>
		<div class="Imgscr"><img name="img"alt="" style="width: 100%;"src="<%=request.getContextPath() %>/uploadFiles/<%=a.getChangeName() %>"></div>
		
	</div>
	<br>
	 <div align="right">
	 	<button onclick="complete()">작성완료</button>
	 	<button onclick="deletePreKNotice()">삭제하기</button>
	 </div>
	 <script>
	 	function complete(){
	 		$("#updateForm").attr("action","<%=request.getContextPath()%>/updatePreKNotice.bo");
	 	}
	 	function deletePreKNotice(){
	 		$("#updateForm").attr("action","<%=request.getContextPath()%>/deletePreKNotice.bo");
	 	}
	 </script>
	 <br><br>
	</div>
	</form>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>
























