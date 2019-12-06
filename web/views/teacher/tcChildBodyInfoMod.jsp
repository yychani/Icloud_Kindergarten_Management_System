<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이 신체정보</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<script>
    $(function() {
  	  $(".li:nth-child(9)").addClass("on");
   	  
        $(".topMenuLi:nth-child(2)").addClass("on");
       
        $(".topMenuLi").mouseover(function() {
          $(".li:nth-child(9)").removeClass("on");
          $(".topMenuLi:nth-child(2)").removeClass("on");
       });
      
        $(".topMenuLi").mouseleave(function() {
          $(".li:nth-child(9)").addClass("on");
          $(".topMenuLi:nth-child(2)").addClass("on");
       });
    }); 
</script>
<style>
	.outer {
		margin: 0 15%;
		padding-top: 10px;
	}
	#BiTable {
		margin: 0 auto;
		margin-top: 40px;
		width: 100%;
	}
	#BiTable th {
		text-align: center;
		width: 33%;
	}
	#BiTable td {
		text-align: center;
	}
	.childbutton {
		float:right;
	}
	input[type=text] {
		text-align:center;
	}
</style>
</head>
<body>

    <%@ include file="/views/common/teacherMenu.jsp" %>
	<div style="margin: 0 15%;">
 		<h1  align="center" style="text-decoration: underline; text-underline-position: under;">박건후 신체정보</h1>
 	</div>
 	<div class="outer">
 		<select name="" id="" style="float:right">
 			<option value="박건후">박건후</option>
 			<option value="권연주">권연주</option>
 			<option value="윤재영">윤재영</option>
 			<option value="이원경">이원경</option>
 		</select>
 		<br />
 		<table class="ui red table" id="BiTable" border="1">
 			<tr>
 				<th>측정일</th>
 				<th>키</th>
 				<th>몸무게</th>
 			</tr>
 			<tr >
 				<td><input type="text" id="checkDate" value="2018/09/16" /></td>
 				<td><input type="text" id="childHeight" value="88.5cm" /></td>
 				<td><input type="text" id="childWeight" value="15.2kg" /></td>
 			</tr>
 		</table>
 		<div style="height:40px; margin-top:7px;">
 		<input type="button" id="addInfo" class="childbutton" value="추가하기" />
 		</div>
 	</div>
 	<hr />
 	<div style="margin:10px 15%; height:40px;">
		<input type="button" class="childbutton" value="수정완료" onclick="location.href='tcChildBodyInfo.jsp'"/>
		<p class="childbutton">&nbsp;&nbsp;</p>
		<input type="button" class="childbutton" value="목록으로" onclick="location.href='tcChildMgmt.jsp'"/>
	</div>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>