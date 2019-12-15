<%@page import="java.net.InetAddress"%>
<%@page import="com.oracle5.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<style>
    #chat {
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 80px;
        height: 80px;
    }
    .custom.popup {
        position: fixed !important;
        bottom: 100px !important;
        right: 45px !important;
        width: 300px !important;
        height: 300px !important;
    }
</style>
<div id="chat" class="ui avatar image" data-tooltip="Add users to your feed" data-position="top right">
    <img style="width:80px; height:80px;" src="<%=request.getContextPath()%>/images/chat.png">
</div>
<div class="ui custom popup top left transition hidden">
   
	<select name="receiver" id="receiver" style="width: 50%; height: 30px; margin-bottom: 10px;">
		<option value="yychani">윤재영</option>
		<option>B</option>
   	</select>
    <div style="border: 1px solid black; width: 100%; height: 200px; margin-bottom: 10px;"id="chatContext">
    </div>
    <input type="text" style="width: 73%; height: 30px; border: 1px solid rgba(211, 211, 211, 0.842)" name="sendMassage" id="sendMassage">
    &nbsp;&nbsp;<input type="button" name="sendBtn" onclick="send()" id="sendBtn" style="width: 47px; height: 25px;" value="보내기">
    
</div>
<script>
    $('.ui.avatar.image').popup({
        popup: $('.custom.popup'),
        on: 'click',
        position : 'top right'
    })
</script>
<script>
	$(function(){
		getConnection();
	});
	
	function getConnection() {
		
		
		ws = new WebSocket("ws:<%=svrIP %>:8001" + '<%=request.getContextPath() %>/chat');
		
		ws.onopen = function(event){
			
		}
		
		ws.onmessage = function(event){
			onMessage(event);
		}
		
		ws.onerror = function(event){
			onError(event);
		}
		
		ws.onclose = function(event){
			onClose(event);
		}
	}
		
	function send(msg){
		var reciever = $("#receiver").val();
		var sendUser = "<%=loginUser.getMemberId() %>";
		var message = $("#sendMassage").val();
		
		var curDate = new Date();
		var curTime = curDate.getHours() + ":" + curDate.getMinutes() + ":" + curDate.getSeconds();
		
		var message = sendUser + ":" + reciever + ":" + message + ":" + curTime;
		ws.send(message);
	}
		
	function onMessage(event){
		var serverMessage = event.data.split(":");
			
		var recieveUser = serverMessage[0];
		var sendUser = serverMessage[1];
		var message = serverMessage[2];
		var remainHour = serverMessage[3];
		var remainMin = serverMessage[4];
		var remainSec = serverMessage[5];
			
		$chatContext = $("#chatContext");
		
		$chatContext.html("전송완료");
			
	}
		
	function onError(event){
		alert(event.data);
	}
		
	function onClose(event){
		alert(event);
	}
	
</script>