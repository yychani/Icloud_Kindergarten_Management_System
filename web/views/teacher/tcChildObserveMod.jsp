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
					var first = $(".childOb tbody tr:nth-of-type(n+4) td").find('input').parent();
					for(var i = 0, k = 0; i < first.length - 2; i+=2, k++) {
						for(var j = 0; j < 5; j+=2) {
							if(first[i].children[j].value == score[k]) {
								first[i].children[j].checked = true;
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
 				<td colspan="5" style="font-weight:normal" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f1" value="3" /><label>3</label>
 					<input type="radio" name="f1" value="2" /><label>2</label>
 					<input type="radio" name="f1" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s1" value="3" /><label>3</label>
 					<input type="radio" name="s1" value="2" /><label>2</label>
 					<input type="radio" name="s1" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f2" value="3" /><label>3</label>
 					<input type="radio" name="f2" value="2" /><label>2</label>
 					<input type="radio" name="f2" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s2" value="3" /><label>3</label>
 					<input type="radio" name="s2" value="2" /><label>2</label>
 					<input type="radio" name="s2" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f3" value="3" /><label>3</label>
 					<input type="radio" name="f3" value="2" /><label>2</label>
 					<input type="radio" name="f3" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s3" value="3" /><label>3</label>
 					<input type="radio" name="s3" value="2" /><label>2</label>
 					<input type="radio" name="s3" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f4" value="3" /><label>3</label>
 					<input type="radio" name="f4" value="2" /><label>2</label>
 					<input type="radio" name="f4" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s4" value="3" /><label>3</label>
 					<input type="radio" name="s4" value="2" /><label>2</label>
 					<input type="radio" name="s4" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f5" value="3" /><label>3</label>
 					<input type="radio" name="f5" value="2" /><label>2</label>
 					<input type="radio" name="f5" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s5" value="3" /><label>3</label>
 					<input type="radio" name="s5" value="2" /><label>2</label>
 					<input type="radio" name="s5" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">의사소통영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f6" value="3" /><label>3</label>
 					<input type="radio" name="f6" value="2" /><label>2</label>
 					<input type="radio" name="f6" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s6" value="3" /><label>3</label>
 					<input type="radio" name="s6" value="2" /><label>2</label>
 					<input type="radio" name="s6" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f7" value="3" /><label>3</label>
 					<input type="radio" name="f7" value="2" /><label>2</label>
 					<input type="radio" name="f7" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s7" value="3" /><label>3</label>
 					<input type="radio" name="s7" value="2" /><label>2</label>
 					<input type="radio" name="s7" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f8" value="3" /><label>3</label>
 					<input type="radio" name="f8" value="2" /><label>2</label>
 					<input type="radio" name="f8" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s8" value="3" /><label>3</label>
 					<input type="radio" name="s8" value="2" /><label>2</label>
 					<input type="radio" name="s8" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f9" value="3" /><label>3</label>
 					<input type="radio" name="f9" value="2" /><label>2</label>
 					<input type="radio" name="f9" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s9" value="3" /><label>3</label>
 					<input type="radio" name="s9" value="2" /><label>2</label>
 					<input type="radio" name="s9" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f10" value="3" /><label>3</label>
 					<input type="radio" name="f10" value="2" /><label>2</label>
 					<input type="radio" name="f10" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s10" value="3" /><label>3</label>
 					<input type="radio" name="s10" value="2" /><label>2</label>
 					<input type="radio" name="s10" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">사회관계영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f11" value="3" /><label>3</label>
 					<input type="radio" name="f11" value="2" /><label>2</label>
 					<input type="radio" name="f11" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s11" value="3" /><label>3</label>
 					<input type="radio" name="s11" value="2" /><label>2</label>
 					<input type="radio" name="s11" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f12" value="3" /><label>3</label>
 					<input type="radio" name="f12" value="2" /><label>2</label>
 					<input type="radio" name="f12" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s12" value="3" /><label>3</label>
 					<input type="radio" name="s12" value="2" /><label>2</label>
 					<input type="radio" name="s12" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f13" value="3" /><label>3</label>
 					<input type="radio" name="f13" value="2" /><label>2</label>
 					<input type="radio" name="f13" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s13" value="3" /><label>3</label>
 					<input type="radio" name="s13" value="2" /><label>2</label>
 					<input type="radio" name="s13" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f14" value="3" /><label>3</label>
 					<input type="radio" name="f14" value="2" /><label>2</label>
 					<input type="radio" name="f14" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s14" value="3" /><label>3</label>
 					<input type="radio" name="s14" value="2" /><label>2</label>
 					<input type="radio" name="s14" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f15" value="3" /><label>3</label>
 					<input type="radio" name="f15" value="2" /><label>2</label>
 					<input type="radio" name="f15" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s15" value="3" /><label>3</label>
 					<input type="radio" name="s15" value="2" /><label>2</label>
 					<input type="radio" name="s15" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">예술경험영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f16" value="3" /><label>3</label>
 					<input type="radio" name="f16" value="2" /><label>2</label>
 					<input type="radio" name="f16" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s16" value="3" /><label>3</label>
 					<input type="radio" name="s16" value="2" /><label>2</label>
 					<input type="radio" name="s16" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f17" value="3" /><label>3</label>
 					<input type="radio" name="f17" value="2" /><label>2</label>
 					<input type="radio" name="f17" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s17" value="3" /><label>3</label>
 					<input type="radio" name="s17" value="2" /><label>2</label>
 					<input type="radio" name="s17" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f18" value="3" /><label>3</label>
 					<input type="radio" name="f18" value="2" /><label>2</label>
 					<input type="radio" name="f18" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s18" value="3" /><label>3</label>
 					<input type="radio" name="s18" value="2" /><label>2</label>
 					<input type="radio" name="s18" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f19" value="3" /><label>3</label>
 					<input type="radio" name="f19" value="2" /><label>2</label>
 					<input type="radio" name="f19" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s19" value="3" /><label>3</label>
 					<input type="radio" name="s19" value="2" /><label>2</label>
 					<input type="radio" name="s19" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f20" value="3" /><label>3</label>
 					<input type="radio" name="f20" value="2" /><label>2</label>
 					<input type="radio" name="f20" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s20" value="3" /><label>3</label>
 					<input type="radio" name="s20" value="2" /><label>2</label>
 					<input type="radio" name="s20" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="2" rowspan="5" style="height:10em"><span style="writing-mode: tb-rl;">자연탐구영역</span></td>
 				<td colspan="5" style="font-weight:normal" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f21" value="3" /><label>3</label>
 					<input type="radio" name="f21" value="2" /><label>2</label>
 					<input type="radio" name="f21" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s21" value="3" /><label>3</label>
 					<input type="radio" name="s21" value="2" /><label>2</label>
 					<input type="radio" name="s21" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f22" value="3" /><label>3</label>
 					<input type="radio" name="f22" value="2" /><label>2</label>
 					<input type="radio" name="f22" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s22" value="3" /><label>3</label>
 					<input type="radio" name="s22" value="2" /><label>2</label>
 					<input type="radio" name="s22" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f23" value="3" /><label>3</label>
 					<input type="radio" name="f23" value="2" /><label>2</label>
 					<input type="radio" name="f23" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s23" value="3" /><label>3</label>
 					<input type="radio" name="s23" value="2" /><label>2</label>
 					<input type="radio" name="s23" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f24" value="3" /><label>3</label>
 					<input type="radio" name="f24" value="2" /><label>2</label>
 					<input type="radio" name="f24" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s24" value="3" /><label>3</label>
 					<input type="radio" name="s24" value="2" /><label>2</label>
 					<input type="radio" name="s24" value="1" /><label>1</label>
				</td>
 			</tr>
 			<tr>
 				<td colspan="5" class="obContent">TEST</td>
 				<td colspan="2">
 					<input type="radio" name="f25" value="3" /><label>3</label>
 					<input type="radio" name="f25" value="2" /><label>2</label>
 					<input type="radio" name="f25" value="1" /><label>1</label>
 				</td>
 				<td colspan="2">
					<input type="radio" name="s25" value="3" /><label>3</label>
 					<input type="radio" name="s25" value="2" /><label>2</label>
 					<input type="radio" name="s25" value="1" /><label>1</label>
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