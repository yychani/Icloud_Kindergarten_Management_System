<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	ArrayList<Note> list = (ArrayList<Note>) request.getAttribute("list");
	String met = (String) request.getParameter("met");
	if(met == null) {
		met = (String) request.getAttribute("met");
	}
	System.out.println(met);
	String date = (String) request.getParameter("date");
	String[] spdate = date.split("-");
	String day = spdate[0] + "년 " + spdate[1] + "월 " + spdate[2] + "일";
	Note n = null;
	int cid;
	if(list.size() != 0 && request.getParameter("cid") != null) {
		cid = Integer.parseInt(request.getParameter("cid"));
		for(int i = 0; i < list.size(); i++){
			if(list.get(i).getCid() == cid) {
				n = list.get(i);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원아별 알림장</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
input[type=text] {
	border-radius: 10px;
	width: 100%;
	height: 30px;
}
input[type=radio] {
	margin-left:10px;
}
input[type='submit'] {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
textarea {
	border-radius: 10px;
	width: 100%;
}
select {
	width: 100px;
}
table {
	text-align: center;
	margin: 50px auto;
}
</style>
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
        
        $.ajax({
        	url:"<%= request.getContextPath() %>/selectBanChildList.do",
        	type:"get",
        	data:{tno: $("#tno").val()},
        	success:function(data) {
        		$select = $("#childList");
        		$select.find("option").remove();
        		
        		for(var i = 0; i < data.length; i++) {
        			var name = data[i].name;
					var childname = $("h1").text();
					childname = childname.substring(0, childname.lastIndexOf(" "));
					var selected = (name == childname) ? "selected" : "";
					
        			$select.append("<option value='" + data[i].cId + "' " + selected + ">" + name + "</option>");
        		}
        		
        		$("#childList").children().each(function(index, value){
       				if(value.value == <%= request.getParameter("cid") %>) {
       					$(this).prop("selected", true);
       				}
        		});
        	},
        	error:function() {
        		console.log("실패")
        	}
        });
        
        $("#childList").change(function() {
        	var cid = $(this).val();
        	var date = $("#date").val(); 
        	var met = $("#materials").val();
        	page_move('<%= request.getContextPath() %>/selectChildNote.me?cid='+cid, date, met);
        });
        
        if($("#shealth").val() != null) {
        	$("[name=health]").each(function(index, value){
        		if(value.value === $("#shealth").val()){
        			$(this).prop("checked", true);
        		}
        	});
        };
	});
</script>
</head>
<body>
	<%@ include file="/views/common/teacherMenu.jsp" %>
 	<div style="margin: 0 15%;">
 	<h1 style="text-decoration: underline; text-underline-position: under;"><%= day %>&nbsp;알림장</h1>
 	</div>
	<form action="<%= request.getContextPath() %>/insertChildNote.me" method="post">
	<div style="margin: 0 30%; padding-top :10px; padding-bottom:50px">
		<input type="hidden" id="tno" name="tno" value="<%= loginUser.getMemberNo() %>" />
		<input type="hidden" id="date" name="date" value="<%= request.getParameter("date") %>" />
		<span style="font-size:20px; font-weight:bold; margin-right:10px;">이름</span>
		<select name="childList" id="childList" style="display:inline-block;">
		</select>
		<% if(n == null) { %>
		<h3 style="text-decoration: underline; text-underline-position: under;">특이사항</h3>
		<textarea id="unique" name="unique" style="resize: none;" rows="10"></textarea>
		<input type="hidden" id="materials" name="materials" value="<%= met %>"/>
		<h3 style="text-decoration: underline; text-underline-position: under;">오늘 하루 건강</h3>
		<% } else { %>
		<h3 style="text-decoration: underline; text-underline-position: under;">특이사항</h3>
		<textarea id="unique" name="unique" style="resize: none;" rows="10"><%= n.getUnique() %></textarea>
		<input type="hidden" id="materials" name="materials" value="<%= met %>"/>
		<h3 style="text-decoration: underline; text-underline-position: under;">오늘 하루 건강</h3>
		<input type="hidden" id="shealth" name="shealth" value=<%= n.getHealth() %> />
		<% } %>
		<input type="radio" name="health" id="health1" value="좋음"/><label for="health1">좋음</label>
		<input type="radio" name="health" id="health2" value="보통"/><label for="health2">보통</label>
		<input type="radio" name="health" id="health3" value="나쁨"/><label for="health3">나쁨</label>
		<br><br>
		<input type="submit" id="subbtn" value="완료" style="float:right; border-radius:5px;"/>
	</div>
	</form>
    <%@ include file="/views/common/footer.jsp" %>
	<%@ include file="/views/common/chat.jsp" %>
	
	<script>
		$("#subbtn").click(function() {
			alert("저장되었습니다.");
		});
		 
		function page_move(url, date, met) {
	     	var form = document.createElement("form");
	     	
	     	form.action = url;
	     	form.method = "post";
	     	
	     	inputDate = document.createElement("input");
	     	inputDate.setAttribute("type", "hidden");
	     	inputDate.setAttribute("name", "date");
	     	inputDate.setAttribute("value", date);
	     	form.appendChild(inputDate);
	     	
	     	inputMet = document.createElement("input");
	     	inputMet.setAttribute("type", "hidden");
	     	inputMet.setAttribute("name", "met");
	     	inputMet.setAttribute("value", met);
	     	form.appendChild(inputMet);
	     	
	     	document.body.appendChild(form);
	     	
	     	form.submit();
	     }
	</script>
</body>
</html>