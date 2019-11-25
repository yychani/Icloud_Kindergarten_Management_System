<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    <style>
        table {
            margin: 50px auto;
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

        .submit {
            width: 100px;
            height: 40px !important;
            border-radius: 10px;
            background: rgb(63, 63, 63);
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        .cancel {
            width: 100px;
            height: 40px !important;
            border-radius: 10px;
            background: rgb(177, 177, 177) !important;
            color: black !important;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        .submit:hover,
        .cancel:hover {
            background: rgb(44, 44, 44) !important;
            color: white !important;
        }

        .label {
            width: 150px;
            height: 60px;
            font-size: 13pt;
            color: ligthgrey;
            font-weight: bold;
        }

        .input {
            width: 300px;
            height: 60px;
            text-align: left !important;
            vertical-align: middle !important;
        }

        input {
            border-radius: 5px;
            height: 30px !important;
            border: 1px solid rgb(77, 77, 77);
        }

        .terms {
            font-size: 15pt;
        }
    </style>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/presidentMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">선생님 관리</h1>
    </div>
    <form action="<%=request.getContextPath() %>/insertTeacher.me" method="post" onsubmit="return validate()">
        <h1 align="center" style="margin-top: 50px;">선생님 계정 생성</h1>
        <table>
            <tr>
                <td colspan="2" class="label"><label>아이디 : </label></td>
                <td colspan="2" class="input"><input type="text" placeholder=" ID를 입력해주세요" id="userId" name="userId"
                        style="width: 80%; height: 20px"></td>
                <td><button id="test">중복 확인</button></td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label>비밀번호 : </label></td>
                <td colspan="2" class="input"><input type="password" placeholder=" 비밀번호를 입력해주세요" id="password"
                        style="width: 90%; height: 20px" name="userPwd"></td>
                <td rowspan="2" class="description">
                </td>
            </tr>

            <tr>
                <td colspan="2" class="label"><label>비밀번호 확인 : </label></td>
                <td colspan="2" class="input"><input type="password" placeholder=" 비밀번호를 입력해주세요" id="passCheck"
                        style="width: 90%; height: 20px" name="passCheck"></td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label>이름 : </label></td>
                <td colspan="2" class="input"><input type="text" placeholder=" 이름을 입력해주세요" id="name"
                        style="width: 50%; height: 20px" name="name"></td>
            </tr>
            <tr>
                <td colspan="2" class="label"><label>담당 반 : </label></td>
                <td colspan="2" class="input"><select style="width: 30%; font-size: 12pt;" id="className" name="className">
                        <option value="none" selected>반 이름</option>
                        <option value="해바라기">해바라기 반</option>
                        <option value="장미">장미 반</option>
                        <option value="튤립">반 DB에서 끌어오기</option>
                    </select></td>
            </tr>
        </table>
        <div style="margin-left: 36%; margin-bottom: 50px;">
            <input type="submit" value="계정 생성" class="submit" style="margin-left: 50px;"> 
            <input type="button" value="취소" class="cancel" style="margin-left: 50px;" class="cancel">
        </div>
    </form>
    <script>
        function validate() {
            var pass = document.getElementById("userPwd").value;
            var pass1 = document.getElementById("passCheck").value;
            console.log(pass + " " + pass1);
            if (pass == "" || pass1 == "") {
                alert("비밀번호를 입력하세요");
                document.getElementById('password').select();
                return false;
            }
            else if (pass != pass1) {
                alert("비밀번호가 일치 하지 않습니다.");
                document.getElementById('passCheck').select();
                return false;
            } else {
                return true;
            }
        }
        $(function () {
            $(".topMenuLi:nth-child(4)").addClass("on");

            $(".topMenuLi").mouseover(function () {
                $(".topMenuLi:nth-child(4)").removeClass("on");
            });
            $(".topMenuLi").mouseleave(function () {
                $(".topMenuLi:nth-child(4)").addClass("on");
            });
        }); 
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>