<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원아관리</title>
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    <script>
      $(function() {
    	  $(".li:nth-child(9)").addClass("on");
    	  
          $(".topMenuLi:nth-child(1)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(9)").removeClass("on");
            $(".topMenuLi:nth-child(1)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(9)").addClass("on");
            $(".topMenuLi:nth-child(1)").addClass("on");
         });
      }); 
</script>
<style>
	.imgDetail {
		display:inline-block;
		overflow:hidden;
		margin:20px;
		width:250px;
		height:250px;
		text-align:center;
		position:relative;
	}
	.imgDetail img {
		position:absolute;
		max-width:80%; 
		max-height:80%;
		width:auto; 
		height:auto;
		margin:auto;
        top:0; bottom:0; left:0; right:0;
	}
	.detail {
		border: 1px solid black;
		border-radius: 20px; 
		background : lightgray;
		display:inline-block; 
		width:250px; 
		height:250px; 
		overflow: hidden;
		margin:20px;
	}
	.childbutton {
		float:right;
	}
	.outerDetail {
		margin: 20px 21%;
		padding: 5px;
		padding-left:0;
		padding-right:0;
		height: 300px;
	}
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
	<div style="margin: 50px 15%;">
 		<h1  align="center"><%= ((Children) hmap.get("c")).getName() %> 상세정보</h1>
 	</div>
 	
 	
 	<div align="center">
 		<table class="ui celled table" style="width: 50%;" >
 			<tr style="text-align:center; background:#e3fad0">
 				<th style="width:33.3%; height:50px">사진</th>
 				<th style="width:33.3%; height:50px">아이 정보</th>
 				<th style="width:33.3%; height:50px">부모님 정보</th>
 			</tr>
 			<tr>
 				<td rowspan="5" style="border-right:1px solid rgba(34,36,38,.1)">
					<img src="<%= request.getContextPath() %>/<%= ((Children) hmap.get("c")).getImgSrc() %>" alt="" width="300px"/>
				</td>
				<td>이름 : <%= ((Children) hmap.get("c")).getName() %></td>
 				<td>부모님 이름 : <%= ((Member) hmap.get("m")).getMemberName() %></td>
 			</tr>
 			<tr>
 				<td>반 : <%= ((Ban) hmap.get("b")).getBanName() %></td>
 				<td>관계 : <%= ((Member) hmap.get("m")).getUType() %></td>
 			</tr>
 			<tr>
 				<td>키 : <%= ((BodyInfo) hmap.get("bi")).getHeight() %>cm</td>
 				<td id="phone">연락처 : <%= ((Member) hmap.get("m")).getPhone() %></td>
 			</tr>
 			<tr>
 				<td>몸무게 : <%= ((BodyInfo) hmap.get("bi")).getWeight() %>kg</td>
 				<td>&nbsp;</td>
 			</tr>
 			<tr>
 				<td>특이사항 : <%= ((Children) hmap.get("c")).getDescription() %></td>
 				<td>&nbsp;</td>
 			</tr>
 		</table>
 	</div>
	<div style="margin:10px 20%; height:40px">
		<input type="button" class="childbutton" value="생활기록부" onclick="location.href='<%= request.getContextPath() %>/selectChildRcBook.me?cid=<%= ((Children) hmap.get("c")).getCId() %>'"/>
		<p class="childbutton">&nbsp;&nbsp;</p>
		<input type="button" class="childbutton" value="유아관찰표" onclick="location.href='<%= request.getContextPath() %>/views/teacher/tcChildObserve.jsp?cid=<%= ((Children) hmap.get("c")).getCId() %>&age=3'"/>
		<p class="childbutton">&nbsp;&nbsp;</p>
		<input type="button" class="childbutton" value="신체정보" onclick="location.href='<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= ((Children) hmap.get("c")).getCId() %>'"/>
	</div>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
    <script>
		var phone = $("#phone").text();
		var phoneArr = [];
		phoneArr = phone.split("-");
		var passphrase = "1234";
	    var decrypted1 = CryptoJS.AES.decrypt(phoneArr[1], passphrase);
	    var phone1 = decrypted1.toString(CryptoJS.enc.Utf8);
	    var decrypted2 = CryptoJS.AES.decrypt(phoneArr[2], passphrase);
	    var phone2 = decrypted2.toString(CryptoJS.enc.Utf8);
	    $("#phone").text("연락처 : 010-" + phone1 + "-" + phone2);
    </script>
</body>
</html>