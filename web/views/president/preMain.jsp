<%@page import="com.oracle5.task.model.vo.TodoList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<TodoList> todoList = (ArrayList<TodoList>) request.getAttribute("todoList");
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
    #todoList {
    	margin: 70px auto;
    }
    #todoList tr td {
        padding: 15px 10px;
    }
        th {
            text-align: left;
        }
        input[type=text] {
            border-radius: 10px;
            border: 1px;
            width: 300px;
            height: 30px;
        }
        input[type=checkbox] {
        	width: 15px;
        	height: 15px;
        	vertical-align: center;
        }
        .ui.labeled.icon.button>.icon:after, 
        .ui.labeled.icon.button>.icon:before, 
        .ui.labeled.icon.buttons>.button>.icon:after, 
        .ui.labeled.icon.buttons>.button>.icon:before{
    		top: 69% !important;
    	}
    	input[name="today"], input[name="tomorrow"] {
    		font-family: 'Noto Sans KR', sans-serif !important;
    	}
    </style>
<script>
	$(document).ready(function(){
		var index = 0;
		<% for(int i = 0; i < 6; i++){ %>                          
			<% if(todoList.get(i).getListCheck().equals("Y") ){%>
				$("input[name='todaycheck']")[index].checked = true
				
			<% } %>
			if("<%=todoList.get(i).getTodayList() %>" != "null"){
				console.log("<%=todoList.get(i).getTodayList() %>");
				$("input[name='today']").eq(index).val("<%=todoList.get(i).getTodayList() %>");
			}
			if("<%=todoList.get(i).getTomorrowList() %>" != "null"){
				$("input[name='tomorrow']").eq(index).val("<%=todoList.get(i).getTomorrowList() %>");
			}
			index++;
		<% } %>
	});
</script>
</head>
<body style="overflow-x:hidden">
    <%@ include file="/views/common/presidentMenu.jsp" %>
    <table id="todoList">
        <tr>
            <th></th>
            <th>오늘 해야할 일</th>
            <th>내일 해야할 일</th>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td style="padding-right: 30px;">
	            <div class="ui input">
	  				<input type="text" name="today" style="background: none; border: none;" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" style="background: none; border: none;" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
			</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td style="padding-right: 30px;">
	            <div class="ui input">
	  				<input type="text" style="background: none; border: none;" name="today" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" style="background: none; border: none;" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
			</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td style="padding-right: 30px;">
	            <div class="ui input">
	  				<input type="text" style="background: none; border: none;" name="today" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" style="background: none; border: none;" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
			</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td style="padding-right: 30px;">
	            <div class="ui input">
	  				<input type="text" style="background: none; border: none;" name="today" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" style="background: none; border: none;" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
			</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td style="padding-right: 30px;" style="padding-right: 30px;">
	            <div class="ui input">
	  				<input type="text" style="background: none; border: none;" name="today" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" style="background: none; border: none;" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
			</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td style="padding-right: 30px;">
	            <div class="ui input">
	  				<input type="text" style="background: none; border: none;" name="today" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" style="background: none; border: none;" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
			</td>
        </tr>
        <tr>
            <td></td>
            <td><input type="hidden" id="todoListTime" val=""></td>
            <td style="float: right;"><!-- <input type="button" style="width: 120px;"id="mvManagement" value="메인 화면 관리">&nbsp;&nbsp; --><input type="button" id="edit" value="수정하기"><input type="hidden" id="ok" value="저장하기"></td>
        </tr>
    </table>
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
    	$(function(){
            $("#edit").click(function() {
                $("#ok").attr("type", "button");
                $(this).attr("type", "hidden");
                $("input[name=today]").each(function(index){
                    $(this).attr("readonly", false);
                    $(this).css({"background":"#fff", "border":"1px solid rgba(34,36,38,.15)"});
                    $(this).attr("placeholder", "오늘 해야할 일");
                });
                
                $("input[name=tomorrow]").each(function(index){
                    $(this).attr("readonly", false);
                    $(this).css({"background":"#fff", "border":"1px solid rgba(34,36,38,.15)"});
                    $(this).attr("placeholder", "내일 해야할 일");
                });
            });

			$("#ok").click(function() {
				$("#edit").attr("type", "button");
				$(this).attr("type", "hidden");
				$("input[name=today]").each(function(index){
					$(this).attr("readonly", true);
					$(this).css({"background":"none", "border":"0"});
					$(this).attr("placeholder", "수정은 버튼을 눌러주세요");
				});
				$("input[name=tomorrow]").each(function(index){
					$(this).attr("readonly", true);
					$(this).css({"background":"none", "border":"0"});
					$(this).attr("placeholder", "수정은 버튼을 눌러주세요");
				});
				 
				var todo = $("input[name='todaycheck']").length;
				var todoCheck = new Array(todo);
				for(var i = 0; i < todo; i++){                          
					if($("input[name='todaycheck']")[i].checked == true){
						todoCheck[i] = 'Y';
					}else{
						todoCheck[i] = 'N';
					}
				}
				
				var today = $("input[name='today']").length;
				var todayList = new Array(today);
				for(var i = 0; i < today; i++){                          
					todayList[i] = $("input[name='today']").eq(i).val();
				}
				
				var tomorrow = $("input[name='tomorrow']").length;
				var tomorrowList = new Array(tomorrow);
				for(var i = 0; i < tomorrow; i++){                          
					tomorrowList[i] = $("input[name='tomorrow']").eq(i).val();
				}
				
				$.ajax({
					url:"/main/insertTodoList.todo",
					data: {
						todoCheck:todoCheck,
						todayList:todayList,
						tomorrowList:tomorrowList
					},
					type:"post",
					success:function(data){
						$("#updateResult").text("할일 리스트가 수정되었습니다!");
						$('.mini.modal').modal('show');
					}
				});
            });
        });
    </script>
    <%@ include file="/views/common/footer.jsp" %>
    <%@ include file="/views/common/chat.jsp" %> 
    
    <script>
    
    $(function(){
		getTodoListTimeCheck();
	});
	  
	function getTodoListTimeCheck() {
		ws6 = new WebSocket("ws:<%=svrIP%>:<%=svrPort %>" + '<%=request.getContextPath() %>/todoListTime.todo');
		
		ws6.onopen = function(event){
			
		}
		
		ws6.onmessage = function(event){
			onMessage6(event);
		}
		
		ws6.onerror = function(event){
			onError6(event);
		}
		
		ws6.onclose = function(event){
			onClose6(event);
		}
	}
		
	function onMessage6(event){
		var serverMessage = event.data;
		
		if(serverMessage == "11:15:00"){
			var today = $("input[name='today']").length;
			var todayList = new Array(today);
			for(var i = 0; i < today; i++){                          
				todayList[i] = $("input[name='today']").eq(i).val();
			}
			
			var tomorrow = $("input[name='tomorrow']").length;
			var tomorrowList = new Array(tomorrow);
			var totomorrowList = new Array(tomorrow);
			for(var i = 0; i < tomorrow; i++){                          
				tomorrowList[i] = $("input[name='tomorrow']").eq(i).val();
				totomorrowList[i] = "";
			}
		
			for(var i = 0; i < 6; i++){                          
				$("input[name='today']").eq(i).val($("input[name='tomorrow']").eq(i).val());
				$("input[name='tomorrow']").eq(i).val("")
				$("input[name='todaycheck']")[i].checked = false;
				 
			}
			var todoCheck = new Array(tomorrow);
			for(var i = 0; i < 6; i++){
				todoCheck[i] = "N";
			}
			$.ajax({
				url:"/main/insertTodoList.todo",
				data: {
					todoCheck:todoCheck,
					todayList:tomorrowList,
					tomorrowList:totomorrowList
				},
				type:"post",
				success:function(data){
					$("#updateResult").text("할일 리스트가 업데이트 되었습니다!");
					$('.mini.modal').modal('show');
				}
			});
			
		}
	}
		
	function onError6(event){
	}
		
	function onClose6(event){
	}
    	
    </script>
</body>

</html>