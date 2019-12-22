<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
footer{
font-family: 'Noto Sans KR', sans-serif;
}
</style>
<footer align="center">
    <hr>
    <p>떡잎유치원 | 주소 : 서울특별시 강서구 방화도 878번지 동부센트레빌단지내 | 원 전화번호 : 02-2667-0645</small>
        <br><br>
        <small>POWERED BY</small> <img src="<%=request.getContextPath() %>/images/icloud.jpg" style="width: 80px;">
        <br>
        <small>서버시간 : </small><span id="serverTime"></span>
</footer>

<script>
	$(function(){
		getServerTime();
	});
	  
	function getServerTime() {
		

		ws = new WebSocket("ws:<%=svrIP%>:<%=svrPort %>" + '<%=request.getContextPath() %>/serverTime.web');
		
		ws.onopen = function(event){
			
		}
		
		ws.onmessage = function(event){
			onMessage2(event);
		}
		
		ws.onerror = function(event){
			onError2(event);
		}
		
		ws.onclose = function(event){
			onClose2(event);
		}
	}
		
	function onMessage2(event){
		var serverMessage = event.data;
		var timeArr = event.data.split(":");
		
		var hour = parseInt(timeArr[0]);
		/*if(hour >= 18 || hour <= 8){
			$("#chat").hide();
		}else {
			$("#chat").show();
		}*/ // 채팅 비활성화
		
		$("#serverTime").text(serverMessage);
		$("#todoListTime").val(serverMessage);
	}
		
	function onError2(event){
	}
		
	function onClose2(event){
	}
</script>