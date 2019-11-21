<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
            background: rgb(177, 177, 177);
            color: black;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        button:hover,
        .submit:hover,
        .cancel:hover {
            background: rgb(241, 241, 188) !important;
            color: gray !important;
        }

        input {
            border-radius: 5px;
            height: 30px !important;
            border: 1px solid rgb(77, 77, 77);
        }

        .kidFace {
            width: 100%;
            height: 100%;
        }

        input[type=radio],
        input[type=checkbox] {
            width: 20px;
            height: 20px !important;
            vertical-align: middle;
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
    </script>
</head>

<body>
    <form action="" method="post">
        <h1 align="center" style="margin-top: 50px;">회원 가입</h1>
        <table>
            <tr>
                <td colspan="2" class="label"><label for="">아이 이름 : </label></td>
                <td colspan="2" class="input"><input type="text" placeholder=" 이름을 입력해주세요" id="name"
                        style="width: 80%; height: 20px"></td>
                <td rowspan="3" style="width: 200px; height: 200px">
                    <div class="kidFace" style="vertical-align: middle;"><img class="kidFace hidden" id="kidFace"
                            style="width: 119px; height: 157px; margin: 23px 40px;"></div>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">주민등록번호 : </label></td>
                <td colspan="2" class="input"><input type="text" id="userNumber1" style="width: 40%; height: 20px"> -
                    <input type="text" id="userNumber2" placeholder="주민번호 뒷자리는 암호화 되어 보관됩니다."
                        style="width: 45%; height: 20px"></td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">거주지 : </label></td>
                <td colspan="2" class="input"><input type="text" placeholder="주소를 입력해주세요" id="name"
                        style="width: 80%; height: 20px"></td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">본적 : </label></td>
                <td colspan="2" class="input"><input type="text" placeholder="주소를 입력해주세요" id="name"
                        style="width: 80%; height: 20px"></td>
                <td align="center">
                    <!-- <button id="addPhoto">사진 선택</button><input type="file" id="kidFile" value="사진 선택" style="display:none;"> -->
                    <input type="file" id="kidFile" style="width: 200px"></td>
                <!-- <script>
                    $("#addPhoto").click(function() {
                        $("#kidFile").trigger('click');
                    });
                </script> -->
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">혈액형 : </label></td>
                <td colspan="2" class="input">
                    <select style="width: 50%; height: 30px; font-size: 12pt;" id="bloodType">
                        <option value="none" selected>혈액형을 선택해주세요</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="O">O</option>
                        <option value="AB">AB</option>
                    </select></td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">성별 : </label></td>
                <td colspan="2" class="input"><input type="radio" name="gender" value="female" checked><label
                        for="female" style="vertical-align: center;">여</label><input type="radio" name="gender"
                        value="male" style="vertical-align: center; margin-left: 50px;"><label for="male">남</label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">응급처치 동의서 : </label></td>
                <td colspan="2" class="input"><input type="radio" name="emergency" value="agree" checked><label
                        for="emergency" style="vertical-align: center;">동의</label><input type="radio" name="emergency"
                        value="disagree" style="vertical-align: center; margin-left: 36px;"><label
                        for="disagree">미동의</label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">입학전 학적사항 : </label></td>
                <td colspan="3" class="input"><input type="text" id="datepicker" style="width: 20%;"
                        placeholder="날짜 입력"><input type="text" placeholder="XX유치원"
                        style="margin-left: 20px; width:20%;"> <input type="text" placeholder="특이사항"
                        style="margin-left: 20px; width:30%;">
                    <button id="add" style="width: 65px; height: 30px; margin-left: 20px;">추가</button>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label for="">가족 사항 : </label></td>
                <td colspan="3" class="input" id="familyTd">
                    <div id="clone" style="margin: 5px 0;">
                        <select name="family" id="">
                            <option value="none">관계선택</option>
                            <option value="부">부</option>
                            <option value="모">모</option>
                            <option value="brother">brother</option>
                            <option value="sister">sister</option>
                        </select><input type="text" placeholder="이름"
                            style="margin-left: 20px; width:15%;"></select><input type="text"
                            placeholder="핸드폰번호를 '-' 를 제외하고 입력하세요" style="margin-left: 20px; width:45%;">
                    </div>
                    <div style="margin: 5px 0;">
                        <select name="family" id="">
                            <option value="none">관계선택</option>
                            <option value="부">부</option>
                            <option value="모">모</option>
                            <option value="brother">brother</option>
                            <option value="sister">sister</option>
                        </select><input type="text" placeholder="이름"
                            style="margin-left: 20px; width:15%;"></select><input type="text"
                            placeholder="핸드폰번호를 '-' 를 제외하고 입력하세요" style="margin-left: 20px; width:45%;">
                        <button id="addFamily" style="width: 65px; height: 30px; margin-left: 20px;">추가</button>
                    </div>
                    <script>
                        $("#addFamily").click(function() {
                            $("#clone").clone(true).appendTo($("#familyTd:last-child"));
                            return false;
                        })
                    </script>
            </tr>
            <tr>
                <td colspan="2" class="label"><label>특이사항 : </label></td>
                <td colspan="3" class="input">
                    <textarea name="" id="" cols="90" rows="10"></textarea>
                </td>
            </tr>
            <tr></tr>
        </table>
        <div style="margin-left: 36%; margin-bottom: 50px;">
            <input type="button" value="아이추가" class="submit"><input type="submit" value="완료" class="submit" onclick="location.href='../index.jsp'" style="margin-left: 50px;"> <input type="button" value="취소" style="margin-left: 50px;"
                class="cancel">
        </div>
        <input type="hidden" name="userId" value="<%=request.getParameter("userId") %>">
    </form>
    
    <%@ include file="/views/common/footer.jsp"%>
</body>

</html>