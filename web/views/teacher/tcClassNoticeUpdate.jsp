<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oracle5.board.model.vo.Board"%>
    <%Board b = (Board) request.getAttribute("b"); %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>게시판 detail</title>
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
	<%@ include file="/views/common/teacherMenu.jsp" %>
	<div style="margin: 0 15%;">
 	<h1 style="text-decoration: underline; text-underline-position: under;">반 공지사항 </h1>
 	</div>
 	<form id="updateForm" method="post">
 	<div style="margin: 50px 25%; margin-bottom: 20px;">
	<h3 style="text-underline-position: under; width: 100%;">제목</h3>
	<div class="ui fluid icon input">
		<input type="text" id="title" name="title" value="<%=b.getTtitle()%>">
	</div>
	
	<br />
	
	<input type="hidden" name="userNo" value="<%=loginUser.getMemberNo()%>">
	<input type="hidden" name="tId" value="<%=b.getTid()%>">
	
	<div class="ui form">
		<div class="field">
			<h3 style="text-underline-position: under;">내용</h3>
			<textarea style="resize: none; width: 100%;" rows="25" id="content" name="content"
			  ><%=b.getTcont() %></textarea>
		</div>
		
	</div>
	<br>
	<div align="right">
		<button onclick="complete()">작성완료</button>
		<button onclick="deleteBanBoard()">삭제하기</button>
	</div>
	<script>
		function complete(){
			$("#updateForm").attr("action","<%=request.getContextPath()%>/updateBanBoard.bo");
		}
		function deleteBanBoard(){
			$("#updateForm").attr("action","<%=request.getContextPath()%>/deleteBanBoard.bo")
		}
	</script>
	
	 <%-- <%if(loginUser != null && loginUser.getUType().equals("교사")) {%>
	 <input type="submit" id="boardReWrite" value="수정완료하기" onclick="location.href='<%=request.getContextPath() %>/updateBoard.bo?num=<%=b.getTid() %>'" style="float: right" /><span style="float: right">&nbsp;&nbsp;</span> 
	 <%} %>
	 <input type="reset" id="return" value="취소하기" onclick="location.href='<%= request.getContextPath() %>/selectAllBanList'" style="float: right" /> --%>
	 
	 <br><br>
</div>
</form>
 	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
    
</body>
</html>