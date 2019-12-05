<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
</head>
<style>
	#textArea{
		margin-left: 1000px;
	}	
	#tableArea{
 	   	width:300px;
      	height:250px;
      	margin-left:auto;
     	margin-right:auto;
 		text-align: center;	
	}

	button {
		width: 80px;
		height: 30px;
		border-radius: 10px;
		background: skyblue;
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
		}
		
		.imgi:hover{
		padding: 10px 10px;
		cursor:pointer;
		
		}

		.ui.dividing.header{
			width: 1000px;
			margin: 0 auto;
		}
		.TBtn{
			margin-left:1000px;
		
		}
</style>
<body>
	<%@ include file="/views/common/parentsMenu.jsp"%>
	<h2 style="margin: 0 15%;" >아이들 사진 갤러리</h2>
	<h2 align="center">사진 제목</h2>
	<div class="ui dividing header" align="center"></div>
	<label id="textArea">2019 -12 - 19</label>
	<form>
		<div align="center">
			<table id="tableArea">
			<tr id="trArea">
				<td colspan="2"><img class="imgi"src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="2">&nbsp;</td>	
			</tr>
			<tr>
				<td	colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>

			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
				
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><img class="imgi" src="<%=request.getContextPath() %>/images/child.png"></td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td	colspan="4">&nbsp;</td>
			</tr>
	
			
			</table>
			<table align="center">
			<tr>
				<td rowspan="4"><label>오늘 아이들 가을 소풍 갔다왔어요</label></td>
			</tr>
			
			
			</table>
		</div>
		
	</form>
	<button class="TBtn">뒤로가기</button>
	<br><br>
	
	
	
	
	
	<script>
    $(function() {
        $(".li1").addClass("on");
        $(".topMenuLi:nth-child(2)").addClass("on");

        $(".topMenuLi").mouseover(function() {
           $(".li1").removeClass("on");
           $(".topMenuLi:nth-child(2)").removeClass("on");
        });
        $(".topMenuLi").mouseleave(function() {
           $(".li1").addClass("on");
           $(".topMenuLi:nth-child(2)").addClass("on");
        });

     });  
	</script>
	<%@ include file="/views/common/footer.jsp"%>
	<%@ include file="/views/common/chat.jsp"%>
</body>
</html>