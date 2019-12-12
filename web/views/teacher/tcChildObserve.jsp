<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	int i = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유아관찰척도</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
	.childOb td {
		border:1px solid black;
	}
	.childOb {
		border:2px solid black;
		width:70%;
	}
	.childOb tr:nth-of-type(n+4) td:nth-of-type(n+2) {
		word-spacing:2.5em;
		font-weight:bold;
	}
	input[type='button'] {
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
</head>
<body>
    <%@ include file="/views/common/teacherMenu.jsp" %>
    <div style="margin: 0 15%;">
 		<h1 align="center" style="text-decoration: underline; text-underline-position: under;"><%= ((Children) list.get(0).get("c")).getName() %> 관찰척도</h1>
 		<select name="selectAge" id="selectAge" style="float:right;">
 			<option value="3" selected>만 3 세</option>
 			<option value="4">만 4 세</option>
 			<option value="5">만 5 세</option>
 		</select>
 	</div>
 	
 	<div>
 		<table class="childOb">
 			<tr>
 				<td colspan="3" style="width:20%">유아이름</td>
 				<td colspan="3" style="width:30%"><span><%= ((Children) list.get(0).get("c")).getName() %></span></td>
 				<td colspan="2" style="width:20%">1차</td>
 				<td colspan="3" style="width:30%"><span><%= ((Observation) list.get(0).get("ob")).getEDate() %></span></td>
 			</tr>
 			<tr>
 				<td colspan="3" style="width:20%">관찰자</td>
 				<td colspan="3" style="width:30%"><span><%= ((Member) list.get(0).get("m")).getMemberName() %></span></td>
 				<td colspan="2" style="width:20%">2차</td>
 				<td colspan="3" style="width:30%">
 				<% if(list.size() == 2) { %>
 					<span><%= ((Observation) list.get(1).get("ob")).getEDate() %></span>
				<% } else { %>
					<span>&nbsp;</span>
				<% } %>
 				</td>
 			</tr>
 			<tr>
 				<td colspan="2" style="width:6%;"><span>영역</span></td>
 				<td colspan="5"><span style="word-spacing:5em">내 용</span></td>
 				<td colspan="2" style="width:20%;"><span style="text-decoration:underline; font-weight:bold; word-spacing:2.5em">3 2 1</span></td>
 				<td colspan="2" style="width:20%"><span style="text-decoration:underline; font-weight:bold; word-spacing:2.5em">3 2 1</span></td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">신체운동 건강영역</span></td>
 				<td colspan="5" style="font-weight:normal">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">의사소통영역</span></td>
 				<td colspan="5" style="font-weight:normal">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">사회관계영역</span></td>
 				<td colspan="5" style="font-weight:normal">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">예술경험영역</span></td>
 				<td colspan="5" style="font-weight:normal">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">자연탐구영역</span></td>
 				<td colspan="5" style="font-weight:normal">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td rowspan="2" style="width:3%; height:10em"><span style="writing-mode: tb-rl;">총평</span></td>
 				<td style="width:3%;"><span style="font-size:8px">1학기</span></td> 
 				<td colspan="9" style="height:4em;"><%= ((Observation) list.get(0).get("ob")).getEval() %></td>
 			</tr>
 			<tr>
 				<td style="width:3%; font-size:0.5em"><span>2학기</span></td>
 				<td colspan="9" style="height:4em;">
 				<% if(list.size() == 2) { %>
 					<%= ((Observation) list.get(1).get("ob")).getEval() %>
 				<% } else { %>
 					&nbsp;
 				<% } %>
 				</td>
 			</tr>		
 		</table>
 	</div>
 	<div style="margin: 0 15%; height:50px;">
		<input type="button" value="뒤로가기" style="float:right; background:lightgray; color:black" onclick="location.href='tcChildDetail.jsp'" />
		<span style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<input type="button" value="수정하기" style="float:right" onclick="location.href='tcChildObserveMod.jsp'" />
		<span style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<input type="button" value="인쇄하기" style="float:right; background:lightgray; color:black" />
	</div>
	<script>
		$("#selectAge").change(function() {
			console.log($(this).val())
			<% %>
		});
	</script>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>