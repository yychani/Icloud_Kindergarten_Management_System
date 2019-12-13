<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<title>Insert title here</title>
<style>
table {
	margin: 50px auto;
}

input[type=text] {
	background: none;
	border: none;
}

input[type=checkbox] {
	width: 15px;
	height: 15px;
	vertical-align: center;
}

button {
	width: 80px;
	height: 40px;
	border-radius: 10px;
	background: rgb(63, 63, 63);
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
}

th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	background: rgba(216, 216, 216, 0.486);
}

#no {
	width: 50px;
}

#name {
	width: 120px;
}

#class, #parents {
	width: 200px;
}

#children {
	margin-top: 20px;
	text-align: center;
}

.no, .name, .class, .parents {
	padding: 5px 0;
	border-bottom: 1px solid black;
}

input[type='submit'] {
	width: 80px;
	height: 40px;
	border-radius: 10px;
	background: rgb(63, 63, 63);
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
}

input[type='text'] {
	margin: 3px 0;
	text-align: center;
	background: none;
	border: 1px solid rgb(63, 63, 63);
	height: 40px;
	border-radius: 5px;
}

.menu {
	width: 1000px;
}

.menu td {
	width: 14%;
}

.menu tr:nth-of-type(2n+3) {
	height: 120px;
}

.menu tr:nth-of-type(2n+4) {
	height: 60px;
}
.label {
	width: 100px;
	text-align: left;
}
.edit {
	margin-left: .75em;
	background-color: #1b1c1d;
	color: #fff;
	text-shadow: none;
	background-image: none;
	cursor: pointer;
	display: inline-block;
	min-height: 1em;
	outline: 0;
	border: none;
	vertical-align: baseline;
	font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;
	margin: 0 .25em 0 0;
	padding: .78571em 1.5em;
	text-transform: none;
	text-shadow: none;
	font-weight: 700;
	line-height: 1;
	font-style: normal;
	text-align: center;
	text-decoration: none;
	background-image: none;
	border-radius: .2857rem;
}
</style>
<script>
	$(function() {
		$(".li7").addClass("on");
		$(".topMenuLi:nth-child(2)").addClass("on");

		$(".topMenuLi").mouseover(function() {
			$(".li7").removeClass("on");
			$(".topMenuLi:nth-child(2)").removeClass("on");
		});
		$(".topMenuLi").mouseleave(function() {
			$(".li7").addClass("on");
			$(".topMenuLi:nth-child(2)").addClass("on");
		});
	});
	$(function() {
		$(document).on("click", "#exist", function() {
			$(".header").text("");
			$(".header").append($(this).children("#date").val() + " ");
			$(".header").append($(this).children("#type").val());
			
			var date = $(this).children("#date").val();
			var dietNo = $(this).children("#dietNo").val();
			var type = $(this).children("#type").val();
			
			$.ajax({
            	url:"/main/selectOneDiet.diet",
            	data:{
            		date:date,
            		dietNo:dietNo,
            		type:type
            	},
            	type:"post",
                success:function(data){
                	if(data.type == 1){
                		$("#mealArea").show();
                		$("#snackArea").hide();
                		
                		$("#dietNoDetail").val(data.dietNo);
                		$("#rice").val(data.rice);
                		$("#soup").val(data.soup);
                		$("#side1").val(data.side1);
                		$("#side2").val(data.side2);
                		$("#side3").val(data.side3);
                		$("#typeName").val(data.typeName);
                		$("#dateOne").val(data.date);
                		$("#snack1").val("");
                		$("#snack2").val("");
                	}else if(data.type == 2){
                		$("#mealArea").hide();
                		$("#snackArea").show();
                		
                		$("#dietNoDetail").val(data.dietNo);
                		$("#rice").val("");
                		$("#soup").val("");
                		$("#side1").val("");
                		$("#side2").val("");
                		$("#side3").val("");
                		$("#typeName").val(data.typeName);
                		$("#dateOne").val(data.date);
                		$("#snack1").val(data.snack1);
                		$("#snack2").val(data.snack2);
                	}
                }
            })
			
			$('.ui.modal')
			  .modal('show')
			;
		});
	});
</script>

</head>
<body>
	<%@ include file="/views/common/presidentMenu.jsp"%>
	<div style="margin: 0 15%;">
		<h1
			style="text-decoration: underline; text-underline-position: under;">식단표</h1>
	</div>
	<%@ include file="/views/common/dietTable.jsp"%>
	<div class="ui modal">
		<i class="close icon"></i>
		<div class="header"></div>
		<div class="image content">
			<div class="description">
			<input type="hidden" name="dietNoDetail" id="dietNoDetail" value="">
			<input type="hidden" name="typeName" id="typeName" value="">
			<input type="hidden" name="dateOne" id="dateOne" value="">
				<div id="mealArea">
					<table>
						<tr>
							<td id="null" class="label"><label>밥 : </label></td>
							<td id="null"><input type="text" id="rice" name="rice" disabled></td>
						</tr>
						<tr>
							<td id="null" class="label"><label>국 : </label></td>
							<td id="null"><input type="text" id="soup" name="soup" disabled></td>
						</tr>
						<tr>
							<td id="null" class="label"><label>반찬1 : </label></td>
							<td id="null"><input type="text" id="side1" name="side1" disabled></td>
						</tr>
						<tr>
							<td id="null" class="label"><label>반찬2 : </label></td>
							<td id="null"><input type="text" id="side2" name="side2" disabled></td>
						</tr>
						<tr>
							<td id="null" class="label"><label>반찬3 : </label></td>
							<td id="null"><input type="text" id="side3" name="side3" disabled></td>
						</tr>
					</table>
				</div>
				<div id="snackArea">
					<table>
						<tr>
							<td id="null" class="label"><label>간식1 : </label></td>
							<td id="null"><input type="text" id="snack1" name="snack1" disabled></td>
						</tr>
						<tr>
							<td id="null" class="label"><label>간식2 : </label></td>
							<td id="null"><input type="text" id="snack2" name="snack2" disabled></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="actions">
			<div class="edit" id="edit">수정하기</div> <div class="edit" id="editCom" style="display:none;">수정완료</div>
			<div class="ui positive right labeled icon button">
				확인 완료<i class="checkmark icon"></i>
			</div>
		</div>
	</div>
	<script>
		$("#edit").click(function(){
			$("#editCom").css("display", "inline-block");
			$(this).css("display", "none");
			$("#rice").prop("disabled", false);
			$("#soup").prop("disabled", false);
			$("#side1").prop("disabled", false);
			$("#side2").prop("disabled", false);
			$("#side3").prop("disabled", false);
			$("#snack1").prop("disabled", false);
			$("#snack2").prop("disabled", false);
			$(".ui positive right labeled icon button").text("수정취소");
		});
		$("#editCom").click(function(){
			$("#edit").css("display", "inline-block");
			$(this).css("display", "none");
			$("#rice").prop("disabled", true);
			$("#soup").prop("disabled", true);
			$("#side1").prop("disabled", true);
			$("#side2").prop("disabled", true);
			$("#side3").prop("disabled", true);
			$("#snack1").prop("disabled", true);
			$("#snack2").prop("disabled", true);
			$(".ui positive right labeled icon button").text("확인 완료");
			
			var rice = $("#rice").val();
			var soup = $("#soup").val();
			var side1 = $("#side1").val();
			var side2 = $("#side2").val();
			var side3 = $("#side3").val();
			var snack1 = $("#snack1").val();
			var snack2 = $("#snack2").val();
			var dietNoDetail = $("#dietNoDetail").val();
			var typeName = $("#typeName").val();
			var dateOne = $("#dateOne").val();
			
			var month = Number($("#month").val());
			var weekOfMonth = Number($("#weekOfMonth").val());
			var year = Number($("#year").val());
			var date = Number($("#date").val());
			
			$.ajax({
				url:"/main/updateOneDiet.diet",
            	data:{
            		rice:rice,
            		soup:soup,
            		side1:side1,
            		side2:side2,
            		side3:side3,
            		snack1:snack1,
            		snack2:snack2,
            		dietNoDetail:dietNoDetail,
            		typeName:typeName,
            		dateOne:dateOne,
            		year:year,
            		month:month,
            		date:date,
            		weekOfMonth:weekOfMonth
            	},
            	type:"post",
                success:function(data){
                	location.replace("<%=request.getContextPath() %>/selectAllDietTable.diet?year=" + year + "&month=" + month + "&date=" + date+ "&weekOfMonth=" + weekOfMonth); 
                }
			});
		});
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>