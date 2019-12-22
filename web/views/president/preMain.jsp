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
	#pwdChange {
		top:25%;
		left:27%;
	}
	.ui.small.modal {
		width:730px !important;
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
	  				<input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
			</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td style="padding-right: 30px;">
	            <div class="ui input">
	  				<input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
			</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td style="padding-right: 30px;">
	            <div class="ui input">
	  				<input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
			</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td style="padding-right: 30px;">
	            <div class="ui input">
	  				<input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
			</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td style="padding-right: 30px;" style="padding-right: 30px;">
	            <div class="ui input">
	  				<input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
			</td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td style="padding-right: 30px;">
	            <div class="ui input">
	  				<input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly>
				</div>
            <td>
            	<div class="ui input">
	  				<input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly>
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
  	
  	
  	<div class="ui small modal" id="pwdChange">
	  <i class="close icon"></i>
	  <div class="header">
	    	비밀번호 변경
	  </div>
	  <div class="image content" style="display:inline-block; padding:1.25rem 1.5rem">
    	<div class="ui input">
    		<input type="hidden" name="rno" id="rno" value="<%= loginUser.getMemberRno() %>"/>
	    	<span style="line-height: 37px;">변경할 비밀번호 : </span> &nbsp;&nbsp;
	    	<input type="password" id="password" name="userPwd" /> &nbsp;&nbsp;
	    	<span style="line-height: 37px;" id="pass1Check"></span>
    	</div>
	    <br />
	    <br />
	    <div class="ui input">
	    	<span style="line-height: 37px;">비밀번호 확인 : </span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	<input type="password" id="passCheck" /> &nbsp;&nbsp;
	    	<span style="line-height: 37px;" id="pass2Check"></span>
	    </div>
	  </div>
	  <div class="actions">
	    <div class="ui positive right labeled icon button" id="okbtn">
	      	확인
	      <i class="checkmark icon"></i>
	    </div>
	  </div>
	</div>
  	
  	
    <script>
	    $(document).ready(function(){
	        $("#passCheck").keypress(function (e) {
	         	if (e.which == 13){
	         		$('#pwdChange').modal('hide');
	         		updatePwd();
	         	}
	     	});
	 	});
    
	    $("#okbtn").click(function() {
	    	updatePwd();
	    });
	    
	    function updatePwd() {
	    	$.ajax({
	    		url:"<%= request.getContextPath() %>/updatePwd.me",
	    		type:"post",
	    		data: {
	    			mno:<%= loginUser.getMemberNo() %>,
	    			rno:$("#rno").val(),
	    			userPwd:$("#password").val()
	    		},
	    		success:function(data) {
	    			if(data == 't') {
						alert("변경완료");
					}
	    		},
	    		error:function() {
	    			console.log("실패")
	    		}
	    	});
	    }
	    
    	$(function(){
            $("#edit").click(function() {
                $("#ok").attr("type", "button");
                $(this).attr("type", "hidden");
                $("input[name=today]").each(function(index){
                    $(this).attr("readonly", false);
                    $(this).attr("placeholder", "오늘 해야할 일");
                });
                
                $("input[name=tomorrow]").each(function(index){
                    $(this).attr("readonly", false);
                    $(this).attr("placeholder", "내일 해야할 일");
                });
            });

			$("#ok").click(function() {
				$("#edit").attr("type", "button");
				$(this).attr("type", "hidden");
				$("input[name=today]").each(function(index){
					$(this).attr("readonly", true);
					$(this).attr("placeholder", "수정은 버튼을 눌러주세요");
				});
				$("input[name=tomorrow]").each(function(index){
					$(this).attr("readonly", true);
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
    $(function() {
    	if(<%= loginUser.getMemberRno().endsWith("~") %>) {
    		alert("임시 비밀번호로 로그인 하셨습니다.\n비밀번호를 변경해주세요.");
    		$('#pwdChange').modal('show');
    	}
    });
    
    var pattern1 = /[0-9]/; // 숫자 
	var pattern2 = /[a-zA-Z]/; // 문자 
	var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자

	$("#password").keyup(function(){
		if (!pattern1.test($('#password').val()) || !pattern2.test($('#password').val()) || !pattern3.test($('#password').val()) || $("#password").val().length <= 8) {
			$("#pass1Check").css({"color":"tomato"},{"height":"30px"});
			$("#pass1Check").html("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");	
		} else {
			$("#pass1Check").css({"color":"green"});
			$("#pass1Check").html("사용가능한 비밀번호 입니다.");	
		} 
	});
	
	$("#passCheck").keyup(function(){
		if ($('#password').val() == $('#passCheck').val()) {
			$("#pass2Check").css({"color":"green"});
			$("#pass2Check").html("비밀번호가 일치합니다.");	
		} else {
			$("#pass2Check").css({"color":"tomato"});
			$("#pass2Check").html("비밀번호가 일치하지 않습니다.");	
		}
	});
    
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
		
		if(serverMessage == "12:42:00"){
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