<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.ArrayList, com.oracle5.board.model.vo.Board"%>
    
     <% 
    	ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
    
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
    	  
          $(".topMenuLi:nth-child(1)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(3)").removeClass("on");
            $(".topMenuLi:nth-child(1)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(3)").addClass("on");
            $(".topMenuLi:nth-child(1)").addClass("on");
         });
          
          $(".writing").click("click", function(){
   			location.href="tcWriteNotice.jsp";
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
 	<%@ include file="/views/common/teacherMenu.jsp" %>
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
					<td id="no"><%=b.getTid() %></td>
					<td id="title"><%=b.getTtitle() %></td>
                    <td id="writer"><%=b.getTno() %></td>
                    <td id="count"><%=b.getTcount() %></td>
					<td id="date"><%=b.getTtime() %></td>
				</tr>
				<%} %>
				
			</tbody>
		</table>
		<br>
        <div id="searchArea">
                <input type="text" placeholder="Search" style="width:150px; height:30px;">
              <button class="searchBtn" style="width:100px; height:30px; margin: 0 .25em 0 0; background-color: #e0e0e0;
                      color: rgba(0,0,0,.6); ">Search</button>
              
              <button style="float:right; width:100px; height:30px;" class="writing" >글쓰기</button>
              
        </div> 
	</div>
 	
 	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
    <script>
    $(function(){
    	$(".writing").click(function(){
    		location.href="./views/teacher/tcWriteNotice.jsp";
    	});
    });
    
    $(function(){
    	$("#tableArea td").click(function(){
    		var num = $(this).parent().children().eq(0).text();
    		
    		console.log(num);
    		location.href="<%=request.getContextPath()%>/selectOneBanBoard.bo?num="+num;
    		
    	});
    	
    });
    
    </script>
</body>
</html>