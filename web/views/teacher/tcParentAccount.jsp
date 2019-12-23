<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학부모 계정관리</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    <script>
      $(function() {
    	currentPage = 1;
    	  fpaging();
    	  <%-- 선택한 select에 따라서 내용 수정 및 페이징 --%>
    	  $("#selectList").change(function() {
    		  if($("#selectList").val() === "승인요청내역") {
    			  $("#subBtn").show();
				  currentPage = 1;
    			  fpaging();
       		  } else if($("#selectList").val() === "이전요청내역") {
       				$("#subBtn").hide();
				 	currentPage = 1;
       			  	fpaging2();
       		  }
    	  })
   		 
   		 
    	
    	  <%-- 메뉴 활성화 --%>
    	  $(".li:nth-child(11)").addClass("on");
    	  
          $(".topMenuLi:nth-child(1)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(11)").removeClass("on");
            $(".topMenuLi:nth-child(1)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(11)").addClass("on");
            $(".topMenuLi:nth-child(1)").addClass("on");
         });
          
          <%-- 아이 이름 부분 클릭 시 모달에 아이 정보 넣어서 보여줌 --%>
      	$(document).on("click",".pAccountList tr>td:nth-of-type(2)", function(){
      		var cid = $(this).parent().find($("[name=cid]")).val();
      		$.ajax({
      			url:"<%=request.getContextPath()%>/selectModalChild.do",
      			type:"get",
      			data:{cid:cid},
      			success:function(data) {
      				var splitrno = data.rno.split("-");
      				var name = data.name;
      				$("#childName").text("이름 : " + name);
      				
      				var birth = splitrno[0];
      				var year = splitrno[0].substring(0,2);
      				year = year > 50 ? "19" + year : "20" + year;
      				var month = splitrno[0].substring(2,4);
      				var day = splitrno[0].substring(4,6);
      				birth = year + "년 " + month + "월 " + day + "일";
      				$("#childBirth").text("생년월일 : " + birth);
      				
      				var gender = splitrno[1].substring(0,1) == 1 ? '남' : '여';
      				$("#childGender").text("성별 : " + gender);
      				
      				var imgSrc ="<%=request.getContextPath()%>/" + data.imgSrc.substring(data.imgSrc.lastIndexOf('\\') + 1);
      				$("#childImg").attr("src", imgSrc);
      			},
      			error:function(request, status, error){   
      				alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error); 
      			}

      		});
      		
      		
      		$('.ui.modal').modal('show');
      	});      
      }); 

    <%-- 미승인 리스트 페이징 --%>
	  function fpaging() {
         	 $.ajax({
				url:"<%=request.getContextPath()%>/notApprovalList.do",
				type:"get",	
				data:{currentPage:currentPage},
				success:function(data) {
           		$tableBody = $(".pAccountList tbody tr:nth-of-type(1)");
   				paging = data.pi;
				$(".pAccountList tbody tr:nth-of-type(n+2)").remove();
           		$.each(data.list, function(index, value){
           		  	var cid = value.children.cId;
           		 	var mno = value.member.memberNo;
           			var $tr = $("<tr>");
           			var $noTd = $("<td>").text(value.rownum);
           			var $cnameTd = $("<td>").text(value.children.name);
           			var $pnameTd = $("<td>").text(value.member.memberName)
           			var $approval = $("<td>").html("<input type='checkbox' name='accept' class='accept'> <input type='hidden' name='cid' value=" + cid+ "><input type='hidden' name='mno' value=" + mno +">");
           			 
           			 
           			$tr.append($noTd);
           			$tr.append($cnameTd);
           			$tr.append($pnameTd);
           			$tr.append($approval);
           			 
           			$tableBody.after($tr);
           		  });
           		  
           		$(".pagination").empty();  //페이징에 필요한 객체내부를 비워준다.

       	     	    if(paging.currentPage != 1){            // 페이지가 1페이지 가아니면
       	        		$(".pagination").append("<li class=\"goFirstPage\"><a><<</a></li>");        //첫페이지로가는버튼 활성화
       	       		}else{
       	        		$(".pagination").append("<li class=\"disabled\"><a><<</a></li>");        //첫페이지로가는버튼 비활성화
         	       	}
         	        
         	     	if((Number(paging.currentPage) % 10) != 1){            //첫번째 블럭이 아니면
         	        	$(".pagination").append("<li class=\"goBackPage\"><a><</a></li>");        //뒤로가기버튼 활성화
         	        } else {
         	        	$(".pagination").append("<li class=\"disabled\"><a><</a></li>");        //뒤로가기버튼 비활성화
         	        }
           		  
         	        for(var i = paging.startPage ; i <= paging.maxPage ; i++){        //시작페이지부터 종료페이지까지 반복문
         	        	if(paging.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
       	                	$(".pagination").append("<li class=\"disabled active\"><a>"+i+"</a></li>");    //버튼 비활성화
         	        	}else{
         	        		$(".pagination").append("<li class=\"goPage\" data-page=\""+i+"\"><a>"+i+"</a></li>"); //버튼 활성화
         	        	}
         	        }

         	      	if(paging.currentPage < paging.endPage){            //전체페이지블럭수가 현재블럭수보다 작을때
       	        		$(".pagination").append("<li class=\"goNextPage\"><a>></a></li>");         //다음페이지버튼 활성화
	       	        }else{
       	        		$(".pagination").append("<li class=\"disabled\"><a>></a></li>");        //다음페이지버튼 비활성화
       	       	 	}

                   if(paging.currentPage < paging.maxPage){                //현재페이지가 전체페이지보다 작을때
                 		$(".pagination").append("<li class=\"goLastPage\"><a>>></a></li>");    //마지막페이지로 가기 버튼 활성화
                 	}else{
                 		$(".pagination").append("<li class=\"disabled\"><a>>></a></li>");        //마지막페이지로 가기 버튼 비활성화
                 	}
           	  	}
       
             });
      	}
	  <%-- 승인리스트 페이징 --%>
	  function fpaging2() {
      	 $.ajax({
				url:"<%=request.getContextPath()%>/acceptApproval.do",
				type:"get",	
				data:{currentPage:currentPage},
				success:function(data) {
        		$tableBody = $(".pAccountList tbody tr:nth-of-type(1)");
				paging = data.pi;
				$(".pAccountList tbody tr:nth-of-type(n+2)").remove();
        		$.each(data.list, function(index, value){
        		  	var cid = value.children.cId;
        		 	var mno = value.member.memberNo;
        			var $tr = $("<tr>");
        			var $noTd = $("<td>").text(value.rownum);
        			var $cnameTd = $("<td>").text(value.children.name);
        			var $pnameTd = $("<td>").text(value.member.memberName)
        			var entdate = value.parents.pEntDate;
        			entdate = entdate.substring(7) + "년 " + entdate.substring(0,2) + "월 " + entdate.substring(4,5) + "일";
        			var $approval = $("<td>").html("<label>" + entdate + "</label> <input type='hidden' name='cid' value=" + cid+ "><input type='hidden' name='mno' value=" + mno +">");
        			 
        			 
        			$tr.append($noTd);
        			$tr.append($cnameTd);
        			$tr.append($pnameTd);
        			$tr.append($approval);
        			 
        			$tableBody.after($tr);
        		  });
        		  
        		$(".pagination").empty();  //페이징에 필요한 객체내부를 비워준다.

    	     	    if(paging.currentPage != 1){            // 페이지가 1페이지 가아니면
    	        		$(".pagination").append("<li class=\"goFirstPage\"><a><<</a></li>");        //첫페이지로가는버튼 활성화
    	       		}else{
    	        		$(".pagination").append("<li class=\"disabled\"><a><<</a></li>");        //첫페이지로가는버튼 비활성화
      	       	}
      	        
      	     	if((Number(paging.currentPage) % 10) != 1){            //첫번째 블럭이 아니면
      	        	$(".pagination").append("<li class=\"goBackPage\"><a><</a></li>");        //뒤로가기버튼 활성화
      	        } else {
      	        	$(".pagination").append("<li class=\"disabled\"><a><</a></li>");        //뒤로가기버튼 비활성화
      	        }
        		  
      	        for(var i = paging.startPage ; i <= paging.maxPage ; i++){        //시작페이지부터 종료페이지까지 반복문
      	        	if(paging.currentPage == i){                            //현재페이지가 반복중인 페이지와 같다면
    	                	$(".pagination").append("<li class=\"disabled active\"><a>"+i+"</a></li>");    //버튼 비활성화
      	        	}else{
      	        		$(".pagination").append("<li class=\"goPage\" data-page=\""+i+"\"><a>"+i+"</a></li>"); //버튼 활성화
      	        	}
      	        }

      	      	if(paging.currentPage < paging.endPage){            //전체페이지블럭수가 현재블럭수보다 작을때
    	        		$(".pagination").append("<li class=\"goNextPage\"><a>></a></li>");         //다음페이지버튼 활성화
	       	        }else{
    	        		$(".pagination").append("<li class=\"disabled\"><a>></a></li>");        //다음페이지버튼 비활성화
    	       	 	}

                if(paging.currentPage < paging.maxPage){                //현재페이지가 전체페이지보다 작을때
              		$(".pagination").append("<li class=\"goLastPage\"><a>>></a></li>");    //마지막페이지로 가기 버튼 활성화
              	}else{
              		$(".pagination").append("<li class=\"disabled\"><a>>></a></li>");        //마지막페이지로 가기 버튼 비활성화
              	}
        	  	}
    
          });
   	}
	  $(function() {
		  $("#subBtn").click(function(){
				var accept = [];
				var mno = [];
				accept = $(".accept:checked");
				accept.each(function(index, value) {
					mno[index] = $(this).parent().children("[name=mno]").val();
				});
				var data = {"mno" : mno};
				$.ajax({
					url:"<%= request.getContextPath() %>/parentAccept.me",
					type:"get",
					data:data,
					success:function(data) {
						location.reload();
					}
				});
		  });
	  });
	  
</script>
<style>
	.pAccountList {
		width:100%;
	}
	.pAccountList>th,td {
		border-top:1px solid lightgray;
		border-bottom:1px solid lightgray;
	}
	input[type='submit'] {
		width: 100px;
		height: 40px;
		border-radius: 10px;
		background: rgb(63, 63, 63);
		color: white;
		font-weight: bold;
		border: none;
		cursor: pointer;
	}
	.clickable {cursor: pointer;}
	.hover {text-decoration: underline;}
	.odd{ background: #FFC;}
	.even{ background: #FF9;}
	.active{ width:10px; height:20px; }
	 .pagination {
		 text-align:center;
	 }
	 .pagination li {
		 margin: 10px;
		 display: inline-block;
	 }
	 .pagination li:hover{
		 cursor:pointer;
	 }
	 #selectList{
	   width:161px;
	   height:34px;
	   border-radius:4px;
	}
	.ui .modal {
		top:25%;
		left:20%;
	}
	.ui.labeled.icon.button>.icon:before {
		top: 67% !important;
	}
	.list{
		padding: 50px;
	}
</style>

</head>
<body>
    <%@ include file="/views/common/teacherMenu.jsp" %>
    <div class="list">
		<h1 align="center">해바라기반 원아 목록</h1>
	</div>

	<div style="margin: 0 20%;">
		<select name="selectList" id="selectList">
			<option value="승인요청내역" selected>승인요청내역</option>
			<option value="이전요청내역">이전요청내역</option>
		</select>
		
		<table class="pAccountList ui celled table" style="text-align:center">
			<tr style="background:#e3fad0">
				<th style="width:10%; height:50px;">번호</th>
				<th style="width:30%; height:50px;">원아명</th>
				<th style="width:30%; height:50px;">학부모 성함</th>
				<th style="width:20%; height:50px;">승인</th>
			</tr>
		</table>
		
	</div>
	<ul class="pagination">

	
	</ul> 
	<div style="margin: 0 20%; height:50px;">
		<input id="subBtn" type="button" value="승인완료" style="float:right"/>
	</div>

    <div class="ui modal">
	  <i class="close icon"></i>
	  <div class="header">
	    	아이상세보기
	  </div>
	  <div class="image content">
	    <div class="ui medium image">
	      <img id="childImg">
	    </div>
	    <div class="description">
	      <div class="ui header" id="childName"></div>
	      	<p id="childGender"></p>
	      	<p id="childBirth"></p>
	    </div>
	  </div>
	  <div class="actions">
	    <div class="ui positive right labeled icon button">
	      	확인
	      <i class="checkmark icon"></i>
	    </div>
	  </div>
	</div>
    
    <script>
      	//클릭한 페이지 버튼 이벤트
		$(document).on("click",".goPage", function() {
     		currentPage = $(this).attr("data-page");
	       	pageFlag = 1;
			   if($("#selectList").val() === "승인요청내역"){
	       			fpaging();
			   } else if($("#selectList").val() === "이전요청내역"){
				   fpaging2();
			   }
	       	pageFlag = 0;
		});
		//첫번째 페이지로 가기 버튼 이벤트
		$(document).on("click", ".goFirstPage", function() {
     		currentPage = 1;
			pageFlag = 1;
				if($("#selectList").val() === "승인요청내역"){
					fpaging();
				} else if($("#selectList").val() === "이전요청내역"){
					fpaging2();
				}
			pageFlag = 0;
		});
        //뒷페이지로 가기 버튼 이벤트
		$(document).on("click", ".goBackPage", function() {
			currentPage = Number(currentPage) - 1;
			pageFlag = 1;
				if($("#selectList").val() === "승인요청내역"){
					fpaging();
				} else if($("#selectList").val() === "이전요청내역"){
					fpaging2();
				}
			pageFlag = 0;
		});
		//다음페이지로 가기 클릭이벤트
		$(document).on("click", ".goNextPage", function() {
			currentPage = Number(currentPage) + 1;
			pageFlag = 1;
				if($("#selectList").val() === "승인요청내역"){
					fpaging();
				} else if($("#selectList").val() === "이전요청내역"){
					fpaging2();
				}
			pageFlag = 0;
		});
		//마지막페이지로 가기 클릭이벤트
		$(document).on("click", ".goLastPage", function() {
			currentPage = paging.maxPage;
			pageFlag = 1;
				if($("#selectList").val() === "승인요청내역"){
					fpaging();
				} else if($("#selectList").val() === "이전요청내역"){
					fpaging2();
				}
			pageFlag = 0;
		});
    </script>
    <%@ include file="/views/common/footer.jsp" %>
	<%@ include file="/views/common/chat.jsp" %>
</body>
</html>