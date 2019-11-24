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

        input[type=text] {
            background: none;
            border: none;
        }

        td {
            padding: 10px 30px;
            padding-left: 0;
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
            text-align: center;
        }

        .title {
            font-weight: bold;
            font-size: 13pt;
        }

        #title {
            color: rgb(77, 77, 77);
            font-size: 2vw;
        }

        .ui.statistics>.statistic {
            margin: 0 2em 2em;
        }
    </style>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/presidentMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">원정보 보기</h1>
    </div>
    <div style="width: 70%; margin: 20px auto">
        <hr>
        <div class="ui four statistics" align="center" style="width: fit-content; margin: 0 auto;">
            <div class="statistic">
                <div class="text value">
                    떡잎<br>
                    유치원
                </div>
                <div class="label">
                    원 이름
                </div>
            </div>
            <div class="statistic">
                <div class="text value">
                    2016<br>
                    02-27
                </div>
                <div class="label">
                    원 설립일
                </div>
            </div>
            <div class="statistic">
                <div class="value">
                    <img src="<%=request.getContextPath() %>/images/teacher.png" class="ui circular inline image">
                    4
                </div>
                <div class="label">
                    총 교사 수
                </div>
            </div>
            <div class="statistic">
                <div class="value">
                    <img src="<%=request.getContextPath() %>/images/child.png" class="ui circular inline image">
                    42
                </div>
                <div class="label">
                    총 원아 수
                </div>
            </div>
        </div>
        <table border="1" id="KInfo" style="width: 100%; margin: 0 auto">
            <tr>
                <td style="width: 100%; text-align: center; padding-right: 0;"><label id="title">년도별 원아 수</label></td>
            </tr>
            <tr>
                <td></td>
            </tr>
        </table>
    </div>
    <script>
        $(function () {
            $(".li11").addClass("on");
            $(".topMenuLi:nth-child(6)").addClass("on");

            $(".topMenuLi").mouseover(function () {
                $(".li11").removeClass("on");
                $(".topMenuLi:nth-child(6)").removeClass("on");
            });
            $(".topMenuLi").mouseleave(function () {
                $(".li11").addClass("on");
                $(".topMenuLi:nth-child(6)").addClass("on");
            });
        }); 
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>