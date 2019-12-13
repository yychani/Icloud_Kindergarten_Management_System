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
    <div class="header" align="center"> <img class="ui avatar image" src="<%= request.getContextPath() %>/uploadFiles/5racle_2019121016462761291.jpg"> 박건후</div>
    <div class="meta" align="center">
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
      		<td colspan="3" id="scholarInfo"><div id="scholarValue" class="ui input"><input type="date"><input type="text" placeholder="기관명 입력"><input type="text" placeholder="특이사항 입력"></div></td>
      	</tr>
      	<tr id="plusBtn"><td colspan="4"><img id="addScholar" width="20px" src="<%=request.getContextPath() %>/images/add.png" onclick=""></td></tr>
      	<tr>
      		<td>가족 사항 : </td>
      		<td colspan="3" id="familyInfo"><div id="familyValue" class="ui fluid icon input"><input  name="fRelation"  type="text" placeholder="관계입력"><input name="fName" type="text" placeholder="이름 입력"><input name="fPhone" type="text" placeholder="연락처 입력"></div></td>
      	</tr>

      	<tr id="plusBtn"><td colspan="4"><img id="addFamily" width="20px" src="<%=request.getContextPath() %>/images/add.png" onclick=""></td></tr>
      	<tr>
      		<td>특이사항 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" placeholder="아이 특이사항 입력란"></div></td>
      	</tr>
      </table>
    </div>
  </div>
  <div class="extra content">
    <div class="right floated author">
    <button class="ui teal basic button">아이 추가하기</button>
    <button class="ui green basic button">아이정보 변경</button>
    </div>
  </div>
</div>

<script>
	/* 학적사항 추가 버튼 */
		$("#addScholar").click(function(){
			$("#scholarValue").clone(true).appendTo($("#scholarInfo:last-child"));
			return false;
		});
	
	/* 가족관계 추가 버튼 */
	    $("#addFamily").click(function(){
			$("#familyValue").clone(true).appendTo($("#familyInfo:last-child"));
			return false;
		});  

	
	
</script>

	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>