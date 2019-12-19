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
        width: 370px !important;
        height: 410px !important;
    }

    .sendMessage {
  		position: relative;
  		padding: 10px 20px;
 		color: white;
  		background: forestgreen;
  		border-radius: 25px;
  		float: right;
  		margin-right: 9px;
	}
	.sendMessage:before {
  		content: "";
  		position: absolute;
  		z-index: 0;
  		bottom: -2px;
  		right: -7px;
  		height: 20px;
  		border-right: 20px solid forestgreen;
  		border-bottom-left-radius: 16px 14px;
  		-webkit-transform: translate(0, -2px);
	}
	.sendMessage:after {
  		content: "";
  		position: absolute;
  		z-index: 1;
  		bottom: -2px;
  		right: -55.987497px;
  		width: 26px;
  		height: 23px;
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
		overflow-x:hidden;
		background: white;
	}

	.recieveTime {
		float: left;
	}
	.sendTime {
		float: right;
	}
	#redCircle {
		width: 20px;
		height: 20px;
		position: fixed;
        bottom: 80px;
        right: 80px;
        background: tomato;
        border-radius: 20px;
        z-index: 999;
        padding: 1px 6px;
        color: white;
        font-weight: bold;
	}
	.ui.top.right.popup:before{
		background: seagreen;
	}
</style>

<div id="redCircle"></div>
<div id="chat" class="ui avatar image" data-tooltip="채팅을 이용하시려면 클릭하세요!" data-position="top right">
    <img style="width:80px; height:80px;" src="<%=request.getContextPath()%>/images/chat.png">
</div>
<div class="ui custom popup top left transition hidden" style="max-width: 400px; background: seagreen; border-radius: 10px;">
	<select class="ui search dropdown" name="receiver" id="receiver" style="width: 50%; height: 30px; margin-bottom: 10px;">
   	</select>
    <div style="border: 1px solid black; width: 100%; height: 295px; margin-bottom: 10px; margin-top: 10px;"id="chatContext">
    </div>
    <input type="text" style="border-radius: 10px; background: white; width: 73%; height: 30px; border: 1px solid rgba(211, 211, 211, 0.842)" name="sendMassage" id="sendMassage">
    &nbsp;&nbsp;<input type="button" name="sendBtn" onclick="send()" id="sendBtn" style="width: 79px; height: 30px;" value="보내기">
    
</div>

<script>
	$('#receiver').dropdown();	
    $('.ui.avatar.image').popup({
        popup: $('.custom.popup'),
        on: 'click',
        position : 'top right'
    })
	$(function(){
		$("#redCircle").hide();
		var sendUser = <%=loginUser.getMemberNo()%>;
		
		$.ajax({
			url:"/main/selectAllUnread.chat",
			data:{
				sendUser:sendUser
			},
			type:"post",
			success:function(data){
				if(data.length != 0){ 
					$("#redCircle").show();
					
				}
			}
		});
		
		$(document).on("change", "#receiver", function(){
			$("#chatContext").html("");
			$chatContext = $("#chatContext");
			var sendUser = <%=loginUser.getMemberNo()%>;
			var reciever = $("#receiver").val();
			$.ajax({
				url:"/main/selectChat.chat",
				type:"post",
				data:{
					reciever:reciever,
					sendUser:sendUser
				},
				success:function(data){
					$chatContext.append("<input type='hidden' id='chatRoomNo' val='" + data[0].chatNo + "'>");
					var origindate = "";
					var newdate = "";
					for(var i = 0; i < data.length; i++){
						var time = data[i].time;
						if(origindate == data[i].sdate){
							newdate = "";
							origindate = data[i].sdate;
						}else {
							newdate = "<small>-----------" + data[i].sdate.split('/')[0] + "년 " + data[i].sdate.split('/')[1] + "월 " + data[i].sdate.split('/')[2] + "일" + "-----------</small>";
							origindate = data[i].sdate;
						}
						var mno = data[i].mno;
						var message = data[i].cont;
						var viewCheck = data[i].viewCheck;
						var view = "";
						if(viewCheck == "Y"){
							view = "읽음";
						}
						if(mno == sendUser){
							$chatContext.append("<div class='clear' style='width: 100%; max-width: 500px; text-align:center; margin: 0 auto;'>"+ newdate +"</div>"
									+ "<div class='sendMessage'>" + message + "</div><small class='sendTime'>" + time + "</small><br><small class='sendTime'>" + view + "</small>");
						}else {
							$chatContext.append("<div class='clear'></div>"
			 						+ "<div class='message'>" + message + "</div><small class='recieveTime'>" + time + "</small>");
						}
						$("#chatContext").scrollTop($("#chatContext")[0].scrollHeight);
					}
				}
			});
		});
		
		$(document).on("focus", "#sendMassage", function(){
			
			var receiver = $("#receiver").val();
			var sendUser = <%=loginUser.getMemberNo()%>;
			var item = [];
			for(var i = 0; i < $(".item").length; i++){
				item[i] = $(".item")[i];
				/* console.log(item[i].dataset.value); */
			}
			$.ajax({
				url:"/main/updateView.chat",
				data:{
					receiver:receiver,
					sendUser:sendUser
				},
				type:"post",
				success:function(data){
					for(var j = 0; j < item.length; j++){
						if (item[j].dataset.value == $("#receiver").val()) { 
							item[j].style.background = "white";
						}
					}
				}
			});
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
		getUnreadCount();
		
	});
	function getUnreadCount(){
		ws2 = new WebSocket("ws:<%=svrIP %>:<%=svrPort %>" + '<%=request.getContextPath() %>/chatReadCheck.chat');
		
		ws2.onopen = function(event){
			console.log("전송 완료");
			ws2.send(<%=loginUser.getMemberNo()%>);
		}
		
		ws2.onmessage = function(event){
			onMessage3(event);
		}
		
		ws2.onerror = function(event){
			onError3(event);
		}
		
		ws2.onclose = function(event){
			onClose3(event);
		}
	}
	function onMessage3(event){
		var serverMessage = event.data.split(":");
		var recieveUser = serverMessage[0];
		var unReadCount = parseInt(serverMessage[1]);
		var item = [];
		for(var i = 0; i < $(".item").length; i++){
			item[i] = $(".item")[i];
			/* console.log(item[i].dataset.value); */
		}
		var unread = [];
		for(var i = 2; i < serverMessage.length; i++){
			unread[i - 2] = parseInt(serverMessage[i]);
		}
		if(recieveUser == "<%=loginUser.getMemberNo() %>"){
			if(unReadCount == "0"){
				$("#redCircle").hide();
				for(var j = 0; j < item.length; j++){
					item[j].style.background = "white";
				}
			}else {
				$("#redCircle").show();
				$("#redCircle").text(unReadCount);
				
				for(var k = 0; k < unread.length; k++){
					for(var j = 0; j < item.length; j++){
						if (parseInt(item[j].dataset.value) == unread[k]) { 
							item[j].style.background = "tomato";
						}
						else {
							item[j].style.background = "white";
						}
					}
				}
			
			}
		}		
	}
		
	function onError3(event){
	}
		
	function onClose3(event){
	}
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
		
		
		
		$.ajax({
			url:"/main/saveChat.chat",
			data:{
				reciever:reciever,
				sendUser:sendUser,
				message:message
			},
			type:"post",
			success:function(data){
				$chatContext.append("<div class='clear'></div>"
						+ "<div class='sendMessage'>" + data.cont + "</div><small class='sendTime'>" + data.time + "</small>");
				$("#chatContext").scrollTop($("#chatContext")[0].scrollHeight);
			}
		});
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
			if(reciever == sendUser){
				$chatContext.append("<div class='clear'></div>"
			 						+ "<div class='message'>" + message + "</div><small class='recieveTime'>" + time + "</small>");
				$("#chatContext").scrollTop($("#chatContext")[0].scrollHeight);
			}
			//$("#receiver").val(sendUser).prop("selected", true);
			//$("#receiver").trigger("change");
			$("#redCircle").show();
		}		
			
	}
		
	function onError(event){
	}
		
	function onClose(event){
	}
	
</script>