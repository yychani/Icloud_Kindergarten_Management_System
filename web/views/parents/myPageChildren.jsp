<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이 정보</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	
	
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<style>
.ui.raised.card{
	margin: auto auto;
	width: 1000px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight:bold;
	color:black;
}
tr{
	height:50px;
}
#plusBtn{
	height:20px;
}
</style>
</head>


<body  style="overflow-x: hidden">
<%@ include file="/views/common/parentsMenu.jsp"%>


<h1 align="center">아이정보</h1>
	<br><br>
	
	
<div class="ui raised card">
  <div class="content">
    <div class="header">박건후</div>
    <div class="meta">
      <span class="category">15-03-29</span>
    </div>
    <div class="description">
      <table>
      	<tr>
      		<td>성별 : </td>
      		<td colspan="3" style="text-align: left;">
	      		<div class="ui radio checkbox">
		      		<div style="display:inline-block;">
		      			 <input type="radio" name="gender" value="f" checked="checked"><label>여</label>
		      		</div>
		      		<div style="display:inline-block;">
		      			<input type="radio" name="gender" value="m"><label>남</label>
		      		</div>
	  			 </div>
			</td>
      	</tr>
      	<tr>
      		<td>혈액형 : </td>
      		<td>a</td>
      	</tr>
      	<tr>
      		<td>거주지 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" value="경기도 수원시 팔달구 인계동"></div> </td>
      	</tr>
      	<tr>
      		<td>본적 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" value="경기도 수원시 팔달구 인계동 989-45"></div> </td>
      	</tr>
      	<tr>
      		<td>입학전 학적사항 : </td>
      		<td><div class="ui input"><input type="text" value="2015-03-25"></div></td>
      		<td><div class="ui input"><input type="text" value="꿈나래 유치원"></div></td>
      		<td><div class="ui input"><input type="text" value="특이사항입력칸"></div></td>
      		
      	</tr>
      	<tr id="plusBtn"><td colspan="4"><img width="20px" src="<%=request.getContextPath() %>/images/add.png" onclick=""></td></tr>
      	<tr>
      		<td>가족 사항 : </td>
      		<td><div class="ui input"><input type="text" value="부"></div></td>
      		<td><div class="ui input"><input type="text" value="박주호"></div></td>
      		<td><div class="ui input"><input type="text" value="010-3327-5305"></div></td>
      	</tr>
      	<tr>
      		<td></td>
      		<td><div class="ui input"><input type="text" value="모"></div></td>
      		<td><div class="ui input"><input type="text" value="안나"></div></td>
      		<td><div class="ui input"><input type="text" value="010-3327-5305"></div></td>
      	</tr>
      	<tr id="plusBtn"><td colspan="4"><img width="20px" src="<%=request.getContextPath() %>/images/add.png" onclick=""></td></tr>
      	<tr>
      		<td>특이사항 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" value="경기도 수원시 팔달구 인계동"></div></td>
      	</tr>
      	
      	
      </table>
    </div>
  </div>
  <div class="extra content">
    <div class="right floated author">
    <button class="ui teal basic button">아이 추가하기</button>
    <button class="ui green basic button">아이정보 변경</button>
      <img class="ui avatar image" src="<%= request.getContextPath() %>/uploadFiles/5racle_2019121016462761291.jpg"> 박건후
    </div>
  </div>
</div>

	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>