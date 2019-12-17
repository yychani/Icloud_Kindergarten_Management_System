<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.oracle5.board.model.vo.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>

<style>
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-family: 'Noto Sans KR', sans-serif;
	color: #595959;
}

th {
	font-family: 'Noto Sans KR', sans-serif;
	color: #000000;
}

select {
	font-family: 'Noto Sans KR', sans-serif;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-family: 'Noto Sans KR', sans-serif;
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-family: 'Noto Sans KR', sans-serif;
	color: #000000;
	text-decoration: none;
}

A:active {
	font-family: 'Noto Sans KR', sans-serif;
	color: red;
	text-decoration: none;
}

A:hover {
	font-family: 'Noto Sans KR', sans-serif;
	color: red;
	text-decoration: none;
}

#calendarFrm {
	margin-top: 30px;
}

#calHead {
	margin: 0 !important;
}

.ui segment attendanceType {
	margin: 0 auto;
	width: 500px;
}
#cNameSelect{
	margin:0 auto;
}
</style>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/parentsMenu.jsp"%>
	
	<script>
      $(function() {
    	  $(".li:nth-child(5)").addClass("on");
    	  
          $(".topMenuLi:nth-child(1)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(5)").removeClass("on");
            $(".topMenuLi:nth-child(1)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(5)").addClass("on");
            $(".topMenuLi:nth-child(1)").addClass("on");
         });
      }); 
</script>
	
	<h1 align="center">내 아이 출결사항</h1>
	<div align="center">
	<select class="ui dropdown" id="cNameSelect"></select>
	</div>
	

	<%@ include file="/views/common/calendar.jsp"%>

	<div class="ui segment attendanceType"
		style="margin: 0 auto; width: 500px;">출석 결석 지각 조퇴</div>
	<div class="ui segment attendanceType"
		style="margin: 0 auto; width: 500px;">
		<label><%=year%>년 <%=month + 1%>월</label>&nbsp;&nbsp;<label id="cName"></label>&nbsp;&nbsp;어린이
		출결사항<br> 
		<label>출석 : </label><label id="chul"></label><br> 
		<label>결석 : </label><label id="gul"></label><br>
		<label>조퇴 : </label><label id="jo"></label><br>
		<label>지각 : </label><label id="zi"></label>

	</div>
	<br>
	<br>
	<br>


	<script>
$(function(){
	cId = 0;
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
				
				$("#cNameSelect").trigger("change");
				
			}
			
		},
		error:function(data){
			console.log("failㅠㅠ");
		}
	});
});

$(function(){
	$(document).on("change", "#cNameSelect", function(){
		$(".dailyDate1").each(function(){
			$(this).parent().children("p").text("");
		});
		
		var cId = $("#cNameSelect").val();
		
		console.log();
		$("#cName").text($("#cNameSelect option:checked").text());

		$.ajax({
			url:"<%=request.getContextPath()%>/cAttend.me",
			data:{cId},
			type:"get",
			success:function(data){
				console.log(data);
				var c = 0;	//출석
				var z = 0;	//지각
				var g = 0;	//결석
				var j = 0;	//조퇴

				/* 캘린더에 출결 입력 */
	             for(var i = 0; i < data.length; i++){
	            	 var date = data[i].amDate;
	            	 date = date.split(" ");
	            	 
					var year = date[2];
					var month = date[0].substring(0, date[0].length - 1);
					var day = date[1].substring(0, date[1].length - 1) < 10 ? "0" +date[1].substring(0, date[1].length - 1) : date[1].substring(0, date[1].length - 1)
	            	date = date[2] + "-" + date[0].substring(0, date[0].length - 1) + "-" + date[1].substring(0, date[1].length - 1) < 10 ? "0" +date[1].substring(0, date[1].length - 1) : date[1].substring(0, date[1].length - 1);
	            	console.log(year + "-" + month + "-" + day)
	            	date = year + "-" + month + "-" + day;
	            	
	            	$(".dailyDate1").each(function(){
	            		if($(this).val() == date){
	            			$(this).parent().children("p").text(data[i].aType);
	            			
	            			if(data[i].aType === "출석"){
	            				c ++;
	            			}else if(data[i].aType === "지각"){
	            				z ++;
	            			}else if(data[i].aType === "결석"){
	            				g ++;
	            			}else if(data[i].aType === "조퇴"){
	            				j ++;
	            			}
	            		}
	            		
	            	});
	            	
				 }
				$("#chul").text(c + "일");
				$("#gul").text(g + "일");
				$("#jo").text(j + "일");
				$("#zi").text(z + "일");
				
			},
			error:function(data){
				console.log("출석 불러오기 실패");
			}
		});
	});
});


</script>


	<script>
	$(".date").on("click", function(){
		var date = $(this).children(".dailyDate1").val();
		console.log(date);
	});

	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>