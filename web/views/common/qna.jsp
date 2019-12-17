<%@page import="com.oracle5.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<%
	ArrayList<Board> qnaList = (ArrayList<Board>) request.getAttribute("qnaList");
%>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	
<style>
.accordion {
	background-color: rgb(255, 255, 255);
	color: #444;
    border: 1.5px solid gold;
    border-radius: 10px;
	cursor: pointer;
	padding: 6px;
	text-align: center;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
	width: 1000px;
	font-family: 'Noto Sans KR', sans-serif;
	width: 700px;
}

.active, .accordion:hover {
	background-color: rgba(255, 247, 228, 0.306);
}

.panel {
	padding: 0 18px;
	background-color: white;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	 font-family: 'Noto Sans KR', sans-serif;
}
tr{
	height: 30px;
}
#noList{
	margin:auto auto;
	height: 450px;
    display: table-cell;
    vertical-align: middle;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 15px;
    font-weight:bold;
    color: rgb(209, 57, 57)
}
</style>	
	
	<div id="totalList" align="center">

	<%
	
	if(qnaList.size() == 0){
		

	%>
		<div id="noList"><label> 건의 문의 신청이 없습니다.</label></div>
	
	<%} else {
			for (int i = 0; i < qnaList.size(); i++) {
		%>

		<button class="accordion"> 일자 :  <%= qnaList.get(i).getTtime() %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성자 : <%= qnaList.get(i).getName() %></button>
		<div class="panel">
			<table align="center" class="goHomeTable">
				<tr>
					<td><label>일자 : </label></td>
					<td colspan="2"><label><%= qnaList.get(i).getTtime() %></label></td>
				</tr>
				<tr>
					<td><label>제목 : </label></td>
					<td colspan="2"><label><%= qnaList.get(i).getTtitle() %></label></td>
				</tr>
				<tr>
					<td><label>내용 : </label></td>
					<td colspan="2" style="width:300px; padding: 0 10px;"><label><%= qnaList.get(i).getTcont() %></label></td>
				</tr>
				<tr>
					<td colspan="3" style="vertical-align:middle; padding-top: 10px;">
						<div class="ui form">
						  <div class="field">
							  <input type="hidden" class="tid" value="<%=qnaList.get(i).getTid() %>">
							  <label style="text-align: left">답변</label>
							  <textarea class="content" style="width: 500px; display: inline-block; vertical-align: middle; resize: none" ></textarea>
							  <input type="button" class="reply" style="width: 80px; height: 30px; margin-left: 10px;"value="답변하기">
						  </div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<br>
		<%
			}
	}
		%>
	

	</div><br><br>
	<script>
		$(document).on("click", ".reply", function(){
			var check = window.confirm("이 내용으로 답변 하시겠습니까?");
			var content = $(this).siblings(".content").val();
			var tid = $(this).siblings(".tid").val();
			
			if(check){
				alert("해당 건의/문의 내용에 대해 답변이 완료 되었습니다.");
				location.replace("<%=request.getContextPath() %>/insertQnAReply.bo?tno=<%=loginUser.getMemberNo() %>&writer=<%=loginUser.getMemberName() %>&content=" + content + "&tid=" + tid);
			}
		});
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			});
		}
	</script>
