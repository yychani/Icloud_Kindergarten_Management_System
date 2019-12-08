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
        	  },
        	  error:function(error, status) {
        		  console.log(error);
        		  console.log(status);
        	  }
          });
          
        $(document).on("click",".accept", function() {
        	
        });
          
          
      	$(document).on("click",".pAccountList tr>td:nth-of-type(2)", function(){
      		$("#myModal").show();
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
</style>

</head>
<body>
    <%@ include file="/views/common/teacherMenu.jsp" %>
    <div style="margin: 0 15%;">
		<h1 align="center" style="text-decoration: underline; text-underline-position: under;">학부모 계정관리</h1>
	</div>
	<div style="margin: 0 20%;">
		<select name="" id="">
			<option value="승인요청내역">승인요청내역</option>
			<option value="이전요청내역">이전요청내역</option>
		</select>
		<table class="pAccountList">
			<tr style="background:lightgray">
				<th>번호</th>
				<th>원아명</th>
				<th>학부모 성함</th>
				<th>승인</th>
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
						<td>이름 : 박건후</td>
						<td rowspan="4"><img src="<%= request.getContextPath() %>/images/img.jpg" alt="" width="200px" style="margin:0 10%"/></td>
					</tr>
					<tr>
						<td>성별 : 남</td>
					</tr>
					<tr>
						<td>생년월일 : 2015년 10월 10일</td>
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
    </script>
	<%@ include file="/views/common/chat.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>
</body>
</html>