<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style>
input[type=text] {
	border-radius: 10px;
	width: 100%;
	height: 30px;
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

textarea {
	border-radius: 10px;
}

h2 {
	padding-left: 30px;
}

#cNameSelect, #toSomeone {
	width: 161px;
	height: 34px;
	border-radius: 4px;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body style="overflow-x: hidden">
	<%@include file="/views/common/parentsMenu.jsp"%>

	<div style="margin: 50px 25%; margin-bottom: 20px;">
		<h2>건의 문의 작성</h2>

		<form action="<%=request.getContextPath()%>/pQnAwrite.me" method="post" onsubmit="return inputValue();">
		<div align="left">
		<input type="hidden" id="cId" name="cId"> <input
					type="hidden" id="tNo" name="tNo">
			<table>
				<tr>
				
					<td><h4 style="text-underline-position: under; width: 100%;">원아
							선택</h4></td>
					<td><select class="ui dropdown" id="cNameSelect" name="cName"></select></td>
					<td><h4 style="text-underline-position: under; width: 100%;">문의
							대상</h4></td>
					<td><select class="ui dropdown" id="toSomeone" name="toSomeone" style="width: 125px;"><option></option></select></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td><h3 style="text-underline-position: under; width: 100%;">제목</h3></td>
					<td colspan="5"><div class="ui fluid icon input">
					<input type="text" name="title" placeholder="제목을 입력하세요"></div>
					</td>
				</tr>
				<tr>
					<td><h3 style="text-underline-position: under;">내용</h3></td>
					<td colspan="5"><textarea style="resize: none; width: 100%; height: 250px;"
							rows="5" id="content" name="content" placeholder="내용을 입력하세요"></textarea></td>
				</tr>
			</table>
		</div>
			<br>
<!-- 			<div id="test">
				<h3 style="text-underline-position: under; width: 100%;">제목</h3>
				<div class="ui fluid icon input">
					<input type="text" name="title" placeholder="제목을 입력하세요">
				</div>

				<br /> <input type="hidden" id="cId" name="cId"> <input
					type="hidden" id="tNo" name="tNo"> <br />

				<div class="ui form">
					<div class="field">
						<h3 style="text-underline-position: under;">내용</h3>
						<textarea style="resize: none; width: 100%; height: 250px;"
							rows="25" id="content" name="content" placeholder="내용을 입력하세요"></textarea>
					</div>
				</div>
				<br>
				
			</div> -->
			<div id="divSubmitBtn" align="right">
			  <button class="ui inverted green button">완료</button>
					<!-- <button class="ui pink  basic button" type="submit" id="submit">완료</button> -->
				</div>
		</form>
	</div>
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
			}
			$("#cNameSelect").trigger("change");

		},
		error:function(data){
			console.log("failㅠㅠ");
		}
	});
});
$(function(){
	$(document).on("change", "#cNameSelect", function(){
		var $select2 = $("#toSomeone");
		$select2.find("option").remove();
		var cId = $("#cNameSelect").val();
		var $optiont = $("<option>");
		
		$optiont.val(1);
		$optiont.text("원장 선생님");
		$select2.append($optiont);
		
		$.ajax({
			url:"<%=request.getContextPath()%>/selectTname.me",
			data:{cId},
			type:"get",
			success:function(data){
				console.log(data);

					var $option = $("<option>");
					$option.val(data.memberNo);
					$option.text(data.memberName + "선생님");
					$select2.append($option);

				
			},
			error:function(data){
				console.log("담임선생님 이름 불러오기 실패")
			}
		});
	});
});

function inputValue(){
	var cId = $("#cNameSelect").val();
	var tNo = $("#toSomeone").val();
	
	$("#cId").val(cId);
	$("#tNo").val(tNo);
}
</script>

	<script>
      $(function() {
    	  $(".li:nth-child(3)").addClass("on");
    	  
          $(".topMenuLi:nth-child(6)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(3)").removeClass("on");
            $(".topMenuLi:nth-child(6)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(3)").addClass("on");
            $(".topMenuLi:nth-child(6)").addClass("on");
         });
      }); 
</script>
	<%@ include file="/views/common/chat.jsp"%>
	<%@include file="/views/common/footer.jsp"%>
</body>
</html>