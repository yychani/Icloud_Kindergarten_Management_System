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
         $("#print").click(function() {
             window.print();
         });
      }); 
</script>

</head>
<body> 
	<%@ include file="/views/common/teacherMenu.jsp" %>
	<%@ include file="/views/common/recordBook.jsp" %>
                     
	<div style="margin: 0 15%; height:50px;">
		<input type="button" value="뒤로가기" style="float:right; background:lightgray; color:black" onclick="location.href='tcChildDetail.jsp'" />
		<span style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<input type="button" value="인쇄하기" id="print" style="float:right; background:lightgray; color:black" />
	</div>
	<%@ include file="/views/common/chat.jsp" %>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>