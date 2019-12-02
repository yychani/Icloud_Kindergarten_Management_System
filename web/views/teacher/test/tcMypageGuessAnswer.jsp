<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#hansol{
		padding-left:30%;
		align="center";
		margin-left:30px;
	}
	#hs{
		width:600px; 
		height:150px;
	}
	table{
		width:600px;
	}
</style>
</head>
<body>
	<%@include file="/views/common/teacherMenu.jsp" %>
	<form action="<%=request.getContextPath()%>/answerGuess" method="post">
	<div id="hansol">
	<table border="1">
		<tr>
			<th>제목</th><th>야</th><th>작성자</th><th>작성일</th>
		</tr>
		<tr>
			<th>내용</th><td>뭐 어쩌라고 뒤질래? 라고 누가 말했어? <br>정말 나쁜 아이구나 진짜 너는 아니다</td><td>임한솔</td><td>2019-11-22</td>
		</tr>
	</table>
	<input type="text" id="hs" placeholder="답변을 입력해주세요~">
	<br>
	<input type="submit" value="답변달기" >
	<input type="reset" value="뒤로가기" onclick="locatioin href=''">
	</div>
	</form>
	<%@include file="/views/common/footer.jsp" %>
</body>
</html>