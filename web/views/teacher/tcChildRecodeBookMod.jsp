<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생활 기록부</title>
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
	.childrecord {
		text-align: center;
		width:70%;
	}
	.childrecord th,td input { 
		border: none; 
		width:100%;
	}
	.childrecord th,td { 
		border: 1px solid black;
		border-collapse: collapse;
	}
	.childrecord tr>th {
		width:20%;	
	}
	.childrecord2 {
		text-align: center;
		width:70%;
	}
	.childrecord2 {
		border: 1px solid black;
		border-collapse: collapse;
	}
	#imgth {
		border-right:none;
		border-top: none;
		border-bottom:none;
	}
	.checkDetail td {
		width:12%; 
	}
	.slash {
		background: url(<%= request.getContextPath() %>/images/slash.png);
		background-size: 100% 100%;
		text-align: left;
	}
	.backslash {
		background: url(<%= request.getContextPath() %>/images/backslash.png);
		background-size: 100% 100%;
		text-align: left;
	}
	.slash div, .backslash div { text-align: right; }
	
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
		<h1 align="center" style="text-decoration: underline; text-underline-position: under;">박건후 생활기록부</h1>
	</div>
	<form action="tcChildRecodeBook.jsp" method="post">
	<div align="center">
		<table class="childrecord">
			<tr>
				<th class="backslash"><div>연령</div>구분</th>
				<th>만 3세</th>
				<th>만 4세</th>
				<th>만 5세</th>
				<th id="imgth" rowspan="4"><img	src="<%=request.getContextPath()%>/images/img.jpg" alt="" width="100px" /></th>
			</tr>
			<tr>
				<td>수료·졸업대장번호</td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>반</td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>담임 성명</td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
			</tr>
		</table>
	</div>
	<div style="margin: 0 15%;">
		<h1 style="text-decoration: underline; text-underline-position: under;">1. 인적사항</h1>
	</div>
	<div>
		<table class="childrecord2" style="width: 70%">
			<tr>
				<td style="width: 8%">성명</td> 
				<td colspan="5" style="width: 36%"><input type="text" value="박건후" style="text-align:center"/></td>
				<td style="width: 8%">성별</td>
				<td style="width: 15%"><input type="text" value="남자" style="text-align:center"/></td>
				<td style="width: 8%">생년월일</td>
				<td style="width: 25%"><input type="text" value="11.11.11" style="text-align:center"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="9"><input type="text" /></td>
			</tr>
			<tr>
				<td rowspan="3">가족상황</td>
				<td colspan="2" class="backslash" style="width:10%"><div>관계</div>구분</td>
				<td colspan="2" style="width:10%">부</td>
				<td colspan="2" style="width:10%">모</td>
				<td colspan="3">특이사항</td>
			</tr>
			<tr>
				<td colspan="2">성명</td>		
				<td colspan="2"><input type="text" /></td>
				<td colspan="2"><input type="text" /></td>
				<td colspan="3"><input type="text" /></td>	
			</tr>
			<tr>
				<td colspan="2">생년월일</td>
				<td colspan="2"><input type="text" /></td>
				<td colspan="2"><input type="text" /></td>
				<td colspan="3"><input type="text" /></td>
			</tr>
		</table>
	</div>
	<div style="margin: 0 15%;">
		<h1 style="text-decoration: underline; text-underline-position: under;">2. 학적사항</h1>
	</div>
	<div>
		<table style="width:70%">
			<tr>
				<td colspan="8" style="width:80%">
					<input type="text" style="width:10%; text-align:right; float:left" /><span style="float:left">년</span> 
					<input type="text" style="width:5%; text-align:right; float:left"/><span style="float:left">월</span> 
					<input type="text" style="width:5%; text-align:right; float:left" /><span style="float:left">일</span>  
					<input type="text" style="width:10%; text-align:right; float:center" /> <span style="float:center">유치원</span>  
					<span style="float:right">세 입학</span> 
					<input type="text" style="width:5%; text-align:right; float:right"/> 
					<span style="float:right">만</span> 
				</td>
				<td colspan="2" style="width:20%">특이사항</td>
			</tr>
			<tr>
				<td colspan="8"><input type="text" /></td>
				<td colspan="2"><input type="text" /></td>
			</tr>
			<tr>
				<td colspan="8"><input type="text" /></td>
				<td colspan="2"><input type="text" /></td>
			</tr>
			<tr>
				<td colspan="8"><input type="text" /></td>
				<td colspan="2"><input type="text" /></td>
			</tr>
			<tr>
				<td colspan="2" style="width:20%">졸업 후의 상황</td>
				<td colspan="8" style="width:80%"><span style="float:left; margin-left:10%">초등학교 진학, 기타 : </span> <input type="text" style="width:60%;"/></td>
			</tr>
		</table>
	</div>
	<div style="margin: 0 15%;">
		<h1 style="text-decoration: underline; text-underline-position: under;">3. 출결상황</h1>
	</div>
	<div>
		<table style="width:70%">
			<tr style="background:lightgray">
				<td class="backslash" style="width:20%;"></td>
				<td style="width:20%;">수업일수</td>
				<td style="width:20%;">출석일수</td>
				<td style="width:20%;">결석일수</td>
				<td style="width:20%;">특기사항</td>
			</tr>
			<tr>
				<td>만 3세</td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>만 4세</td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>만 5세</td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
			</tr>
		</table>
	</div>
	<div style="margin: 0 15%;">
		<h1 style="text-decoration: underline; text-underline-position: under;">4. 신체발달상황</h1>
	</div>
	<div>
		<table style="width:70%">
			<tr>
				<td rowspan="2" class="backslash" style="width:10%"><div>구분</div>연령</td>
				<td colspan="3">1학기</td>
				<td colspan="3">2학기</td>
				<td rowspan="2" style="width:20%">특이사항</td>
			</tr>
			<tr class="checkDetail">
				<td>검사일</td>
				<td>키</td>
				<td>몸무게</td>
				<td>검사일</td>
				<td>키</td>
				<td>몸무게</td>
			</tr>
			<tr>
				<td>만 3 세</td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>만 4 세</td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>만 5 세</td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
				<td><input type="text" /></td>
			</tr>
		</table>
	</div>
	<div style="margin: 0 15%; height:50px;">
		<input type="submit" value="완료" style="float:right"/>
	</div>
	</form>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>