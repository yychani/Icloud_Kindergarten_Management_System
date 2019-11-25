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
        #table1, #table2 {
            margin: 10px auto;
        }

        input[type=text] {
            border-radius: 10px;
            width: 300px;
            height: 30px;
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
        th[id="no"]{
            width: 100px;
            height: 50px;
        } 
        th[id="apply"]{
            width: 50px;
            height: 50px;
            padding-right: 0;
        } 
        th[id="applicant"] {
            width: 500px;
            height: 50px;
        }
        th {
            background: lightgrey;
        }
        #applyTr{
            border-bottom: 1px solid black;
        }
        td[id="applicant"]{
            height: 30px;
        }
        td[id="apply"]{
            padding-right: 0;
        } 
    </style>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/presidentMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">방과후 페이지</h1>
    </div>
    <select name="as" id="as" style="margin: 20px 20%;">
        <option value="신청자 리스트" selected>신청자 리스트</option>
        <option value="이전 신청 이력">이전 신청 이력</option>
    </select>
    <table id="table1">
        <tr id="applyTr">
            <th id="no">No</th>
            <th id="applicant">신청자</th>
            <th id="apply">선택</th>
        </tr>
        <tr id="applyTr">
            <td id="no"></td>
            <td id="applicant"></td>
            <td id="apply" align="center"><input id="check" type="checkbox"></td>
        </tr>
        <tr id="applyTr">
                <th style="height: 30px;"></th>
                <th align="right">전체선택</th>
                <th><input id="allCheck" type="checkbox"></th>
            
        </tr>
        <tr>
            <td></td>
            <td></td>
                <td colspan="3" style="float: right; padding-right: 0;"><input type="button" value="승인" style="width: 70px; height:30px"></td>
            
        </tr>
    </table>
    <table id="table2" hidden>
            <tr id="applyTr">
                <th id="no">No</th>
                <th id="applicant">신청자</th>
                <th id="apply">승일 날짜</th>
            </tr>
            <tr id="applyTr">
                <td id="no"></td>
                <td id="applicant"></td>
                <td id="apply" align="center"></td>
            </tr>
            <tr id="applyTr">
                    <th style="height: 20px;"></th>
                    <th align="right"></th>
                    <th></th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                    <td colspan="3" style="float: right; padding-right: 0;"><input type="button" value="승인" style="width: 70px; height:30px"></td>
                
            </tr>
        </table>
    <script>
        $(function () {
            $(".li6").addClass("on");
            $(".topMenuLi:nth-child(2)").addClass("on");

            $(".topMenuLi").mouseover(function () {
                $(".li6").removeClass("on");
                $(".topMenuLi:nth-child(2)").removeClass("on");
            });
            $(".topMenuLi").mouseleave(function () {
                $(".li6").addClass("on");
                $(".topMenuLi:nth-child(2)").addClass("on");
            });
            $("#allCheck").click(function() {
                if($("#allCheck").prop("checked")) {
                    $("#check").prop("checked", true);
                } else {
                    $("#check").prop("checked", false);
                }
            });

            $("#as").change(function(){
                 if($(this).val() == "신청자 리스트"){
                    $("#table1").attr("hidden", false);
                    $("#table2").attr("hidden", true);
                 }else if($(this).val() == "이전 신청 이력"){
                    $("#table2").attr("hidden", false);
                    $("#table1").attr("hidden", true);
                 }
            });
        }); 
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>