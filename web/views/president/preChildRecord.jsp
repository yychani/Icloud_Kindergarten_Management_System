<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="com.oracle5.member.model.vo.Ban"%>
<%@page import="com.oracle5.common.model.vo.PageInfo"%>
<%@page import="com.oracle5.member.model.vo.Parents"%>
<%@page import="com.oracle5.member.model.vo.Children"%>
<%@page import="java.util.HashMap"%>
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
        input:focus {outline:none;}
    </style>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/presidentMenu.jsp"%>
    <%@ include file="/views/common/recordBook.jsp" %>
    <div style="margin: 0 15%; height:50px;">
		<input type="button" value="뒤로가기" style="float:right; background:lightgray; color:black" onclick="history.go(-1);" />
		<span style="float:right">&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<input type="button" value="인쇄하기" id="print" style="float:right; background:lightgray; color:black" />
	</div>
    <script> 
        $(function () {
            $(".topMenuLi:nth-child(5)").addClass("on");

            $(".topMenuLi").mouseover(function () {
                $(".topMenuLi:nth-child(5)").removeClass("on");
            });
            $(".topMenuLi").mouseleave(function () {
                $(".topMenuLi:nth-child(5)").addClass("on");
            });
            $(".detailBtn").on("click", function(){
            	var cId = $(this).parent().siblings("input[type=hidden]").val();
            	location.href = "<%=request.getContextPath() %>/childRecordBook.me?cId=" + cId;
            });
            $("#print").click(function() {
                window.print();
            });
        }); 
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
    
    
</body>

</html>