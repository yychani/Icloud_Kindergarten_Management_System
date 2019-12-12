<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
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
        .menu {
        	width: 900px;
        }
        .menu td {
        	width: 14%;
        } 
        .menu tr:nth-of-type(2n+3) {
        	height: 120px;
        }
        .menu tr:nth-of-type(2n+4) {
        	height: 60px;
        }
    
</style>
<script>
    $(function (){
    	 $(".li7").addClass("on");
         $(".topMenuLi:nth-child(2)").addClass("on");

         $(".topMenuLi").mouseover(function () {
             $(".li7").removeClass("on");
             $(".topMenuLi:nth-child(2)").removeClass("on");
         });
         $(".topMenuLi").mouseleave(function () {
             $(".li7").addClass("on");
             $(".topMenuLi:nth-child(2)").addClass("on");
         });
    });
    </script>
</head>
<body>
	<%@ include file="/views/common/presidentMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">식단표</h1>
    </div>
   	<%@ include file="/views/common/dietTable.jsp" %>
   	<script>
   		
   	</script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>
</html>