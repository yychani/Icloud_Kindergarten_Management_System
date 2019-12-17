<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oracle5.member.model.vo.*"%>
<%
	Teacher t = (Teacher) request.getAttribute("t");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<script>
	$(function() {
		  $(".li:nth-child(1)").addClass("on");
		  
	    $(".topMenuLi:nth-child(5)").addClass("on");
	   
	    $(".topMenuLi").mouseover(function() {
	      $(".li:nth-child(1)").removeClass("on");
	      $(".topMenuLi:nth-child(5)").removeClass("on");
	   });
	  
	    $(".topMenuLi").mouseleave(function() {
	      $(".li:nth-child(1)").addClass("on");
	      $(".topMenuLi:nth-child(5)").addClass("on");
	   });
	}); 
</script>
</head>
<body>
    <%@ include file="/views/common/teacherMenu.jsp" %>
	<div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">내 정보 보기</h1>
    </div>
    <div class="ui card" style="margin:0 auto;" id="card1">
	  <div class="image">
	    <img src="<% if(t.getImgSrc() == null) { %>
					<%=request.getContextPath() %>/images/nullUser.png
				<% } else { %>
					<%=t.getImgSrc()%>
			<% } %>">
	  </div>
	  <div class="content">
	    <a class="header"><%= loginUser.getMemberName() %></a>
	    <div class="meta">
	      <span class="date">Joined in <%= t.getTEntDate() %></span>
	    </div>
	    <div class="description">
	      <%= t.getTDescription() %>
	    </div>
	  </div>
	  <div class="extra content">
	    <button class="ui button" onclick="location.href='/views/teacher/tcMyInfoMod.jsp'">수정하기</button>
	  </div>
	</div>
	<div class="ui card" style="margin:0 auto; width:500px; text-align:center">
	  <div class="image" style="width:290px; margin:0 auto; background:none;">
	    <img src="<% if(t.getImgSrc() == null) { %>
					<%=request.getContextPath() %>/images/nullUser.png
				<% } else { %>
					<%=t.getImgSrc()%>
			<% } %>">
		<button class="ui button" id="imgMod">사진 수정하기</button>
	  </div>
	  <div class="content">
	    <a class="header"><%= loginUser.getMemberName() %></a>
	    <div class="meta">
	      <span class="date">Joined in <%= t.getTEntDate() %></span>
	    </div>
	    <div class="description">
	      <table border=1>
	      	<tr>
	      		<td>이메일</td>
	      		<td><input type="email" /></td>
	      	</tr>
	      	<tr>
	      		<td>연락처</td>
	      		<td><input type="text" /></td>
	      	</tr>
	      </table>
	    </div>
	  </div>
	  <div class="extra content">
	    <button class="ui button" onclick="">수정완료</button>
	  </div>
	</div>
    <%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
    <script>
    	$("#card1").hide();
    </script>
</body>
</html>