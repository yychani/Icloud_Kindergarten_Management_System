<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유아관찰척도</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
	.childOb td {
		border:1px solid black;
		padding:2px;
	}
	.childOb {
		border:2px solid black;
		width:70%;
	}
	.childOb tr:nth-of-type(n+4) td:nth-of-type(n+2) {
		word-spacing:2.5em;
		font-weight:bold;
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
</style>
</head>
<body>
    <%@ include file="/views/common/teacherMenu.jsp" %>
    <div style="margin: 0 15%;">
 		<h1 align="center" style="text-decoration: underline; text-underline-position: under;">박건후 관찰척도</h1>
 		<select name="" id="" style="float:right;">
 			<option value="3">만 3 세</option>
 			<option value="3">만 4 세</option>
 			<option value="3">만 5 세</option>
 		</select>
 	</div>
 	<form action="" method="get">
 	<div>
 		<table class="childOb">
 			<tr>
 				<td colspan="3" style="width:20%">유아이름</td>
 				<td colspan="3" style="width:30%"><span>박건후</span></td>
 				<td colspan="2" style="width:20%">1차</td>
 				<td colspan="3" style="width:30%"><span>2016</span><span>년</span><span>3</span><span>월</span><span>3</span><span>일</span></td>
 			</tr>
 			<tr>
 				<td colspan="3" style="width:20%">관찰자</td>
 				<td colspan="3" style="width:30%"><span>담임선생</span></td>
 				<td colspan="2" style="width:20%">2차</td>
 				<td colspan="3" style="width:30%"><span>2016</span><span>년</span><span>9</span><span>월</span><span>3</span><span>일</span></td>
 			</tr>
 			<tr>
 				<td colspan="2" style="width:8%;"><span>영역</span></td>
 				<td colspan="5"><span style="word-spacing:5em">내 용</span></td>
 				<td colspan="2" style="width:20%;"><span style="text-decoration:underline; font-weight:bold; word-spacing:2.5em">3 2 1</span></td>
 				<td colspan="2" style="width:20%"><span style="text-decoration:underline; font-weight:bold; word-spacing:2.5em">3 2 1</span></td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">신체운동·건강영역</span></td>
 				<td colspan="5" style="font-weight:normal">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="1" id="1-3" style="display:none" onclick="test()"/><label for="1-3">3</label>
 					<input type="radio" name="1" id="1-2" style="display:none" onclick="test()"/><label for="1-2">2</label>
 					<input type="radio" name="1" id="1-1" style="display:none" onclick="test()"/><label for="1-2">1</label>
 				</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">의사소통영역</span></td>
 				<td colspan="5" style="font-weight:normal">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="1" id="1-3" style="display:none" onclick="test()"/><label for="1-3">3</label>
 					<input type="radio" name="1" id="1-2" style="display:none" onclick="test()"/><label for="1-2">2</label>
 					<input type="radio" name="1" id="1-1" style="display:none" onclick="test()"/><label for="1-2">1</label>
 				</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">사회관계영역</span></td>
 				<td colspan="5" style="font-weight:normal">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">예술경험영역</span></td>
 				<td colspan="5" style="font-weight:normal">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">자연탐구영역</span></td>
 				<td colspan="5" style="font-weight:normal">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td colspan="5">TEST</td>
 				<td colspan="2">3 2 1</td>
 				<td colspan="2">3 2 1</td>
 			</tr>
 			<tr>
 				<td rowspan="2" style="width:3%; height:10em"><span style="writing-mode: tb-rl;">총평</span></td>
 				<td style="width:3%;"><span style="font-size:10px">1학기</span></td>
 				<td colspan="9" style="height:4em;"><input type="text" style="width:100%; height:100%" /></td>
 			</tr>
 			<tr>
 				<td style="width:3%; font-size:0.5em"><span>2학기</span></td>
 				<td colspan="9" style="height:4em;"><input type="text" style="width:100%; height:100%" /></td>
 			</tr>		
 		</table>
 	</div>
 	<div style="margin: 0 15%; height:50px;">
		<input type="submit" value="수정하기" style="float:right" />
	</div>
	</form>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
    
    <script>
 		function test() {
				console.log($("input:radio[name=1]").is(":checked"));	
		}
 	</script>
</body>
</html>