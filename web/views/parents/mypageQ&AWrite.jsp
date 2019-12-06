<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
h2 {
	
}
</style>
</head>
<body>
<%@include file="/views/common/parentsMenu.jsp" %>

<div style="margin: 50px 25%; margin-bottom: 20px;">
<h2>건의 문의 작성</h2>
<form action="<">
	<h3 style="text-underline-position: under; width: 100%;">제목</h3>
	<div class="ui fluid icon input">
		<input type="text" id="title" name="title" placeholder="제목을 입력하세요">
	</div>
	
	<br />
	
	<div>
		<select>
			
			<option>담임 선생님</option>
			<option>원장 선생님</option>
		</select>
	</div>
	
	<br />
	<div class="ui form">
		<div class="field">
			<h3 style="text-underline-position: under;">내용</h3>
			<textarea style="resize: none; width: 100%;" rows="25" id="content" name="content"
			placeholder="내용을 입력하세요"></textarea>
		</div>
		
	</div>
	<br>  <input type="submit" id="boardWrite"
		value="완료" style="float: right" />
		<br /><br/>
		</form>
		
		
</div>
<%@include file="/views/common/footer.jsp" %>
</body>
</html>