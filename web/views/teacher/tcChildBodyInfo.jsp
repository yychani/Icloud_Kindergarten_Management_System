<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<% 
	ArrayList<BodyInfo> list = (ArrayList<BodyInfo>) request.getAttribute("list"); 
	int cid = Integer.parseInt(request.getParameter("cid"));
%>
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
</style>
</head>
<body>

    <%@ include file="/views/common/teacherMenu.jsp" %>
	<div style="margin: 0 15%;">
 		<h1  align="center" style="text-decoration: underline; text-underline-position: under;"><%= list.get(0).getCName() %> 신체정보</h1>
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
 			<% if(list.get(0).getHeight() != 0) {
 			for(int i = 0; i < list.size(); i ++) { %>
 			<tr>
 				<td><%= list.get(i).getBiDate() %></td>
 				<td><%= list.get(i).getHeight() %>cm</td>
 				<td><%= list.get(i).getWeight() %>kg</td>
 			</tr>
 			<% }
 			} %>
 		</table>
 	</div>
 	<div style="margin:10px 15%; height:40px;">
		<input type="button" class="childbutton" value="수정하기" onclick="location.href='<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>'+'&mod=1'"/>
		<p class="childbutton">&nbsp;&nbsp;</p>
		<input type="button" class="childbutton" value="목록으로" onclick="location.href='<%= request.getContextPath() %>/selectBanChildren.me'"/>
	</div>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>