<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<% 
	String date = (String) request.getParameter("date");
	ArrayList<Children> list = (ArrayList<Children>) request.getAttribute("list");
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
			$(".attendTable").children('tbody').find('td').find('.'+check).each(function(index, value){
				$(this).prop("checked", true);
			});
		}
	});
	
	function saveAttend() {
		var cnt = 0;
		var input = $(".attendTable").children('tbody').find('td').find("input[type=radio]");
		var cidArr = [];
		var attArr = [];
		input.each(function(index, item) {
			if(index <= 138) {
				if($(this).is(":checked")) {
					cidArr[cnt] = $("#cid"+cnt).val();
					attArr[cnt] = $(this).val();
					cnt++;
				}
			}
		});
		
		var date = '<%= request.getParameter("date") %>';
		$.ajax({
			url:"<%= request.getContextPath() %>/insertChildAttend.do",
			type:"post",
			data:{
				cidArr:cidArr,
				attArr:attArr,
				date:date
			},
			success:function(data) {
				alert("저장되었습니다.");
			},
			error:function(){
				console.log("실패")
			}
		});
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
        
        $.ajax({
        	url:"<%= request.getContextPath() %>/selectChildAttend.do",
        	type:"post",
        	data:{
        		date:'<%= date %>',
        		tno:$("#tno").val()
        	},
        	success:function(data) {
        		for(var i = 0; i < data.length; i ++) {
        			if($("#cid" + i).val() == data[i].cId) {
        				$("#cid" + i).parent().parent().find("input[type=radio]").each(function(index, value) {
        					if(value.value === data[i].aType) {
        						$(this).prop("checked", true);
        					}
        				});
        			}
        		}
        	}, error:function() {
        		console.log("실패")
        	}
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
    	<input type="hidden" id="tno" value="<%= loginUser.getMemberNo() %>" />
    		<table class="attendTable" border=1>
    			<tr>
    				<th style="width:10%">No.</th>
    				<th style="width:50%">이름</th>
    				<th>출석</th>
    				<th>지각</th>
    				<th>조퇴</th>
    				<th>결석</th>
    			</tr>
    			<% for(int i = 0; i < list.size(); i++) { %>
    			<tr>
    				<td><%= i+1 %><input type="hidden" id="cid<%= i %>" value=<%= list.get(i).getCId()%> /></td>
    				<td><%= list.get(i).getName() %></td>
    				<td><input type="radio" id="attend" name="atMgmt<%= i %>" class="attend" value="출석" /></td>
    				<td><input type="radio" id="tardy" name="atMgmt<%= i %>" class="tardy" value="지각" /></td>
    				<td><input type="radio" id="leave" name="atMgmt<%= i %>" class="leave" value="조퇴" /></td>
    				<td><input type="radio" id="absent" name="atMgmt<%= i %>" class="absent" value="결석" /></td>
    			</tr>
    			<% } %>
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
    <%@ include file="/views/common/footer.jsp" %>
    <%@ include file="/views/common/chat.jsp" %>
</body>
</html>