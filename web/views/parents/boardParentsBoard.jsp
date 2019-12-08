<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oracle5.board.model.vo.Board"%>
 <%@page import="java.util.ArrayList" %>
 <%@page import="com.oracle5.common.model.vo.PageInfo" %>
    <%
    	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
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
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 시멘틱ui -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
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
<style>
#outBox {
	margin: 50px 15%;	
}

#tableArea {
	width: 100%;
}

#no {
	width: 60px;
	text-align: center;
}

#title {
	width: 500px;
	text-align: center;
}

#writer {
	width: 120px;
	text-align: center;
}

#date {
	width: 100px;
	text-align: center;
}
#count {
    width: 60px;
    text-align: center;
}

#requestBtn {
	float: right;
}
        

#writeBtnArea{
       	
	padding-left: 85%;
}
input[type='button'] {
	width: 100px;
	height: 40px;
	border-radius: 10px;
	background: rgb(63, 63, 63);
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
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


   .boardTable>tbody>tr:hover{
      opacity:0.8;
      cursor: pointer;
     background: rgba(245, 245, 245, 0.802);
</style>
</head>
<body style="overflow-x:hidden">
	
	<%@include file="/views/common/parentsMenu.jsp" %>
	<div style="margin: 0 15%;">
		<h1 style="text-decoration: underline; text-underline-position: under;">학부모 게시판</h1>
	</div>
		<div id="outBox">
		<table class="ui celled table boardTable" id="tableArea">
			<thead>
				<tr>
					<th id="no">번호</th>
					<th id="title">제목</th>
                    <th id="writer">작성자</th>
                    <th id="count">조회수</th>
					<th id="date">작성일</th>
				</tr>
				<%for (Board b : list) {%>
				<tr>
				<td><%=b.getPno() %></td>
				<td><%=b.getTtitle() %></td>
				<td><%=b.getTwriter() %></td>
				<td><%=b.getTcount() %></td>
				<td><%=b.getTdate() %></td>
				</tr>
				<%} %>
				
			</thead>
			
			<tbody id="tbodyArea"> 
				<tr>
					<td id="no">3</td>
					<td id="title">24</td>
                    <td id="writer">박주호</td>
                    <td id="count">1</td>
					<td id="date">2019-05-05</td>
				</tr>

			</tbody>
		</table>
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%=request.getContextPath() %>/selectList.bo?currentPage=1'"><<</button>
			
			<% if(currentPage <= 1) { %>
			<button disabled><</button>
			<% }else { %>
			<button onclick="location.href='<%=request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage - 1 %>'"><</button>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++) {
				if(p == currentPage) {
			%>
				<button disabled><%=p %></button>
				<% } else { %>
				<button onclick="location.href='<%=request.getContextPath() %>/selectList.bo?currentPage=<%=p %>'"><%=p %></button>
				<% } %>
			<% } %>
			
			<% if(currentPage >= maxPage) { %>
			<button disabled>></button>
			<% }else { %>
			<button onclick="location.href='<%=request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage + 1 %>'">></button>
			<% } %>
			
			<button onclick="location.href='<%=request.getContextPath() %>/selectList.bo?currentPage=<%=maxPage %>'">>></button>
		</div>
		<br>
        <div id="searchArea">
                <input type="text" placeholder="Search" style="width:150px; height:30px;">
              <button class="searchBtn" style="width:100px; height:30px; margin: 0 .25em 0 0; background-color: #e0e0e0;
                      color: rgba(0,0,0,.6); ">Search</button>
              
              <button style="float:right; width:100px; height:30px;" class="writing">글쓰기</button>
              
        </div> 
	</div>
	<%@ include file="/views/common/chat.jsp"%>
	<%@include file="/views/common/footer.jsp" %>
</body>
</html>