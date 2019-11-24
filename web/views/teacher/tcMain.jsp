<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 		<h1 align="center" style="text-decoration: underline; text-underline-position: under;">해바라기반 원아 목록</h1>
 		</div>
		
		<table class="main" align="center">
			<%-- db값 읽어오는걸로 유동적으로 추가되도록 할 것 --%>
				<!-- tcFeed?name=test -> test자리는 db에서 아이이름 가져와서 채울 것 -->
			<tr>
				<th class="no">No.</th>
				<th class="name">이름</th>
			</tr>
			<tr>
				<td class="no">1</td>
				<td class="name"><a href="tcFeed.jsp">권연주</a></td> 
			</tr>
			<tr>
				<td class="no">2</td>
				<td class="name"><a href="tcFeed.jsp">윤재영</a></td> 
			</tr>
			<tr>
				<td class="no">3</td>
				<td class="name"><a href="tcFeed.jsp">이범희</a></td> 
			</tr>
			<tr>
				<td class="no">4</td>
				<td class="name"><a href="tcFeed.jsp">이원경</a></td> 
			</tr>
			<tr>
				<td class="no">5</td>
				<td class="name"><a href="tcFeed.jsp">임한솔</a></td> 
			</tr>
			<tr>
				<td class="no">6</td>
				<td class="name"><a href="tcFeed.jsp">박건후</a></td> 
			</tr>
			<tr>
				<td class="no">7</td>
				<td class="name"><a href="tcFeed.jsp">이유진</a></td> 
			</tr>
			<tr>
				<td class="no">8</td>
				<td class="name"><a href="tcFeed.jsp">최이수</a></td> 
			</tr>
			<tr>
				<td class="no">9</td>
				<td class="name"><a href="tcFeed.jsp">최신우</a></td> 
			</tr>
			<tr>
				<td class="no">10</td>
				<td class="name"><a href="tcFeed.jsp">최이준</a></td> 
			</tr>
			<tr>
				<td class="no">11</td>
				<td class="name"><a href="tcFeed.jsp">박나은</a></td> 
			</tr>
			<tr>
				<td class="no">12</td>
				<td class="name"><a href="tcFeed.jsp">강성호</a></td> 
			</tr>
			<tr>
				<td class="no">13</td>
				<td class="name"><a href="tcFeed.jsp">고효정</a></td> 
			</tr>
			<tr>
				<td class="no">14</td>
				<td class="name"><a href="tcFeed.jsp">황하준</a></td> 
			</tr>
		</table>
	</div>
	

    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>