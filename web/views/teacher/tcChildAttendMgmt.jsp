<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String date = (String) request.getParameter("date");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
	.outer {
		margin: 0 15%;
	}
	.attendTable {
		width: 100%;
	}
</style>
<script>
	$(document).on('click','td',function(){
		$(this).find('input[type=radio]').prop('checked', true);
		if($(this).find('input[type=radio]').attr('name') === "selectAll") {
			var check = $(this).find('input[type=radio]').attr('id');
			$(".attendTable").children('tbody').find('td').find('#'+check).prop('checked',true);
		}
	});
	
	function saveAttend() {
		var cnt = 0;
		var input = $(".attendTable").children('tbody').find('td').find('input[type=radio]');
		input.each(function(index, item) {
			if($(this).is(":checked")) {
				cnt++;
			}
		});
		console.log(cnt);
	};
	
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
</head>
<body>

    <%@ include file="/views/common/teacherMenu.jsp" %>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;"><%= date %></h1>
    </div>
    <div class="outer">
    	<div class="tableArea">
    		<table class="attendTable" border=1>
    			<tr>
    				<th style="width:10%">No.</th>
    				<th style="width:50%">이름</th>
    				<th>출석</th>
    				<th>지각</th>
    				<th>조퇴</th>
    				<th>결석</th>
    			</tr>
    			<tr>
    				<td>1</td>
    				<td>박건후</td>
    				<td><input type="radio" id="attend" name="atMgmt" /></td>
    				<td><input type="radio" id="tardy" name="atMgmt" /></td>
    				<td><input type="radio" id="leave" name="atMgmt" /></td>
    				<td><input type="radio" id="absent" name="atMgmt" /></td>
    			</tr>
    			<tr>
    				<td>2</td>
    				<td>이원경</td>
    				<td><input type="radio" id="attend" name="atMgmt2" /></td>
    				<td><input type="radio" id="tardy" name="atMgmt2" /></td>
    				<td><input type="radio" id="leave" name="atMgmt2" /></td>
    				<td><input type="radio" id="absent" name="atMgmt2" /></td>
    			</tr>
    			<tr>
    				<td>3</td>
    				<td>윤재영</td>
    				<td><input type="radio" id="attend" name="atMgmt3" /></td>
    				<td><input type="radio" id="tardy" name="atMgmt3" /></td>
    				<td><input type="radio" id="leave" name="atMgmt3" /></td>
    				<td><input type="radio" id="absent" name="atMgmt3" /></td>
    			</tr>
    			<tr>
    				<td colspan="2">전체선택</td>
    				<td><input type="radio" id="attend" name="selectAll" /></td>
    				<td><input type="radio" id="tardy" name="selectAll" /></td>
    				<td><input type="radio" id="leave" name="selectAll" /></td>
    				<td><input type="radio" id="absent" name="selectAll" /></td>
    			</tr>
    		</table>
    	</div>
    		<div style="height:40px"> 
    			<input type="button" value="저장하기" onclick="saveAttend()" style="float:right"/>
    		</div>
    </div>
    <%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>