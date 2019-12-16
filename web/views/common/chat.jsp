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

    .sendMessage {
  		position: relative;
  		padding: 10px 20px;
 		color: white;
  		background: #0B93F6;
  		border-radius: 25px;
  		float: right;
  		margin-right: 9px;
	}
	.sendMessage:before {
  		content: "";
  		position: absolute;
  		z-index: -1;
  		bottom: -2px;
  		right: -7px;
  		height: 20px;
  		border-right: 20px solid #0B93F6;
  		border-bottom-left-radius: 16px 14px;
  		-webkit-transform: translate(0, -2px);
	}
	.sendMessage:after {
  		content: "";
  		position: absolute;
  		z-index: 1;
  		bottom: -2px;
  		right: -56px;
  		width: 26px;
  		height: 20px;
 		background: white;
  		border-bottom-left-radius: 10px;
  		-webkit-transform: translate(-30px, -2px);
	}

	.message {
  		position: relative;
  		padding: 10px 20px;
  		background: #E5E5EA;
  		border-radius: 25px;
  		color: black;
  		float: left;
  		margin-left: 9px;
	}
	.message:before {
  		content: "";
  		position: absolute;
  		z-index: 2;
  		bottom: -2px;
  		left: -7px;
  		height: 20px;
  		border-left: 20px solid #E5E5EA;
  		border-bottom-right-radius: 16px 14px;
  		-webkit-transform: translate(0, -2px);
	}
	.message:after {
  		content: "";
  		position: absolute;
  		z-index: 3;
  		bottom: -2px;
  		left: 4px;
  		width: 26px;
  		height: 20px;
  		background: white;
  		border-bottom-right-radius: 10px;
  		-webkit-transform: translate(-30px, -2px);
	}
	.clear {
  		clear: both;
	}
	#chatContext div {
  		max-width: 150px;
  		word-wrap: break-word;
  		margin-bottom: 7px;
  		line-height: 24px;
	}
	#chatContext {
		overflow-y:scroll; 
	}

	.recieveTime {
		float: left;
	}
	.sendTime {
		float: right;
	}
</style>
<div id="chat" class="ui avatar image" data-tooltip="Add users to your feed" data-position="top right">
    <img style="width:80px; height:80px;" src="<%=request.getContextPath()%>/images/chat.png">
</div>
<div class="ui custom popup top left transition hidden">
   
	<select name="receiver" id="receiver" style="width: 50%; height: 30px; margin-bottom: 10px;">
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
	$(function(){
		$(document).on("change", "#receiver", function(){
			$("#chatContext").html("");
		});
	});
    $(document).ready(function(){
        $("#sendMassage").keypress(function (e) {
         if (e.which == 13){
        	 send();
         }
     });
 });
</script>
<script>
	$(function(){
		getConnection();
	});
	
	function getConnection() {
		
		
		ws = new WebSocket("ws:<%=svrIP %>:<%=svrPort %>" + '<%=request.getContextPath() %>/chat');
		
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
		var sendUser = "<%=loginUser.getMemberNo() %>";
		var message = $("#sendMassage").val();
		
		$("#sendMassage").val("");
		
		var curTime = $("#serverTime").text();
		
		var sendMessage = sendUser + ":" + reciever + ":" + message + ":" + curTime;
		ws.send(sendMessage);
		
		$chatContext = $("#chatContext");
		
		$chatContext.append("<div class='clear'></div>"
							+ "<div class='sendMessage'>" + message + "</div><small class='sendTime'>" + curTime + "</small>");
		$("#chatContext").scrollTop($("#chatContext")[0].scrollHeight);
	}
		
	function onMessage(event){
		var serverMessage = event.data.split(":");
		var reciever = $("#receiver").val();
		
		var recieveUser = serverMessage[0];
		var sendUser = serverMessage[1];
		var message = serverMessage[2];
		var remainHour = serverMessage[3];
		var remainMin = serverMessage[4];
		var remainSec = serverMessage[5];
		
		var time = remainHour + ":" + remainMin + ":" + remainSec;
		$chatContext = $("#chatContext");
		
		if(recieveUser == "<%=loginUser.getMemberNo() %>"){
			console.log(reciever);
			if(reciever == sendUser){
				$chatContext.append("<div class='clear'></div>"
			 						+ "<div class='message'>" + message + "</div><small class='recieveTime'>" + time + "</small>");
			}
		}
		$("#chatContext").scrollTop($("#chatContext")[0].scrollHeight);
		
			
	}
		
	function onError(event){
		alert(event.data);
	}
		
	function onClose(event){
		alert(event);
	}
	
</script>