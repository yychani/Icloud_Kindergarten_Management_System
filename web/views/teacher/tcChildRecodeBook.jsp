<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	HashMap<String, Object> hmap1 = (HashMap<String, Object>) request.getAttribute("hmap");
	Children c = (Children) request.getAttribute("c");
	String address = (String) request.getAttribute("address");
	ArrayList<FamilyRelation> fr = (ArrayList<FamilyRelation>) request.getAttribute("fr");
	ArrayList<Scholarly> sc = (ArrayList<Scholarly>) request.getAttribute("sc");
	ArrayList<BodyInfo> bi = (ArrayList<BodyInfo>) request.getAttribute("bi");
%>
<%
	String gender = "";
	if(c.getRno().substring(7, 8).equals("1")) {
		gender = "남";
	} else if(c.getRno().substring(7, 8).equals("2")) {
		gender = "여";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생활 기록부</title>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
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
		background: url("<%= request.getContextPath() %>/images/slash.png");
		background-size: 100% 100%;
		text-align: left;
	}
	.backslash {
		background: url("<%= request.getContextPath() %>/images/backslash.png");
		background-size: 100% 100%;
		text-align: left;
	}
	.slash div, .backslash div { text-align: right; }
	input[type='button'] {
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
	<%-- <%@ include file="/views/common/recordBook.jsp" %> --%>
	

	<div style="margin: 0 15%;">
		<h1 align="center"
			style="text-decoration: underline; text-underline-position: under;"><%= c.getName() %>
			생활기록부</h1>
	</div>
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
				<td><%= ((String[]) hmap1.get("year"))[0] %><%= c.getCId() %></td>
				<td><%= ((String[]) hmap1.get("year"))[1] %><%= c.getCId() %></td>
				<td><%= ((String[]) hmap1.get("year"))[2] %><%= c.getCId() %></td>
			</tr>
			<tr>
				<td>반</td>
				<td><%= ((String[]) hmap1.get("ban"))[0] %></td>
				<td><%= ((String[]) hmap1.get("ban"))[1] %></td>
				<td><%= ((String[]) hmap1.get("ban"))[2] %></td>
			</tr>
			<tr>
				<td>담임 성명</td>
				<td><%= ((String[]) hmap1.get("name"))[0] %></td>
				<td><%= ((String[]) hmap1.get("name"))[1] %></td>
				<td><%= ((String[]) hmap1.get("name"))[2] %></td>
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
				<td colspan="5" style="width: 36%"><%= c.getName() %></td>
				<td style="width: 8%">성별</td>
				<td style="width: 15%"><%= gender %></td>
				<td style="width: 8%">생년월일</td>
				<td style="width: 25%"><%= c.getRno().substring(0,2) + "." + c.getRno().substring(2,4) + "." + c.getRno().substring(4,6) %></td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="9"><label id="address"><%= address %></label></td>
			</tr>
			<tr>
				<td rowspan="3">가족상황</td>
				<td colspan="2" class="backslash" style="width:10%"><div>관계</div>구분</td>
				<td colspan="2" style="width:10%"><%= fr.get(0).getRelation() %></td>
				<td colspan="2" style="width:10%"><%= fr.get(1).getRelation() %></td>
				<td colspan="3">특이사항</td>
			</tr>
			<tr>
				<td colspan="2">성명</td>		
				<td colspan="2"><%= fr.get(0).getName() %></td>
				<td colspan="2"><%= fr.get(1).getName() %></td>
				<td colspan="3"></td>	
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
					<span style="width:10%; text-align:right; float:left">&nbsp;</span><span style="float:left">년</span> 
					<span style="width:5%; text-align:right; float:left">&nbsp;</span><span style="float:left">월</span> 
					<span style="width:5%; text-align:right; float:left">&nbsp;</span><span style="float:left">일</span>  
					<span style="text-align:right; float:center">&nbsp;</span><span style="float:center">유치원</span>  
					<span style="float:right">&nbsp;세 입학</span> 
					<span style="width:3%; text-align:right; float:right">&nbsp;</span> 
					<span style="float:right">만</span> 
				</td>
				<td colspan="2" style="width:20%">특이사항</td>
			</tr>
			<% for(int i = 0; i < sc.size(); i++) { 
				Date d = sc.get(i).getSDate();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String date = sdf.format(d);		
				String[] dateArr = date.split("-");
				int year = new GregorianCalendar(Locale.KOREA).get(Calendar.YEAR);
			%>
			<tr>
				<td colspan="8">
					<span style="width:10%; text-align:right; float:left"><%= dateArr[0] %></span><span style="float:left">년</span> 
					<span style="width:5%; text-align:right; float:left"><%= dateArr[1] %></span><span style="float:left">월</span> 
					<span style="width:5%; text-align:right; float:left"><%= dateArr[2] %></span><span style="float:left">일</span>  
					<span style="text-align:right; float:center"><%= sc.get(i).getAgency() %></span>  
					<span style="float:right">&nbsp;세 입학</span> 
					<span style="width:3%; text-align:right; float:right"><%= year - Integer.parseInt(c.getRno().substring(0,2)) - 1900 %></span> 
					<span style="float:right">만</span> 
				</td>
				<td colspan="2"><%= sc.get(i).getUniqueness() %></td>
			</tr>
			<% } %>
			<tr>
				<td colspan="2" style="width:20%">졸업 후의 상황</td>
				<td colspan="8" style="width:80%;"><span style="float:left; margin-left:10%">초등학교 진학, 기타 : </span><span style="width:60%;"></span></td> 
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
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>만 4세</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>만 5세</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
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
			<% if(bi.size() >= 2) { %>
			<tr>
				<td>만 3 세</td>
				<td><%= bi.get(0).getBiDate() %></td>
				<td><%= bi.get(0).getHeight() %></td>
				<td><%= bi.get(0).getWeight() %></td>
				<td><%= bi.get(1).getBiDate() %></td>
				<td><%= bi.get(1).getHeight() %></td>
				<td><%= bi.get(1).getWeight() %></td>
				<td></td>
			</tr>
			<% } %>
			<tr>
				<td>만 4 세</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>만 5 세</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<script>
		var address = $("#address").text();
		var passphrase = "1234";
        var decrypted1 = CryptoJS.AES.decrypt(address, passphrase);
        var address1 = decrypted1.toString(CryptoJS.enc.Utf8);
        $("#address").text(address1);
	</script>
	
	<%--                                      --%>
	<div style="margin: 0 15%; height:50px;">
		<input type="button" value="뒤로가기" style="float:right; background:lightgray; color:black" onclick="location.href='tcChildDetail.jsp'" />
		<span style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<input type="button" value="수정하기" style="float:right" onclick="location.href='tcChildRecodeBookMod.jsp'" />
		<span style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<input type="button" value="인쇄하기" style="float:right; background:lightgray; color:black" />
	</div>
	<%@ include file="/views/common/chat.jsp" %>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>