<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가정통신문</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<script>
	$(function(){
 		$(".writing > button").click("click", function(){
 			location.href="tcWriteFletter.jsp";
 		});
	});
</script>
<script>
      $(function() {
    	  $(".li:nth-child(5)").addClass("on");
    	  
          $(".topMenuLi:nth-child(1)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(5)").removeClass("on");
            $(".topMenuLi:nth-child(1)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(5)").addClass("on");
            $(".topMenuLi:nth-child(1)").addClass("on");
         });
      }); 
</script>
<style>
.writing > button {
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
 	<h1 style="text-decoration: underline; text-underline-position: under;">가정통신문</h1>
 	</div>
 	<%@ include file="/views/common/board.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>