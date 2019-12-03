<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	h2 {
		padding-left:30px;
	}
	#div1{
		margin-left:20%;
		
		
	}
</style>
</head>
<body style="overflow-x:hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	
	<h2>방과후 프로그램</h2>
	<%-- <div id="div1">
		<table align="center">
			<tr>
				<td colspan="2"><h4>음악 프로그램</h4></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath() %>/images/as1.PNG"></td>
				<td>말하기, 노래부르기, 신체표현, 악기연주 등 다양한 음악활동을 통해 기초 음악 개념을형성하고<br>
					몸으로 자연스럽게 리듬을 느끼는 음악 프로그램 입니다.</td>
			</tr>
			<tr>
				<td colspan="2"><h4>다양한 언어 프로그램</h4></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath() %>/images/as2.PNG"></td>
				<td>언어 습득의 기본단계와 유아의 특성을 반영 하여 알파벳 모양을 흥미롭게 익히며 기초과정을 완성하고<br>
					다양한 언어를 처음 접하는 유아들이 즐겁게 배울 수 있도록 하는 프로그램</td>
			</tr>
			<tr>
				<td colspan="2"><h4>놀이 프로그램</h4></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath() %>/images/as3.PNG"></td>
				<td>다양한 신체단련활동을 통해 성장 발달에 도움이 되는 놀이 프로그램을 통해<br>
					근육발달과 지구력을 키울수 있는 활동</td>
			</tr>
			<tr>
				<td colspan="2"><h4>예술 프로그램</h4></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath() %>/images/as4.PNG"></td>
				<td>만들고 그리며 노는 과정에서 아이의 마음이 가장 자유롭게 펼쳐지도록 창의표현, 생각을 이끌어 내는 <br>
					아이들의 이야기 미술 프로그램</td>
			</tr>
		</table>
	</div> --%>
	<%@ include file="/views/parents/asList.jsp" %>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>