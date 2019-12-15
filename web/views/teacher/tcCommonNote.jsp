<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.oracle5.board.model.vo.CommonNote, java.sql.Date"%>
<%
	ArrayList<CommonNote> list = (ArrayList<CommonNote>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>반 공통 알림장</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    <style>
        table {
            margin: 50px auto;
        }

        input[type=text] {
            background: none;
            border: none;
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

        #teacher {
            border-radius: 10px;
            background: rgba(216, 216, 216, 0.486);
        }

        #pictureTd {
            width: 300px;
            height: 250px;
            padding-right: 0;
        }

        #picture {
            width: 250px;
            height: 250px;
            border: 1px solid black;
        }

        th {
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            background: rgba(216, 216, 216, 0.486);
        }

        #no {
            width: 50px;
        }

        #name {
            width: 120px;
        }

        #class,
        #parents {
            width: 200px;
        }

        #children {
            margin-top: 20px;
            text-align: center;
        }

        .no,
        .name,
        .class,
        .parents {
            padding: 5px 0;
            border-bottom: 1px solid black;
        }
        input[type='submit'] {
            width: 80px;
            height: 40px;
            border-radius: 10px;
            background: rgb(63, 63, 63);
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
        input[type='text'] {
            text-align: center;
            background: rgba(30, 143, 255, 0.432);
        }
    </style>
     <script>
    	$(function(){
    		<% for(int i = 0; i < list.size(); i++) {
    			String date = list.get(i).getDate().toString();%>
    			$(".dailyDate1").each(function(){
    				if($(this).val() == "<%=date %>"){
    					$(this).parent().children("p").text("작성");
    				}
    			});
    		<% } %>
    		
    	});
    </script>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/teacherMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">반 공통 알림장</h1>
    </div>
    <%@ include file="/views/common/calendar.jsp" %>
    <div style="margin: 5px auto; width: fit-content; min-width: 712px;">
        <label>날짜 : </label><span id="dateOutput"></span><br><br>
        <label>내용</label><br>
        <textarea name="dateCont" id="dateCont" cols="100" rows="5" readonly></textarea><br>
        <input type="button" name="edit" id="edit" value="수정하기" style="float:right;">
        <input type="hidden" name="dateVal" id="dateVal" />
        <input type="hidden" name="editComplete" id="editComplete" value="수정완료" style="float:right;"> 
        <input type="hidden" name="tno" id="tno" value="<%= loginUser.getMemberNo() %>" />
    </div>
    <br /><br />
    
    <script>
        $(function () {
            var today = $(".date[bgcolor='#C9C9C9']");
            var todayVal = today.children(".dailyDate").val();
            var todayVal1 = today.children(".dailyDate1").val();
            var tno = $("#tno").val();
            
            $("#dateOutput").text(todayVal);
            $("#dateVal").val(todayVal1);
            
            $.ajax({
            	url:"<%= request.getContextPath() %>/selectTcNote",
            	data:{
            		date:todayVal1,
            		tno:tno
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
            $(".li:nth-child(3)").addClass("on");
      	  
            $(".topMenuLi:nth-child(2)").addClass("on");
           
            $(".topMenuLi").mouseover(function() {
              $(".li:nth-child(3)").removeClass("on");
              $(".topMenuLi:nth-child(2)").removeClass("on");
           });
          
            $(".topMenuLi").mouseleave(function() {
              $(".li:nth-child(3)").addClass("on");
              $(".topMenuLi:nth-child(2)").addClass("on");
           });

            $(".date").on("click", function(){
                calColor();
                var date = $(this).children(".dailyDate").val();
                var date1 = $(this).children(".dailyDate1").val();
                var tno = $("#tno").val();
                $(this).css("background", "rgba(30, 143, 255, 0.432)")
                $("#dateOutput").text(date);
                $("#dateVal").val(date1);
                
                $.ajax({
                	url:"<%= request.getContextPath() %>/selectTcNote",
                	data:{
                		date:date1,
                		tno:tno
                	},
                	type:"post",
                    success:function(data){
                    	$("#dateCont").val("");
                    	$("#dateCont").val(data);
                    }
                });
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
                var tno = $("#tno").val();
                
                $.ajax({
                	url:"<%= request.getContextPath() %>/insertTcNote",
                	data:{
                		date:dateVal,
                		dateCont:dateCont,
                		tno:tno
                	},
                	type:"post",
                	success:function(data){
                		$(".dailyDate1").each(function(){
            				if($(this).val() == dateVal){
            					$(this).parent().children("p").text("작성");
            				}
            			});
                	}
                });
            });
        }); 
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>