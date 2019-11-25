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
        th {
            text-align: left;
        }

        input[type=text] {
            border-radius: 10px;
            width: 300px;
            height: 30px;
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
    <div style="margin: 0 15%;">
		<h1 style="text-decoration: underline; text-underline-position: under;">선생님 업무분장</h1>
    </div>
    <%@ include file="/views/common/uBusiness.jsp" %>
    <script>
        $(function () {
            $(".li3").addClass("on");
            $(".topMenuLi:nth-child(2)").addClass("on");
            $(".topMenuLi").mouseover(function () {
                $(".li3").removeClass("on");
                $(".topMenuLi:nth-child(2)").removeClass("on");
            });
            $(".topMenuLi").mouseleave(function () {
                $(".li3").addClass("on");
                $(".topMenuLi:nth-child(2)").addClass("on");
            });
        });
    </script>

    <%@ include file="/views/common/footer.jsp" %>
    <%@ include file="/views/common/chat.jsp" %>
</body>

</html>