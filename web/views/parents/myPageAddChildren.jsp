<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이 추가하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style>
#card{
	margin:0 auto;
	width:1000px;
}
#bloodType, #className, #family{
	width:161px;
	height:34px;
		border-radius:4px;
		border: 0.5px solid lightgray;
}
.input{
	
}



</style>
<script>
var selFile;

$(document).ready(function () {
    $("#kidFile").on("change", handleImgFileSelect);

   
});

function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function (f) {
        if (!f.type.match("image.*")) {
            alert("이미지 확장자 파일만 등록 가능합니다.");
            return;
        }
        selFile = f;

        var reader = new FileReader();
        reader.onload = function (e) {
            $("#kidFace").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });

}

$(function() {
	$.ajax({
		url : "/main/selectBan.do",
		type : "post",
		success:function(data){
			$select = $("#className");
			$select.find("option").remove();
			
			for(var i = 0; i < data.length; i++){
				
				var className = decodeURIComponent(data[i].banName);
				var selected = (i == 0) ? "selected" : "";
				
				$select.append("<option value='" + data[i].banNo + "' " + selected + ">" + className + "</option>");
			}
		},
		error: function(data){
			console.log("실패!");
		}
	});
});
</script>
</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/parentsMenu.jsp"%>
	
	<div class="ui card" id="card">
  <div class="content">
    <div class="header">아이 추가하기</div>
    <form action="<%=request.getContextPath() %>/childrenInsert.me?add=1" method="post" encType="multipart/form-data" id="addChild" onsubmit="return encryption()">
    <div class="description">
      <table>
      	<tr>
      		<td colspan="2">이름 : </td>
      		<td colspan="2"><div class="ui input">
  			<input type="text" placeholder="원아 이름" name="name" id="name"></div>
			</td>
			<td rowspan="3">
			<div class="kidFace" style="vertical-align: middle;"><img class="kidFace" id="kidFace" name="kidFace" src="<%=request.getContextPath() %>/images/noImages.png"
                            style="width: 119px; height: 157px; margin: 23px 40px;"></div>
                            <input type="hidden" value="<%=loginUser.getMemberId() %>" name="userId" id="userId">
			</td>
      	</tr>
      	<tr>
      		<td colspan="2" >주민등록 번호 : </td>
      		<td colspan="2" ><div class="ui input">
  			<input type="text" name="userNumber1"> - <input type="password"  name="userNumber2"></div></td>
      	</tr>
      	<tr>
      		<td colspan="2" >본적 : </td>
      		<td colspan="2" >
	      		<div class="ui input">
	  			<input type="text" placeholder="본적 입력" name="address" id="address">
	  			<input type="hidden" name="address1" id="address1">
	  			</div>
  			</td>
      	</tr>
      	<tr>
      		<td colspan="2" >혈액형 : </td>
      		<td colspan="2" >
      			<select id="bloodType" name="bloodType">
	                <option value="A" selected>A</option>
	                <option value="B">B</option>
	                <option value="O">O</option>
	                <option value="AB">AB</option>
                </select>
            </td>
             <td align="center">
                    <label id="kidFaceBtn">아이사진 선택</label>
                    <input type="file" id="kidFile" name="kidFile" style="width: 200px; border: 0;">
                 </td>
      	</tr>
      	<tr>
      		<td colspan="2" >해당 반 : </td>
      		<td colspan="2" ><select id="className" name="className"></select></td>
      	</tr>
      	<script>
            $(function() {
            	$("#kidFile").hide();
    			$("#kidFaceBtn").click(function(){
    				$("#kidFile").click();
    			});
    		});
            $(function() {
            	$("#className").change(function() {
					console.log($(this).val());
				});
            })
            </script>
      	<tr>
      		<td colspan="2" >응급 처치 동의 : </td>
      		<td colspan="2" >
      			<input type="radio" id="agree" name="emergency" value="Y" checked>
      			<label for="agree" style="vertical-align: center;">동의</label>
      			<input type="radio" id="disemergency" name="emergency" value="N" style="vertical-align: center; margin-left: 36px;">
           	 	<label for="disemergency">미동의</label>
        	</td>
      	</tr>
      	<tr>
      		<td colspan="2" >입학전 학적사항 : </td>
      		<td colspan="3"  id="dateTd">
	      		<div id="dateclone">
		      		<div class="ui input">
		  				<input type="text" id="datepicker" class="datepicker" style="width: 20%;" placeholder="날짜 입력" name="date" autocomplete="off">
		                <input type="text" placeholder="XX유치원" style="margin-left: 20px; width:20%;" name="agency"> 
		                <input type="text" placeholder="특이사항" style="margin-left: 20px; width:30%;" name="uniqueness">
		                <button id="add" class="compact ui button">추가</button>
		            </div>
	      		</div>
      		</td>
      	</tr>
      	<tr>
      		<td colspan="2">가족 사항 : </td>
      		<td colspan="3" id="familyTd">
      			<div id="clone" style="margin: 5px 0;">
                        <select id="family" name="family">
                            <option value="none">관계선택</option>
                            <option value="부">부</option>
                            <option value="모">모</option>
                            <option value="형제자매">형제자매</option> 
                        </select>
                        <div class="ui input">
  						<input type="text" placeholder="이름" style="width:20%" name="familyName">
                        <input type="text" placeholder="핸드폰번호를 '-' 를 포함 입력" style="width:50%" name="familyPhone">
                        <button id="addFamily" class="compact ui button">추가</button>
                        </div>
                </div>
      		</td>
      	</tr>
      	<tr>
                <td colspan="2" class="label"><label>특이사항 : </label></td>
                <td colspan="3" class="input">
                <div class="ui form">
                	<div class="field">
                    	<textarea cols="90" rows="10" name="kidUnique" id="kidUnique"></textarea>
                	</div>
                </div>
                </td>
            </tr>
      </table>
    </div>
  <div class="extra content" align="center">
	<button type="button" class="ui grey basic button" onclick="location.href='<%=request.getContextPath()%>/views/parents/myPageChildren.jsp'">취소</button>
	<button class="ui blue basic button" type="submit">완료</button>
  </div>
      </form>
  </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
	<script>
	
	 $("#datepicker").datepicker({
	        changeMonth: true,
	        changeYear: true
	    });
	 
            $("#add").on("click", function() {
                $("#dateclone").clone(true).appendTo($("#dateTd:last-child"));
                return false;
            })
            
             $("#addFamily").click(function() {
                        	$("#clone").clone(true).appendTo($("#familyTd:last-child"));
                        	return false;
                    	})
                    	
             function encryption(){
            	var address = $("#address").val();
        	    var passphrase = "1234";
        	    var encrypt1 = CryptoJS.AES.encrypt(address, passphrase);
        	    $("#address1").val(encrypt1);
        	    
        	
        	    return true;
            }
      </script>
	
	
	
	
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>