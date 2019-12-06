<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>반 공통 알림장</title>
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
    </style>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/parentsMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">식단표</h1>
    </div>
   <div>
   		<table border=1 class="menu">
   			<tr style="height:60px; background:gray">
   				<td><button>prev</button></td>
   				<td colspan="5"><span>11월 1주</span></td>
   				<td><button>next</button></td>
   			</tr>
   			<tr style="height:40px; background:lightgray">
   				<td></td>
   				<td>월</td>
   				<td>화</td>
   				<td>수</td>
   				<td>목</td>
   				<td>금</td>
   				<td>토</td>
   			</tr>
   			<tr>
   				<td>아침</td>
   				<td>백미밥<br />배추김치<br />콩나물국<br />돼지고기장조림<br />버섯볶음</td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   			</tr>
   			<tr>
   				<td>오전 간식</td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   			</tr>
   			<tr>
   				<td>점심</td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   			</tr>
   			<tr>
   				<td>오후 간식</td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   			</tr>
   			<tr>
   				<td>저녁</td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   				<td></td>
   			</tr>
   		</table>
   </div>
   <script>
   	
	//메뉴바 고정
	$(function() {
	    $(".li1").addClass("on");
	    $(".topMenuLi:nth-child(1)").addClass("on");

	    $(".topMenuLi").mouseover(function() {
	       $(".li1").removeClass("on");
	       $(".topMenuLi:nth-child(1)").removeClass("on");
	    });
	    $(".topMenuLi").mouseleave(function() {
	       $(".li1").addClass("on");
	       $(".topMenuLi:nth-child(1)").addClass("on");
	    });

	 }); 
   
   
   
   </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>