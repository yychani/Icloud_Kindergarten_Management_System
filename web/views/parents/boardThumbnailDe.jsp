<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
</style>
</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h1 style="margin: 0 15%; text-decoration: underline; text-underline-position: under;" >아이들 사진 갤러리</h1>
	<h2 align="center">사진 제목</h2>
	<div class="ui dividing header" align="center"></div>
	<label id="textArea">2019 -12 - 19</label>
	<form>
		<div align="center">
			<table id="tableArea">
			<tr id="trArea">
				<td colspan="2"><img class="imgi"src="<%=request.getContextPath() %>/images/child.png"
									onclick="location.href='<%=request.getContextPath()%>/download.bo?'"></td>
			</tr>
			<tr>
				<td	colspan="2">&nbsp;</td>	
			</tr>
			<tr>
				<td	colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>

			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
				
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
	
			
			</table>
			<table align="center" id="tableArea2">
			<tr>
				<td rowspan="4"><label></label></td>
			</tr>

			</table>
			<br>
					<div  class="ui dividing header"></div>
		</div>
		<br><br>
		
	</form>
	
	
	<div class="ui comments">
  <h3 class="ui dividing header">댓글</h3>
  <div class="comment">
    <div class="content">
      <a class="author">채성아</a>
      <div class="metadata">
        <span class="date">Today at 5:42PM</span>
      </div>
      <div class="text">
           조용히해!
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
</div>
	<button class="TBtn" onclick="location.href='../parents/boardThumbnailMain.jsp'">뒤로가기</button>
	
	
	
	
	
	
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
    
    $(function(){
    	$(".icon edit").click(function(){
    	
    	})
    	
    })
    
    $(function(){
    	$(".rereArea").hide();
    	
    	$(".rereply").click(function(){
    		$(".rereArea").toggle();
    		
    	})
    	
    	
    })
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>