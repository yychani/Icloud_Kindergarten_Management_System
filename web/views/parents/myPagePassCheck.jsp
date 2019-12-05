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

<!-- 글꼴  -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>
<style>
#outBox {
	width: 700px;
	margin: 15% auto;
	align:center;
}

</style>

<body>
	<%@ include file="/views/common/parentsMenu.jsp"%>
	
	<div id="outBox" align="center">
		<form
			action="<%=request.getContextPath()%>/views/parents/myPage.jsp"
			method="post"  onsubmit="return true">
			<label>비밀번호 확인이 필요합니다.</label><br><br>
			<div class="ui left corner labeled input">
				 <input type="password"
					placeholder="PASSWORD">
				<div class="ui left corner label">
					<i class="asterisk icon"></i>
				</div>
			</div>
			<button type="submit" class="ui positive basic button">확인</button>
		</form>
	</div>

</body>
</html>