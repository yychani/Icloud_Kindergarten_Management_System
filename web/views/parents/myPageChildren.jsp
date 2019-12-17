<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이 정보</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
	
	
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<style>
.ui.raised.card{
	margin: auto auto;
	width: 1000px;
	font-family: 'Nanum Gothic Coding', monospace;
	font-weight:bold;
	color:black;
}
tr{
	height:50px;
}
#plusBtn{
	height:20px;
}
#cNameSelect{
	width:161px;
	height:34px;
	border-radius:4px;
}
</style>

</head>


<body  style="overflow-x: hidden">
<%@ include file="/views/common/parentsMenu.jsp"%>


<h1 align="center">아이정보</h1>
	<br>
	<div align="center">
	<select class="ui dropdown" id="cNameSelect" name="cName"></select>
	</div>
	<br>
<div class="ui raised card" id="cDiv1">

  <div class="content">
    <div class="header" align="center"> <img class="ui avatar image" src="<%= request.getContextPath() %>/uploadFiles/5racle_2019121016462761291.jpg"><label id="cName"> </label></div>
    <div class="meta" align="center">
      <span class="category" id="birth"></span>
    </div>
    <div class="description">
      <table>
      	<tr>
      		<td>성별 : </td>
      		<td colspan="3" style="text-align: left;">
	      		<div class="ui radio checkbox">
		      		<div style="display:inline-block;">
		      			 <input type="radio" name="gender" value="f" checked="checked"><label>여</label>
		      		</div>
		      		<div style="display:inline-block;">
		      			<input type="radio" name="gender" value="m"><label>남</label>
		      		</div>
	  			 </div>
			</td>
      	</tr>
      	<tr>
      		<td>혈액형 : </td>
      		<td><div class="ui input"><input type="text" id="bloodType" value=""></div></td>
      	</tr>
      	<tr>
      		<td>거주지 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" value="" id="address"></div> </td>
      	</tr>
      	<tr>
      		<td>본적 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" value="" id="originAddress"></div> </td>
      	</tr>
      	<tr>
      		<td>입학전 학적사항 : </td>
      		<td colspan="3" id="scholarInfo">
      		<!-- <div id="scholarValue" class="ui input">
      		<input type="date" value="">
      		<input type="text" placeholder="기관명 입력" value="">
      		<input type="text" placeholder="특이사항 입력"  value=""></div> -->
      		</td>
      	</tr>
      	<tr id="plusBtn"><td colspan="4"><img id="addScholar" width="20px" src="<%=request.getContextPath() %>/images/add.png" onclick=""></td></tr>
      	<tr>
      		<td>가족 사항 : </td>
      		<td colspan="3" id="familyInfo">     		
      		<!-- <div id="familyValue" class="ui fluid icon input">
      		 <input name="fRelation"  type="text" placeholder="관계입력"  value="">
      		<input name="fName" type="text" placeholder="이름 입력"  value="">
      		<input name="fPhone" type="text" placeholder="연락처 입력"  value=""></div> -->
      		</td>
      	</tr>

      	<tr id="plusBtn"><td colspan="4"><img id="addFamily" width="20px" src="<%=request.getContextPath() %>/images/add.png" onclick=""></td></tr>
      	<tr>
      		<td>특이사항 : </td>
      		<td colspan="3"><div class="ui fluid icon input">
  			<input type="text" placeholder="아이 특이사항 입력란" value="" id="description"></div></td>
      	</tr>
      </table>
    </div>
  </div>
  <div class="extra content">
    <div class="right floated author">
    <button class="ui teal basic button">아이 추가하기</button>
    <button class="ui green basic button">아이정보 변경</button>
    </div>
  </div>
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
		var cId = $("#cNameSelect").val();

		$.ajax({
			url:"<%=request.getContextPath()%>/cInfo.me",
			data:{cId},
			type:"get",
			success:function(data){

				console.log(data);
				/* 초기화 */
				$("#cName").text("");
				$("#bloodType").val("");
				$("#originAddress").val("");
				$("#description").val("");
				$("#address").val("");
				$("div").remove("#familyValue");
				$("div").remove("#scholarValue");
				
				/* children 객체에서 정보 넣어주기 */
				$("#cName").text(data.c.name);
				$("#bloodType").val(data.c.bloodType);
				$("#originAddress").val(data.c.originAddr);
				$("#description").val(data.c.description);
				
				/* 거주지 넣어주기 */
				$("#address").val(data.address);
				
				/* 학적사항 날짜 변경 */
				for(var i = 0; i < data.sc.length; i++){
					date = data.sc[i].sDate;
					date = date.split(" ");
					
					var year = date[2];
					var month = date[0].substring(0, date[0].length - 1);
					var day = date[1].substring(0, date[1].length - 1) < 10 ? "0" +date[1].substring(0, date[1].length - 1) : date[1].substring(0, date[1].length - 1)
	            	date = date[2] + "-" + date[0].substring(0, date[0].length - 1) + "-" + date[1].substring(0, date[1].length - 1) < 10 ? "0" +date[1].substring(0, date[1].length - 1) : date[1].substring(0, date[1].length - 1);
	            	console.log(year + "-" + month + "-" + day)
	            	date = year + "-" + month + "-" + day;
	            	
	            	for(var s = 0; s < data.sc.length; s++){
						 //console.log(data.sc[i].sDate); 
						//$("#scholarValue").append("<input type='date' value='"+data.sc[i].sDate+"'>");	
						$("#scholarInfo").append("<div id='scholarValue' class='ui input'><input type='date' value='" + date + "'><input type='text' value='" + data.sc[s].agency + "'><input type='text' value='" + data.sc[s].uniqueness + "'></div>");
					}  
					
				}

				/* 학적사항 */
				   
				
				/* 가족사항 */
				 for(var f = 0; f < data.fr.length; f++){
					// console.log(data.fr[f]); 
					$("#familyInfo").append("<div id='familyValue' class='ui fluid icon input'><input name='fRelation'  type='text' value='" + data.fr[f].relation + "'><input name='fName' type='text' value='"+ data.fr[f].name+"'><input name='fPhone' type='text' value='"+data.fr[f].phone+"'></div>");
				} 
				
			},
			error:function(data){
				console.log("원아 데이터 불러오기 실패");
			}
		});
	});
}); 
</script>


<script>
	

	/* select 값 가져오기 */
/* 	$("#cSelect").change(function() {
		if($("#cSelect option:selected").val()==1){
			$(".card").hide();
			$("#cDiv1").show();
		}else if($("#cSelect option:selected").val()==2){
			$(".card").hide();
			var d = $("#cSelect option:selected").val();
			$("#cDiv2").show();
		}else if($("#cSelect option:selected").val()==3){
			$(".card").hide();
			var d = $("#cSelect option:selected").val();
			$("#cDiv3").show();
		}  
	}) */
	
	/* 학적사항 추가 버튼 */
		$("#addScholar").click(function(){
			$("#scholarValue").clone(true).appendTo($("#scholarInfo:last-child"));
			return false;
		});
	
	/* 가족관계 추가 버튼 */
	    $("#addFamily").click(function(){
			$("#familyValue").clone(true).appendTo($("#familyInfo:last-child"));
			return false;
		});  
	
	/* 생일 */
		function birth(){
			var birth = "";
			console.log(birth);
			var frontRno = birth.split('-');
			$("#birth").text(frontRno[0]);
			
		};
	
	
</script>

	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>