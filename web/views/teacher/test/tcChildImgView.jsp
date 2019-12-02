<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/views/common/teacherMenu.jsp"  %>
	<form action="<%=request.getContextPath()%>/deleteChildren" method="post">
	<div align="center">
		<table border="1">
			<tr>
				<td colspan="2"><h3>가을 소풍 왔어요</h3></td><td>조회수</td><td>10</td><td>작성일</td><td>2019-11-22</td>
			</tr>
			<tr>
				<td colspan="2"><img src="<%=request.getContextPath() %>/images/as2.PNG"></td><td colspan="2"><img src="<%=request.getContextPath() %>/images/as2.PNG"></td>
				<td colspan="2"><img src="<%=request.getContextPath() %>/images/as2.PNG"></td>
			</tr>
		</table>
		<input type="submit" value="앨범수정">
		<input type="submit" value="삭제하기" >
		<input type="reset" value="뒤로가기" onclick="location.href='/main/views/teacher/tcChildImgMain.jsp'"> 
	</div>
	
	</form>
	<%@include file="/views/common/footer.jsp" %>
</body>
</html>