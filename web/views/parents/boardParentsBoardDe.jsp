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
<title>학부모 게시판 </title>
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
</style>

</head>
<body>
	<%@ include file="/views/common/parentsMenu.jsp" %>
	
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
	<div style="margin: 0 15%;">
 	<h1 style="text-decoration: underline; text-underline-position: under;">학부모 게시판 </h1>
 	</div>
 	<div id="hansol" align="right" style="margin-right:22%;">작성자  <%=b.getName() %> 조회수  <%=b.getTcount() %> 작성일 <%=b.getTtime() %></div>
 	<div style="margin: 50px 25%; margin-bottom: 20px;">
	<h3 style="text-underline-position: under; width: 100%;">제목</h3>
	<div class="ui fluid icon input">
		<input type="text" id="title" name="title" style="border:0;" value="<%=b.getTtitle()%>" readonly>
	</div>
	
	<br />
	
	<input type="hidden" name="userNo" value="<%=loginUser.getMemberNo()%>">
	
	<div class="ui form">
		<div class="field">
			<h3 style="text-underline-position: under;">내용</h3>
			<textarea style="resize: none; width: 100%; border:0;" rows="25" id="content" name="content" 
			  readonly><%=b.getTcont() %></textarea>
		</div>		
	</div>
	<% 
			for(Attachment at : list){
		%>
		<div class="Imgscr"><img alt=""  class="img" style="width: 100%;"src="<%=request.getContextPath() %>/uploadFiles/<%=at.getChangeName() %>"></div>
		<%} %>
	<br>
	 <%if(loginUser != null && loginUser.getUType().equals("학부모")) {%>
	 <input type="submit" id="boardReWrite" value="수정하기" onclick="location.href='<%=request.getContextPath() %>/selectParent.pbo?num=<%=b.getTid()%>&isUpdate=true'" style="float: right" /><span style="float: right">&nbsp;&nbsp;</span> 
	 <%} %>
	 <input type="reset" id="return" value="목록으로" onclick="location.href='<%= request.getContextPath() %>/selectAll.pbo'" style="float: right" />
	 
	 <br><br>
	 <div class="ui comments">
			<h3 class="ui dividing header">댓글</h3>
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


<script>
		
function getReply(){
	var tid='<%=b.getTid()%>'
	$.ajax({
		url:"/main/selectAllPreH.re",
		data:{tid:tid},
		type:"post",
		success:function(data){
			var $content = $("#rplycontent");
			var index = 0;
			var rid = 0;
			var rid2 = 0;
			
			console.log(data);
			for(var key in data) {
				if(data[key].refrid == 0){
					var $contentDiv = $("<div class='content'>");
					var $a = $("<a class='author'>").text(data[key].rname);
					var $div1 = $("<div class='metadata'>");
					var $span = $("<span class='date'>").text(data[key].rdate);
					var $div2 = $("<div class='text'>").text(data[key].rcont);
					var $inputRid = $("<input type='hidden'>").val(data[key].rid);
					
					
					$contentDiv.append($a);
					$contentDiv.append($div1.append($span));
					$contentDiv.append($div2);
					$contentDiv.append($inputRid);
					$content.append($contentDiv);
					
					var $actionDiv = $("<div class='actions' onclick=''>");
					var $rereply = $("<a class='rereply'>댓글달기</a>");
					$actionDiv.append($rereply);
					
					$content.append($actionDiv);
					
					var $rereAreaDiv = $("<div class='rereArea'>");
					var $inputText = $("<input type='text' class='reretext'>");
					var $rereBtn = $("<button id='rereBtn'>댓글달기</button>");
					
					
					$rereAreaDiv.append($inputText);
					$rereAreaDiv.append($rereBtn);
					
					$content.append($rereAreaDiv);
					
					$(".rereArea").hide();
					rid = data[key].rid;
					console.log("rid123 : " + rid);
				}
				else {
					//for(var key2 in data){
						//console.log(index++);
					console.log(data[key].rid);
					if(rid == data[key].refrid && rid != rid2){
						var  $rereplyArea = $("<div class='rereply' id='rereplycontent' style='margin-left:20px;'>");
						
						var $contentDiv2 = $("<div class='content'>");
						var $a1 = $("<a class='author'>").text(data[key].rname);
						var $div11 = $("<div class='metadata'>");
						var $span1 = $("<span class='date'>").text(data[key].rdate);
						var $div21 = $("<div class='text'>").text(data[key].rcont);
						
						$contentDiv2.append($a1);
						$contentDiv2.append($div11.append($span1));
						$contentDiv2.append($div21);
						
						$rereplyArea.append($contentDiv2);
						
						$content.append($rereplyArea);
						rid2 = data[key].rid;
					}
					//console.log(key2);
					//}
				}
			}
		},
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
	var writer = '<%= loginUser.getMemberName()%>'
	var tid ='<%=b.getTid()%>'
	var content = $("#textAreaRe").val();
	console.log("1")
	var rid = 0;
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
					if(data[key].refrid == 0){
					var $replyArea = $("#replycontent");
					var $contentDiv = $("<div class='content'>");
					var $a = $("<a class='author'>").text(data[key].rname);
					var $div1 = $("<div class='metadata'>");
					var $span = $("<span class='date'>").text(data[key].rdate);
					var $div2 = $("<div class='text'>").text(data[key].rcont);
					var $inputRid = $("<input type='hidden'>").val(data[key].rid);
					
					$contentDiv.append($a);
					$contentDiv.append($div1.append($span));
					$contentDiv.append($div2);
					$contentDiv.append($inputRid);
					
					$content.append($contentDiv);
					
					var $actionDiv = $("<div class='actions' onclick=''>");
					var $rereply = $("<a class='rereply'>댓글달기</a>");
					$actionDiv.append($rereply);
					
					$content.append($actionDiv);
					
					var $rereAreaDiv = $("<div class='rereArea'>");
					var $inputText = $("<input type='text' class='reretext'>");
					var $rereBtn = $("<button id='rereBtn'>댓글 달기</button>");
					
					$rereAreaDiv.append($inputText);
					$rereAreaDiv.append($rereBtn);
					
					$replyArea.append($rereAreaDiv);
					
					$(".rereArea").hide();
					rid = data[key].rid;
					}
					for(var key2 in data){
						if(rid == data[key2].refrid){
							var  $rereplyArea = $("<div class='rereply' id='rereplycontent' style='margin-left:20px;'>");
							
							var $contentDiv2 = $("<div class='content'>");
								var $a1 = $("<a class='author'>").text(data[key2].rname);
								var $div11 = $("<div class='metadata'>");
									var $span1 = $("<span class='date'>").text(data[key2].rdate);
								var $div21 = $("<div class='text'>").text(data[key2].rcont);
							
							$contentDiv2.append($a1);
							$contentDiv2.append($div11.append($span1));
							$contentDiv2.append($div21);
							
							$rereplyArea.append($contentDiv2);
							
							$content.append($rereplyArea);
						}
					}
					
				} $("#textAreaRe").val('');
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
//일단 이것은 미완성
$(document).on("click", "#rereBtn", function() {
	
	var writer = '<%= loginUser.getMemberName()%>'
	var tid ='<%=b.getTid()%>'
	var content = $(this).parent().find("input").val();

	var refrid = $(this).parent().prev().prev().find("input").val();
	console.log(refrid);
	
	$.ajax({
			url:"/main/preHBoardInsertReReply.bo",
			data : {writer:writer,
					content:content,
						tid:tid,
					refrid:refrid},
			type:"post",
			success:function(data){
				var $content = $("#rplycontent");
				var rid2 = 0;
				$content.text("");
				var index = 0;
				var rid = 0;
				for(var key in data) {
					if(data[key].refrid == 0){
						var $contentDiv = $("<div class='content'>");
						var $a = $("<a class='author'>").text(data[key].rname);
						var $div1 = $("<div class='metadata'>");
						var $span = $("<span class='date'>").text(data[key].rdate);
						var $div2 = $("<div class='text'>").text(data[key].rcont);
						var $inputRid = $("<input type='hidden'>").val(data[key].rid);
						
						
						$contentDiv.append($a);
						$contentDiv.append($div1.append($span));
						$contentDiv.append($div2);
						$contentDiv.append($inputRid);
						$content.append($contentDiv);
						
						var $actionDiv = $("<div class='actions' onclick=''>");
						var $rereply = $("<a class='rereply'>댓글달기</a>");
						$actionDiv.append($rereply);
						
						$content.append($actionDiv);
						
						var $rereAreaDiv = $("<div class='rereArea'>");
						var $inputText = $("<input type='text' class='reretext'>");
						var $rereBtn = $("<button id='rereBtn'>댓글달기</button>");
						
						
						$rereAreaDiv.append($inputText);
						$rereAreaDiv.append($rereBtn);
						
						$content.append($rereAreaDiv);
						
						$(".rereArea").hide();
						rid = data[key].rid;
						console.log("rid123 : " + rid);
					}
					else {
						//for(var key2 in data){
							//console.log(index++);
						console.log(data[key].rid);
						if(rid == data[key].refrid && rid != rid2){
							var  $rereplyArea = $("<div class='rereply' id='rereplycontent' style='margin-left:20px;'>");
							
							var $contentDiv2 = $("<div class='content'>");
							var $a1 = $("<a class='author'>").text(data[key].rname);
							var $div11 = $("<div class='metadata'>");
							var $span1 = $("<span class='date'>").text(data[key].rdate);
							var $div21 = $("<div class='text'>").text(data[key].rcont);
							
							$contentDiv2.append($a1);
							$contentDiv2.append($div11.append($span1));
							$contentDiv2.append($div21);
							
							$rereplyArea.append($contentDiv2);
							
							$content.append($rereplyArea);
							rid2 = data[key].rid;
						}
						//console.log(key2);
						//}
					}
					//$("#rereBtn").trigger("#click");
				}
			},
			error:function(data){
				console.log("댓글 조회 실패");
			}
		});
});
		</script>
		<!-- replyArea end -->
		</div>
 	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>