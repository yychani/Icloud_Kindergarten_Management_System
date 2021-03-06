<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>알림장 날짜 선택</title>
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
        
        .ui.basic.modal {
        	top:35%;
        	left:20%;
        }
    </style>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/teacherMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">알림장 날짜 선택</h1>
    </div>
    <%@ include file="/views/common/calendar.jsp" %>
 
    <div class="ui basic modal">
  		<div class="ui icon header">
    		<i class="bullhorn icon"></i>
    		준비물을 입력하세요 !
  		</div>
  		<div class="content"  align="center">
  			<div class="ui input" style="width: 400px;">
  				<input type="text" id="materials"/>
  			</div>
  		</div>
  		<div class="actions">
    		<div class="ui red basic cancel inverted button">
      			<i class="remove icon"></i>
      				취소
    		</div>
    		<div class="ui green ok inverted button" onclick="page_move('<%= request.getContextPath() %>/selectChildNote.me', date, $('#materials').val());">
      			<i class="checkmark icon"></i>
      				확인
   			</div>
		</div>
	</div>
    
    
    <script>
        $(function () {
            var today = $(".date[bgcolor='#C9C9C9']");
            var todayVal = today.children(".dailyDate").val();
            function calColor() {
                $(".date").css("background", "white");
                today.css("background", "#C9C9C9");
                
            }
            $(".li:nth-child(5)").addClass("on");
      	  
            $(".topMenuLi:nth-child(1)").addClass("on");
           
            $(".topMenuLi").mouseover(function() {
              $(".li:nth-child(5)").removeClass("on");
              $(".topMenuLi:nth-child(1)").removeClass("on");
           });
          
            $(".topMenuLi").mouseleave(function() {
              $(".li:nth-child(5)").addClass("on");
              $(".topMenuLi:nth-child(1)").addClass("on");
           });

            $(".date").on("click", function(){
                calColor();
                $('.ui.basic.modal').modal('show');
                date = $(this).children(".dailyDate").val();
                $(this).css("background", "rgba(30, 143, 255, 0.432)")
                date = date.split(" ");
                date = date[0].substring(0, date[0].length - 1) + "-" + date[1].substring(0, date[1].length - 1) + "-" + date[2].substring(0, date[2].length - 1)
            });
        }); 
        
        function page_move(url, date, met) {
        	var form = document.createElement("form");
        	
        	form.action = url;
        	form.method = "post";
        	
        	inputDate = document.createElement("input");
        	inputDate.setAttribute("type", "hidden");
        	inputDate.setAttribute("name", "date");
        	inputDate.setAttribute("value", date);
        	form.appendChild(inputDate);
        	
        	inputMet = document.createElement("input");
        	inputMet.setAttribute("type", "hidden");
        	inputMet.setAttribute("name", "met");
        	inputMet.setAttribute("value", met);
        	form.appendChild(inputMet);
        	
        	document.body.appendChild(form);
        	
        	form.submit();
        }
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>