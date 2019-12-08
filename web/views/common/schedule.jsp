<%@page import="com.oracle5.board.model.vo.Schedule"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		ArrayList<Schedule> list = (ArrayList<Schedule>) request.getAttribute("list");
	
	%>
        <script>
    	$(function(){
    		<% for(int i = 0; i < list.size(); i++) {
    			String date = list.get(i).getDate().toString();%>
    			$(".dailyDate1").each(function(){
    				if($(this).val() == "<%=date %>"){
    					$(this).parent().children("p").text("일정");
    				}
    			});
    		<% } %>
    		
    	});
    </script>
<table style="margin: 0 auto; width: fit-content;">
    <tr>
    <td>
    <%@ include file="/views/common/calendar.jsp" %>
    </td>
    <td>
    <div style="margin: 5px auto; width: fit-content;">
        <label>날짜 : </label><span id="dateOutput"></span><br><br>
        <label>내용</label><br>
        <textarea name="dateCont" id="dateCont" cols="30" rows="15" readonly></textarea>
        <input type="hidden" name="dateVal" id="dateVal"><br>
        <input type="button" name="edit" id="edit" value="수정하기"><input type="hidden" name="editComplete" id="editComplete" value="수정완료"> 
    </div>
    <script>
        $(function () {
            var today = $(".date[bgcolor='#C9C9C9']");
            var todayVal = today.children(".dailyDate").val();
            var todayVal1 = today.children(".dailyDate1").val();
            
            $("#dateOutput").text(todayVal);
            $("#dateVal").val(todayVal1);
            
            $.ajax({
            	url:"/main/selectSchedule.sch",
            	data:{
            		date:todayVal1
            	},
            	type:"post",
                success:function(data){
                	$("#dateCont").text(data);
                }
            });
            
            function calColor() {
                $(".date").css("background", "white");
                today.css("background", "#C9C9C9");
                
            }
           
           
            $(".date").on("click", function(){
                calColor();
                var date = $(this).children(".dailyDate").val();
                var date1 = $(this).children(".dailyDate1").val();
                $(this).css("background", "rgba(30, 143, 255, 0.432)")
                $("#dateOutput").text(date);
                $("#dateVal").val(date1);
                
                $.ajax({
                	url:"/main/selectSchedule.sch",
                	data:{
                		date:date1
                	},
                	type:"post",
                    success:function(data){
                    	$("#dateCont").val("");
                    	$("#dateCont").val(data);
                    }
                })
            });

            $("#edit").on("click", function() {
                $("#dateCont").prop("readonly", false);
                $("#editComplete").prop("type", "button");
                $(this).prop("type", "hidden");
            });
            $("#editComplete").on("click", function() {
                $("#dateCont").prop("readonly", true);
                $("#edit").prop("type", "button");
                $(this).prop("type", "hidden");
                var dateVal = $("#dateVal").val();
                var dateCont = $("#dateCont").val();
                $.ajax({
                	url:"/main/InsertSchedule.sch",
                	data:{
                		date:dateVal,
                		dateCont:dateCont
                	},
                	type:"post",
                	success:function(data){
                		$(".dailyDate1").each(function(){
            				if($(this).val() == dateVal){
            					$(this).parent().children("p").text("일정");
            				}
            			});
                	}
                });
            });
        }); 
    </script>
   	</td></tr></table>