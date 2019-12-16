<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.oracle5.board.model.vo.Board"%>
<%@ page import="com.oracle5.common.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
       <%
    	Board b = (Board) request.getAttribute("b"); 
    ArrayList<Attachment> list = new ArrayList<>();
	if((ArrayList<Attachment>) request.getAttribute("list") != null){
		list = (ArrayList<Attachment>) request.getAttribute("list");
	}
     %>
<!DOCTYPE h
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>아이들 사진 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>

<style>
	#textArea{
		margin-left: 1000px;
	}	
	#tableArea{
 	   	width:300px;
      	height:250px;
      	margin-left:auto;
     	margin-right:auto;
 		text-align: center;	
	}
	

		
		.imgi:hover{
		padding: 10px 10px;
		cursor:pointer;
		
		}

		.ui.dividing.header{
			width: 1000px;
			margin: 0 auto;
		}
		.TBtn{
			width: 80px;
			height:40px;
			margin-left:1200px;
			border-radius: 250px;
			background: skyblue;
			color: white;
			font-weight: bold;
			border: none;
			cursor: pointer;
		
		}
		#tableArea2{
			width: 1000px;
			margin: 0 auto;
			font: bold;
		
		}
		.ui.comments{
		margin-left: 265px;
		
		}
		.ui.blue.labeled.submit.icon.button{
		margin-left: 510px;
		
		}
		#reretext{
		border-radius: 10px;
		width: 30%;
		height: 30px;
		}
		#rereBtn{
		width: 80px;
		height: 40px;
		border-radius: 10px;
		background:skyblue;
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
		
		
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
	

		
</style>
</head>
<body style="overflow-x: hidden">

	<%@ include file="/views/common/teacherMenu.jsp"%>
	<h1 style="margin: 0 15%; text-decoration: underline; text-underline-position: under;" >아이들 사진 갤러리 수정</h1>
	
	<div align="center"><input type="text" id="title" name="title" value="<%=b.getTtitle()%>"></div>
	<div class="ui dividing header" align="center"></div>
	<label id="textArea"><%=b.getTtime()%></label>
	<form id="updateForm" method="post">
	<div align="center">
			<table id="tableArea">
			<tr id="trArea">
		<% 
			for(Attachment at : list){
		%>
				<td colspan="2"><img width="800" height="400" class="imgi"src="<%=request.getContextPath() %>/uploadFiles/<%=at.getChangeName() %>"
									onclick="location.href='<%=request.getContextPath()%>/updateOneChildImg.tbo/<%=at.getFid()%>"></td>
							<td><button onclick="location.href='<%=request.getContextPath()%>/deleteOneChildImg.tbo'">삭제</button></td>		
							
								
			</tr>

		
			<tr>
				<td	colspan="2">&nbsp;</td>	
			</tr>
			<tr>
				<td	colspan="2">&nbsp;</td>
			</tr>
	
			<%} %>
			</table>
			<table align="center" id="tableArea2">
			<tr>
				<td rowspan="4" id="content"><textarea style="resize: none; width: 100%;" rows="15" id="content" name="content"
			placeholder="내용을 수정하세요"><%=b.getTcont() %></textarea></td>
			</tr>

			</table>
			<br>
					<div  class="ui dividing header"></div>
		</div>
		<br><br>
		<input type="hidden" name="userNo" value="<%=loginUser.getMemberNo()%>">
		<input type="hidden" name="tid" value="<%=b.getTid()%>">
		
		
		
		

	 <br><br>
	 <div align="right">
		<button onclick="complete()">작성완료</button>
		<button onclick="deleteimg()">삭제하기</button>
	</div>
	</form>
	<script>
		function complete(){
			$("#updateForm").attr("action","<%=request.getContextPath()%>/updateChildImg.tbo");
		}
		function deleteimg(){
			$("#updateForm").attr("action","<%=request.getContextPath()%>/deletechildImgBoard.tbo")
		}
		
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

	});
    
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>