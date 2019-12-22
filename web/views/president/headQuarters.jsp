<%@page import="com.oracle5.member.model.vo.Children"%>
<%@page import="com.oracle5.member.model.vo.MemberAndTeacher"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<MemberAndTeacher> teacherList = (ArrayList<MemberAndTeacher>) request.getAttribute("teacherlist");
	ArrayList<Children> sunFlowerList = (ArrayList<Children>)request.getAttribute("sunFlowerList");
	ArrayList<Children> roseList = (ArrayList<Children>)request.getAttribute("roseList");
	ArrayList<Children> TulipList = (ArrayList<Children>)request.getAttribute("TulipList");
%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#headQuarters th{
		width: 200px;
		height: 50px;
		text-align: left;
	}
	select {
	   width:161px;
	   height:34px;
	   border-radius:4px;
	}
	select:focus { 
		outline: none; 
	}
</style>
</head>
<body>
	<%@ include file="/views/common/presidentMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">유치원 운영위원회 설정</h1>
    </div>
   	<table id="headQuarters">
		<tr>
			<th style="background: white;">원장 : </th>
			<td>
				<select id="president" disabled>
					<option value="1">원장 선생님</option>
				</select>
			</td>
		</tr>
		<tr>
			<th style="background: white;">교사 : </th>
			<td>
				<select id="teacher" disabled>
					<% for(int i = 0; i < teacherList.size(); i++) {%>
						<% if(teacherList.get(i).getMemberNo() != 1) { 
						if(teacherList.get(i).getUType().equals("N")) {%>
						<option value="<%=teacherList.get(i).getMemberNo() %>"><%=teacherList.get(i).getMemberName() %> 선생님</option>
						<% } else { %>
						<option value="<%=teacherList.get(i).getMemberNo() %> selected"><%=teacherList.get(i).getMemberName() %> 선생님</option>
						<%}
						}
					}%>
				</select>
			</td>
		</tr>
		<tr>	
			<th>해바라기반 대표 학부모 : </th>
			<td>
				<select id="sunFlower" disabled>
					<% for(int i = 0; i < sunFlowerList.size(); i++) {
					if(sunFlowerList.get(i).getBloodType().equals("N")) {%>
					<option value="<%=sunFlowerList.get(i).getPno() %>"><%=sunFlowerList.get(i).getName() %> 학부모</option>
					<% }else { %>
					<option value="<%=sunFlowerList.get(i).getPno() %>" selected><%=sunFlowerList.get(i).getName() %> 학부모</option>
					<% }
					}%>
				</select>
			</td>
		</tr>
		<tr>
			<th>장미반 대표 학부모 : </th>
			<td>
				<select id="rose" disabled>
					<% for(int i = 0; i < roseList.size(); i++) {
					if(roseList.get(i).getBloodType().equals("N")) {%>
					<option value="<%=roseList.get(i).getPno() %>"><%=roseList.get(i).getName() %> 학부모</option>
					<% }else { %>
					<option value="<%=roseList.get(i).getPno() %>" selected><%=roseList.get(i).getName() %> 학부모</option>
					<%
						}
					}%>
				</select>
			</td>
		</tr>
		<tr>
			<th>튤립반 대표 학부모 : </th>
			<td>
				<select id="tulip" disabled>
					<% for(int i = 0; i < TulipList.size(); i++) {
					if(TulipList.get(i).getBloodType().equals("N")) {%>
					<option value="<%=TulipList.get(i).getPno() %>"><%=TulipList.get(i).getName() %> 학부모</option>
					<% }else { %>
					<option value="<%=TulipList.get(i).getPno() %>" selected><%=TulipList.get(i).getName() %> 학부모</option>
					<%
						}
					}%>
				</select>
			</td>
		</tr>
 	</table>
  	<div id="btnArea" align="center">
		<input type="button" id="start" value="수정하기" style="background: seagreen; color: white">
		<input type="hidden" id="end" value="저장하기" style="background: green; color:white">
  	</div>
  	
  	<div class="ui mini modal" style="top: 36%; left: 40%;">
    	<div class="header">수정 결과</div>
    	<div class="content">
      		<p id="updateResult"></p>
    	</div>
    	<div class="actions">
      		<div class="ui positive right labeled icon button">
        		Yes
        		<i class="checkmark icon"></i>
     		</div>
    	</div>
  	</div>
  	
  	<script>
	  	$("#start").click(function(){
			$(this).prop("type", "hidden");
			$("#end").prop("type", "button");
			$("select").not("#receiver").each(function(){
				$(this).prop("disabled", false);
			});
		});
		$("#end").click(function(){
			$(this).prop("type", "hidden");
			$("#start").prop("type", "button");
			var selectArr = [];
			
			$("select").not("#receiver").each(function(){
				selectArr.push($(this).val());
			});
			console.log(selectArr); 
			$.ajax({
				url:"/main/updateHeadquarter.hq",
				type:"post",
				data:{
					selectArr:selectArr
				},
				success:function(data){
					$("#updateResult").text("유치원 운영위원회 상태가 저장되었습니다.");
					$('.mini.modal').modal('show');
					$("select").not("#receiver").each(function(){
						$(this).prop("disabled", true);
					});
				}
			}); 
		});
  	</script>
    <script>
        $(function () {
            $(".li13").addClass("on");
            $(".topMenuLi:nth-child(2)").addClass("on");

            $(".topMenuLi").mouseover(function () {
                $(".li13").removeClass("on");
                $(".topMenuLi:nth-child(2)").removeClass("on");
            });
            $(".topMenuLi").mouseleave(function () {
                $(".li13").addClass("on");
                $(".topMenuLi:nth-child(2)").addClass("on");
            });
        }); 
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>
</html>