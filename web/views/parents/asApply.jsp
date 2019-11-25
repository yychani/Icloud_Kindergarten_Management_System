<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>

table {
	margin: 70px auto;
}

input[type=text] {
	border-radius: 10px;
	width: 300px;
	height: 30px;
}

td {
	padding: 10px 30px;
	padding-left: 0;
}

input[type=checkbox] {
	width: 15px;
	height: 15px;
	vertical-align: center;
}
	button {
		width: 80px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
</style>

</head>
<body style="overflow-x:hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
<form align="center">
	<h1>방과후 신청</h1>
	<table align="center">
		<tr>
			<td><label>아이 이름: </label></td>
			<td><input type="text" placeholder="아이 이름을 입력해주세요" id="kidName" name="kidName" ></td>
		</tr>
		<tr>
			<td><label>신청 선택:</label></td>
			<td><input type="checkbox">신청</td>
			<td><input type="checkbox">미신청</td>
		</tr>
		<tr align="right">
			<td><input type="submit" value="신청하기"></td>
		</tr>
	
	</table>
	
</form>
	<script>
    $(function() {
        $(".li1").addClass("on");
        $(".topMenuLi:nth-child(3)").addClass("on");

        $(".topMenuLi").mouseover(function() {
           $(".li1").removeClass("on");
           $(".topMenuLi:nth-child(3)").removeClass("on");
        });
        $(".topMenuLi").mouseleave(function() {
           $(".li1").addClass("on");
           $(".topMenuLi:nth-child(3)").addClass("on");
        });

     });  
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>