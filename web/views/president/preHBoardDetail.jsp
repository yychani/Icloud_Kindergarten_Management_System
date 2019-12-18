<%@page import="java.util.ArrayList"%>
<%@page import="com.oracle5.common.model.vo.Attachment"%>
<%@page import="com.oracle5.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Board b = (Board) request.getAttribute("b");
	ArrayList<Attachment> list = new ArrayList<>();
	if ((ArrayList<Attachment>) request.getAttribute("list") != null) {
		list = (ArrayList<Attachment>) request.getAttribute("list");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원 공지사항 detail</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
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
	<%@ include file="/views/common/presidentMenu.jsp"%>
	<div style="margin: 0 15%;">
		<h1
			style="text-decoration: underline; text-underline-position: under;">유치원 운영 위원회 게시판</h1>
	</div>
	<div id="hansol" align="right" style="margin-right: 22%;">
		작성자
		<%=b.getName()%>
		조회수
		<%=b.getTcount()%>
		작성일
		<%=b.getTtime()%></div>
	<div style="margin: 50px 25%; margin-bottom: 20px;">
		<h3 style="text-underline-position: under; width: 100%;">제목</h3>
		<div class="ui fluid icon input">
			<input type="text" id="title" name="title" style="border: 0;"
				value="<%=b.getTtitle()%>" readonly>
		</div>

		<br /> <input type="hidden" name="userNo"
			value="<%=loginUser.getMemberNo()%>">

		<div class="ui form">
			<div class="field">
				<h3 style="text-underline-position: under;">내용</h3>
				<textarea style="resize: none; width: 100%; border: 0;" rows="25"
					id="content" name="content" readonly><%=b.getTcont()%></textarea>
			</div>
			<%
				for (Attachment at : list) {
			%>
			<div class="Imgscr">
				<img alt="" style="width: 100%;"
					src="<%=request.getContextPath()%>/uploadFiles/<%=at.getChangeName()%>">
			</div>

			<%
				}
			%>
			
		</div>
		<br>
		<%
			if (loginUser != null && loginUser.getUType().equals("교사")) {
		%>
		<input type="submit" id="boardReWrite" value="수정하기"
			onclick="location.href='<%=request.getContextPath()%>/selectPreHBoard.bo?num=<%=b.getTid()%>&isUpdate=true'"
			style="float: right" /><span style="float: right">&nbsp;&nbsp;</span>
		<%
			}
		%>
		<input type="reset" id="return" value="목록으로"
			onclick="location.href='<%=request.getContextPath()%>/selectAllPreHBoard.bo'"
			style="float: right" /> <br> <br>
		<div class="ui comments">
			<h3 class="ui dividing header">댓글</h3>

			<div class="comment">
				<div class="reply">
					<div class="content">
						<a class="author">채성아</a>
						<div class="metadata">
							<span class="date">Today at 5:42PM</span>
						</div>
						<div class="text">조용히해!</div>
					</div>
					<div class="actions" onclick="">
						<a class="rereply">댓글달기</a>
					</div>
					<div class="rereArea">
						<input type="text" id="reretext">
						<button id="rereBtn">댓글 달기</button>
					</div>
				</div>
			</div>
			<!-- 댓글 영역 -->
			<div class="comment">
				<div class="reply" id="rplycontent" onload="getReply()">
						
				</div>
			</div>

				<!-- 댓글 영역 -->
				<form class="ui reply form" action="">
					<div class="field">
						<textarea id="textAreaRe"></textarea>
					</div>
					<div class="ui blue labeled submit icon button" id="btn">
						<i class="icon edit"></i> 등록하기
					</div>
				</form>

			
</div>
		</div>
		<script>
		
			function getReply(){
				var tid='<%=b.getTid()%>'
				$.ajax({
					url:"/main/selectAllPreH.re",
					data:{tid:tid},
					type:"post",
					success:function(data){
						var $content = $("#rplycontent");
						$content.html('');
						console.log(data);
						for(var key in data) {
							var $contentDiv = $("<div class='content'>");
							var $a = $("<a class='author'>").text(data[key].rname);
							var $div1 = $("<div class='metadata'>");
							var $span = $("<span class='date'>").text(data[key].rdate);
							var $div2 = $("<div class='text'>").text(data[key].rcont);
							$contentDiv.append($a);
							$contentDiv.append($div1.append($span));
							$contentDiv.append($div2);
							
							$content.append($contentDiv);
							
							var $actionDiv = $("<div class='actions' onclick=''>");
							var $rereply = $("<a class='rereply'>댓글달기</a>");
							$actionDiv.append($rereply);
							
							$content.append($actionDiv);
							
							var $rereAreaDiv = $("<div class='rereArea'>");
							var $inputText = $("<input type='text' id='reretext'>");
							var $rereBtn = $("<button id='rereBtn'>댓글 달기</button>");
							
							$rereAreaDiv.append($inputText);
							$rereAreaDiv.append($rereBtn);
							
							$content.append($rereAreaDiv);
							
							$(".rereArea").hide();
					}},
					error:function(data){
						console.log("댓글 조회 실패");
					}
					
				});
			}
		
			$(function() {
				$(".rereArea").hide();

				$(document).on("click", ".rereply", function() {
					$(this).parent().next(".rereArea").toggle();
				});
				
				getReply();

			});
			
			$("#btn").click(function(){
				var writer = '<%= loginUser.getMemberNo()%>'
				var tid ='<%=b.getTid()%>'
				var content = $("#textAreaRe").val();
				console.log("1")
				
				$.ajax({
					url:"/main/preHBoardInsertReply.bo",
					data : {writer:writer,
						content:content,
						tid:tid},
						type:"post",
						success:function(data){
							var $content = $("#rplycontent");
							$content.html('');
							console.log(data);
							for(var key in data) {
					
								var $contentDiv = $("<div class='content'>");
								var $a = $("<a class='author'>").text(data[key].rname);
								var $div1 = $("<div class='metadata'>");
								var $span = $("<span class='date'>").text(data[key].rdate);
								var $div2 = $("<div class='text'>").text(data[key].rcont);
								$contentDiv.append($a);
								$contentDiv.append($div1.append($span));
								$contentDiv.append($div2);
								
								$content.append($contentDiv);
								
								var $actionDiv = $("<div class='actions' onclick=''>");
								var $rereply = $("<a class='rereply'>댓글달기</a>");
								$actionDiv.append($rereply);
								
								$content.append($actionDiv);
								
								var $rereAreaDiv = $("<div class='rereArea'>");
								var $inputText = $("<input type='text' id='reretext'>");
								var $rereBtn = $("<button id='rereBtn'>댓글 달기</button>");
								
								$rereAreaDiv.append($inputText);
								$rereAreaDiv.append($rereBtn);
								
								$content.append($rereAreaDiv);
								
								$(".rereArea").hide();

							}
						},
						error:function(date){
							console.log("댓글달기 실패");
						}
				});
			});
			
			/* <div class="actions" onclick="">
				<a class="rereply">댓글달기</a>
			</div>
			<div class="rereArea">
				<input type="text" id="reretext">
				<button id="rereBtn">댓글 달기</button>
			</div> */
			$("#rereBtn").click(function(){
				var writer = '<%= loginUser.getMemberNo()%>'
				var tid ='<%=b.getTid()%>'
				var content = $("#rertext").val();
				
				$.ajax({
						url:"/main/preHBoardInsertReReply.bo",
						data : {writer:writer,
								content:content,
								tid:tid},
						type:"post",
						success:function(data){
							console.log(data);
						},
						error:function(data){
							console.log("댓글의 댓글 실패");
						}
						});
				
				var writer 
				var $replyContent = $("#replyContent");
				var $div1 = $("<div id='rereply'>");
				
				
			});
		</script>
		<!-- replyArea end -->

		<%@ include file="/views/common/footer.jsp"%>
		<%@ include file="/views/common/chat.jsp"%>
</body>
</html>























