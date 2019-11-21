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
    	margin: 70px auto;
    }
        th {
            text-align: left;
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
    </style>
</head>
<body style="overflow-x:hidden">
    <%@ include file="/views/common/presidentMenu.jsp" %>
    <table>
        <tr>
            <th></th>
            <th>오늘 해야할 일</th>
            <th>내일 해야할 일</th>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td><input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly></td>
            <td><input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td><input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly></td>
            <td><input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td><input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly></td>
            <td><input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td><input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly></td>
            <td><input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td><input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly></td>
            <td><input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly></td>
        </tr>
        <tr>
            <td><input type="checkbox" name="todaycheck"></td>
            <td><input type="text" name="today" placeholder="수정은 버튼을 눌러주세요" readonly></td>
            <td><input type="text" name="tomorrow" placeholder="수정은 버튼을 눌러주세요" readonly></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td style="float: right;"><input type="button" id="mvManagement" value="메인 화면 관리">&nbsp;&nbsp;<input type="button" id="edit" value="수정하기"><input type="hidden" id="ok" value="저장하기"></td>
        </tr>
    </table>
    <script>
    	$(function(){
            $("#edit").click(function() {
                $("#ok").attr("type", "button");
                $(this).attr("type", "hidden");
                $("input[name=today]").each(function(index){
                    $(this).attr("readonly", false);
                    $(this).attr("placeholder", "오늘 해야할 일");
                });
                
                $("input[name=tomorrow]").each(function(index){
                    $(this).attr("readonly", false);
                    $(this).attr("placeholder", "내일 해야할 일");
                });
            });

            $("#ok").click(function() {
                $("#edit").attr("type", "button");
                $(this).attr("type", "hidden");
                $("input[name=today]").each(function(index){
                    $(this).attr("readonly", true);
                    $(this).attr("placeholder", "수정은 버튼을 눌러주세요");
                });
                $("input[name=tomorrow]").each(function(index){
                    $(this).attr("readonly", true);
                    $(this).attr("placeholder", "수정은 버튼을 눌러주세요");
                });
            });

            /* $(".li7").addClass("on");
            $(".topMenuLi:nth-child(2)").addClass("on"); */
        });
    </script>
    <%@ include file="/views/common/footer.jsp" %>
    <%@ include file="/views/common/chat.jsp" %> 
</body>

</html>