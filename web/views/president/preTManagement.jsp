<%@page import="com.oracle5.member.model.vo.Teacher"%>
<%@page import="com.oracle5.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	ArrayList<Member> mlist = (ArrayList<Member>) request.getAttribute("mlist");
	ArrayList<Teacher> tlist = (ArrayList<Teacher>) request.getAttribute("tlist");
	System.out.println(mlist + "\n" + tlist);
%>
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
table {
	margin: 50px auto;
}

input[type=text] {
	background: none;
	border: none;
}

input[type=checkbox] {
	width: 15px;
	height: 15px;
	vertical-align: center;
}

button {
	width: 80px;
	height: 40px;
	border-radius: 10px;
	background: rgb(63, 63, 63);
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
}

.teacher {
	border-radius: 10px;
	background: rgba(216, 216, 216, 0.486);
}

.pictureTd {
	width: 300px;
	height: 250px;
	padding-right: 0;
}

.picture {
	width: 250px;
	height: 250px;
	border: 1px solid black;
}
</style>
</head>

<body style="overflow-x: hidden">
	<%@ include file="/views/common/presidentMenu.jsp"%>
	<div style="margin: 0 15%;">
		<h1
			style="text-decoration: underline; text-underline-position: under;">선생님
			관리</h1>
	</div>
	<%
		for (Member m : mlist) {
			for (Teacher t : tlist) {
				if (t.getTeacherNo() == m.getMemberNo()) {
	%>
	<table class="teacher" style="text-align: left">
		<tr>
			<td class="pictureTd" rowspan="3" align="center"><img
				src="<%=t.getImgSrc()%>" class="picture" align="center"></td>
			<td style="width: 200px; padding-bottom: 15px; padding-top: 20px;"><span>Teacher.</span><br>
				<h2 style="margin-top: 5px;"><%=m.getMemberName()%></h2> <span
				style="margin-top: 5px; margin-bottom: 50px; color: gray; font-size: 10pt;"><%=t.getTDescription()%></span><br>

				<div class="ui list">
					<div class="item">
						<i class="user icon"></i>
						<div class="content" id="userId"><%=m.getMemberId()%></div>
					</div>
					<div class="item">
						<i class="book icon"></i>
						<div class="content" id="dept"><%=t.getPId()%></div>
					</div>
					<div class="item">
						<i class="users icon"></i>
						<div class="content" id="className"><%=t.getClassName()%>
							반
						</div>
					</div>
					<div class="item">
						<i class="calendar plus icon"></i>
						<div class="content" id="hireDate"><%=t.getTEntDate()%></div>
					</div>
					<div class="item">
						<i class="phone square icon"></i>
						<div class="content" id="phone"><%=m.getPhone()%></div>
					</div>
					<div class="item">
						<i class="mail icon"></i>
						<div class="content">
							<a href=""><%=m.getEmail()%></a>
						</div>
					</div>
				</div>
			<td style="width: 130px;"><input style="float: left;"
				type="hidden" value="삭제" class="deleteBtn"></td>
		</tr>

	</table>
	<%
		}
			}
		}
	%>

	<div style="margin-bottom: 50px; width: 100%;">
		<input type="button" value="계정 생성" id="create"
			style="float: right; margin-right: 28%;"
			onclick="location.href='<%=request.getContextPath()%>/views/president/preTCreate.jsp'">&nbsp;&nbsp;
		<input type="button" id="delete" value="계정 삭제"
			style="float: right; margin-right: 31%;"> <input
			type="hidden" id="deleteC" value="삭제 완료"
			style="float: right; margin-right: 28%;">&nbsp;&nbsp; <br>
		<br>
	</div>
	<script>
		$(function() {
			$(".topMenuLi:nth-child(4)").addClass("on");

			$(".topMenuLi").mouseover(function() {
				$(".topMenuLi:nth-child(4)").removeClass("on");
			});
			$(".topMenuLi").mouseleave(function() {
				$(".topMenuLi:nth-child(4)").addClass("on");
			});
			$("#delete").on("click", function() {
				$(".deleteBtn").prop("type", "button");
				$("#deleteC").prop("type", "button");
				$("#deleteCC").prop("type", "button");
				$(this).prop("type", "hidden");
				$("#create").prop("type", "hidden");
			});
			$("#deleteC").on("click", function() {
				$(".deleteBtn").prop("type", "hidden");
				$("#delete").prop("type", "button");
				$("#deleteCC").prop("type", "hidden");
				$(this).prop("type", "hidden");
				$("#create").prop("type", "button");
			});

			$(".deleteBtn").click(function() {
				$("#teacher").remove();
			})
		});
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>

</html>