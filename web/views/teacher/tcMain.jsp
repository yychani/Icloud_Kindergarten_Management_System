<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	String bn = (String) request.getAttribute("bn");
	ArrayList<Children> list = (ArrayList<Children>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 메인페이지</title>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
	.main {
		text-align: center;
		margin: 50 auto;
	}
	.list{
		padding: 50px;
	}
	.no {
		width: 100px !important;
		height: 30px !important;
		border-right: 1px solid black;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}
	.name {
		width: 700px !important;
		height: 30px !important;
		border-left: 1px solid black;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
	}
</style>
</head>
<body> 
	<%@ include file="/views/common/teacherMenu.jsp" %>
	<div class="list">
		<div style="margin: 0 15%;">
 		<h1 align="center" style="text-decoration: underline; text-underline-position: under;"><%= bn %>반 원아 목록</h1>
 		</div>
		<input type="hidden" id="tno" value="<%= loginUser.getMemberNo() %>" />
		<table class="main" align="center">
			<tr>
				<th class="no">No.</th>
				<th class="name">이름</th>
			</tr>
			<% for(int i = 0; i < list.size(); i++) { %>
			<tr>
				<td class="no"><%= i + 1 %> <input type="hidden" id="cid" value="<%= list.get(i).getCId() %>" /></td>
				<td class="name"><a href="<%= request.getContextPath() %>/views/teacher/tcFeed.jsp?cid=<%= list.get(i).getCId() %>"><%= list.get(i).getName() %></a></td> 
			</tr>
			<% } %>
		</table>
	</div>
	

    <%@ include file="/views/common/footer.jsp" %>
    <%@ include file="/views/common/chat.jsp" %>
</body>
</html>