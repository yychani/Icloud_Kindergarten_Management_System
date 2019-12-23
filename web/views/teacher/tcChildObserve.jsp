<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	int cid = Integer.parseInt(request.getParameter("cid"));
	int age = Integer.parseInt(request.getParameter("age"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유아관찰척도</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<style>
	.childOb td {
		border:1px solid black;
	}
	.childOb {
		border:2px solid black;
		width:70%;
	}
	.childOb tr:nth-of-type(n+4) td:nth-of-type(n+2) {
		word-spacing:2.5em;
		font-weight:bold;
	}
	input[type='button'] {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
	.obContent {
		word-spacing: 0 !important;
	}
	.first, .second {
		display: inline-block;
		width:24px;
		height:24px;
	}
</style>
<script>
	$(function() {
		$.ajax({
			url:"<%= request.getContextPath() %>/selectChildOb.me",
			type:"get",
			data:{
				cid:<%= request.getParameter("cid") %>,
				age:<%= request.getParameter("age") %>
			},
			success:function(data) {
				$(".obContent").each(function(index, value) {
					value.innerText = data.itemList[index].content;
				})
				$("h1").text(data.list[0].c.name + " 관찰척도");
				
				$("#selectAge").children().each(function(index, value) {
					if(value.value == <%= request.getParameter("age") %>) {
						$(this).prop("selected", true);
					}
				});
				
				$("#cname").text(data.list[0].c.name);
				
				if(Object.keys(data.list[0]).length == 3){
					var date = data.list[0].ob.eDate;
					date = date.split(" ");
					date = date[2] + "년 " + date[0] + " " + date[1].substring(0,2) + "일"
					$("#fdate").text(date);
					$("#obname").text(data.list[0].m.memberName);
					
					var score = data.list[0].ob.escore.split("/");
					var first = $(".first");
					for(var i = 0, k = 0; i < first.length; i+=3,k++){
						for(var j = 0; j < 3; j++) {
							if(score[k] == first[i+j].innerText){
								$(first[i+j]).addClass("ui olive circular label");
								break;
							}
							
						}
					}
					
					$("#total1").text(data.list[0].ob.eval);
					
					if(data.list.length == 2) {
						var date2 = data.list[1].ob.eDate;
						date2 = date2.split(" ");
						date2 = date2[2] + "년 " + date2[0] + " " + date2[1].substring(0,2) + "일"
						$("#sdate").text(date2);
						var score2 = data.list[1].ob.escore.split("/");
						var second = $(".second");
						for(var i = 0, k = 0; i < second.length; i+=3,k++){
							for(var j = 0; j < 3; j++) {
								if(score2[k] == second[i+j].innerText){
									$(second[i+j]).addClass("ui olive circular label");
									break;
								}
								
							}
						}
						
						$("#total2").text(data.list[1].ob.eval);
					}
				}
			},
			error:function() {
				console.log("에러")
			}
		});
		
		$("#selectAge").change(function() {
			var age = $(this).val();
			if(age != 'default')
				location.href="<%= request.getContextPath() %>/views/teacher/tcChildObserve.jsp?cid=<%= request.getParameter("cid") %>&age=" + age; 
		});
		
		 $(".li:nth-child(9)").addClass("on");
   	  
         $(".topMenuLi:nth-child(1)").addClass("on");
        
         $(".topMenuLi").mouseover(function() {
           $(".li:nth-child(9)").removeClass("on");
           $(".topMenuLi:nth-child(1)").removeClass("on");
        });
       
         $(".topMenuLi").mouseleave(function() {
           $(".li:nth-child(9)").addClass("on");
           $(".topMenuLi:nth-child(1)").addClass("on");
        });
         
         $("#print").click(function() {
       	  window.print();
         });
	});
</script>
</head>
<body>
    <%@ include file="/views/common/teacherMenu.jsp" %>
    <div style="margin: 0 15%;">
 		<h1 align="center" style="text-decoration: underline; text-underline-position: under;"></h1>
 		<select name="selectAge" id="selectAge" style="float:right;">
 			<option value="default">선택</option>
 			<option value="3">만 3 세</option>
 			<option value="4">만 4 세</option>
 			<option value="5">만 5 세</option>
 		</select>
 	</div>
 	
 	<div>
 		<table class="childOb">
 			<tr>
 				<td colspan="3" style="width:20%">유아이름</td>
 				<td colspan="3" style="width:30%"><span id="cname"></span></td>
 				<td colspan="2" style="width:20%">1차</td>
 				<td colspan="3" style="width:30%"><span id="fdate"></span></td>
 			</tr>
 			<tr>
 				<td colspan="3" style="width:20%">관찰자</td>
 				<td colspan="3" style="width:30%"><span id="obname"></span></td>
 				<td colspan="2" style="width:20%">2차</td>
 				<td colspan="3" style="width:30%"><span id="sdate"></span></td>
 			</tr>
 			<tr>
 				<td colspan="2" style="width:6%;"><span>영역</span></td>
 				<td colspan="5"><span style="word-spacing:5em">내 용</span></td>
 				<td colspan="2" style="width:20%;"><span style="text-decoration:underline; font-weight:bold; word-spacing:2.5em">3 2 1</span></td>
 				<td colspan="2" style="width:20%"><span style="text-decoration:underline; font-weight:bold; word-spacing:2.5em">3 2 1</span></td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">신체운동 건강영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">의사소통영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">사회관계영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">예술경험영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">자연탐구영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2"><div class="first">3</div> <div class="first">2</div> <div class="first">1</div></td>
 				<td colspan="2"><div class="second">3</div> <div class="second">2</div> <div class="second">1</div></td>
 			</tr>
 			<tr>
 				<td rowspan="2" style="width:3%; height:10em"><span style="writing-mode: tb-rl;">총평</span></td>
 				<td style="width:3%;"><span style="font-size:8px">1학기</span></td> 
 				<td colspan="9" style="height:4em;"><span id="total1" style="word-spacing: 0em;"></span></td>
 			</tr>
 			<tr>
 				<td style="width:3%; font-size:0.5em"><span>2학기</span></td>
 				<td colspan="9" style="height:4em;"><span id="total2" style="word-spacing: 0em;"></span>
 				
 				</td>
 			</tr>		
 		</table>
 	</div>
 	<div style="margin: 0 15%; height:50px;">
		<input type="button" value="뒤로가기" style="float:right; background:lightgray; color:black" onclick="location.href='tcChildDetail.jsp'" />
		<span style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<input type="button" value="수정하기" style="float:right" onclick="location.href='<%= request.getContextPath() %>/views/teacher/tcChildObserveMod.jsp?cid=<%= cid %>&age=<%= age %>'" />
		<span style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<input type="button" value="인쇄하기" id="print" style="float:right; background:lightgray; color:black" />
	</div>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>