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
	HashMap<String, Object> at = (HashMap<String, Object>) request.getAttribute("at");
%>
<%
	String gender = "";
	if(c.getRno().substring(7, 8).equals("1")) {
		gender = "남";
	} else if(c.getRno().substring(7, 8).equals("2")) {
		gender = "여";
	}
%> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
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
			<% for(int i = 0; i < 3; i++) { 
				if(((String[]) hmap1.get("year"))[i] != null) {%>
				<td><%= ((String[]) hmap1.get("year"))[i] %><%= c.getCId() %></td>
			<% } else { %>
				<td>&nbsp;</td>
			<% } 
			} %>
			</tr>
			<tr>
				<td>반</td>
			<% for(int i = 0; i < 3; i++) { 
				if(((String[]) hmap1.get("ban"))[i] != null) {%>
				<td><%= ((String[]) hmap1.get("ban"))[i] %></td>
			<% } else { %>
				<td>&nbsp;</td>
			<% } 
			} %>
			</tr>
			<tr>
				<td>담임 성명</td>
			<% for(int i = 0; i < 3; i++) { 
				if(((String[]) hmap1.get("name"))[i] != null) {%>
				<td><%= ((String[]) hmap1.get("name"))[i] %></td>
			<% } else { %>
				<td>&nbsp;</td>
			<% } 
			} %>
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
				<td colspan="2" style="width:10%"><% if(fr.size() >= 2) { %><%= fr.get(1).getRelation() %><% } else { %>&nbsp;<% } %></td>
				<td colspan="3">특이사항</td>
			</tr>
			<tr>
				<td colspan="2">성명</td>		
				<td colspan="2"><%= fr.get(0).getName() %></td>
				<td colspan="2"><% if(fr.size() >= 2) { %><%= fr.get(1).getName() %><% } else { %>&nbsp;<% } %></td>
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
				int age = year - Integer.parseInt(c.getRno().substring(0,2)) - 2000;
				if(age < 0) {
					age += 100;
				}
			%>
			<tr>
				<td colspan="8">
					<span style="width:10%; text-align:right; float:left"><%= dateArr[0] %></span><span style="float:left">년</span> 
					<span style="width:5%; text-align:right; float:left"><%= dateArr[1] %></span><span style="float:left">월</span> 
					<span style="width:5%; text-align:right; float:left"><%= dateArr[2] %></span><span style="float:left">일</span>  
					<span style="text-align:right; float:center"><%= sc.get(i).getAgency() %></span>  
					<span style="float:right">&nbsp;세 입학</span> 
					<span style="width:3%; text-align:right; float:right"><%= age %></span> 
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
				<td class="backslash" style="width:16.6%;"></td>
				<td style="width:16.6%;">수업일수</td>
				<td style="width:16.6%;">출석일수</td>
				<td style="width:16.6%;">결석일수</td>
				<td style="width:16.6%;">지각/조퇴</td>
				<td style="width:16.6%;">특이사항</td>
			</tr>
			<% int attend = 0; int tardy = 0; int leave = 0; int absent = 0; int savet = 0; int savel = 0;
			for(int i = 0; i < 3; i++) { %>
			<tr>
				<td>만 <%= i+3 %>세</td>
				<% if(((ArrayList<Attend>) at.get(String.valueOf(i+3))) != null) { %>
				<td><%= ((ArrayList<Attend>) at.get(String.valueOf(i+3))).size() %></td>
				<% for(int j = 0; j < ((ArrayList<Attend>) at.get(String.valueOf(i+3))).size(); j++) {
					switch(((ArrayList<Attend>) at.get(String.valueOf(i+3))).get(j).getAType()) {
					case "출석" : attend++; break;
					case "지각" : tardy++; savet++; break;
					case "조퇴" : leave++; savel++; break;
					case "결석" : absent++; break;
					}
					
					if(tardy + leave == 3) {
						tardy = 0;
						leave = 0;
						absent++;
					}
				}
				%>
				<td><%= attend %></td>
				<td><%= absent %></td>
				<td><%= savet %>/<%= savel %></td>
				<td></td>
				<% } else { %>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				<% } %>
			</tr>
			<% 
				attend = 0; tardy = 0; leave = 0; absent = 0; savet = 0; savel = 0;
			} %>
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
			<% int j = 0;
			   for(int i = 0; i < 3; i++) { %>
			<tr>
				<td>만 <%= i+3 %> 세</td>
				<% if(bi.size() != 0 && j < 6) { %>
						<td><%= bi.get(j).getBiDate() %></td>
						<td><%= bi.get(j).getHeight() %></td>
						<td><%= bi.get(j).getWeight() %></td>
						<% if(bi.size() % 2 == 0) { %>
							<td><%= bi.get(j+1).getBiDate() %></td>
							<td><%= bi.get(j+1).getHeight() %></td>
							<td><%= bi.get(j+1).getWeight() %></td>
						<% } else { %>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						<% } %>
				<% } else { %>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				<% } %>
				<td></td>
			</tr>
			<% if(bi.size() > 2 || bi.size() > 4) {
				j+=2; 
			} else {
				j = 10;
			}
			} %>
		</table>
	</div>
	<script>
		var address = $("#address").text();
		var passphrase = "1234";
        var decrypted1 = CryptoJS.AES.decrypt(address, passphrase);
        var address1 = decrypted1.toString(CryptoJS.enc.Utf8);
        $("#address").text(address1);
	</script>