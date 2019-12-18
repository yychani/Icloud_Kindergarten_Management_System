<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	.chat{
		font-family: 'Noto Sans KR', sans-serif;
		margin : 5% 20%;
	}
	.card{
		height: 500px;
		border-radius: 15px !important;
		background-color: #f0f69f !important;
	}
	.contacts_body{
		padding:  0.75rem 0 !important;
		overflow-y: auto;
		white-space: nowrap;
	}
	.msg_card_body{
		overflow-y: auto;
	}
	.card-header{
		border-radius: 15px 15px 0 0 !important;
		border-bottom: 0 !important;
           background-color: #bfe78a; 
	}
	.card-footer{
		border-radius: 0 0 15px 15px !important;
		border-top: 0 !important;
	}
	.container{
		align-content: center;
	}
	.search{
		border-radius: 15px 0 0 15px !important;
		background-color: rgba(0,0,0,0.3) !important;
		border:0 !important;
		color:white !important;
	}
	.search:focus{
	     box-shadow:none !important;
          outline:0px !important;
	}
	.type_msg{
		background-color: rgba(0, 0, 0, 0.129) !important;
		border:0 !important;
		color:white !important;
		height: 60px !important;
		overflow-y: auto;
	}
	.type_msg:focus{
	     box-shadow:none !important;
          outline:0px !important;
	}
	.attach_btn{
		border-radius: 15px 0 0 15px !important;
		background-color:  rgba(0, 0, 0, 0.129) !important;
		border:0 !important;
		color: white !important;
		cursor: pointer;
	}	
	.send_btn{
		border-radius: 0 15px 15px 0 !important;
		background-color:  rgba(0, 0, 0, 0.129) !important;
		border:0 !important;
		color: white !important;
		cursor: pointer;
	}
	.search_btn{
		border-radius: 0 15px 15px 0 !important;
		background-color: rgba(0,0,0,0.3) !important;
		border:0 !important;
		color: white !important;
		cursor: pointer;
	}
	.contacts{
		list-style: none;
		padding: 0;
	}
	.contacts li{
		width: 100% !important;
		padding: 5px 10px;
		margin-bottom: 15px !important;
	}
	.active{
			background-color: rgba(0,0,0,0.3);
	}
	.user_img{
		height: 70px;
		width: 70px;
		border:1.5px solid #f5f6fa;
	
	}
	.user_img_msg{
		height: 40px;
		width: 40px;
		border:1.5px solid #f5f6fa;
	
	}
	.img_cont{
			position: relative;
			height: 70px;
			width: 70px;
	}
	.img_cont_msg{
			height: 40px;
			width: 40px;
	}
	.online_icon{
		position: absolute;
		height: 15px;
		width:15px;
		background-color: #4cd137;
		border-radius: 50%;
		bottom: 0.2em;
		right: 0.4em;
		border:1.5px solid white;
	}
	.offline{
		background-color: #c23616 !important;
	}
	.user_info{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 15px;
	}
	.user_info span{
		font-size: 20px;
		color: white;
	}
	.user_info p{
		font-size: 10px;
		color: rgba(255,255,255,0.6);
	}
	.video_cam{
		margin-left: 50px;
		margin-top: 5px;
	}
	.video_cam span{
		color: white;
		font-size: 20px;
		cursor: pointer;
		margin-right: 20px;
	}
	.msg_cotainer{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 10px;
		border-radius: 25px;
		background-color: #b0e071;
		padding: 10px;
		position: relative;
	}
	.msg_cotainer_send{
		margin-top: auto;
		margin-bottom: auto;
		margin-right: 10px;
		border-radius: 25px;
		background-color: #78e08f;
		padding: 10px;
		position: relative;
	}
	.msg_time{
		position: absolute;
		left: 0;
		bottom: -15px;
		color: rgba(105, 105, 105, 0.768);
		font-size: 10px;
	}
	.msg_time_send{
		position: absolute;
		right:0;
		bottom: -15px;
		color: rgba(105, 105, 105, 0.768);
		font-size: 10px;
	}
	.msg_head{
		position: relative;
	}
	#action_menu_btn{
		position: absolute;
		right: 10px;
		top: 10px;
		color: white;
		cursor: pointer;
		font-size: 20px;
	}
	.action_menu{
		z-index: 1;
		position: absolute;
		padding: 15px 0;
		background-color: rgba(0,0,0,0.5);
		color: white;
		border-radius: 15px;
		top: 30px;
		right: 15px;
		display: none;
	}
	.action_menu ul{
		list-style: none;
		padding: 0;
	margin: 0;
	}
	.action_menu ul li{
		width: 100%;
		padding: 10px 15px;
		margin-bottom: 5px;
	}
	.action_menu ul li i{
		padding-right: 10px;
	
	}
	.action_menu ul li:hover{
		cursor: pointer;
		background-color: rgba(0,0,0,0.2);
	}
</style>
<div class="col-md-12 col-xl-8 chat">
	<div class="card">
		<div class="card-header msg_head">
			<div class="d-flex bd-highlight">
				<div class="img_cont">
					<img id="mainChildImg" src="" class="rounded-circle user_img">
				</div>
				<div class="user_info">
					<span id="childrenName"></span>
					<input type="hidden" val="" id="childNo">
				</div>
			</div>
		</div>
		<div id="feedContext" class="card-body msg_card_body">
			<!-- <div class="d-flex justify-content-start mb-4">
				<div class="img_cont_msg">
					<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img_msg">
				</div>
				<div class="msg_cotainer">
					오늘 건후 밥 잘먹었어요!!!!!!!!!!!!!!!!!!!!!!!!!!
					<span class="msg_time">8:40 AM, Today</span>
				</div>
			</div> -->
		</div>
		
		<div class="card-footer">
			<% if(loginUser.getUType().equals("교사")) {%>
			<form id="feedSendForm" action="" method="post" enctype="multipart/form-data">
				<div class="input-group">
					<div class="input-group-append">
						<span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
					</div>
					<input type="text" name="" id="sendMassage2" class="form-control type_msg" placeholder="아이 피드를 입력하세요">
					<div class="input-group-append">
						<input type="hidden">
						<span onclick="send2()" class="input-group-text send_btn"><i class="fas fa-location-arrow"></i></span>
					</div>
				</div>
			</form>
			<% } %>
		</div>
	</div>
</div>
<script>
	$(function(){
		
		$.ajax({
			url:"/main/selectModalChild.do",
			data:{
				cid:<%=cid %>
			},
			type:"post",
			success:function(data){
				var img = "<%=request.getContextPath() %>/" + data.imgSrc.substring(data.imgSrc.lastIndexOf("\\") + 1)
				$("#childrenName").text(data.name);
				$("#mainChildImg").prop("src", img);
				$("#childNo").val(data.cId);
			}
		});
		getConnection4();
	});
	$(document).ready(function(){
        $("#sendMassage2").keypress(function (e) {
         	if (e.which == 13){
        	 	send2();
         	}
     	});
        $.ajax({
        	url:"/main/selectChildFeed.feed",
        	data:{
        		cid:<%=cid %>
        	},
        	type="post",
        	success:function(data){
        		
        	}
        });
	});
	
	function getConnection4() {
		
		ws4 = new WebSocket("ws:<%=svrIP %>:<%=svrPort %>" + '<%=request.getContextPath() %>/feed');
		
		ws4.onopen = function(event){
			
		}
		
		ws4.onmessage = function(event){
			onMessage4(event);
		}
		
		ws4.onerror = function(event){
			onError4(event);
		}
		
		ws4.onclose = function(event){
			onClose4(event);
		}
	}
	function send2(msg){
		var reciever = $("#childNo").val();
		var sendUser = "<%=loginUser.getMemberNo() %>";
		var message = $("#sendMassage2").val();
		
		$("#sendMassage2").val("");
		
		var curTime = $("#serverTime").text();
		
		var sendMessage = sendUser + ":" + reciever + ":" + message + ":" + curTime;
		ws4.send(sendMessage);
		
		var $feedContext = $("#feedContext");
		var $div1 = $('<div class="d-flex justify-content-end mb-4">')
		var $div2 = $('<div class="msg_cotainer_send">').text(message);
		var $span = $('<span class="msg_time_send">').text(curTime);
		$div2.append($span);
		
		$div1.append($div2);
		$feedContext.append($div1);
		$("#feedContext").scrollTop($("#feedContext")[0].scrollHeight);
		
		$.ajax({
			url:"/main/saveFeed.feed",
			data:{
				reciever:reciever,
				sendUser:sendUser,
				message:message
			},
			type:"post",
			success:function(data){
				
			}
		});
	}
		
	function onMessage4(event){
		var serverMessage = event.data.split(":");
		
		var recieveUser = serverMessage[0];
		var sendUser = serverMessage[1];
		var message = serverMessage[2];
		var remainHour = serverMessage[3];
		var remainMin = serverMessage[4];
		var remainSec = serverMessage[5];
		var img = $("#mainChildImg").prop("src");
		var time = remainHour + ":" + remainMin + ":" + remainSec;
		$feedContext = $("#feedContext");
		if(recieveUser == "<%=cid %>"){
			if(<%=pno %> == <%=loginUser.getMemberNo() %>){
				$feedContext.append("<div class='d-flex justify-content-start mb-4'>"
						+ "<div class='img_cont_msg'>" + "<img src='" + img + "' class='rounded-circle user_img_msg'></div>" + "<div class='msg_cotainer'>" + message + "<span class='msg_time'>" + time + "</span></div></div>");
				$("#feedContext").scrollTop($("#feedContext")[0].scrollHeight);
			}
			//$("#receiver").val(sendUser).prop("selected", true);
			//$("#receiver").trigger("change");
		}		
			
	}
		
	function onError4(event){
	}
		
	function onClose4(event){
	}
</script>