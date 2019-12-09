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
    	  $("#selectList").change(function() {
    		  if($("#selectList").val() === "승인요청내역") {
       			  $.ajax({
       	        	  url:"<%=request.getContextPath()%>/notApprovalList.do",
       	        	  type:"get",	
       	        	  success:function(data) {
       	        		  $tableBody = $(".pAccountList tbody tr:nth-of-type(1)");
       	        		  $(".pAccountList tbody tr:nth-of-type(n+2)").remove();
       	        		  $("#remo").remove();
       	        		  $.each(data, function(index, value){
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
       	        		  page();
       	        	  },
       	        	  error:function(error, status) {
       	        		  console.log(error);
       	        		  console.log(status);
       	        	  }
       	          });
       		  } else if($("#selectList").val() === "이전요청내역") { //여기부터
       			  console.log($(this))
       			 $.ajax({
      	        	  url:"<%=request.getContextPath()%>/acceptApproval.do",
      	        	  type:"get",	
      	        	  success:function(data) {
      	        		 $tableBody = $(".pAccountList tbody tr:nth-of-type(1)");
    					  $(".pAccountList tbody tr:nth-of-type(n+2)").remove();
    					  $("#remo").remove();
      	        		  $.each(data, function(index, value){
      	        			var cid = value.children.cId;
      	        			var mno = value.member.memberNo;
      	        			 var $tr = $("<tr>");
      	        			 var $noTd = $("<td>").text(value.rownum);
      	        			 var $cnameTd = $("<td>").text(value.children.name);
      	        			 var $pnameTd = $("<td>").text(value.member.memberName);
      	        			 var $approval = $("<td>").html("<input type='checkbox' name='accept' class='accept'> <input type='hidden' name='cid' value=" + cid+ "><input type='hidden' name='mno' value=" + mno +">");
      	        			 
      	        			 $tr.append($noTd);
      	        			 $tr.append($cnameTd);
      	        			 $tr.append($pnameTd);
      	        			 $tr.append($approval);
      	        			 
      	        			 $tableBody.after($tr); 
      	        		  }); 
      	        		  page();
      	        	  },
      	        	  error:function(error, status) {
      	        		  console.log(error);
      	        		  console.log(status);
      	        	  }
       			 });
       		  }
    	  })
   		 
   		 
    	
    	  
    	  $(".li:nth-child(11)").addClass("on");
    	  
          $(".topMenuLi:nth-child(2)").addClass("on");
         
          $(".topMenuLi").mouseover(function() {
            $(".li:nth-child(11)").removeClass("on");
            $(".topMenuLi:nth-child(2)").removeClass("on");
         });
        
          $(".topMenuLi").mouseleave(function() {
            $(".li:nth-child(11)").addClass("on");
            $(".topMenuLi:nth-child(2)").addClass("on");
         });
          
         
          
        $(document).on("click",".accept", function() {
        	
        });
          
          
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
      		
      		
      		$("#myModal").show();
      	}); 
      	
      	 $.ajax({
        	  url:"<%=request.getContextPath()%>/notApprovalList.do",
        	  type:"get",	
        	  success:function(data) {
        		  $tableBody = $(".pAccountList tbody tr:nth-of-type(1)");

        		  $.each(data, function(index, value){
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
        		  page();
        	  },
        	  error:function(error, status) {
        		  console.log(error);
        		  console.log(status);
        	  }
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
	.modal-content table td {
		border:none;
	}

    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 30%; /* Could be more or less, depending on screen size */                          
    }
    
 
.clickable {cursor: pointer;}
.hover {text-decoration: underline;}
.odd{ background: #FFC;}
.even{ background: #FF9;}
.active{ width:10px; height:10px; background:#f60; color:white;}

</style>

</head>
<body>
    <%@ include file="/views/common/teacherMenu.jsp" %>
    <div style="margin: 0 15%;">
		<h1 align="center" style="text-decoration: underline; text-underline-position: under;">학부모 계정관리</h1>
	</div>
	<div style="margin: 0 20%;">
		<select name="selectList" id="selectList">
			<option value="승인요청내역" selected>승인요청내역</option>
			<option value="이전요청내역">이전요청내역</option>
		</select>
		<table class="pAccountList tbl paginated" id="tbl">
			<tr style="background:lightgray">
				<th style="width:10%">번호</th>
				<th style="width:30%">원아명</th>
				<th style="width:30%">학부모 성함</th>
				<th style="width:10%">승인</th>
			</tr>
		</table>
	</div>
	<div style="margin: 0 20%; height:50px;">
		<input type="submit" value="승인완료" style="float:right"/>
	</div>

	<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      	<div class="modal-content">
				<table style="text-align:left">
					<tr>
						<td id="childName"></td>
						<td rowspan="4"><img id="childImg" width="200px" style="margin:0 10%"/></td>
					</tr>
					<tr>
						<td id="childGender"></td>
					</tr>
					<tr>
						<td id="childBirth"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     	닫기
                </span>
            </div>
	     </div>
 
    </div>
    <script>
  		function close_pop(){
      		$("#myModal").hide();
      	};
      	
      	function page(){ 
      		var reSortColors = function($table) {
      		  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
      		  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
      		 };
      	   $('table.paginated').each(function() {
      	    var pagesu = 10;  //페이지 번호 갯수
      	    var currentPage = 0;
      	    var numPerPage = 10;  //목록의 수
      	    var $table = $(this);    
      	    
      	    //length로 원래 리스트의 전체길이구함
      	    var numRows = $table.find('tbody tr').length;
      		  console.log($table)
      	    //Math.ceil를 이용하여 반올림
      	    var numPages = Math.ceil(numRows / numPerPage);
      	    //리스트가 없으면 종료
      	    if (numPages==0) return;
      	    //pager라는 클래스의 div엘리먼트 작성
      	    var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
      	    
      	    var nowp = currentPage;
      	    var endp = nowp+10;
      	    
      	    //페이지를 클릭하면 다시 셋팅
      	    $table.not('tbody tr th').bind('repaginate', function() {
      	    //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
      	    
      	     $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
      	     
      	     $("#remo").html("");
      	     
      	     if (numPages > 1) {     // 한페이지 이상이면
      	      if (currentPage < 5 && numPages - currentPage >= 5) {   // 현재 5p 이하이면
      	       nowp = 0;     // 1부터 
      	       endp = pagesu;    // 10까지
      	      }else{
      	       nowp = currentPage -5;  // 6넘어가면 2부터 찍고
      	       endp = nowp+pagesu;   // 10까지
      	       pi = 1;
      	      }
      	      
      	      if (numPages < endp) {   // 10페이지가 안되면
      	       endp = numPages;   // 마지막페이지를 갯수 만큼
      	       nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
      	      }
      	      if (nowp < 1) {     // 시작이 음수 or 0 이면
      	       nowp = 0;     // 1페이지부터 시작
      	      }
      	     }else{       // 한페이지 이하이면
      	      nowp = 0;      // 한번만 페이징 생성
      	      endp = numPages;
      	     }
      	     // [처음]
      	     $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
      	            currentPage = 0;   
      	            $table.trigger('repaginate');  
      	            $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
      	        }).appendTo($pager).addClass('clickable');
      	      // [이전]
      	        $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
      	            if(currentPage == 0) return; 
      	            currentPage = currentPage-1;
      	      $table.trigger('repaginate'); 
      	      $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
      	     }).appendTo($pager).addClass('clickable');
      	      // [1,2,3,4,5,6,7,8]
      	     for (var page = nowp ; page < endp; page++) {
      	      $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
      	       currentPage = event.data['newPage'];
      	       $table.trigger('repaginate');
      	       $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
      	       }).appendTo($pager).addClass('clickable');
      	     } 
      	      // [다음]
      	        $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
      	      if(currentPage == numPages-1) return;
      	          currentPage = currentPage+1;
      	      $table.trigger('repaginate'); 
      	       $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
      	     }).appendTo($pager).addClass('clickable');
      	      // [끝]
      	     $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
      	             currentPage = numPages-1;
      	             $table.trigger('repaginate');
      	             $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
      	     }).appendTo($pager).addClass('clickable');
      	       
      	       $($(".page-number")[2]).addClass('active');
      	  reSortColors($table);
      	    });
      	     $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
      	     $pager.appendTo($table);
      	     $table.trigger('repaginate');
      	   });
      	  }
    </script>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>