<%@page import="com.oracle5.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.InetAddress"%>
<% InetAddress inet = InetAddress.getLocalHost();
		String svrIP = inet.getHostAddress();
		int svrPort = request.getServerPort();%>
<%
	Member loginUser = (Member) session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>메인 화면</title>
<style>
        html,
        body {
            width: 100%;
            height: 100%;
            margin: 0;
        }
        .center-outer {
            display: table;
            width: 100%;
            height: 100%;
        }

        .center-inner {
            display: table-cell;
            vertical-align: middle;
            text-align: center;
        }

        /* Essential CSS - Makes the effect work */

        body {
            background-color: #a1dd70;
        }

        .bubbles {
            display: inline-block;
            font-family: arial;
            position: relative;
        }

        .bubbles h1 {
            position: relative;
            margin: 1em 0 0;
            font-family: 'arial';
            font-size: 70px;
            color: #fff;
            z-index: 2;
        }

        .individual-bubble {
            position: absolute;
            border-radius: 100%;
            bottom: 10px;
            background-color: #fff;
            z-index: 1;
        }
    </style>

</head>

<body>
		<img alt="" src="<%=request.getContextPath() %>/images/logo.png" style="position: absolute; top: 35%; left: 34%; width: 500px;">
	<div align="center" style="height: 100%;">
	    <div class="center-outer">
	        <div class="center-inner">
	
	            <div class="bubbles" style="width: 500px; height: 200px;">
	                
	            </div>
	            <br>
	<%
		if (loginUser == null) {
	%>
	
	            <a href="views/signUp/login.jsp">
	                <button class="ui inverted button" style="margin: 30px;">Log In&nbsp;&nbsp;&nbsp;&nbsp;&&nbsp;&nbsp;&nbsp;&nbsp;Sign Up</button>
	            </a>

	<%
		} else {
	%>
	<div align="center">
		<h1 style="color: white; font-family: 'Noto Sans KR', sans-serif;"><%=loginUser.getMemberName()%>님 어서오세요!</h1>
		 	<button class="ui inverted button" onclick="location.href=<%if (loginUser.getUType().equals("교사")) {
																								if (loginUser.getMemberId().equals("admin")) {%>
																									'<%=request.getContextPath()%>/selectTodoList.todo'
																							<%} else {%>
																									'<%=request.getContextPath()%>/teacher'
																							<%}
																							} else if (loginUser.getUType().equals("학부모")) {%>
																									'<%=request.getContextPath()%>/selectChildCidServlet.me?pno=<%=loginUser.getMemberNo() %>'
																							<%}%>">메인으로 이동하기</button>
	</div>
	<%
		}
	%>
		        </div>
	    </div>
	</div>
	
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {

            // Define a blank array for the effect positions. This will be populated based on width of the title.
            var bArray = [];
            // Define a size array, this will be used to vary bubble sizes
            var sArray = [4, 6, 8, 10];

            // Push the header width values to bArray
            for (var i = 0; i < $('.bubbles').width(); i++) {
                bArray.push(i);
            }

            // Function to select random array element
            // Used within the setInterval a few times
            function randomValue(arr) {
                return arr[Math.floor(Math.random() * arr.length)];
            }

            // setInterval function used to create new bubble every 350 milliseconds
            setInterval(function () {

                // Get a random size, defined as variable so it can be used for both width and height
                var size = randomValue(sArray);
                // New bubble appeneded to div with it's size and left position being set inline
                // Left value is set through getting a random value from bArray
                $('.bubbles').append('<div class="individual-bubble" style="left: ' + randomValue(bArray) + 'px; width: ' + size + 'px; height:' + size + 'px;"></div>');

                // Animate each bubble to the top (bottom 100%) and reduce opacity as it moves
                // Callback function used to remove finsihed animations from the page
                $('.individual-bubble').animate({
                    'bottom': '100%',
                    'opacity': '-=0.7'
                }, 3000, function () {
                    $(this).remove()
                }
                );


            }, 350);

        });
    </script>
</body>

</html>