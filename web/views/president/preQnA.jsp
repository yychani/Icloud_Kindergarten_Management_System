<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    #teacher {
        border-radius: 10px;
        background: rgba(216, 216, 216, 0.486);
    }

    #pictureTd {
        width: 300px;
        height: 250px;
        padding-right: 0;
    }

    #picture {
        width: 250px;
        height: 250px;
        border: 1px solid black;
    }

    th {
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        background: rgba(216, 216, 216, 0.486);
    }

    #no {
        width: 50px;
    }

    #name {
        width: 120px;
    }

    #class,
    #parents {
        width: 200px;
    }

    #children {
        margin-top: 20px;
        text-align: center;
    }

    .no,
    .name,
    .class,
    .parents {
        padding: 5px 0;
        border-bottom: 1px solid black;
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
        background: rgba(30, 143, 255, 0.432);
    }
</style>
</head>
<body style="overflow-x: hidden">
	<%@ include file="/views/common/presidentMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">건의 문의</h1>
    </div>
    <%@ include file="/views/common/qna.jsp" %>
    <script>
		$(".li12").addClass("on");
		$(".topMenuLi:nth-child(6)").addClass("on");
		
		$(".topMenuLi").mouseover(function () {
		    $(".li12").removeClass("on");
		    $(".topMenuLi:nth-child(6)").removeClass("on");
		});
		$(".topMenuLi").mouseleave(function () {
		    $(".li12").addClass("on");
		    $(".topMenuLi:nth-child(6)").addClass("on");
		});
	</script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>
</html>