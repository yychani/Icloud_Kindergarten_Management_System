<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.oracle5.member.model.vo.*"%>

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


<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<style>
.ui.raised.card {
	margin: auto auto;
	width: 1000px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	color: black;
}

tr {
	height: 50px;
}

#plusBtn {
	height: 20px;
}

#cNameSelect {
	width: 161px;
	height: 34px;
	border-radius: 4px;
}

#submit {
	float: right;
}
</style>

</head>


<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>


	<h1 align="center">아이정보</h1>
	<br>
	<div align="center">
		<select class="ui dropdown" id="cNameSelect" name="cName"></select>
	</div>
	<br>
	<div class="ui raised card" id="cDiv1">

		<div class="content">
		<form id="passChangeForm" action="<%=request.getContextPath()%>/kidInfoChange.me" method="post"  onsubmit="return encryption()">
			<div class="header" align="center">
				<img id="kidImg" class="ui avatar image"
					src="<%=request.getContextPath()%>/uploadFiles/5racle_2019121016462761291.jpg"><label
					id="cName"> </label>
			</div>
			<div class="meta" align="center">
				<span class="category" id="birth"></span>
			</div>
			<div class="description">
				<table>
					<!-- <tr>
						<td>성별 :</td>
						<td colspan="3" style="text-align: left;">
							<div class="ui radio checkbox">
								<div style="display: inline-block;">
								<input type="hidden" name="cId" id="cId">
									<input type="radio" name="gender" value="2"><label>여</label>
								</div>
								<div style="display: inline-block;">
									<input type="radio" name="gender" value="1"><label>남</label>
								</div>
							</div>
						</td>
					</tr> -->
					<tr>
						<td>혈액형 :</td>
						<td style="float:left"><div class="ui input">
								<input type="text" name="bloodType" id="bloodType" readonly>
							</div></td>
					</tr>
					<tr>
						<td>거주지 :</td>
						<td colspan="3"><div class="ui fluid icon input">
								<input type="text" name="address" id="address" readonly>
							</div></td>
					</tr>
					<tr>
						<td>본적 :</td>
						<td colspan="3"><div class="ui fluid icon input">
								<input type="text" name="originAddress" id="originAddress" readonly>
							</div></td>
					</tr>
					<tr>
						<td>입학전 학적사항 :</td>
						<td colspan="3" id="scholarInfo">
						<!-- <div id="scholarValueNone" class="ui input" style="display:none;">
      						<input type="date" value="">
      						<input type="text" placeholder="기관명 입력" value="">
      						<input type="text" placeholder="특이사항 입력"  value=""></div> -->
						</td>
					</tr>
					<%-- <tr id="plusBtn">
						<td colspan="4"><img id="addScholar" width="20px"
							src="<%=request.getContextPath()%>/images/add.png" onclick=""></td>
					</tr> --%>
					<tr>
						<td>가족 사항 :</td>
						<td colspan="3" id="familyInfo">
							<!-- <div id="familyValue" class="ui fluid icon input">
      		 <input name="fRelation"  type="text" placeholder="관계입력"  value="">
      		<input name="fName" type="text" placeholder="이름 입력"  value="">
      		<input name="fPhone" type="text" placeholder="연락처 입력"  value=""></div> -->
						</td>
					</tr>

					<%-- <tr id="plusBtn">
						<td colspan="4"><img id="addFamily" width="20px"
							src="<%=request.getContextPath()%>/images/add.png" onclick=""></td>
					</tr> --%>
					<tr>
						<td>특이사항 :</td>
						<td colspan="3"><div class="ui fluid icon input">
								<input type="text" name="description" id="description"
									readonly>
									<input type="hidden" name="cId" id="cId">
							</div></td>
					</tr>
				</table>
				<div id="divSubmitBtn" style="display: none;">
					<button class="ui pink  basic button" type="submit" id="submit">완료</button>
				</div>
			</div>
			</form>
		</div>
		<div class="extra content">
			<div class="right floated author">
				<button class="ui green basic button" onclick="location.href='<%=request.getContextPath()%>/views/parents/myPageAddChildren.jsp'">아이 추가하기</button>
				<button class="ui teal basic button" id="cInfoChangeBtn"
					onclick="childInfoChange();">아이정보 변경</button>

			</div>
		
		</div>
		
	</div>

	<!-- 암호화 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>


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
				
				/* 사진 넣어주기 */
				$("#kidImg").attr("src", '<%=request.getContextPath()%>/uploadFiles/' + data.c.imgSrc);
				
				/* children 객체에서 정보 넣어주기 */
				$("#cName").text(data.c.name);
				$("#bloodType").val(data.c.bloodType);
				$("#originAddress").val(data.c.originAddr);
				var originAdd = $("#originAddress").val();
				var passphrase = "1234";
				var decrypted1 = CryptoJS.AES.decrypt(originAdd, passphrase);
				var originAdd1 = decrypted1.toString(CryptoJS.enc.Utf8);
				$("#originAddress").val(originAdd1);
				console.log(originAdd1);
				
				$("#description").val(data.c.description);
				$("#birth").text(data.birth);
				
				/* 성별 체크 */
				var rno = data.c.rno;
				var test = rno.split('-');
				var gender = test[0].charAt(0);
				$("input:radio[name=gender]:input[value='" + gender + "']").prop("checked", true);
				
				/* 거주지 넣어주기 */
				$("#address").val(data.address);
				var address = $("#address").val();
				var decrypted2 = CryptoJS.AES.decrypt(address, passphrase);
				var address1 = decrypted2.toString(CryptoJS.enc.Utf8);
				$("#address").val(address1);
				
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
						$("#scholarInfo").append("<div id='scholarValue' class='ui input'><input type='date' name='sDate' readonly value='" + date + "'><input type='text' name='sAgency' readonly value='" + data.sc[s].agency + "'><input type='text' name='sUnique' readonly value='" + data.sc[s].uniqueness + "'></div>");
					}  
					
				}

				/* 학적사항 */
				   
				
				/* 가족사항 */
				 for(var f = 0; f < data.fr.length; f++){
					// console.log(data.fr[f]); 
					$("#familyInfo").append("<div id='familyValue' class='ui fluid icon input'><input name='fRelation' readonly type='text' value='" + data.fr[f].relation + "'><input name='fName' readonly type='text' value='"+ data.fr[f].name+"'><input name='fPhone' readonly type='text' value='"+data.fr[f].phone+"'><input type='hidden' name='relationId' value='" + data.fr[f].relationId + "'</div>");
				} 
				
			},
			error:function(data){
				console.log("원아 데이터 불러오기 실패");
			}
		});
	});
}); 

/* 아이정보 변경 버튼 클릭시  */
function childInfoChange(){
	console.log("아이정보 변경 버튼 클릭");
	/* readonly 해제 */
	$('input').removeAttr("readonly");
	$('input').css("background","rgba(204, 255, 115, 0.102)");
	
	$("#divSubmitBtn").show();
	console.log($("#cNameSelect").val());
	$("#cId").val($("#cNameSelect").val());
	
}

function encryption(){
	/* 거주지 암호화 */
	var address = $("#address").val();
	var passphrase = "1234";
	var encrypt1 = CryptoJS.AES.encrypt(address, passphrase);
	$("#address").val(encrypt1);
	
	/* 본적 암호화 */
	var originAdd = $("#originAddress").val();
	var encrypt2 = CryptoJS.AES.encrypt(originAdd, passphrase); 
	$("#originAddress").val(encrypt2);
}
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
		$(document).on("click","#addScholar", function(){
			$("#scholarValueNone").show();
			$("#scholarValueNone").clone(true).appendTo($("#scholarInfo:last-child"));
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

		 <script>
      $(function() {
    	  $(".li:nth-child(1)").addClass("on");
    	  
          $(".topMenuLi:nth-child(6)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(1)").removeClass("on");
            $(".topMenuLi:nth-child(6)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(1)").addClass("on");
            $(".topMenuLi:nth-child(6)").addClass("on");
         });
      }); 
</script>

	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>