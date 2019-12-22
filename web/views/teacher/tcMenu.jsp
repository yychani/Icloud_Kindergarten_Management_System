<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>식단표</title>
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

#class, #parents {
	width: 200px;
}

#children {
	margin-top: 20px;
	text-align: center;
}

.no, .name, .class, .parents {
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
	margin: 3px 0;
	text-align: center;
	background: none;
	border: 1px solid rgb(63, 63, 63);
	height: 40px;
	border-radius: 5px;
}

#dietmenu {
	width: 1000px;
	font-family: 'Noto Sans KR', sans-serif;
	margin: 50px; auto;
}

#dietmenu td {
	width: 14%;
	text-align: center;
}

#dietmenu tr:nth-of-type(2n+3) {
	height: 120px;
}

#dietmenu tr:nth-of-type(2n+4) {
	height: 60px;
}
.label {
	width: 100px;
	text-align: left;
}
.edit {
	margin-left: .75em;
	background-color: #1b1c1d;
	color: #fff;
	text-shadow: none;
	background-image: none;
	cursor: pointer;
	display: inline-block;
	min-height: 1em;
	outline: 0;
	border: none;
	vertical-align: baseline;
	font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;
	margin: 0 .25em 0 0;
	padding: .78571em 1.5em;
	text-transform: none;
	text-shadow: none;
	font-weight: 700;
	line-height: 1;
	font-style: normal;
	text-align: center;
	text-decoration: none;
	background-image: none;
	border-radius: .2857rem;
}
</style>
</head>

<body style="overflow-x: hidden">
    <%@ include file="/views/common/teacherMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">식단표</h1>
    </div>
   	<%@ include file="/views/common/dietTable.jsp" %>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>