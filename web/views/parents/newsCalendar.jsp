<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>

table {
	margin: 70px auto;
}

input[type=text] {
	border-radius: 10px;
	width: 300px;
	height: 30px;
}

td {
	padding-left: 0;
}

input[type=checkbox] {
	width: 15px;
	height: 15px;
	vertical-align: center;
}
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
<body style="overflow-x:hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<div style="margin: 0 15%;">
		<h1 style="text-decoration: underline; text-underline-position: under;">원 일정</h1>
    </div>
    <%@ include file="/views/common/schedule.jsp"%>
<script>
      $(function() {
    	  $(".li:nth-child(7)").addClass("on");
    	  
          $(".topMenuLi:nth-child(2)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(7)").removeClass("on");
            $(".topMenuLi:nth-child(2)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(7)").addClass("on");
            $(".topMenuLi:nth-child(2)").addClass("on");
         });
      }); 
</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>

</html>