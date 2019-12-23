<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int cid = Integer.parseInt(request.getParameter("cid"));
%>
<!DOCTYPE html>
<html>

	<head>
		<title></title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        
    	body,html{
			height: 100%;
			margin: 0;
			background: white;
	       /* background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
	        background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5); */
		}

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
	@media(max-width: 576px){
		.contacts_card{
		margin-bottom: 15px !important;
		}
	}
	#pwdChange {
		top:25%;
		left:27%;
		height:253.6px !important;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.ui.small.modal {
		width:730px !important;
	}
	#cNameSelect{
	   width:161px;
	   height:34px;
	   border-radius:4px;
	   margin-left: 21%;
	}
	#cNameSelect:focus { 
		outline: none; 
	}
	.chat {
		margin-top: 10px !important;
	}
</style>
<script>
$(function(){
	$.ajax({
		url:"<%=request.getContextPath()%>/pCName.me",
		type:"get",
		success:function(data){
			console.log(data);

			$select = $("#cNameSelect");
			$select.find("option").remove();
			
			for(var key in data){
				var $option = $("<option>");
				$option.val(data[key].cId);
				$option.text(data[key].name);
				$select.append($option);
				
			}
		},
		error:function(data){
			console.log("faileㅠㅠ");
		}
	});
});
</script>
    </head>
<body> 
	 <%@ include file="/views/common/parentsMenu.jsp" %>
	 <% int pno = loginUser.getMemberNo(); %>
	 <select id="cNameSelect"></select>
	<%@ include file="/views/common/feed.jsp" %>
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
		$(function() {
	    	if(<%= loginUser.getMemberRno().endsWith("~") %>) {
	    		alert("임시 비밀번호로 로그인 하셨습니다.\n비밀번호를 변경해주세요.");
	    		$('#pwdChange').modal('show');
	    	}
	    });
	
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
	</script>
	<%@ include file="/views/common/footer.jsp" %>
    <%@ include file="/views/common/chat.jsp" %>
    <script>
    	$(document).ready(function(){
    		$(document).on("change", "#cNameSelect", function(){
    			var cid = $(this).val();
    			//console.log(cid);
    			$("#childrenName").text("");
    			$("#feedContext").text("");
    			
    			$.ajax({
					url: "<%=request.getContextPath()%>/myKidsInfo.me",
					data:{cId:cid},
					async: false,
					type:"get",
					success:function(data){
						$("#childrenName").text(data.c.name);
    					$("#mainChildImg").attr('src', '<%= request.getContextPath() %>/uploadFiles/'+ data.c.imgSrc);
					}
    			});
    			$.ajax({
    				url:"<%=request.getContextPath()%>/selectChildFeed.feed",
    				data:{cid:cid},
    				async: false,
    				type:"post",
    				success:function(data){
    					var img2 = $("#mainChildImg").prop("src");
    	        		//console.log(img2);
    	        		var $feedContext = $("#feedContext");
    	        		for(var key in data){
    	        			var date = data[key].fdate;
    	            		var time = data[key].time;
    	            		var fileP = "";
    	            		var message = "";
    	            		if(data[key].changeName == null){
    	            			message = data[key].content;
    	            		}else {
    	            			fileP = "<img src='<%=request.getContextPath() %>/uploadFiles/" + data[key].changeName + "' style='max-width: 300px; max-height: 200px;'>";
    	            		}
    		    			if(<%=pno %> == <%=loginUser.getMemberNo() %>){
    			   				$feedContext.append("<div class='d-flex justify-content-start mb-4'>"
    			   						+ "<div class='img_cont_msg'>" + "<img src='" + img2 + "' class='rounded-circle user_img_msg'></div>" + "<div class='msg_cotainer'>" + message + fileP +"<span class='msg_time'>" + date + " " + time + "</span></div></div>");
    		        		}else {
    		        			var $div1 = $('<div class="d-flex justify-content-end mb-4">')
    		        			var $div2 = $('<div class="msg_cotainer_send">').html(message + fileP);
    		        			var $span = $('<span class="msg_time_send">').text(date + "년    " + time);
    		        			$div2.append($span);
    		        			
    		        			$div1.append($div2);
    		        			$feedContext.append($div1);
    		        		}
    		    			$("#feedContext").scrollTop($("#feedContext")[0].scrollHeight);
    	        		}
    				},
    				error:function(data){
    					alert("피드 불러오기 실패");
    				}
    			});
    		});
    	});
    </script>
</body>
</html>