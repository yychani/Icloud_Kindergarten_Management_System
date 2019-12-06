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
<style>
	.tcMyInfo {
		margin: 5% 27%;
		border: 1px solid black; 
		border-radius: 10px;
		width: 700px;
	}
	.tcMyInfo>table {
		text-align:right;
		margin: 5% 5%;
	}
	.tcMyInfo>table tr:nth-of-type(n+1) td:nth-of-type(1) { 
		width:5%;
	}
	.tcMyInfo>table tr:nth-of-type(1) td:nth-of-type(1) {
		width: 1%;
	}
</style>
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
    <div class="tcMyInfo">
    	<table>
    		<tr>
    			<td rowspan="5"><img src="<%=request.getContextPath()%>/images/img.jpg" alt="" width="200px"/></td>
    			<td></td> 
    			<td style="width:15%;"><span>이름 : </span>&nbsp;<input type="text" id="" name="" value="김종석" readonly /></td>
    		</tr>
    		<tr>
    			<td></td>
    			<td><span>담당 반 : </span>&nbsp;<input type="text" id="" name="" value="해바라기" readonly /></td>
    		</tr>
    		<tr>
    			<td></td>
    			<td><span>입사 날짜 : </span>&nbsp;<input type="text" id="" name="" value="해바라기" readonly /></td>
    		</tr>
    		<tr>
    			<td></td>
    			<td></td>
    		</tr>
    		<tr>
    			<td></td>
    			<td style="height:50px"><input type="button" value="수정하기"/></td>
    		</tr>
    	</table>
    </div>
    <%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>