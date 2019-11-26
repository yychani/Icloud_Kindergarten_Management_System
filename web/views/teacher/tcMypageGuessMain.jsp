<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	  $(".li:nth-child(5)").addClass("on");
    	  
          $(".topMenuLi:nth-child(5)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(5)").removeClass("on");
            $(".topMenuLi:nth-child(5)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(5)").addClass("on");
            $(".topMenuLi:nth-child(5)").addClass("on");
         });
      }); 
</script>
<style>
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
<body>
	<%@include file="/views/common/teacherMenu.jsp" %>
	   <div style="margin: 0 15%;">
		<h1 align="center" style="text-decoration: underline; text-underline-position: under;">건의/문의 확인</h1>
	</div>
	<%@include file="/views/common/board.jsp" %>
	<%@include file="/views/common/footer.jsp" %>
</body>
</html>