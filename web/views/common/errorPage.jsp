<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String msg = (String) request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>


</head>
<style>
html, body
{
    height: 100%;
}

body
{
    display: table;
    margin: 0 auto;
}
#errorArea{
	margin:auto auto;
	height: 100%;
    display: table-cell;
    vertical-align: middle;
}
#mark{
    height: 80px;
    width: 80px;
}
#return{
    height:40px;
    width:40px;
}
</style>
</head>
<body>
	<div id="errorArea" align="center">
        <!-- <div id="icon"><i class="exclamation circle icon"></i></div> -->
            
        <img id="mark" src="<%=request.getContextPath() %>/images/round-error-symbol.png"><br><br><br>
        <p><%=msg%></p><br>
        <img id="return" src="<%=request.getContextPath() %>/images/reply-all-button.png" onclick="history.go(-1)">

	</div>
</body>
</html>

</html>