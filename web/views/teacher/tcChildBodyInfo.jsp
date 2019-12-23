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
        
        
        $.ajax({
        	url:"<%= request.getContextPath() %>/selectBanChildList.do",
        	type:"get",
        	data:{tno: $("#tno").val()},
        	success:function(data) {
        		$select = $("#childList");
        		$select.find("option").remove();
        		
        		for(var i = 0; i < data.length; i++) {
        			var name = data[i].name;
					var childname = $("h1").text();
					childname = childname.substring(0, childname.lastIndexOf(" "));
					var selected = (name == childname) ? "selected" : "";
					
        			$select.append("<option value='" + data[i].cId + "' " + selected + ">" + name + "</option>");
        		}
        	},
        	error:function() {
        		console.log("실패")
        	}
        });
        
        $("#childList").change(function() {
        	var cid = $(this).val();
        	location.href = '<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=' + cid;
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
	.childbutton {
		float:right;
	}
</style>
</head>
<body>
    <%@ include file="/views/common/teacherMenu.jsp" %>
    <input type="hidden" id="tno" value="<%= loginUser.getMemberNo() %>" />
	<div style="margin: 0 15%;">
 		<h1  align="center" style="text-decoration: underline; text-underline-position: under;"><%= list.get(0).getCName() %> 신체정보</h1>
 	</div>
 	<div class="outer">
 		<select name="childList" id="childList" style="float:right">
 			
 		</select>
 		<br />
 		<table class="ui red table" id="BiTable" border="1">
 			<tr>
 				<th>측정일</th>
 				<th>키</th>
 				<th>몸무게</th>
 			</tr>
 			<% if(list.get(0).getHeight() != 0) {
 			for(int i = 0; i < list.size(); i ++) { %>
 			<tr>
 				<td style="line-height:3;"><%= list.get(i).getBiDate() %></td>
 				<td><%= list.get(i).getHeight() %>cm</td>
 				<td><%= list.get(i).getWeight() %>kg</td>
 			</tr>
 			<% }
 			} %>
 			<tr>
        	<td colspan="3" style="padding-top: 10px;">
        		<div style="width: fit-content; margin: auto">
			<button style="width: 50px; height: 30px;" onclick="<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>&currentPage=<%=startPage%>">처음</button>
			<%
				if (currentPage <= 1) {
			%>
			<button style="width: 50px; height: 30px;" disabled>이전</button>
			<%
				} else {
			%>
			<button style="width: 50px; height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>&currentPage=<%=currentPage - 1%>'">이전</button>
			<%
				}
			%>
			<%
				for (int p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
			%>
			<button disabled class="current" style="width: 30px; height: 30px;"><%=p%></button>
			<%
				} else {
			%>
			<button class="other" style="width: 30px; height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>&currentPage=<%=p%>'"><%=p%></button>
			<%
				}
			%>
			<%
				}
			%>

			<%
				if (currentPage >= maxPage) {
			%>
			<button style="width: 50px; height: 30px;" disabled>다음</button>
			<%
				} else {
			%>
			<button style="width: 50px; height: 30px;" onclick="location.href='<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>&currentPage=<%=currentPage + 1%>'">다음</button>
			<%
				}
			%>
			<button style="width: 60px; height: 30px;"
				onclick="location.href='<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>&currentPage=<%=maxPage%>'">마지막</button>
		</div>
        	</td>
        </tr>
 		</table>
 	</div>
 	<div style="margin:10px 15%; height:40px;">
		<input type="button" class="childbutton" value="수정하기" onclick="location.href='<%= request.getContextPath() %>/selectChildBodyInfo.me?cid=<%= cid %>'+'&mod=1'"/>
		<p class="childbutton">&nbsp;&nbsp;</p>
		<input type="button" class="childbutton" value="목록으로" onclick="location.href='<%= request.getContextPath() %>/selectBanChildren.me'"/>
	</div>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>