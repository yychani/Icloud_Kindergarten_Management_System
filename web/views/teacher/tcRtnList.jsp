<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.oracle5.member.model.vo.*"%>
<%
	ArrayList<ReturnAgree> list = (ArrayList<ReturnAgree>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>귀가 동의서  관리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    <style>
    
        table {
            margin: 50px auto;
        }
        #table1, #table2, #table3, #table4 {
            margin: 10px auto;
            width: 60%;
        }

        input[type=text] {
            border-radius: 10px;
            width: 300px;
            height: 30px;
        }

        td {
            padding: 0px 0px;
            padding-left: 0;
        }

        input[type=checkbox] {
            width: 15px;
            height: 15px;
            vertical-align: center;
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
        th[id="no"]{
            width: 10%;
            height: 50px;
        } 
        th[id="apply"]{
            width: 10%;
            height: 50px;
            padding-right: 0;
        } 
        th[id="applicant"] {
            width: 80%;
            height: 50px;
        }
        #applyTr{
            border-bottom: 1px solid black;
        }
        td[id="applicant"]{
            height: 30px;
        }
        td[id="apply"]{
            padding-right: 0;
        } 
        td[id="rtn"]{
            height: 30px;
        }
        td[id="rtn"]{
            padding-right: 0;
        } 
        td[id="does"]{
            height: 30px;
        }
        td[id="does"]{
            padding-right: 0;
        } 
        
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
        width: 40%; /* Could be more or less, depending on screen size */                          
    }
    
    #modaltable td{
    	height:30px
    }
    .modalBtn {
    	cursor:pointer;
    	background-color:#DDDDDD;
    	text-align: center;
    	padding-bottom: 10px;
    	padding-top: 10px;
    	display:inline-block;
    	width: 40px;
    }
    
    td#applicant:nth-of-type(n+1) {
    	cursor:pointer;
    }
    #as{
	   width:161px;
	   height:34px;
	   border-radius:4px;
	}
    </style>
</head>

<body style="overflow-x: hidden; overflow-y:hidden;">
    <%@ include file="/views/common/teacherMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">귀가 동의서 관리 페이지</h1>
    </div>
    <div style="margin: 20px 20%">
	    <select name="as" id="as">
	        <option value="인계 대기 리스트" selected>인계 대기 리스트</option>
	        <option value="미확인 리스트">미확인 리스트</option>
	        <option value="반려 리스트">반려 리스트</option>
	        <option value="처리완료 리스트">처리완료 리스트</option>
	    </select>
    </div>
     <table id="table1" class="asTable ui celled table" style="text-align:center;">
        <tr id="applyTr" style="background: #e3fad0">
            <th id="no">No</th>
            <th id="applicant">신청자</th>
            <th id="apply">신청일</th>
        </tr>
        <% for(int i = 0; i < list.size(); i++) { 
        	if(list.get(i).getStatus().equals("수신 확인")) { %>
        <tr id="applyTr">
            <td id="no"><%= i + 1 %> 
            	<input type="hidden" id="cid" value="<%= list.get(i).getCId() %>" />
            	<input type="hidden" id="rano" value="<%= list.get(i).getRaNo() %>" />
            </td>
            <td id="applicant"><%= list.get(i).getCName() %></td>
            <td id="apply"><%= list.get(i).getSubmitDate() %></td>
        </tr>
        <% }
        } %>
        <tr id="applyTr">
                <th style="height: 30px;"></th>
                <th align="right"></th>
                <th></th>
        </tr>
    </table>
     <table id="table2" class="asTable ui celled table" style="text-align:center;" hidden>
        <tr id="applyTr" style="background: #e3fad0">
            <th id="no">No</th>
            <th id="applicant">신청자</th>
            <th id="apply">신청일</th>
        </tr>
        <% for(int i = 0; i < list.size(); i++) { 
        	if(list.get(i).getStatus().equals("미확인")) { %>
        <tr id="applyTr">
            <td id="no"><%= i + 1 %> 
            	<input type="hidden" id="cid" value="<%= list.get(i).getCId() %>" />
            	<input type="hidden" id="rano" value="<%= list.get(i).getRaNo() %>" />
            </td>
            <td id="applicant"><%= list.get(i).getCName() %></td>
            <td id="apply"><%= list.get(i).getSubmitDate() %></td>
        </tr>
        <% }
        } %>
        <tr id="applyTr">
                <th style="height: 30px;"></th>
                <th align="right"></th>
                <th></th>
        </tr>
    </table>
   <table id="table3" class="asTable ui celled table" style="text-align:center;" hidden>
        <tr id="applyTr" style="background: #e3fad0">
            <th id="no">No</th>
            <th id="applicant">신청자</th>
            <th id="apply">신청일</th>
        </tr>
        <% for(int i = 0; i < list.size(); i++) { 
        	if(list.get(i).getStatus().equals("반려")) {%>
        <tr id="applyTr">
            <td id="no"><%= i + 1 %> 
            	<input type="hidden" id="cid" value="<%= list.get(i).getCId() %>" />
            	<input type="hidden" id="rano" value="<%= list.get(i).getRaNo() %>" />
            </td>
            <td id="applicant"><%= list.get(i).getCName() %></td>
            <td id="apply"><%= list.get(i).getSubmitDate() %></td>
        </tr>
        <% }
        } %>
        <tr id="applyTr">
                <th style="height: 30px;"></th>
                <th align="right"></th>
                <th></th>
        </tr>
    </table>
     <table id="table4" class="asTable ui celled table" style="text-align:center;" hidden>
        <tr id="applyTr" style="background: #e3fad0">
            <th id="no">No</th>
            <th id="applicant">신청자</th>
            <th id="apply">신청일</th>
        </tr>
        <% for(int i = 0; i < list.size(); i++) { 
        	if(list.get(i).getStatus().equals("인계 완료")) {%>
        <tr id="applyTr">
            <td id="no"><%= i + 1 %> 
            	<input type="hidden" id="cid" value="<%= list.get(i).getCId() %>" />
            	<input type="hidden" id="rano" value="<%= list.get(i).getRaNo() %>" />
            </td>
            <td id="applicant"><%= list.get(i).getCName() %></td>
            <td id="apply"><%= list.get(i).getSubmitDate() %></td>
        </tr>
        <% }
        } %>
        <tr id="applyTr">
                <th style="height: 30px;"></th>
                <th align="right"></th>
                <th></th>
        </tr>
    </table>

        
        <!-- The Modal -->
    <div id="myModal" class="modal" style="overflow-y: hidden">
 
      <!-- Modal content -->
      	<div class="modal-content">
				<table id="modaltable" style="text-align:center; width:100%;" border=1>
					<tr>
						<td colspan="2" style="width:50%">이름</td>
						<td colspan="2" style="width:50%" id="name"></td>
					</tr>
					<tr>
						<td>인계요청일자</td>
						<td id="applydate"></td>
						<td>인계요청시간</td>
						<td id="applytime"></td>
					</tr>
					<tr>
						<td>인계자</td>
						<td id="guidename"></td>
						<td>연락처</td>
						<td id="guidephone"></td>
					</tr>
				</table>
                <p><br /></p>
                <div style="display: inline-block; margin-left: 75%; width: 200px;" id="btndiv">
	                <div class="modalBtn" id="return" style="margin-right:20px;" onClick="updateStatus('반려');">
	            		<span class="pop_bt" style="font-size: 13pt;" >
	                     		반려
	                	</span>
	            	</div>
	                <div class="modalBtn" id="take" style="margin-right:20px;" onClick="updateStatus('인계');">
	            		<span class="pop_bt" style="font-size: 13pt;" >
	                     		인계
	                	</span>
	            	</div>
	                <div class="modalBtn" id="check" style="margin-right:20px;" onClick="updateStatus('확인');">
	            		<span class="pop_bt" style="font-size: 13pt;" >
	                     		확인
	                	</span>
	            	</div>
	           		<div class="modalBtn" onClick="close_pop();">
	               		<span class="pop_bt" style="font-size: 13pt;" >
	                    		닫기
	               		</span>
	           		</div>
             </div>
	     </div>
 
    </div>
    <script>
        $(function () {
        	 $(".li:nth-child(17)").addClass("on");
       	  
             $(".topMenuLi:nth-child(2)").addClass("on");
            
             $(".topMenuLi").mouseover(function() {
               $(".li:nth-child(17)").removeClass("on");
               $(".topMenuLi:nth-child(2)").removeClass("on");
            });
           
             $(".topMenuLi").mouseleave(function() {
               $(".li:nth-child(17)").addClass("on");
               $(".topMenuLi:nth-child(2)").addClass("on");
            });
            
            $("#allCheck").click(function() {
                if($("#allCheck").prop("checked")) {
                    $("#check").prop("checked", true);
                } else {
                    $("#check").prop("checked", false);
                }
            });
            
            $("#as").change(function(){
                if($(this).val() == "인계 대기 리스트"){
                   $("#table2").attr("hidden", true);
                   $("#table3").attr("hidden", true);
                   $("#table4").attr("hidden", true);
                   $("#table1").attr("hidden", false);
                }else if($(this).val() == "미확인 리스트"){
                   $("#table1").attr("hidden", true);
                   $("#table2").attr("hidden", false);
                   $("#table3").attr("hidden", true);
                   $("#table4").attr("hidden", true);
                } else if($(this).val() == "반려 리스트"){
                   $("#table1").attr("hidden", true);
                   $("#table2").attr("hidden", true);
                   $("#table3").attr("hidden", false);
                   $("#table4").attr("hidden", true);
                } else if($(this).val() == "처리완료 리스트"){
                    $("#table1").attr("hidden", true);
                    $("#table2").attr("hidden", true);
                    $("#table3").attr("hidden", true);
                    $("#table4").attr("hidden", false);
                 }
           });
            
            
        	$("td#applicant:nth-of-type(n+1)").click(function() {
    			$("#myModal").show();
    		});
    		
        }); 
        
        function close_pop() {
			$("#myModal").hide();
		};
		
		$("td#applicant:nth-of-type(n+1)").click(function() {
    		rano = $(this).parent().find("#rano").val();
    		
    		if($("#as option:selected").val() == '미확인 리스트') {
    			$("#return").show();
    			$("#check").show();
    			$("#take").hide();
    			$("#btndiv").css("margin-left","75%");
    		} else if($("#as option:selected").val() == '인계 대기 리스트') {
    			$("#take").show();
    			$("#return").hide();
    			$("#check").hide();
    			$("#btndiv").css("margin-left","85%");
    		} else {
    			$("#return").hide();
    			$("#check").hide();
    			$("#take").hide();
    			$("#btndiv").css("margin-left","95%");
    		}
    		
    		$.ajax({
    			url:"selectChildRtn.do",
    			type:"post",
    			data:{
    				rano:rano
    			},
    			success:function(data) {
    				$("#name").text(data.cName);
    				$("#applydate").text(changeDate(data.applyDate));
    				$("#applytime").text(data.applyTime);
    				$("#guidename").text(data.guideName);
    				$("#guidephone").text(data.guidePhone);
    			},
    			error:function() {
    				console.log("실패")
    			}
    		});
    		
    		
			$("#myModal").show();
		});
		
		function changeDate(date) {
        	date = date.split(" ");
        	date = date[2] + "년 " + date[0] + " " + date[1].substring(0, date[1].length - 1) + "일";
        	return date;
        }
		
		function updateStatus(status) {
        	if($("#as option:selected").val() === '미확인 리스트' || $("#as option:selected").val() === '인계 대기 리스트') {
	        	var stat = "";
	        	
	        	if(status === '확인') {
	        		stat = "수신 확인";
	        	} else if(status === '반려') {
	        		stat = "반려";
	        	} else if(status === '인계') {
	        		stat = "인계 완료";
	        	}
	        	console.log(stat);
	        	close_pop();
	        	
	        	$.ajax({
	        		url:"<%= request.getContextPath() %>/updateRtnStatus.do",
	        		type:"post",
	        		data:{
	        			stat:stat,
	        			rano:rano
	        		},
	        		success:function(data) {
	        			alert("정상 처리 되었습니다.");
	        			location.reload();
	        		},
	        		error:function() {
	        			console.log("실패");
	        		}
	        	});
        	}
        }
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>