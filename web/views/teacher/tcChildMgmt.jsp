<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.oracle5.member.model.vo.Children"%>
<%
	ArrayList<Children> list = (ArrayList<Children>) request.getAttribute("list");
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
	.list{
		padding: 50px;
	}
	.no {
		width: 100px !important;
		height: 30px !important;
	}
	.name {
		width: 700px !important;
		height: 30px !important;
	}
	#tbarea {
		width:60%;
		margin: 0 20%;
	}
	#tb {
		text-align: center;
	}
	a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	#tb a:hover { color: orangered !important;}

</style>
</head>
<body> 
	<%@ include file="/views/common/teacherMenu.jsp" %>
	<div class="list">
		<h1 align="center">해바라기반 원아 목록</h1>
	</div>
	<div id="tbarea">
		<table id="tb" class="main ui celled table">
			<tr style="background:#e3fad0; height:50px">
				<th class="no">No.</th>
				<th class="name">이름</th>
			</tr>
			<% for(int i = 0; i < list.size(); i++){ %>
			<tr>
				<td class="no"><%= list.get(i).getPno() %></td>
				<td class="name"><a href="<%= request.getContextPath() %>/selectChildDetail.me?cid=<%= list.get(i).getCId() %>" class="link"><%= list.get(i).getName() %></a></td> 
			</tr>
			<% } %>
		</table>
	</div>
	
    <%@ include file="/views/common/footer.jsp" %>
	<%@ include file="/views/common/chat.jsp" %>
</body>
</html>