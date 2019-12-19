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
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>아이들 사진 게시판</title>
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
		
</style>
<script>
$(function() {
	 $(".li:nth-child(1)").addClass("on");
	  
		$(".topMenuLi:nth-child(3)").addClass("on");

	$(".topMenuLi").mouseover(function() {
		 $(".li:nth-child(1)").removeClass("on");
	 $(".topMenuLi:nth-child(3)").removeClass("on");
	});

	$(".topMenuLi").mouseleave(function() {
 		$(".li:nth-child(1)").addClass("on");
	 $(".topMenuLi:nth-child(3)").addClass("on");
	});
}); 
          
  
</script>
</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h1 style="margin: 0 15%; text-decoration: underline; text-underline-position: under;" >아이들 사진 갤러리</h1>
	<h2 align="center"><%=b.getTtitle()%></h2>
	<div class="ui dividing header" align="center"></div>
	<label id="textArea">작성일 : <%=b.getTtime()%></label>
	<label id="textArea">조회수 : <%=b.getTcount() %></label>
	<form>
		<div align="center">
			<table id="tableArea">
			<tr id="trArea">
		<% 
			for(Attachment at : list){
		%>
				<td colspan="2" data-tooltip="사진 다운을 하시려면 클릭하세요!"><img  width="800" height="430" class="imgi"src="<%=request.getContextPath() %>/uploadFiles/<%=at.getChangeName() %>"
									onclick="location.href='<%=request.getContextPath()%>/imgdownload.tbo?num=<%= at.getFid()%>'"></td>
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
				<td rowspan="4"><label><%=b.getTcont() %></label></td>
			</tr>

			</table>
			<br>
					<div  class="ui dividing header"></div>
		</div>
		<br><br>
		
	</form>
	
	<table>
		<tr>
			<td></td>
		</tr>
	
	
	</table>
	<%if(loginUser != null && loginUser.getUType().equals("교사")) {%>
	 <input type="submit" id="boardReWrite" value="수정하기" onclick="location.href='<%=request.getContextPath() %>/selectChildImg2.tbo?num=<%=b.getTid() %>&isUpdate=true'" style="float: right" /><span style="float: right">&nbsp;&nbsp;</span> 
	 <%} %>
	 <input type="reset" id="return" value="목록으로" onclick="location.href='<%= request.getContextPath() %>/selectListChImg.tbo'" style="float: right" />
	 
	 <br><br>
	
	

	
	
	<script>

	
	
	
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>