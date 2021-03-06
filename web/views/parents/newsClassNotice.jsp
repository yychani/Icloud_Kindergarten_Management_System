<%@page import="com.oracle5.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, com.oracle5.board.model.vo.Board, com.oracle5.member.model.vo.Children"%>
    
     <% 
     	
    	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
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
<title>반 공지사항</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
<script>
$(function() {
 	  $(".li:nth-child(3)").addClass("on");
 	  
       $(".topMenuLi:nth-child(2)").addClass("on");
      
       $(".topMenuLi").mouseover(function() {
         $(".li:nth-child(3)").removeClass("on");
         $(".topMenuLi:nth-child(2)").removeClass("on");
      });
     
       $(".topMenuLi").mouseleave(function() {
         $(".li:nth-child(3)").addClass("on");
         $(".topMenuLi:nth-child(2)").addClass("on");
      });
   });
</script>
<style>
 .writing > button {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
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
     }
</style>
</head>
<body>
 	<%@ include file="/views/common/parentsMenu.jsp" %>
 	<div style="margin: 0 15%;">
 	<h1 style="text-decoration: underline; text-underline-position: under;">반 공지사항</h1>
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
			</thead>
			<tbody id="tbodyArea"> 
			<%for(Board b : list) { %> 
				<tr>
					<td id="no"><%=b.getTid() %><input type="hidden" name="tid" id="tid" value="<%=b.getTid() %>">
					<input type="hidden" name="pno" id="pno" value="<%=b.getPno()%>"></td>
					<td id="title"><%=b.getTtitle() %></td>
                    <td id="writer"><%=b.getName()%></td>
                    <td id="count"><%=b.getTcount() %></td>
					<td id="date"><%=b.getTtime() %></td>
				</tr>
				<%} %>
				
			</tbody>
		</table>
	<div style="width: fit-content; margin: auto">
		<button style="width: 50px; height: 30px;" onclick="<%=request.getContextPath()%>/selectAllBanList?currentPage=<%=startPage%>">처음</button>
		<%
			if(currentPage <= 1){
		%>
		<button style="width:50px; height:30px;" disabled>이전</button>
		<%
			}else { 
		%>
		<button style="width:50px; height:30px;" onclick="location.href='<%=request.getContextPath()%>/selectAllBanList?currentPage=<%=currentPage -1%>'">이전</button>
		<%
			} 
		%>
		<%
			for(int p = startPage; p <= endPage; p++){
				if(p == currentPage){
			
		%> 
		<button disabled class="curent" style="width:30px; height:30px;"><%=p %></button>
		<%
			}else{
		%>
		<button class="other" style="width:30px; height:30px;" onclick="location.href='<%=request.getContextPath()%>/selectAllBanList?currentPage=<%=p%>'"><%=p %></button>
		<%
			}
		%>
		<%
			}
		%>
		
		<%
			if(currentPage >= maxPage) {
		%>
		<button style="width:50px; height:30px;" disabled>다음</button>
		<%
			} else { 
		%>
		<button style="width:50px; height:30px;" onclick="location.href='<%=request.getContextPath()%>/selectAllBanList?currentPage=<%=currentPage +1%>'">다음</button>
		<%
			} 
		%>
		<button style="width: 60px; height:30px;"
				onclick="location.href='<%=request.getContextPath()%>/selectAllBanList?currentPage=<%=maxPage%>'">마지막</button>
		</div>
		
		<br>
		<form action="<%=request.getContextPath()%>/searchBan.bo" method="post" onsubmit="return check();">
        <div id="searchArea">
               <div class="ui action input">
  					<input type="text" id="cont" name="text1" placeholder="Search..." style="width:170px; height:45px;">
  					<input type="hidden" name="bdid" value="4">
  					<input type="hidden" name="user" value="3">
 				    <select class="ui compact selection dropdown" name="select" style="height:45px;">
    				<option selected="" value="all">전체</option>
   				 	<option value="title1">제목</option>
    				<option value="name1">작성자</option>
  					</select>
  					<button class="ui button" type="submit">찾기</button>
				</div>
        </div> 
        </form>
              <%if((loginUser.getUType()).equals("교사")) {%>
              <button style="float:right; width:100px; height:30px;" class="writing" >글쓰기</button>
              <%} %>
	</div>
 	

    <script>
    $(function(){
    	$(".writing").click(function(){
    		location.href="./views/teacher/tcWriteNotice.jsp";
    	});
    });
    
    $(function(){
    	$("#tableArea td").click(function(){
    		var num = $(this).parent().children().eq(0).children().val();
    		
    		console.log(num);
    		location.href="<%=request.getContextPath()%>/selectOneBanBoard.bo?num="+num;
    		
    		
    	});
    	
    });
    function check(){
		if($("#cont").val() == ""){
			alert("검색할 내용을 입력하세요.");
			return false;
		} else {
			return true;
		}

	}
    </script>
    <%@ include file="/views/common/footer.jsp" %>
 	<%@ include file="/views/common/chat.jsp" %>
</body>
</html>