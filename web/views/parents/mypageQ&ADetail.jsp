<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<style>
	.ui.comments{
		
		margin-left:420px;
	}
	.ui.blue.labeled.submit.icon.button{
		margin-left:510px;
	}

</style>



</head>
<body  style="overflow-x:hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<!-- 질문 영역 -->
	<table align="center">
		<tr>
			<td style="width:60px;">제목 : </td><td style="width:350px;" align="left">안녕 디지몬</td><td style="width:60px;">작성일 : </td><td style="width:200px;" align="left">2019-08-19</td>
		</tr>
		<tr>
			<td colspan="4">
			
			<textarea style="resize: none; width: 100%; height:250px;" rows="25" id="content" name="content" readonly align="center" text-align="center">
				안녕 디지몬 내꿈을 찾아서 잠이들래 안녕 디지몬 친구들 모두안녕
			</textarea>
		 	</td>
		</tr>
			
	</table>
	
	<!-- 댓글 영역 -->
	
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
      <div class="actions">
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
      <textarea id="text1"></textarea>
    </div>
    <div class="ui blue labeled submit icon button">
      <i class="icon edit"></i> 등록하기
    </div>
  </form>
</div>


<%@ include file="/views/common/chat.jsp"%>
<%@include file="/views/common/footer.jsp" %>

</body>
<script>
	$(function(){
		 var text1=$("#text1").val();
		 
		 
		 
	});
	
	
	
	
</script>
</html>

















