<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% String userId = (String) request.getParameter("id"); %>
	<%@page import="java.net.InetAddress"%>
<% InetAddress inet = InetAddress.getLocalHost();
		String svrIP = inet.getHostAddress();
		int svrPort = request.getServerPort();%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    <meta charset="UTF-8">
    <title>회원 가입</title>
    <style>
        .label {
            width: 150px;
            height: 60px;
            font-size: 13pt;
            color: ligthgrey;
            font-weight: bold;
        }

        .input {
            width: 400px;
            height: 60px;
            text-align: left !important;
            vertical-align: middle !important;
        }

        .terms {
            font-size: 15pt;
        }

        table {
            margin: 50px auto;
            padding-top: 30px;
        }

        button,
        .submit {
            width: 100px;
            height: 40px;
            border-radius: 10px;
            background: rgb(63, 63, 63);
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        .cancel {
            width: 100px;
            height: 40px;
            border-radius: 10px;
            background: rgb(177, 177, 177) !important;
            color: black !important;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        button:hover,
        .submit:hover,
        .cancel:hover {
            background: rgb(44, 44, 44) !important;
            color: gray !important;
        }

        input {
            border-radius: 5px;
            height: 30px !important;
            border: 1px solid rgb(77, 77, 77);
        }

        #kidFace {
            border: 0.5px solid rgb(200, 200, 200);
        }

        input[type=radio],
        input[type=checkbox] {
            width: 20px;
            height: 20px !important;
            vertical-align: middle;
        }
    #kidFaceBtn
	{ 
		display: inline-block; 
		padding: .5em .75em; 
		color: white; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: rgb(63, 63, 63); 
		cursor: pointer; 
		border-radius: .25em; 
	} 
    </style>
    <script>

        var selFile;

        $(document).ready(function () {
            $("#kidFile").on("change", handleImgFileSelect);

            $("#datepicker").datepicker({
                changeMonth: true,
                changeYear: true
            });
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

<body>
    <form action="<%=request.getContextPath() %>/childrenInsert.me" method="post" encType="multipart/form-data" onsubmit="return validate();">
        <h1 align="center" style="margin-top: 50px;">회원 가입</h1>
        <table>
            <tr>
                <td colspan="2" class="label"><label for="">아이 이름 : </label></td>
                <td colspan="2" class="input"><input type="text" placeholder=" 이름을 입력해주세요" id="name" name="name" style="width: 80%; height: 20px"></td>
                <td rowspan="3" style="width: 200px; height: 200px">
                    <div class="kidFace" style="vertical-align: middle;"><img class="kidFace" id="kidFace" name="kidFace" src="<%=request.getContextPath() %>/images/noImages.png"
                            style="width: 119px; height: 157px; margin: 23px 40px;"></div>
                    <input type="hidden" id="addKids">
                    <input type="hidden" value="<%=userId %>" name="userId" id="userId">
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">주민등록번호 : </label></td>
                <td colspan="2" class="input"><input type="text" id="userNumber1" name="userNumber1"style="width: 40%; height: 20px"> -
                    <input type="password" id="userNumber2" placeholder="주민번호 뒷자리는 암호화 되어 보관됩니다." name="userNumber2"
                        style="width: 45%; height: 20px"></td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">본적 : </label></td>
                <td colspan="2" class="input"><input type="text" placeholder="주소를 입력해주세요" id="address" name="address"
                        style="width: 80%; height: 20px">
                        <input type="hidden" id="address1" name="address1"></td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">혈액형 : </label></td>
                <td colspan="2" class="input">
                    <select style="width: 50%; height: 30px; font-size: 12pt;" id="bloodType" name="bloodType">
                        <option value="A" selected>A</option>
                        <option value="B">B</option>
                        <option value="O">O</option>
                        <option value="AB">AB</option>
                    </select>
                 </td>
                 <td align="center">
                    <label id="kidFaceBtn">아이사진 선택</label><br>
                    <input type="file" id="kidFile" name="kidFile" style="width: 200px; border: 0;">
                 </td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label>해당 반 : </label></td>
                <td colspan="2" class="input"><select style="width: 30%; font-size: 12pt;" id="className" name="className">
                    </select></td>
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
                <td colspan="2" class="label"><label for="">응급처치 동의서 : </label></td>
                <td colspan="2" class="input"><input type="radio" id="agree" name="emergency" value="Y" checked><label
                        for="agree" style="vertical-align: center;">동의</label><input type="radio" id="disemergency" name="emergency"
                        value="N" style="vertical-align: center; margin-left: 36px;"><label
                        for="disemergency">미동의</label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">입학전 학적사항 : </label></td>
                <td colspan="3" class="input" id="dateTd">
                <div id="dateclone"><input type="text" id="datepicker" class="datepicker" style="width: 20%;" placeholder="날짜 입력" name="date">
                <input type="text" placeholder="XX유치원" style="margin-left: 20px; width:20%;" name="agency"> 
                <input type="text" placeholder="특이사항" style="margin-left: 20px; width:30%;" name="uniqueness">
                    <button id="add" style="width: 65px; height: 30px; margin-left: 20px;">추가</button>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">가족 사항 : </label></td>
                <td colspan="3" class="input" id="familyTd">
                    <div id="clone" style="margin: 5px 0;">
                        <select name="family">
                            <option value="none">관계선택</option>
                            <option value="부">부</option>
                            <option value="모">모</option>
                            <option value="형제자매">형제자매</option> 
                        </select><input type="text" placeholder="이름" name="familyName"
                            style="margin-left: 20px; width:15%;"></select>
                            <input type="text" placeholder="핸드폰번호를 '-' 를 포함해서 입력하세요" name="familyPhone" style="margin-left: 20px; width:45%;" class="phone">
                    </div>
                    <div style="margin: 5px 0;">
                        <select name="family">
                            <option value="none">관계선택</option>
                            <option value="부">부</option>
                            <option value="모">모</option>
                            <option value="형제자매">형제자매</option> 
                        </select><input type="text" placeholder="이름" name="familyName"
                            style="margin-left: 20px; width:15%;"></select><input type="text"
                            placeholder="핸드폰번호를 '-' 를 포함해서 입력하세요" name="familyPhone" style="margin-left: 20px; width:45%;" class="phone">
                        <button id="addFamily" style="width: 65px; height: 30px; margin-left: 20px;">추가</button>
                    </div>
                    <script>
                   	    $("#addFamily").click(function() {
                        	$("#clone").clone(true).appendTo($("#familyTd:last-child"));
                        	return false;
                    	})
                        $("#add").on("click", function() {
                            $("#dateclone").clone(true).appendTo($("#dateTd:last-child"));
                            return false;
                        })
                    </script>
            </tr>
            <tr>
                <td colspan="2" class="label"><label>특이사항 : </label></td>
                <td colspan="3" class="input">
                    <textarea cols="90" rows="10" name="kidUnique" id="kidUnique"></textarea>
                </td>
            </tr>
            <tr></tr>
        </table>
        <div style="margin-left: 36%; margin-bottom: 50px;">
            <input type="button" value="아이추가" class="submit"><input type="submit" value="완료" class="submit" onclick="location.href='<%=request.getContextPath()%>/index.jsp'" style="margin-left: 50px;"> <input type="button" class="cancel" value="취소" style="margin-left: 50px;"
                class="cancel">
        </div>
    </form>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
    <script>
    $(function(){
    	$(".cancel").click(function(){
    		var userId = $("#userId").val();
    		var path = "<%=request.getContextPath() %>/signUpCancel.me?userId=" + userId;
    		location.replace(path);
    	});
    });
    function validate() {
		var msg = "입력한 정보들을 다시 한번 확인해주세요";
		
		var rno1 = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
		var rno2 = /^[1-4][0-9]{6}$/;
		
		var inval_Arr = new Array(4).fill(false);
		if($("#kidUnique").val() != ""){
			inval_Arr[3] = true;
		}else { 
			msg = "특이사항이 없으면 \"없음\"이라고 적어주세요";
			inval_Arr[3] = false;
		}
		if($("#address").val() != ""){
			inval_Arr[2] = true;
		}else {
			inval_Arr[2] = false;
			msg = "주소를 입력해주세요!";
		}
		if(rno1.test($("#userNumber1").val()) && rno2.test($("#userNumber2").val())){
			inval_Arr[1] = true;
		}else {
			inval_Arr[1] = false;
			msg = "올바른 주민등록번호를 입력해주세요!";
		}
		if($("#name").val() != ""){
			inval_Arr[0] = true;
		}else {
			inval_Arr[0] = false;
			msg = "이름을 입력해주세요!";
		}
		var validAll = true;
		for(var i = 0; i < inval_Arr.length; i++){
			if(inval_Arr[i] == false){
				validAll = false;
			}
		}
		
		var address = $("#address").val();
	    var passphrase = "1234";
	    var encrypt1 = CryptoJS.AES.encrypt(address, passphrase);
	    var decrypted1 = CryptoJS.AES.decrypt(encrypt1, passphrase );
	 
	    // 암호화 이전의 문자열은 toString 함수를 사용하여 추출할 수 있다.
	    var address1 = decrypted1.toString(CryptoJS.enc.Utf8);
	    $("#address1").val(decrypted1);
	    
		if(validAll){ // 유효성 모두 통과
			return true;
		} else{
			alert(msg);
			return false;
		}
	}
    </script>
    
    <%@ include file="/views/common/footer.jsp"%>
</body>

</html>