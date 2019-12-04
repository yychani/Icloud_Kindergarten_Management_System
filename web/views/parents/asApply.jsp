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
	padding: 10px 30px;
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
	#asTable{
		margin: auto auto;
		margin-top: 50px;	
		border: 3px double black;
		width: 300px;
		height: 400px;
		text-align: center;
		box-shadow: 0px 0px 30px -7px gray;
	}
	#name{
		font-size: 18px;
		background: skyblue;
		color: white;
		display: inline-block;
		padding: 4px 10px;
		border-radius: 15px;
	
	}
	#className{
		font-size :17px; 
		background: rgb(247,230,0);
		color: brown;
		display: inline-block;
		padding: 4px 10px;
		border-radius: 15px;
		
	
	}
	.Btn:hover{
		
		cursor:pointer;
		box-shadow: 0px 0px 30px -7px gray;
	
	}

</style>

</head>
<body style="overflow-x:hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h2 align="center">방과후 신청</h2>
	<div>
	<form id="asArea">
	<table align="center" id="asTable" >
		<tr>
			<th colspan="2">내아이 방과후 신청</th>
		</tr>
		<tr>
			<td colspan="2"><img src="<%=request.getContextPath()%>/images/block.PNG"></td>
		</tr>
		<tr>
			<td colspan="2"><label id="name">박건후</label></td>
		</tr>
		<tr>
			<td colspan="2"><label id="className">해바라기 반 </label></td>
		</tr>
		<tr>
			<td><button class="Btn">신청</button></td>
			<td><button class="Btn">미신청</button></td>
		</tr>
	
	
	
	</table>
	</form>
	</div>
	<br><br><br><br><br>
	<script>
    $(function() {
        $(".li1").addClass("on");
        $(".topMenuLi:nth-child(3)").addClass("on");

        $(".topMenuLi").mouseover(function() {
           $(".li1").removeClass("on");
           $(".topMenuLi:nth-child(3)").removeClass("on");
        });
        $(".topMenuLi").mouseleave(function() {
           $(".li1").addClass("on");
           $(".topMenuLi:nth-child(3)").addClass("on");
        });

     });  
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>