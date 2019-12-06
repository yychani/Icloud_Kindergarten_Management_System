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
        <h1 style="text-decoration: underline; text-underline-position: under;">원장 알림장</h1>
    </div>
    <%@ include file="/views/common/calendar.jsp" %>
    <div style="margin: 5px auto; width: fit-content; min-width: 712px;">
        <label>날짜 : </label><span id="dateOutput"></span><br><br>
        <label>내용</label><br>
        <textarea name="dateCont" id="dateCont" cols="100" rows="5" readonly></textarea>
        <input type="hidden" name="dateVal" id="dateVal"><br>
        <input type="button" name="edit" id="edit" value="수정하기"><input type="hidden" name="editComplete" id="editComplete" value="수정완료"> 
    </div>
    <script>
        $(function () {
            var today = $(".date[bgcolor='#C9C9C9']");
            var todayVal = today.children(".dailyDate").val();
            var todayVal1 = today.children(".dailyDate1").val();
            
            $("#dateOutput").text(todayVal);
            $("#dateVal").val(todayVal1);
            
            $.ajax({
            	url:"/main/selectPreNote.pre",
            	data:{
            		date:todayVal1
            	},
            	type:"post",
                success:function(data){
                	$("#dateCont").text(data);
                }
            });
            
            function calColor() {
                $(".date").css("background", "white");
                today.css("background", "#C9C9C9");
                
            }
            $(".li2").addClass("on");
            $(".topMenuLi:nth-child(1)").addClass("on");

            $(".topMenuLi").mouseover(function () {
                $(".li2").removeClass("on");
                $(".topMenuLi:nth-child(1)").removeClass("on");
            });
            $(".topMenuLi").mouseleave(function () {
                $(".li3").addClass("on");
                $(".topMenuLi:nth-child(1)").addClass("on");
            });
           
            $(".date").on("click", function(){
                calColor();
                var date = $(this).children(".dailyDate").val();
                var date1 = $(this).children(".dailyDate1").val();
                $(this).css("background", "rgba(30, 143, 255, 0.432)")
                $("#dateOutput").text(date);
                $("#dateVal").val(date1);
                
                $.ajax({
                	url:"/main/selectPreNote.pre",
                	data:{
                		date:date1
                	},
                	type:"post",
                    success:function(data){
                    	$("#dateCont").val("");
                    	$("#dateCont").val(data);
                    }
                })
            });

            $("#edit").on("click", function() {
                $("#dateCont").prop("readonly", false);
                $("#editComplete").prop("type", "button");
                $(this).prop("type", "hidden");
            });
            $("#editComplete").on("click", function() {
                $("#dateCont").prop("readonly", true);
                $("#edit").prop("type", "button");
                $(this).prop("type", "hidden");
                var dateVal = $("#dateVal").val();
                var dateCont = $("#dateCont").val();
                $.ajax({
                	url:"/main/InsertPreNote.pre",
                	data:{
                		date:dateVal,
                		dateCont:dateCont
                	},
                	type:"post",
                	success:function(data){
                		console.log(data);
                	}
                });
            });
        }); 
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>