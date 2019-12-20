<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.oracle5.board.model.vo.*"%>
<%@page import="com.oracle5.board.model.vo.Reply"%>

<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
%>
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
#requestBtn {
	float: right;
}

.accordion {
	background-color: rgb(255, 255, 255);
	color: #444;
	border: 1.5px solid rgb(147, 196, 34);
	border-radius: 10px;
	cursor: pointer;
	padding: 18px;
	text-align: center;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
	width: 1000px;
	font-family: 'Noto Sans KR', sans-serif;
	width: 700px;
}

.active, .accordion:hover {
	background-color: rgba(228, 247, 228, 0.306);
}

.panel {
	padding: 0 18px;
	background-color: white;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	font-family: 'Noto Sans KR', sans-serif;
}

tr {
	height: 30px;
}

#Out {
	margin: 0 auto;
}
#requestBtn{
	margin-right:400px;
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
</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<div style="margin: 0 15%;">
		<h1 align="center">건의/문의</h1>
	</div>
	<div align="center">
	<button type="button" id="requestBtn" class="ui green button" onclick="location.href='<%=request.getContextPath()%>/views/parents/mypageQ&AWrite.jsp'">문의하기</button></div>
	<br><br><br>
	<div id="Out" align="center">
	
		<div id="outBox">
			<%
				if (((ArrayList<Board>) hmap.get("bList")).size() == 0) {
			%>
			<div id="noList">
				<label> 건의 문의 신청이 없습니다.</label>
			</div>

			<%
				} else {
					for (int i = 0; i < ((ArrayList<Board>) hmap.get("bList")).size(); i++) {
			%>

			<button class="accordion">
				문의 상대 : <%=((ArrayList<Member>) hmap.get("mList")).get(i).getMemberName()%> &nbsp; 선생님 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				문의 내용 : <%=((ArrayList<Board>) hmap.get("bList")).get(i).getTtitle()%>
			</button>
			<div class="panel">
				<table align="center" class="goHomeTable">
					<tr>
						<td><label>일자 : </label></td>
						<td colspan="2"><label><%=((ArrayList<Board>) hmap.get("bList")).get(i).getTtime()%></label></td>
					</tr>
					<tr>
						<td><label>제목 : </label></td>
						<td colspan="2"><label><%=((ArrayList<Board>) hmap.get("bList")).get(i).getTtitle()%></label></td>
					</tr>
					<tr>
						<td><label>내용 : </label></td>
						<td colspan="2" style="width: 300px; padding: 0 10px;"><label><%=((ArrayList<Board>) hmap.get("bList")).get(i).getTcont()%></label></td>
					</tr>
					<tr>
						<td colspan="3" style="vertical-align: middle; padding-top: 10px;">
							<div class="ui form">
								<div class="field">
									<label style="text-align: left">답변</label>
									<% if(((ArrayList<Reply>) hmap.get("rList")).get(i).getRcont() == null) {%>
									<textarea class="content" style="width: 500px; height:100px; display: inline-block; vertical-align: middle; resize: none"> 답변이 아직 달리지 않았습니다.
										<% } else {%>
										<%=((ArrayList<Reply>) hmap.get("rList")).get(i).getRcont() %>
										<% } %>
									</textarea>
										
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
			<br><br><br>
		</div>
	</div>
	<script>
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

<script>
      $(function() {
    	  $(".li:nth-child(3)").addClass("on");
    	  
          $(".topMenuLi:nth-child(6)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(3)").removeClass("on");
            $(".topMenuLi:nth-child(6)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(3)").addClass("on");
            $(".topMenuLi:nth-child(6)").addClass("on");
         });
      }); 
</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>

</html>