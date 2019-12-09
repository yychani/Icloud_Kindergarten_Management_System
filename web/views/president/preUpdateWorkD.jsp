<%@page import="com.oracle5.task.model.vo.WorkDivision"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<% WorkDivision work = (WorkDivision) request.getAttribute("work"); %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
th {
	text-align: left;
}

input[type=text] {
	border-radius: 10px;
	width: 300px;
	height: 30px;
}

input[type=checkbox] {
	width: 15px;
	height: 15px;
	vertical-align: center;
}

#charge {
	width: 120px;
	border: 1px solid black;
	vertical-align: middle;
	border-left: none;
}

#task {
	width: 500px;
	border: 1px solid black;
}

#cleaningArea {
	width: 300px;
	border: 1px solid black;
	border-right: none;
}

tr>th {
	text-align: center;
	font-weight: bold;
	font-size: 13pt;
	height: 50px;
}

textarea {
	border-radius: 10px;
	resize: none;
}

#workDivision {
	margin: 70px auto;
}
input[type='submit'] {
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

<body style="overflow-x: hidden">
	<%@ include file="/views/common/presidentMenu.jsp"%>
	<div style="margin: 0 15%;">
		<h1
			style="text-decoration: underline; text-underline-position: under;">선생님
			업무분장</h1>
	</div>
	<form action="<%=request.getContextPath()%>/updateWork.task" method="post">
		<table id="workDivision" align="center">
			<tr>
				<th id="charge">담당</th>
				<th id="task">업무 내용</th>
				<th id="cleaningArea">청소 구역</th>
			</tr> 
			<tr>
				<td id="charge" style="padding-right: 0;"><select
					 id="chargeN"
					style="margin-left: 10px; width: 100px; height: 30px; background:lightgray;" disabled>
					<%if(work.getPid() != 0) { %>
					<option value="<%=work.getPid() %>" selected><%=work.getName() %></option>
					<% } else { %>
					<option value="<%=work.getTno() %>" selected><%=work.getName() %></option>
					<% } %>
				</select>
				<input type="hidden" name="type" value="<%=work.getType() %>">
				<input type="hidden" name="chargeN" value="<%=work.getPid() %>"></td>
				<td id="task" style="padding-left: 20px; padding-right: 0;"><textarea
						name="taskText" id="taskText" cols="61" rows="10"
						placeholder="담당업무를 줄단위로 입력해 주세요"><%=work.getContent() %></textarea></td>
				<td id="cleaningArea" style="padding-left: 20px; padding-right: 0;"><textarea
						name="cleaningText" id="cleaningText" cols="34" rows="10"
						placeholder="청소구역을 줄단위로 입력해 주세요"><%=work.getArea() %></textarea></td>
			</tr>
			<tr>
				<td colspan="3"><div style="float: right;">
						<input type="submit" value="확인">&nbsp;&nbsp;
						<input type="button" value="취소"
							onclick="location.href='<%=request.getContextPath()%>/selectWorkList.task'">
					</div></td>
			</tr>
		</table>
	</form>
	<script>
		$(function() {
			$(".li3").addClass("on");
			$(".topMenuLi:nth-child(2)").addClass("on");
			$(".topMenuLi").mouseover(function() {
				$(".li3").removeClass("on");
				$(".topMenuLi:nth-child(2)").removeClass("on");
			});
			$(".topMenuLi").mouseleave(function() {
				$(".li3").addClass("on");
				$(".topMenuLi:nth-child(2)").addClass("on");
			});
		});
	</script>

	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>

</html>