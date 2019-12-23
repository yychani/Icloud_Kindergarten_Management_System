<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.sql.Date, com.oracle5.member.model.vo.*"%>
<%
	ArrayList<ReturnAgree> list = (ArrayList<ReturnAgree>) request.getAttribute("list");

	java.sql.Date d = new Date(new java.util.Date().getTime());
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
    td#applicant:nth-of-type(n+1) {
    	cursor:pointer;
    }
    #as{
	   width:161px;
	   height:34px;
	   border-radius:4px;
	}
	.ui .modal {
		top:25%;
		left:25%;
	}
	.ui.labeled.icon.button>.icon:before {
		top: 67% !important;
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
        	if(list.get(i).getStatus().equals("수신 확인")) { 
        		if(list.get(i).getApplyDate().after(d) || String.valueOf(list.get(i).getApplyDate()).equals(String.valueOf(d))) {%>
        <tr id="applyTr">
            <td id="no"><%= i + 1 %> 
            	<input type="hidden" id="cid" value="<%= list.get(i).getCId() %>" />
            	<input type="hidden" id="rano" value="<%= list.get(i).getRaNo() %>" />
            </td>
            <td id="applicant"><%= list.get(i).getCName() %></td>
            <td id="apply"><%= list.get(i).getSubmitDate() %></td>
        </tr>
        <% 		}
        	} 
        }%>
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
    </table>

    <div class="ui modal">
	  <i class="close icon"></i>
	  <div class="header">
	    귀가 동의서 상세보기
	  </div>
	  <div class="image content">
	    <div class="description">
	      <div class="ui header"></div>
	      <table class="ui celled table" id="modaltable" style="text-align:center; width:100%;" border=1>
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
	    </div>
	  </div>
	  <div class="actions">
	    <div class="ui negative right labeled icon button" onClick="updateStatus('반려');" id="return">
	      	반려
	      <i class="ban icon"></i>
	    </div>
	    <div class="ui positive right labeled icon button" onClick="updateStatus('확인');" id="check">
	      	확인
	      <i class="checkmark icon"></i>
	    </div>
	    <div class="ui black right labeled icon button" id="close">
	      	닫기
	      <i class="x icon icon"></i>
	    </div>
	    <div class="ui positive right labeled icon button" onClick="updateStatus('인계');" id="take">
	      	인계
	      <i class="checkmark icon"></i>
	    </div>
	  </div>
	</div>
    
    
    
    
    
    <script>
        $(function () {
        	 $(".li:nth-child(17)").addClass("on");
       	  
             $(".topMenuLi:nth-child(1)").addClass("on");
            
             $(".topMenuLi").mouseover(function() {
               $(".li:nth-child(17)").removeClass("on");
               $(".topMenuLi:nth-child(1)").removeClass("on");
            });
           
             $(".topMenuLi").mouseleave(function() {
               $(".li:nth-child(17)").addClass("on");
               $(".topMenuLi:nth-child(1)").addClass("on");
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
        		$('.ui.modal').modal('show');
    		});
    		
        }); 
		
		$("td#applicant:nth-of-type(n+1)").click(function() {
    		rano = $(this).parent().find("#rano").val();
    		
    		if($("#as option:selected").val() == '미확인 리스트') {
    			$("#return").show();
    			$("#check").show();
    			$("#take").hide();
    		} else if($("#as option:selected").val() == '인계 대기 리스트') {
    			$("#take").show();
    			$("#return").hide();
    			$("#check").hide();
    		} else {
    			$("#return").hide();
    			$("#check").hide();
    			$("#take").hide();
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
		
		$("#close").click(function() {
    		$('.ui.modal').modal('hide');
    	});
    </script>
    <%@ include file="/views/common/footer.jsp"%>
    <%@ include file="/views/common/chat.jsp"%>
</body>

</html>