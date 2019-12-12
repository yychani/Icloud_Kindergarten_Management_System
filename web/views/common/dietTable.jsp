<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int[] valueOfDate = (int[]) request.getAttribute("valueOfDate");
	String mondayYear = (String)request.getAttribute("mondayYear"); // 해당 주의 첫 날짜의 년도 월;
	String mondayMonth = (String)request.getAttribute("mondayMonth"); // 해당 주의 첫 날짜의 월;
	String mondayDate = (String)request.getAttribute("mondayDate"); // 해당 주의 첫 날짜
	/* for(int i = 0; i < valueOfDate.length; i++){
		System.out.println(valueOfDate[i]);
	} */
	int year = valueOfDate[0];
	int month = valueOfDate[1];
	int weekOfMonth = valueOfDate[2];
	int date = valueOfDate[3];
	int startday = valueOfDate[4];
	int endDay = valueOfDate[5];
	int start = valueOfDate[6]; // 시작 요일
	int lastWeek = valueOfDate[7];
	int endDayOfWeek = valueOfDate[8];
	
	int newLine = 0;
	
	int mondayMonthInt = Integer.parseInt(mondayMonth);
	int mondayDateInt = Integer.parseInt(mondayDate);
%>

<div>
	<table border=1 class="menu">
		<tr style="height: 60px; background: gray">
			<td><button id="prev">prev</button></td>
			<td colspan="5"><span><%=year %>년 <%=month + 1 %>월 <%=weekOfMonth %>주</span></td>
			<td><button id="next">next</button></td>
		</tr>
		<tr style="height: 40px; background: lightgray">
			<td>구분</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
		<tr class="meal">
			<td>아침</td> 
			<% 
			newLine = 0;
			if(weekOfMonth == 1){
				for(int index = 1; index < start; index++) { 
					if(newLine != 0){%>
						<td colspan="<%=start-1 %>" rowspan="5" id="null">이전 달</td>
				<%	} newLine ++; %>
			<% 	}
				int ind = 1;
				for(int i = start; i <= 7; i++){
					if(newLine != 0){%>
					<td><%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-0<%=ind %></td>
				<%	} newLine ++; 
				ind++;
				} %>
				
			<% }else if(weekOfMonth == lastWeek){
				int ind = -1;
					for(int index = 1; index <= endDayOfWeek; index++) { 
						if(newLine != 0){%>
							<td><%=mondayYear %>-<%if(Integer.toString(month).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %></td>
					<%	} newLine ++; 
					ind++;%>
				<% 	}
						if(newLine != 7){%>
							<td colspan="<%=7-endDayOfWeek %>" rowspan="5" id="null">다음 달</td>
					<%	} newLine ++; 

				}else{ 
					int ind = 0;
					for(int i = 0; i < 6; i++) {%>
				
						<td><%=mondayYear %>-<%if(Integer.toString(month).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %></td>
					<%	ind++;
			 		}
					
				}%>
		</tr>
		<tr class="snack">
			<td>오전 간식</td>
			<% 
			newLine = 0;
			if(weekOfMonth == 1){
				for(int index = 1; index < start; index++) { 
					if(newLine != 0){%>
						<td id="null">빈값</td>
				<%	} newLine ++; %>
			<% 	}
				int ind = 1;
				for(int i = start; i <= 7; i++){
					if(newLine != 0){%>
					<td><%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-0<%=ind %></td>
				<%	} newLine ++; 
				ind++;
				} %>
				
			<% }else if(weekOfMonth == lastWeek){
				int ind = -1;
					for(int index = 1; index <= endDayOfWeek; index++) { 
						if(newLine != 0){%>
							<td><%=mondayYear %>-<%if(Integer.toString(month).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %></td>
					<%	} newLine ++; 
					ind++;%>
				<% 	}
					for(int i = endDayOfWeek; i < 7; i++){
						if(newLine != 7){%>
					<%	} newLine ++; 
					}
				}else{ 
					int ind = 0;
					for(int i = 0; i < 6; i++) {%>
				
						<td><%=mondayYear %>-<%if(Integer.toString(month).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %></td>
					<%	ind++;
			 		}
					
				}%>
		</tr>
		<tr class="meal">
			<td>점심</td>
			<% 
			newLine = 0;
			if(weekOfMonth == 1){
				for(int index = 1; index < start; index++) { 
					if(newLine != 0){%>
						<td id="null">빈값</td>
				<%	} newLine ++; %>
			<% 	}
				int ind = 1;
				for(int i = start; i <= 7; i++){
					if(newLine != 0){%>
					<td><%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-0<%=ind %></td>
				<%	} newLine ++; 
				ind++;
				} %>
				
			<% }else if(weekOfMonth == lastWeek){
				int ind = -1;
					for(int index = 1; index <= endDayOfWeek; index++) { 
						if(newLine != 0){%>
							<td><%=mondayYear %>-<%if(Integer.toString(month).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %></td>
					<%	} newLine ++; 
					ind++;%>
				<% 	}
					for(int i = endDayOfWeek; i < 7; i++){
						if(newLine != 7){%>
					<%	} newLine ++; 
					}
				}else{ 
					int ind = 0;
					for(int i = 0; i < 6; i++) {%>
				
						<td><%=mondayYear %>-<%if(Integer.toString(month).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %></td>
					<%	ind++;
			 		}
					
				}%>
		</tr>
		<tr class="snack">
			<td>오후 간식</td>
			<% 
			newLine = 0;
			if(weekOfMonth == 1){
				for(int index = 1; index < start; index++) { 
					if(newLine != 0){%>
						<td id="null">빈값</td>
				<%	} newLine ++; %>
			<% 	}
				int ind = 1;
				for(int i = start; i <= 7; i++){
					if(newLine != 0){%>
					<td><%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-0<%=ind %></td>
				<%	} newLine ++; 
				ind++;
				} %>
				
			<% }else if(weekOfMonth == lastWeek){
				int ind = -1;
					for(int index = 1; index <= endDayOfWeek; index++) { 
						if(newLine != 0){%>
							<td><%=mondayYear %>-<%if(Integer.toString(month).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %></td>
					<%	} newLine ++; 
					ind++;%>
				<% 	}
					for(int i = endDayOfWeek; i < 7; i++){
						if(newLine != 7){%>
					<%	} newLine ++; 
					}
				}else{ 
					int ind = 0;
					for(int i = 0; i < 6; i++) {%>
				
						<td><%=mondayYear %>-<%if(Integer.toString(month).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %></td>
					<%	ind++;
			 		}
					
				}%>
		</tr>
		<tr class="meal">
			<td>저녁</td>
			<% 
			newLine = 0;
			if(weekOfMonth == 1){
				for(int index = 1; index < start; index++) { 
					if(newLine != 0){%>
						<td id="null">빈값</td>
				<%	} newLine ++; %>
			<% 	}
				int ind = 1;
				for(int i = start; i <= 7; i++){
					if(newLine != 0){%>
					<td><%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-0<%=ind %></td>
				<%	} newLine ++; 
				ind++;
				} %>
				
			<% }else if(weekOfMonth == lastWeek){
				int ind = -1;
					for(int index = 1; index <= endDayOfWeek; index++) { 
						if(newLine != 0){%>
							<td><%=mondayYear %>-<%if(Integer.toString(month).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %></td>
					<%	} newLine ++; 
					ind++;%>
				<% 	}
					for(int i = endDayOfWeek; i < 7; i++){
						if(newLine != 7){%>
					<%	} newLine ++; 
					}
				}else{ 
					int ind = 0;
					for(int i = 0; i < 6; i++) {%>
				
						<td><%=mondayYear %>-<%if(Integer.toString(month).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %></td>
					<%	ind++;
			 		}
					
				}%>
		</tr>
	</table>
</div>
<script>
	$(function(){
		$("#prev").click(function(){
			console.log("prev");
			
		});
		$("#next").click(function(){
			console.log("next");
			<%
			if(month == 11 && weekOfMonth == lastWeek){
				year += 1;
				month = 0;
				date = 1;
				weekOfMonth = 1;
			}
			else if(weekOfMonth == lastWeek){
				month += 1;
				weekOfMonth = 1;
				date = 1;
			}else {
				weekOfMonth += 1;
				date += 7;
			}
		%>
			location.href = "<%=request.getContextPath() %>/selectAllDietTable.diet?year=<%=year %>&month=<%=month %>&date=<%=date %>&weekOfMonth=<%=weekOfMonth%>";
		});
	});
</script>