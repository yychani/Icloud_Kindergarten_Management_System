<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*, com.oracle5.common.model.vo.*"%>
<% 
	ArrayList<BodyInfo> list = (ArrayList<BodyInfo>) request.getAttribute("list"); 
	int cid = Integer.parseInt(request.getParameter("cid"));
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int listCount = pi.getListCount();
	int limit = pi.getLimit(); 
	int maxPage = pi.getMaxPage(); 
	int startPage = pi.getStartPage(); 
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이 신체정보</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<script src="<%= request.getContextPath() %>/js/rolldate.min.js"></script>

<script>
    $(function() {
  	  $(".li:nth-child(9)").addClass("on");
   	  
        $(".topMenuLi:nth-child(1)").addClass("on");
       
        $(".topMenuLi").mouseover(function() {
          $(".li:nth-child(9)").removeClass("on");
          $(".topMenuLi:nth-child(1)").removeClass("on");
       });
      
        $(".topMenuLi").mouseleave(function() {
          $(".li:nth-child(9)").addClass("on");
          $(".topMenuLi:nth-child(1)").addClass("on");
       });
        
        new Rolldate({
        	el: '#date',
        	format: 'YYYY-MM-DD',
        	lang: {
        		title: '날짜를 선택하세요',
        		cancel : '취소',
        		confirm : '완료',
				year : '년',
				month : '월',
				day : '일'
        	}
        });
        
       	$(document).on("click", "#deletebtn", function() {
       		var bino = $(this).parent().parent().find("#bino").val();
       		
       		$.ajax({
       			url: "<%= request.getContextPath() %>/deleteBodyInfo.do",
       			type: "get",
       			data : {bino},
       			success : function(data) {
       				if(data === "성공") {
       					location.reload();
       				}
       			},
       			error : function() {
       				console.log("실패");
       			}
       		});
       	});
    });
</script>
<style>
	.outer {
		margin: 0 15%;
		padding-top: 10px;
	}
	#BiTable {
		margin: 0 auto;
		margin-top: 40px;
		width: 100%;
	}
	#BiTable th {
		text-align: center;
		width: 33%;
	}
	#BiTable td {
		text-align: center;
	}
	#BiTable tr:last-of-type {
		border: none;
	}
	.childbutton {
		float:right;
	}
	.input {
		text-align:center;
	}
	.listTd {
		width:33.3%;
	}
</style>
</head>
<body>

    <%@ include file="/views/common/teacherMenu.jsp" %>
	<div style="margin: 0 15%;">
 		<h1  align="center" style="text-decoration: underline; text-underline-position: under;"><%= list.get(0).getCName() %> 신체정보</h1>
 	</div>
 	<div class="outer">
 		<br />
 		<form action="<%= request.getContextPath() %>/insertBodyInfo.me" id="bisubmit">
	 		<table class="ui red table" id="BiTable" border="1">
	 			<tr>
	 				<th>측정일</th>
	 				<th>키</th>
	 				<th>몸무게</th>
	 			</tr>
	 			<% if(currentPage == 1) { %>
	 			<tr>
	 				<td><input type="text" id="date" name="date" class="input" /><input type="hidden" name="cid" value="<%= cid %>" /></td>
	 				<td><input type="text" id="height" name="height" class="input"/></td>
	 				<td><input type="text" id="weight" name="weight" class="input"/></td>
	 			</tr>
	 			<% } %>
	 			<% if(list.get(0).getHeight() != 0) {
	 			for(int i = 0; i < list.size(); i ++) { %>
	 			<tr>
	 				<td class="listTd"><input type="hidden" id="bino" name="bino" value="<%= list.get(i).getBiNo() %>" /><%= list.get(i).getBiDate() %></td>
	 				<td class="listTd"><%= list.get(i).getHeight() %>cm</td>
	 				<td class="listTd">
	 					<label style="line-height:3; margin-left:27%;"><%= list.get(i).getWeight() %>kg</label>
	 					<input type="button" id="deletebtn" value="삭제하기" style="float:right" />
	 				</td>
	 			</tr>
	 			<% }
	 			} %>
	 			<tr>
 			<td colspan="3" style="padding-top: 10px;">
       		<div style="width: fit-content; margin: auto">
			<input type="button" style="width: 50px; height: 30px;" onclick="<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>&mod=1&currentPage=<%=startPage%>" value="처음">
			<%
				if (currentPage <= 1) {
			%>
			<input type="button" style="width: 50px; height: 30px;" disabled value="이전">
			<%
				} else {
			%>
			<input type="button" style="width: 50px; height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>&mod=1&currentPage=<%=currentPage - 1%>'" value="이전">
			<%
				}
			%>
			<%
				for (int p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
			%>
			<input type="button" disabled class="current" style="width: 30px; height: 30px;" value="<%= p %>">
			<%
				} else {
			%>
			<input type="button" class="other" style="width: 30px; height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>&mod=1&currentPage=<%=p%>'" value="<%= p %>">
			<%
				}
			%>
			<%
				}
			%>

			<%
				if (currentPage >= maxPage) {
			%>
			<input type="button" style="width: 50px; height: 30px;" disabled value="다음">
			<%
				} else {
			%>
			<input type="button" style="width: 50px; height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>&mod=1&currentPage=<%=currentPage + 1%>'" value="다음">
			<%
				}
			%>
			<input type="button" style="width: 60px; height: 30px;"
				onclick="location.href='<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>&mod=1&currentPage=<%=maxPage%>'" value="마지막">
		</div>
        	</td>
        </tr>
	 		</table>
 		</form>
 	</div>
 	<div style="margin:10px 15%; height:40px;">
		<input type="button" class="childbutton" value="수정완료" onclick="insSubmit();"/>
		<p class="childbutton">&nbsp;&nbsp;</p>
		<input type="button" class="childbutton" value="목록으로" onclick="location.href='<%= request.getContextPath() %>/selectBanChildren.me'"/>
	</div>
	<script>
		function insSubmit() {
			var d = 1;
			var h = 1;
			var w = 1;
			if($("#date").val() === "") {
				alert("날짜를 선택해주세요.")
				d = 0;
			} else if($("#height").val() == 0) {
				alert("키를 입력해주세요.");
				h = 0;
			} else if($("#weight").val() == 0) {
				alert("체중을 입력해주세요.")
				w = 0;
			} 
			
			if(d + h + w == 3) {
			   $("#bisubmit").submit();
			}
		}
	</script>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>