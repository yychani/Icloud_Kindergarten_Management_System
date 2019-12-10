<%@page import="com.oracle5.task.model.vo.WorkDivision"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<WorkDivision> Ulist = (ArrayList<WorkDivision>) request.getAttribute("Ulist");
	ArrayList<WorkDivision> Dlist = (ArrayList<WorkDivision>) request.getAttribute("Dlist");
%>
<style>
	table {
		margin: 50px auto;
	}
    #division {
        width: 80px;
        border: 1px solid black;
        border-left: none;
    }

    #charge {
        width: 120px;
        border: 1px solid black;
    }

    #task {
        width: 500px;
        border: 1px solid black;
    }

    #cleaningArea {
        width: 300px;
        border: 1px solid black;
        border-left: none;
        border-right: none;
    }

    tr>th,
    td[id="division"] {
        text-align: center;
        font-weight: bold;
        font-size: 13pt;
    }

    tr>th {
        height: 50px;
    }

    td[id="division"] {
        font-size: 11pt;
        padding-right: 0;
    }
    #workDivision {
        margin: 70px auto;
    }
    textarea:focus{
    	outline: none;
    }
</style>
<table id="workDivision">
    <tr>
        <th id="division">구분</th>
        <th id="charge">담당</th>
        <th id="task">업무 내용</th>
        <th id="cleaningArea">청소 구역</th>
    </tr>
    	
    	<% 
    	if(Dlist != null){
    	int index = 0;
    	for(WorkDivision w : Dlist){ %>
    	<tr>
    		<% if(index == 0) {%>
    			<td id="division" rowspan="<%=Dlist.size() %>">고유<br>업무<br>
            		
        		</td>
        	<% } %>
        	<td id="charge"><%=w.getName() %></td>
        	<td id="task"><textarea style="margin: 15px 30px; float: left;width:400px;height:115px;overflow-y:hidden; border:0; resize: none;" readonly><%=w.getContent() %></textarea></td>
        	<td id="cleaningArea"><%=w.getArea() %></td>
        	<td><input type="hidden" class="editD" value="수정하기" style="width: 70px; height: 30px">
        	<input type="hidden" class="deleteD" value="삭제하기" style="width: 70px; height: 30px">
        	<input type="hidden" name="pid" class="pid" value="<%=w.getPid()%>"></td>
        	</tr>
    	<% 		index++;
    		}
    	} %>
        
    
    <%  
	if(Ulist != null){
    int index1 = 0;
    	for(WorkDivision w : Ulist){ %>
    	<tr>
    		<% if(index1 == 0) {%>
    			<td id="division" rowspan="<%=Ulist.size() %>">업무<br>분담<br>
            	
        	</td>
        	<% } %>
        	<td id="charge"><%=w.getName() %> 선생님</td>
        	<td id="task"><textarea class="task" style="margin: 15px 30px; float: left;width:400px;height:115px;overflow-y:hidden; border:0; resize: none;" readonly><%=w.getContent() %></textarea></td>
        	<td id="cleaningArea"><%=w.getArea() %></td>
        	<td><input type="hidden" class="editU" value="수정하기" style="width: 70px; height: 30px">
        	<input type="hidden" class="deleteU" value="삭제하기" style="width: 70px; height: 30px">
        	<input type="hidden" name="tno" class="tno" value="<%=w.getTno()%>"></td>
        	</tr>
    	<% 		index1++;
    		
    		}
    	} %>
    	<% if(loginUser.getMemberId().equals("admin")){ %>
    <tr>
        <td colspan="5" style="padding-top: 10px;">
            <div style="float: right;"><input type="button" id="edit" value="수정하기">
                <div style="float: right;">
                <input style="width: 100px; height: 40px;" type="hidden" class="add" value="고유업무 추가"
                		onclick="location.href='<%=request.getContextPath() %>/views/president/preDBusiness.jsp'">
                <input style="width: 100px; height: 40px;" type="hidden" class="add" value="업무분담 추가"
            		onclick="location.href='<%=request.getContextPath() %>/views/president/preUBusiness.jsp'">
                <input type="hidden" id="complete" value="완료하기">
            </div></div>
        </td>
    </tr>
    <% } %>
</table>

<script>
	$(".editD").on("click", function() {
		var pid = $(this).siblings(".pid").val();
		
		location.href = "<%=request.getContextPath() %>/taskUpdateDetail.task?pid=" + pid;
	});
	$(".editU").on("click", function() {
		var tno = $(this).siblings(".tno").val();
		location.href = "<%=request.getContextPath() %>/taskUpdateDetail.task?tno=" + tno;
	});
	$(".deleteD").on("click", function() {
		var pid = $(this).siblings(".pid").val();
		var check = window.confirm("정말 삭제 하시겠습니까?");
		
		if (check) {
			location.href = "<%=request.getContextPath() %>/deleteWork.task?pid=" + pid;
		}
	});
	$(".deleteU").on("click", function() {
		var tno = $(this).siblings(".tno").val();
		var check = window.confirm("정말 삭제 하시겠습니까?");
		
		if (check) {
			location.replace("<%=request.getContextPath() %>/deleteWork.task?tno=" + tno);
		}
	});
    $("#edit").click(function() {
        $(".add").attr("type", "button");
        $(".add").attr("type", "button");
        $("#complete").attr("type", "button");
        $(".editD").prop("type", "button");
        $(".editU").prop("type", "button");
        $(".deleteD").prop("type", "button");
        $(".deleteU").prop("type", "button");
        $(this).attr("type", "hidden");
    });
    $("#complete").click(function() {
        $(".add").attr("type", "hidden");
        $(".add").attr("type", "hidden");
        $("#edit").attr("type", "button");
        $(".editD").prop("type", "hidden");
        $(".editU").prop("type", "hidden");
        $(".deleteD").prop("type", "hidden");
        $(".deleteU").prop("type", "hidden");
        $(this).attr("type", "hidden");
    });
</script>