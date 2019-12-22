<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.sql.Date, com.oracle5.member.model.vo.*"%>
<%
	ArrayList<DoseRequest> list = (ArrayList<DoseRequest>) request.getAttribute("list");
	
	java.sql.Date d = new Date(new java.util.Date().getTime());
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>투약 의뢰서 관리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
            width: 100px;
            height: 50px;
        } 
        th[id="apply"]{
            width: 100px;
            height: 50px;
            padding-right: 0;
        } 
        th[id="applicant"] {
            width: 400px;
            height: 50px;
        }
        th[id="date"] {
        	width: 100px;
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

<body style="overflow-x: hidden; overflow-y:hidden">
    <%@ include file="/views/common/teacherMenu.jsp"%>
    <div style="margin: 0 15%;">
        <h1 style="text-decoration: underline; text-underline-position: under;">투약 의뢰서 관리 페이지</h1>
    </div>
    <div style="margin: 20px 20%">
	    <select name="as" id="as">
	        <option value="투약 리스트" selected>투약 리스트</option>
	        <option value="미확인 리스트">미확인 리스트</option>
	        <option value="이전 신청 이력">이전 신청 이력</option>
	        <option value="반려 이력">반려 이력</option>
	    </select>
    </div>
    <table id="table1" class="asTable ui celled table" style="text-align:center;">
        <tr id="applyTr" style="background: #e3fad0">
            <th id="no">No</th>
            <th id="applicant">신청자</th>
            <th id="apply">증상</th>
            <th id="date">신청일</th>
        </tr>
        <% for(int i = 0; i < list.size(); i++) { 
        		if(list.get(i).getStatus().equals("수신 확인")) {
        				if(list.get(i).getEndDate().after(d) || String.valueOf(list.get(1).getEndDate()).equals(String.valueOf(d))) {%>
        <tr id="applyTr" class="child<%= i %>">
            <td id="no"><%= i + 1 %> 
            	<input type="hidden" id="cid" value="<%= list.get(i).getCNo() %>" />
            	<input type="hidden" id="dno" value="<%= list.get(i).getDNo() %>" />
            </td>
            <td id="applicant"><%= list.get(i).getCName() %></td>
            <td id="apply"><%= list.get(i).getSymptom() %></td>
            <td id="date"><%= list.get(i).getSubmitDate() %></td>
        </tr>
        <% 	}
      	  }
        } %>
        <tr id="applyTr">
            <th style="height: 30px;"></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
    </table>
    <table id="table2" class="asTable ui celled table" style="text-align:center;" hidden >
        <tr id="applyTr" style="background: #e3fad0">
            <th id="no">No</th>
            <th id="applicant">신청자</th>
            <th id="apply">증상</th>
            <th id="date">신청일</th>
        </tr>
        <% for(int i = 0; i < list.size(); i++) { 
        		if(list.get(i).getStatus().equals("미확인")) {%>
        <tr id="applyTr" class="child<%= i %>">
            <td id="no"><%= i + 1 %> 
            	<input type="hidden" id="cid" value="<%= list.get(i).getCNo() %>" />
            	<input type="hidden" id="dno" value="<%= list.get(i).getDNo() %>" />
            </td>
            <td id="applicant"><%= list.get(i).getCName() %></td>
            <td id="apply"><%= list.get(i).getSymptom() %></td>
            <td id="date"><%= list.get(i).getSubmitDate() %></td>
        </tr>
        <% }
        } %>
        <tr id="applyTr">
            <th style="height: 30px;"></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
    </table>
     <table id="table3" class="asTable ui celled table" style="text-align:center;" hidden>
        <tr id="applyTr" style="background: #e3fad0">
            <th id="no">No</th>
            <th id="applicant">신청자</th>
            <th id="apply">증상</th>
            <th id="date">신청일</th>
        </tr>
        <% for(int i = 0; i < list.size(); i++) { 
        		if(list.get(i).getStatus().equals("수신 확인")) {%>
        <tr id="applyTr" class="child<%= i %>">
            <td id="no"><%= i + 1 %> 
            	<input type="hidden" id="cid" value="<%= list.get(i).getCNo() %>" />
            	<input type="hidden" id="dno" value="<%= list.get(i).getDNo() %>" />
            </td>
            <td id="applicant"><%= list.get(i).getCName() %></td>
            <td id="apply"><%= list.get(i).getSymptom() %></td>
            <td id="date"><%= list.get(i).getSubmitDate() %></td>
        </tr>
        <% }
        } %>
        <tr id="applyTr">
            <th style="height: 30px;"></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
    </table>
     <table id="table4" class="asTable ui celled table" style="text-align:center;" hidden>
        <tr id="applyTr" style="background: #e3fad0">
            <th id="no">No</th>
            <th id="applicant">신청자</th>
            <th id="apply">증상</th>
            <th id="date">신청일</th>
        </tr>
        <% for(int i = 0; i < list.size(); i++) { 
        		if(list.get(i).getStatus().equals("반려")) {%>
        <tr id="applyTr" class="child<%= i %>">
            <td id="no"><%= i + 1 %> 
            	<input type="hidden" id="cid" value="<%= list.get(i).getCNo() %>" />
            	<input type="hidden" id="dno" value="<%= list.get(i).getDNo() %>" />
            </td>
            <td id="applicant"><%= list.get(i).getCName() %></td>
            <td id="apply"><%= list.get(i).getSymptom() %></td>
            <td id="date"><%= list.get(i).getSubmitDate() %></td>
        </tr>
        <% }
        } %>
        <tr id="applyTr">
            <th style="height: 30px;"></th>
            <th></th>
            <th></th>
            <th></th> 
        </tr>
    </table>
    
        <!-- The Modal -->
    <div id="myModal" class="modal" style="overflow-y: hidden">
 
      <!-- Modal content -->
      	<div class="modal-content">
				<table id="modaltable" style="text-align:center; width:100%;" border=1>
					<tr>
						<td style="width:25%">이름</td>
						<td style="width:25%" id="name"></td>
						<td style="width:25%">보관방법</td>
						<td style="width:25%" id="keep"></td>
					</tr>
					<tr>
						<td>투약시작일자</td>
						<td id="startDate"></td>
						<td>투약종료일자</td>
						<td id="endDate"></td>
					</tr>
					<tr>
						<td>증상</td>
						<td id="symptom"></td>
						<td>요청사항</td>
						<td id="remarks"></td>
					</tr>
					<tr>
						<td>투약시간</td>
						<td colspan="3" id="dosingTime"></td>
						
					</tr>
				</table>
                <p><br /></p>
                <div style="display: inline-block; margin-left: 75%; width: 200px;" id="btndiv">
	                <div class="modalBtn" id="return" style="margin-right:20px;" onClick="updateStatus('반려');">
	            		<span class="pop_bt" style="font-size: 13pt;" >
	                     		반려
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
        	 $(".li:nth-child(15)").addClass("on");
       	  
             $(".topMenuLi:nth-child(2)").addClass("on");
            
             $(".topMenuLi").mouseover(function() {
               $(".li:nth-child(15)").removeClass("on");
               $(".topMenuLi:nth-child(2)").removeClass("on");
            });
           
             $(".topMenuLi").mouseleave(function() {
               $(".li:nth-child(15)").addClass("on");
               $(".topMenuLi:nth-child(2)").addClass("on");
            });
            
            $("#as").change(function(){
                 if($(this).val() == "투약 리스트"){
                    $("#table2").attr("hidden", true);
                    $("#table3").attr("hidden", true);
                    $("#table4").attr("hidden", true);
                    $("#table1").attr("hidden", false);
                 }else if($(this).val() == "미확인 리스트"){
                    $("#table1").attr("hidden", true);
                    $("#table2").attr("hidden", false);
                    $("#table3").attr("hidden", true);
                    $("#table4").attr("hidden", true);
                 } else if($(this).val() == "이전 신청 이력"){
                    $("#table1").attr("hidden", true);
                    $("#table2").attr("hidden", true);
                    $("#table3").attr("hidden", false);
                    $("#table4").attr("hidden", true);
                 } else if($(this).val() == "반려 이력"){
                     $("#table1").attr("hidden", true);
                     $("#table2").attr("hidden", true);
                     $("#table3").attr("hidden", true);
                     $("#table4").attr("hidden", false);
                  }
            });
            
            
        	$("td#applicant:nth-of-type(n+1)").click(function() {
        		dno = $(this).parent().find("#dno").val();
        		
        		if($("#as option:selected").val() != '미확인 리스트') {
        			$("#return").hide();
        			$("#check").hide();
        			$("#btndiv").css("margin-left","95%");
        		} else {
        			$("#return").show();
        			$("#check").show();
        			$("#btndiv").css("margin-left","75%");
        		}
        		
        		$.ajax({
        			url:"selectChildDoseReq.do",
        			type:"post",
        			data:{
        				dno:dno
        			},
        			success:function(data) {
        				$("#name").text(data.cName);
        				$("#startDate").text(changeDate(data.startDate));
        				$("#endDate").text(changeDate(data.endDate));
        				$("#symptom").text(data.symptom);
        				$("#keep").text(data.keep);
        				$("#dosingTime").text(data.dosingTime);
        				$("#remarks").text(data.remarks);
        			},
        			error:function() {
        				console.log("실패")
        			}
        		});
        		
        		
    			$("#myModal").show();
    		});
    		
        }); 
        
        function changeDate(date) {
        	date = date.split(" ");
        	date = date[2] + "년 " + date[0] + " " + date[1].substring(0, date[1].length - 1) + "일";
        	return date;
        }
        
        function close_pop() {
			$("#myModal").hide();
		};
		
        function updateStatus(status) {
        	console.log(status)
        	console.log(dno)
        	if($("#as option:selected").val() === '미확인 리스트') {
	        	var stat = "";
	        	
	        	if(status === '확인') {
	        		stat = "수신 확인";
	        	} else if(status === '반려') {
	        		stat = "반려";
	        	}
	        	
	        	close_pop();
	        	
	        	$.ajax({
	        		url:"<%= request.getContextPath() %>/updateDoseReqStatus.do",
	        		type:"post",
	        		data:{
	        			stat:stat,
	        			dno:dno
	        		},
	        		success:function(data) {
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