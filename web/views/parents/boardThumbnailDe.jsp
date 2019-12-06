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
				<td colspan="2"><img class="imgi"src="<%=request.getContextPath() %>/images/child.png"></td>
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
				<td rowspan="4"><label>생명을 동산에는 있으며, 소담스러운 철환하였는가?
				 피어나기 풍부하게 풀이 눈이 풍부하게 수 타오르고 이 봄바람이다. 살 충분히 품으며, 전인 기관과 산야에 것은 끓는 그리하였는가? 
				 이상의 하여도 과실이 풀이 오직 같이, 든 약동하다. 이 이상이 두손을 평화스러운 봄바람이다. 그들은 인생에 보배를 할지라도 가슴이 것은 역사를 꽃이 황금시대다. 
				 그들의 그것을 석가는 사막이다. 청춘의 황금시대의 있을 바이며, 말이다. 청춘의 뼈 풀이 보이는 온갖 봄바람이다. 돋고, 우리의 거선의 귀는 청춘의 피가 오아이스도 설레는 때문이다. 
				 고동을 끓는 발휘하기 놀이 없는 이상의 봄바람이다.</label></td>
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
        <a class="reply">댓글달기</a>
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
        <a class="reply">댓글달기</a>
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
            <a class="reply">댓글달기</a>
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
        <a class="reply">댓글달기</a>
      </div>
    </div>
  </div>
  <form class="ui reply form" action="">
    <div class="field">
      <textarea></textarea>
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
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>