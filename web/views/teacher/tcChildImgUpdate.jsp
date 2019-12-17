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

	<div align="center">
		<% 
			for(Attachment at : list){
		%>
		<div>
			<form action="" method="post" enctype="multipart/form-data" id="imgUpdateForm">
				<table id="tableArea">
				<tr id="trArea">
					<td><input type="hidden" name="fid" id="fid"value="<%=at.getFid()%>">
					<input type="hidden" name="tidImg" value="<%=b.getTid()%>"></td>
					<td colspan="2"><img width="800" height="400" class="imgi" src="<%=request.getContextPath() %>/uploadFiles/<%=at.getChangeName() %>"></td>
					<td><input type="button" class="updateImg" value="수정"></td>
					<td><input type="button" class="deleteImg" value="삭제"></td>		
					<td>
						<div id="titleImgArea" style="width: 200px; height:180px; border: 1px solid black;">
						</div>
						<div id="fileArea">
							<input type="file" id="thumbnailImg1" name="imgfid<%=at.getFid()%>" onchange="loadImg(this, 1)">
						</div>
					</td>							
				</tr>
					
					
			
				<tr>
					<td	colspan="2">&nbsp;</td>	
				</tr>
				<tr>
					<td	colspan="2">&nbsp;</td>
				</tr>
		
				</table>
			</form>
		</div>
			<%} %>
			<div>
			<!-- <form id="updateForm" method="post"> -->
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
		<input type="button" onclick="complete()" value="작성완료">
		<input type="button" onclick="deleteimg()" value="삭제하기">
	</div>
	<!-- </form> -->
	
	<script>
		function loadImg(value, num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){
					switch(num){
					case 1 : $("#titleImg").attr("src",e.target.result);break;
					}
				}
				reader.readAsDataURL(value.file[0]);
			}
		}
		$(function(){
			/* $("#fileArea").hide();
			
			$("#titleImgArea").click(function(){
				$("#thumbnailImg1").click();
			}) */
		})
		
	
	</script>
	<script>
	
		function complete(){
			$("#updateForm").attr("action","<%=request.getContextPath()%>/updateChildImg.tbo");
			$("#updateForm").submit();
		}
		function deleteimg(){
			$("#updateForm").attr("action","<%=request.getContextPath()%>/deletechildImgBoard.tbo");
			$("#updateForm").submit();
		}
		function updateImg(){
			$("#imgUpdateForm").attr("action","<%=request.getContextPath()%>/");
			$("#imgUpdateForm").submit();
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
	<script>
		$(function(){
			
			$(document).on("click", ".updateImg", function(){
				var writer = "<%=loginUser.getMemberName()%>";
				var fid = $(this).parent().siblings().children("#fid").val();
				var form = $(this).parents("form");
			    var formdata = new FormData(form[0]);
			    var img = $(this).parent().prev().children().eq(0);
			    
				$.ajax({
					url:"/main/UpdateImgServlet.tbo",
					type:"post",
			    	processData:false,
			    	contentType:false,
			    	data:formdata,
			    	success:function(data) {
			    		img.prop("src", "<%=request.getContextPath() %>/uploadFiles/" + data.changeName);
			    	},
			    	error:function() {
			    		console.log("실패");
			    	} 
				});
			});
			$(document).on("click", ".deleteImg", function(){
				var writer = "<%=loginUser.getMemberName()%>";
				var fid = $(this).parent().siblings().children("#fid").val();
			    var img = $(this).parent().prev().children().eq(0);
			    var form = $(this).parents("form");
			    
				$.ajax({
					url:"/main/deleteImg.tbo",
					type:"post",
			    	data:{
			    		fid:fid
			    	},
			    	success:function(data) {
			    		console.log("이미지 삭제완료")
			    		form.remove();
			    	},
			    	error:function() {
			    		console.log("실패");
			    	} 
				});
			});
		});
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>