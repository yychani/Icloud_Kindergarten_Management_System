<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>일정표</title>
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
    <%@ include file="/views/common/teacherMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">일정표</h1>
    </div>
    <%@ include file="/views/common/schedule.jsp" %>
    
    
    <script>
        $(function () {
            var today = $(".date[bgcolor='#C9C9C9']");
            var todayVal = today.children(".dailyDate").val();
            $("#dateOutput").text(todayVal);
            function calColor() {
                $(".date").css("background", "white");
                today.css("background", "#C9C9C9");
                
            }
            $(".li:nth-child(7)").addClass("on");
      	  
            $(".topMenuLi:nth-child(2)").addClass("on");
           
            $(".topMenuLi").mouseover(function() {
              $(".li:nth-child(7)").removeClass("on");
              $(".topMenuLi:nth-child(2)").removeClass("on");
           });
          
            $(".topMenuLi").mouseleave(function() {
              $(".li:nth-child(7)").addClass("on");
              $(".topMenuLi:nth-child(2)").addClass("on");
           });

            $(".date").on("click", function(){
                calColor();
                var date = $(this).children(".dailyDate").val();
                $(this).css("background", "rgba(30, 143, 255, 0.432)")
                $("#dateOutput").text(date);
                console.log(date);
            });
        }); 
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>