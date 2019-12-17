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
		
</style>
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
</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h1 style="margin: 0 15%; text-decoration: underline; text-underline-position: under;" >아이들 사진 갤러리</h1>
	<h2 align="center"><%=b.getTtitle()%></h2>
	<div class="ui dividing header" align="center"></div>
	<label id="textArea"><%=b.getTtime()%></label>
	<form>
		<div align="center">
			<table id="tableArea">
			<tr id="trArea">
		<% 
			for(Attachment at : list){
		%>
				<td colspan="2"><img width="800" height="400" class="imgi"src="<%=request.getContextPath() %>/uploadFiles/<%=at.getChangeName() %>"
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
	<div class="ui comments">
  <h3 class="ui dividing header">댓글</h3>
 
  <div class="comment">
   <div class="reply">
    <div class="content">
      <a class="author">채성아</a>
      <div class="metadata">
        <span class="date">Today at 5:42PM</span>
      </div>
      <div class="text">
           조용히해!
      </div>
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
 
  <div class="comment">
    <div class="content">
      <a class="author">나미리</a>
      <div class="metadata">
        <span class="date">Yesterday at 12:30AM</span>
      </div>
      <div class="text">
        <p>역시 해바라기반은 조용한날이 없다니깐~</p>
      </div>
      <div class="actions">
        <a class="rereply">댓글달기</a>
      </div>
    </div>
    <div class="comments">
      <div class="comment">
        <div class="content">
          <a class="author">권연주</a>
          <div class="metadata">
            <span class="date">Just now</span>
          </div>
          <div class="text">
            한솔지금 몇시야
          </div>
          <div class="actions">
            <a class="rereply">댓글달기</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="comment">
    <div class="content">
      <a class="author">한솔 임</a>
      <div class="metadata">
        <span class="date">5 days ago</span>
      </div>
      <div class="text">
           죄송합니다.
      </div>
      <div class="actions">
        <a class="rereply">댓글달기</a>
      </div>
    </div>
  </div>
  <form class="ui reply form" action="">
    <div class="field">
      <textarea id="textAreaRe"></textarea>
    </div>
    <div class="ui blue labeled submit icon button">
      <i class="icon edit"></i> 등록하기
    </div>
  </form>
  
   <h3 class="ui dividing header">댓글</h3>
  	<div>
		<table id="replySelectTable" border="1" align="center">
			
		</table>
		
	</div>
  <div class="replyArea">
		<div class="replyWriteArea">
		<table align="center">
		
				<tr>
					<td>댓글작성</td>
					<td><textarea rows="3" cols="80" id="replyContent"></textarea></td>
					<td><button id="addReply">댓글 작성</button></td>
				</tr>
			</table>
		</div>
			
		</div><!-- replyArea end -->
</div>
	 <input type="reset" id="return" value="목록으로" onclick="location.href='<%= request.getContextPath() %>/selectListChImg.tbo'" style="float: right" />
	 
	 <br><br>
	
	
	
	
	
	<script>
	$(function(){
		$("#addReply").click(function(){
			var writer = <%=loginUser.getMemberNo()%>
			var tid = <%=b.getTid()%>
			var content = $("#replyContent").val();
			
			$.ajax({
				url:"/jsp/insertReply.bo",
				data:{
					writer:writer,
					content:content,
					tid:tid,
					
				},
				type:"post",
				success:function(data){
					//console.log(data);
					var $replySelectTable = $("#replySelectTable");
					$replySelectTable.html('');
					
					for(var key in data){
						var $tr = $("<tr>");
						var $writerTd = $("<td>").text(data[key].bWriter).css("width","100px");
						var $contentTd = $("<td>").text(data[key].bContent).css("width","400px");
						var $dateTd = $("<td>").text(data[key].bDate).css("width","200px");
						
						$tr.append($writerTd);
						$tr.append($contentTd);
						$tr.append($dateTd);  
						
						$replySelectTable.append($tr);
					}
				},
				error:function(){
					console.log("에러!");
				}
				
				
			})
			
		})
		
		
		
	})
	
	
	
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>