<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="<%= request.getContextPath() %>/js/rolldate.min.js"></script>
<style>
	.childOb td {
		border:1px solid black;
		padding:2px;
	}
	.childOb {
		border:2px solid black;
		width:70%;
	}
	.childOb tr:nth-of-type(n+4) td:nth-of-type(n+2) {
		word-spacing:2.5em;
		font-weight:bold;
	}
	input[type='submit'] {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
	#ftotal, #stotal {
		text-align:center;
	}
	.obContent {
		word-spacing: 0 !important;
	}
	.checks {
		display:inline-block;
	}
	.checks {
		position: relative;
	} 
	.checks input[type="radio"] { 
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
	} 
	.checks input[type="radio"] + label { 
		display: inline-block; 
		position: relative; 
		padding-left: 30px; 
		cursor: pointer; 
		-webkit-user-select: none; 
		-moz-user-select: none; 
		-ms-user-select: none; 
	} 
	.checks input[type="radio"] + label:before { 
		content: ''; 
		position: absolute; 
		left: 0; 
		top: 0px; 
		width: 21px; 
		height: 21px; 
		text-align: center; 
		background: #fafafa; 
		border: 1px solid #cacece; 
		border-radius: 100%; 
		box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); 
	} 
	.checks input[type="radio"] + label:active:before, .checks input[type="radio"]:checked + label:active:before { 
		box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); 
	} 
	.checks input[type="radio"]:checked + label:before { 
		background: #E9ECEE; border-color: #adb8c0; 
	} 
	.checks input[type="radio"]:checked + label:after { 
		content: ''; 
		position: absolute; 
		top: 4px; 
		left: 4px; 
		width: 13px; 
		height: 13px; 
		background: #99a1a7; 
		border-radius: 100%; 
		box-shadow: inset 0px 0px 10px rgba(0,0,0,0.3); 
	}


</style>
<script>
 	var now = new Date();
 	var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
            
    var chan_val = year + '-' + mon + '-' + day;

    $(function() {
		new Rolldate({
			el: '#sdate',
			format: 'YYYY-MM-DD',
			beginYear : 2019,
			endYear : 2019,
			lang: {
				title: '날짜를 선택하세요',
				cancel : '취소',
				confirm : '완료',
				year : '년',
				month : '월',
				day : '일'
			}
		});
		
		new Rolldate({
			el: '#fdate',
			format: 'YYYY-MM-DD',
			beginYear : 2019,
			endYear : 2019,
			lang: {
				title: '날짜를 선택하세요',
				cancel : '취소',
				confirm : '완료',
				year : '년',
				month : '월',
				day : '일'
			}
		});
		
		$("#selectAge").children().each(function(index, value) {
			if(value.value == <%= request.getParameter("age") %>) {
				$(this).prop("selected", true);
			}
		});
		
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
				
				$("#cname").text(data.list[0].c.name);
				
				if(Object.keys(data.list[0]).length == 3){
					var date = data.list[0].ob.eDate;
					date = date.split(" ");
					date = date[2] + "년 " + date[0] + " " + date[1].substring(0,2) + "일"
					$("#fdate").val(date);
					$("#obname").text(data.list[0].m.memberName);
					
					var score = data.list[0].ob.escore.split("/");
					var first = $(".childOb tbody tr:nth-of-type(n+4) td").find('input');
					console.log(first)
					for(var i = 0, k = 0; i < first.length - 2; i+=6, k++) {
						for(var j = 0; j < 5; j+=2) {
							if(first[i+j].value == score[k]) {
								console.log(i+j)
								first[i+j].checked = true;
							}
						}
					}
					
					$("#ftotal").val(data.list[0].ob.eval);
					
					if(data.list.length == 2) {
						var date2 = data.list[1].ob.eDate;
						date2 = date2.split(" ");
						date2 = date2[2] + "년 " + date2[0] + " " + date2[1].substring(0,2) + "일"
						$("#sdate").val(date2);

						var score2 = data.list[1].ob.escore.split("/");
						var first = $(".childOb tbody tr:nth-of-type(n+4) td").find('input').parent();
						for(var i = 1, k = 0; i < first.length - 2; i+=2, k++) {
							for(var j = 0; j < 5; j+=2) {
								if(first[i].children[j].value == score2[k]) {
									first[i].children[j].checked = true;
								}
							}
						}
						
						
						$("#stotal").val(data.list[1].ob.eval);
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
				location.href="<%= request.getContextPath() %>/views/teacher/tcChildObserveMod.jsp?cid=<%= request.getParameter("cid") %>&age=" + age; 
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
    });
</script>
</head>
<body>
    <%@ include file="/views/common/teacherMenu.jsp" %>
 	<form action="<%= request.getContextPath() %>/insertChildOb.me" method="post">
    <div style="margin: 0 15%;">
 		<h1 align="center" style="text-decoration: underline; text-underline-position: under;"></h1>
 		<select name="selectAge" id="selectAge" style="float:right;">
 			<option value="default">선택</option>
 			<option value="3">만 3 세</option>
 			<option value="4">만 4 세</option>
 			<option value="5">만 5 세</option>
 		</select>
 	</div>
 	<input type="hidden" name="cid" value="<%= cid %>" />
 	<div>
 		<table class="childOb">
 			<tr>
 				<td colspan="3" style="width:20%">유아이름</td>
 				<td colspan="3" style="width:30%"><span id="cname"></span></td>
 				<td colspan="2" style="width:20%">1차</td>
 				<td colspan="3" style="width:30%"><input type="text" id="fdate" name="fdate" class="date" /></td>
 			</tr>
 			<tr>
 				<td colspan="3" style="width:20%">관찰자</td>
 				<td colspan="3" style="width:30%"><span id="obname"></span></td>
 				<td colspan="2" style="width:20%">2차</td>
 				<td colspan="3" style="width:30%"><input type="text" id="sdate" name="sdate" class="date" /></td>
 			</tr>
 			<tr>
 				<td colspan="2" style="width:8%;"><span>영역</span></td>
 				<td colspan="5"><span style="word-spacing:5em">내 용</span></td>
 				<td colspan="2" style="width:20%;"><span style="text-decoration:underline; font-weight:bold; word-spacing:2.5em">3 2 1</span></td>
 				<td colspan="2" style="width:20%"><span style="text-decoration:underline; font-weight:bold; word-spacing:2.5em">3 2 1</span></td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">신체운동·건강영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f1" id="f1-1-3" value="3" /><label for="f1-1-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f1" id="f1-1-2" value="2" /><label for="f1-1-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f1" id="f1-1-1" value="1" /><label for="f1-1-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s1" id="s1-1-3" value="3" /><label for="s1-1-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s1" id="s1-1-2" value="2" /><label for="s1-1-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s1" id="s1-1-1" value="1" /><label for="s1-1-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f2" id="f2-2-3" value="3" /><label for="f2-2-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f2" id="f2-2-2" value="2" /><label for="f2-2-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f2" id="f2-2-1" value="1" /><label for="f2-2-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s2" id="s2-2-3" value="3" /><label for="s2-2-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s2" id="s2-2-2" value="2" /><label for="s2-2-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s2" id="s2-2-1" value="1" /><label for="s2-2-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f3" id="f3-3-3" value="3" /><label for="f3-3-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f3" id="f3-3-2" value="2" /><label for="f3-3-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f3" id="f3-3-1" value="1" /><label for="f3-3-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s3" id="s3-3-3" value="3" /><label for="s3-3-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s3" id="s3-3-2" value="2" /><label for="s3-3-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s3" id="s3-3-1" value="1" /><label for="s3-3-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f4" id="f4-4-3" value="3" /><label for="f4-4-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f4" id="f4-4-2" value="2" /><label for="f4-4-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f4" id="f4-4-1" value="1" /><label for="f4-4-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s4" id="s4-4-3" value="3" /><label for="s4-4-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s4" id="s4-4-2" value="2" /><label for="s4-4-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s4" id="s4-4-1" value="1" /><label for="s4-4-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f5" id="f5-5-3" value="3" /><label for="f5-5-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f5" id="f5-5-2" value="2" /><label for="f5-5-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f5" id="f5-5-1" value="1" /><label for="f5-5-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s5" id="s5-5-3" value="3" /><label for="s5-5-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s5" id="s5-5-2" value="2" /><label for="s5-5-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s5" id="s5-5-1" value="1" /><label for="s5-5-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">의사소통영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f6" id="f6-6-3" value="3" /><label for="f6-6-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f6" id="f6-6-2" value="2" /><label for="f6-6-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f6" id="f6-6-1" value="1" /><label for="f6-6-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s6" id="s6-6-3" value="3" /><label for="s6-6-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s6" id="s6-6-2" value="2" /><label for="s6-6-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s6" id="s6-6-1" value="1" /><label for="s6-6-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f7" id="f7-7-3" value="3" /><label for="f7-7-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f7" id="f7-7-2" value="2" /><label for="f7-7-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f7" id="f7-7-1" value="1" /><label for="f7-7-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s7" id="s7-7-3" value="3" /><label for="s7-7-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s7" id="s7-7-2" value="2" /><label for="s7-7-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s7" id="s7-7-1" value="1" /><label for="s7-7-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f8" id="f8-8-3" value="3" /><label for="f8-8-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f8" id="f8-8-2" value="2" /><label for="f8-8-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f8" id="f8-8-1" value="1" /><label for="f8-8-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s8" id="s8-8-3" value="3" /><label for="s8-8-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s8" id="s8-8-2" value="2" /><label for="s8-8-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s8" id="s8-8-1" value="1" /><label for="s8-8-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f9" id="f9-9-3" value="3" /><label for="f9-9-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f9" id="f9-9-2" value="2" /><label for="f9-9-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f9" id="f9-9-1" value="1" /><label for="f9-9-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s9" id="s9-9-3" value="3" /><label for="s9-9-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s9" id="s9-9-2" value="2" /><label for="s9-9-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s9" id="s9-9-1" value="1" /><label for="s9-9-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f10" id="f10-10-3" value="3" /><label for="f10-10-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f10" id="f10-10-2" value="2" /><label for="f10-10-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f10" id="f10-10-1" value="1" /><label for="f10-10-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s10" id="s10-10-3" value="3" /><label for="s10-10-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s10" id="s10-10-2" value="2" /><label for="s10-10-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s10" id="s10-10-1" value="1" /><label for="s10-10-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">사회관계영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f11" id="f11-11-3" value="3" /><label for="f11-11-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f11" id="f11-11-2" value="2" /><label for="f11-11-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f11" id="f11-11-1" value="1" /><label for="f11-11-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s11" id="s11-11-3" value="3" /><label for="s11-11-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s11" id="s11-11-2" value="2" /><label for="s11-11-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s11" id="s11-11-1" value="1" /><label for="s11-11-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f12" id="f12-12-3" value="3" /><label for="f12-12-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f12" id="f12-12-2" value="2" /><label for="f12-12-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f12" id="f12-12-1" value="1" /><label for="f12-12-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s12" id="s12-12-3" value="3" /><label for="s12-12-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s12" id="s12-12-2" value="2" /><label for="s12-12-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s12" id="s12-12-1" value="1" /><label for="s12-12-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f13" id="f13-13-3" value="3" /><label for="f13-13-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f13" id="f13-13-2" value="2" /><label for="f13-13-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f13" id="f13-13-1" value="1" /><label for="f13-13-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s13" id="s13-13-3" value="3" /><label for="s13-13-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s13" id="s13-13-2" value="2" /><label for="s13-13-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s13" id="s13-13-1" value="1" /><label for="s13-13-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f14" id="f14-14-3" value="3" /><label for="f14-14-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f14" id="f14-14-2" value="2" /><label for="f14-14-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f14" id="f14-14-1" value="1" /><label for="f14-14-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s14" id="s14-14-3" value="3" /><label for="s14-14-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s14" id="s14-14-2" value="2" /><label for="s14-14-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s14" id="s14-14-1" value="1" /><label for="s14-14-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f15" id="f15-15-3" value="3" /><label for="f15-15-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f15" id="f15-15-2" value="2" /><label for="f15-15-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f15" id="f15-15-1" value="1" /><label for="f15-15-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s15" id="s15-15-3" value="3" /><label for="s15-15-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s15" id="s15-15-2" value="2" /><label for="s15-15-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s15" id="s15-15-1" value="1" /><label for="s15-15-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">예술경험영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f16" id="f16-16-3" value="3" /><label for="f16-16-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f16" id="f16-16-2" value="2" /><label for="f16-16-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f16" id="f16-16-1" value="1" /><label for="f16-16-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s16" id="s16-16-3" value="3" /><label for="s16-16-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s16" id="s16-16-2" value="2" /><label for="s16-16-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s16" id="s16-16-1" value="1" /><label for="s16-16-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f17" id="f17-17-3" value="3" /><label for="f17-17-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f17" id="f17-17-2" value="2" /><label for="f17-17-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f17" id="f17-17-1" value="1" /><label for="f17-17-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s17" id="s17-17-3" value="3" /><label for="s17-17-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s17" id="s17-17-2" value="2" /><label for="s17-17-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s17" id="s17-17-1" value="1" /><label for="s17-17-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f18" id="f18-18-3" value="3" /><label for="f18-18-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f18" id="f18-18-2" value="2" /><label for="f18-18-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f18" id="f18-18-1" value="1" /><label for="f18-18-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s18" id="s18-18-3" value="3" /><label for="s18-18-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s18" id="s18-18-2" value="2" /><label for="s18-18-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s18" id="s18-18-1" value="1" /><label for="s18-18-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f19" id="f19-19-3" value="3" /><label for="f19-19-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f19" id="f19-19-2" value="2" /><label for="f19-19-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f19" id="f19-19-1" value="1" /><label for="f19-19-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s19" id="s19-19-3" value="3" /><label for="s19-19-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s19" id="s19-19-2" value="2" /><label for="s19-19-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s19" id="s19-19-1" value="1" /><label for="s19-19-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f20" id="f20-20-3" value="3" /><label for="f20-20-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f20" id="f20-20-2" value="2" /><label for="f20-20-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f20" id="f20-20-1" value="1" /><label for="f20-20-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s20" id="s20-20-3" value="3" /><label for="s20-20-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s20" id="s20-20-2" value="2" /><label for="s20-20-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s20" id="s20-20-1" value="1" /><label for="s20-20-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">자연탐구영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f21" id="f21-21-3" value="3" /><label for="f21-21-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f21" id="f21-21-2" value="2" /><label for="f21-21-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f21" id="f21-21-1" value="1" /><label for="f21-21-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s21" id="s21-21-3" value="3" /><label for="s21-21-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s21" id="s21-21-2" value="2" /><label for="s21-21-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s21" id="s21-21-1" value="1" /><label for="s21-21-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f22" id="f22-22-3" value="3" /><label for="f22-22-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f22" id="f22-22-2" value="2" /><label for="f22-22-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f22" id="f22-22-1" value="1" /><label for="f22-22-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s22" id="s22-22-3" value="3" /><label for="s22-22-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s22" id="s22-22-2" value="2" /><label for="s22-22-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s22" id="s22-22-1" value="1" /><label for="s22-22-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f23" id="f23-23-3" value="3" /><label for="f23-23-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f23" id="f23-23-2" value="2" /><label for="f23-23-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f23" id="f23-23-1" value="1" /><label for="f23-23-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s23" id="s23-23-3" value="3" /><label for="s23-23-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s23" id="s23-23-2" value="2" /><label for="s23-23-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s23" id="s23-23-1" value="1" /><label for="s23-23-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f24" id="f24-24-3" value="3" /><label for="f24-24-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f24" id="f24-24-2" value="2" /><label for="f24-24-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f24" id="f24-24-1" value="1" /><label for="f24-24-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s24" id="s24-24-3" value="3" /><label for="s24-24-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s24" id="s24-24-2" value="2" /><label for="s24-24-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s24" id="s24-24-1" value="1" /><label for="s24-24-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">&nbsp;</td>
 				<td colspan="2">
 				<div class="checks">
 					<input type="radio" name="f25" id="f25-25-3" value="3" /><label for="f25-25-3">3</label>
 				</div>
 				<div class="checks">
 					<input type="radio" name="f25" id="f25-25-2" value="2" /><label for="f25-25-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="f25" id="f25-25-1" value="1" /><label for="f25-25-1">1</label>
				</div>
 				</td>
 				<td colspan="2">
 				<div class="checks">
					<input type="radio" name="s25" id="s25-25-3" value="3" /><label for="s25-25-3">3</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s25" id="s25-25-2" value="2" /><label for="s25-25-2">2</label>
				</div>
				<div class="checks">
 					<input type="radio" name="s25" id="s25-25-1" value="1" /><label for="s25-25-1">1</label>
				</div>
				</td>
 			</tr>
 			<tr>
 				<td rowspan="2" style="width:3%; height:10em"><span style="writing-mode: tb-rl;">총평</span></td>
 				<td style="width:3%;"><span style="font-size:10px">1학기</span></td>
 				<td colspan="9" style="height:4em;"><input type="text" name="ftotal" id="ftotal" style="width:100%; height:100%" /></td>
 			</tr>
 			<tr>
 				<td style="width:3%; font-size:0.5em"><span>2학기</span></td>
 				<td colspan="9" style="height:4em;"><input type="text" name="stotal" id="stotal" style="width:100%; height:100%" /></td>
 			</tr>		
 		</table>
 	</div>
 	<div style="margin: 0 15%; height:50px;">
		<input type="submit" value="수정하기" style="float:right" />
	</div>
	</form>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>