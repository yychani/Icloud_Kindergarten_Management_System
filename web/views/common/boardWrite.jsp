<%@page import="com.oracle5.common.model.vo.Attachment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.oracle5.member.model.vo.*"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style>
input[type=text] { 
	border-radius: 10px;
	width: 100%;
	height: 30px;
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

textarea {
	border-radius: 10px;
}
</style>

<div style="margin: 50px 25%; margin-bottom: 20px;">
	<h3 style="text-underline-position: under; width: 100%;">제목</h3>
	<div class="ui fluid icon input">
		<input type="text" id="title" name="title" placeholder="제목을 입력하세요">
	</div>
	
	<br />
	
	<input type="hidden" name="userNo" value="<%=loginUser.getMemberNo()%>">
	
	<div class="ui form">
		<div class="field">
			<h3 style="text-underline-position: under;">내용</h3>
			<textarea style="resize: none; width: 100%;" rows="25" id="content" name="content"
			placeholder="내용을 입력하세요"></textarea>
		</div>
		
	</div>
	
	<table align="center" style="width:100%" id="plusFileArea">
		<tr>
			<td style="width:40px;"><input type="button" id="plusFile" style="width:30px; height:30px;" value="+">
			<td align="left"><input type="file" name="img1" /></td>
			<td><input type="submit" id="boardWrite"value="완료" style="float: right" /></td>
		</tr>

	</table>
	
</div>
<script>
	$(function(){
		var i = 2;
		$("#plusFile").click(function(){
			
			var name = "img" + i;

			var $tr = $("<tr>");
			
			var $td = $("<td></td><td align='left' style='padding: 7px 0;'><input type='file' name='" + name + "'></td><td></td>");
			var files = $("<input type='file'>");
			var $tbody = $("#plusFileArea");

			$tr.append($td);
			
			$tbody.append($tr);
			i++;
		});
	});
</script>



















