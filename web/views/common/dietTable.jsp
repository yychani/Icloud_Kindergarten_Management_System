<%@page import="com.oracle5.task.model.vo.Snack"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.oracle5.task.model.vo.Meal"%>
<%@page import="java.util.ArrayList"%>
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
	}  */
	int year = valueOfDate[0];
	int month = valueOfDate[1];
	int weekOfMonth = valueOfDate[2];
	int date = valueOfDate[3];
	int startday = valueOfDate[4];
	int endDay = valueOfDate[5];
	int start = valueOfDate[6]; // 시작 요일
	int lastWeek = valueOfDate[7];
	int endDayOfWeek = valueOfDate[8];
	int prevLastDate = valueOfDate[9];
	int prevlastWeek = valueOfDate[10];
		
	int newLine = 0;
	
	int mondayMonthInt = Integer.parseInt(mondayMonth);
	int mondayDateInt = Integer.parseInt(mondayDate);
	HashMap<String, Object> dietMap = (HashMap<String, Object>) request.getAttribute("dietMap");
	
	ArrayList<Meal> morningList = (ArrayList<Meal>) dietMap.get("morningList");
	ArrayList<Meal> lunchList = (ArrayList<Meal>) dietMap.get("lunchList");
	ArrayList<Meal> dinnerList = (ArrayList<Meal>) dietMap.get("dinnerList");
	ArrayList<Snack> beforeSunList = (ArrayList<Snack>) dietMap.get("beforeSunList");
	ArrayList<Snack> afterSunList = (ArrayList<Snack>) dietMap.get("afterSunList");

%>
<div>
	<input type="hidden" value="<%=month %>" id="month">
	<input type="hidden" value="<%=lastWeek %>" id="lastWeek">
	<input type="hidden" value="<%=weekOfMonth %>" id="weekOfMonth">
	<input type="hidden" value="<%=year %>" id="year">
	<input type="hidden" value="<%=date %>" id="date">
	<input type="hidden" value="<%=prevLastDate %>" id="prevLastDate">
	<input type="hidden" value="<%=prevlastWeek %>" id="prevlastWeek">
	<input type="hidden" value="<%=endDay %>" id="endDay">
	
	<table border=1 class="menu">
		<tr style="height: 60px; background: gray">
			<td id="null"><button id="prev">prev</button></td>
			<td colspan="5" id="null"><span><%=year %>년 <%=month + 1 %>월 <%=weekOfMonth %>주</span></td>
			<td id="null"><button id="next">next</button></td>
		</tr>
		<tr style="height: 40px; background: lightgray">
			<td id="null">구분</td>
			<td id="null">월</td>
			<td id="null">화</td>
			<td id="null">수</td>
			<td id="null">목</td>
			<td id="null">금</td>
			<td id="null">토</td>
		</tr>
		<tr class="meal">
			<td id="null">아침</td> 
			
			<% 
			newLine = 0;
			if(weekOfMonth == 1){
				 if(start - 2 > 0){ %>
				<td colspan="<%=start-2 %>" rowspan="5" id="null">이전 달</td>
				<% } 
				for(int index = 1; index < start; index++) { 
					if(newLine != 0){%>
				<%	} newLine ++; %>
			<% 	}
				int ind = 1;
				for(int i = start; i <= 7; i++){
					if(newLine != 0){%>
					
					<td id="exist"><input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-0<%=ind %>">
					<input type="hidden" id="dietNo" value="<%=morningList.get(i - 2).getDietNo() %>">
					<input type="hidden" id="type" value="아침">
						
						<span><% if (morningList.get(i - 2).getRice() != null){ %>
							<%=morningList.get(i - 2).getRice() %>
							<% } %></span><br>
						<span><% if (morningList.get(i - 2).getRice() != null){ %>
							<%=morningList.get(i - 2).getSoup() %>
							<% } %></span><br>
						<span><% if (morningList.get(i - 2).getRice() != null){ %>
							<%=morningList.get(i - 2).getSide1() %>
								<% } %></span><br>
						<span><% if (morningList.get(i - 2).getRice() != null){ %>
							<%=morningList.get(i - 2).getSide2() %>
							<% } %></span><br>
						<span><% if (morningList.get(i - 2).getRice() != null){ %>
							<%=morningList.get(i - 2).getSide3() %>
							<% } %></span><br>
						</td>
				<%	} newLine ++; 
				ind++;
				} %>
				
			<% }else if(weekOfMonth == lastWeek){
				int ind = -1;
					for(int index = 1; index <= endDayOfWeek; index++) { 
						if(newLine != 0){%>
							<td id="exist"><input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %>">
						<input type="hidden" id="dietNo" value="<%=morningList.get(index - 2).getDietNo() %>">
						<input type="hidden" id="type" value="아침">
						
						<span><% if (morningList.get(index - 2).getRice() != null){ %>
							<%=morningList.get(index - 2).getRice() %>
							<% } %></span><br>
						<span><% if (morningList.get(index - 2).getRice() != null){ %>
							<%=morningList.get(index - 2).getSoup() %>
							<% } %></span><br>
						<span><% if (morningList.get(index - 2).getRice() != null){ %>
							<%=morningList.get(index - 2).getSide1() %>
								<% } %></span><br>
						<span><% if (morningList.get(index - 2).getRice() != null){ %>
							<%=morningList.get(index - 2).getSide2() %>
							<% } %></span><br>
						<span><% if (morningList.get(index - 2).getRice() != null){ %>
							<%=morningList.get(index - 2).getSide3() %>
							<% } %></span><br>
						</td>
					<%	} newLine ++; 
					ind++;%>
				<% 	}
						if(newLine != 7){%>
							<td colspan="<%=7-endDayOfWeek %>" rowspan="5" id="null">다음 달</td>
					<%	} newLine ++; 

				}else{ 
					int ind = 0;
					for(int i = 0; i < 6; i++) {%>
						<td id="exist">
						<input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %>">
						<input type="hidden" id="dietNo" value="<%=morningList.get(i).getDietNo() %>">
						<input type="hidden" id="type" value="아침">
						
						<span><% if (morningList.get(i).getRice() != null){ %>
							<%=morningList.get(i).getRice() %>
							<% } %></span><br>
						<span><% if (morningList.get(i).getRice() != null){ %>
							<%=morningList.get(i).getSoup() %>
							<% } %></span><br>
						<span><% if (morningList.get(i).getRice() != null){ %>
							<%=morningList.get(i).getSide1() %>
								<% } %></span><br>
						<span><% if (morningList.get(i).getRice() != null){ %>
							<%=morningList.get(i).getSide2() %>
							<% } %></span><br>
						<span><% if (morningList.get(i).getRice() != null){ %>
							<%=morningList.get(i).getSide3() %>
							<% } %></span><br>
						</td>
					<%	ind++;
			 		}
					
				}%>
		</tr>
		<tr class="snack">
			<td id="null">오전 간식</td>
			
			<% 
			newLine = 0;
			if(weekOfMonth == 1){
				 if(start - 2 > 0){ %>
				
				<% } 
				for(int index = 1; index < start; index++) { 
					if(newLine != 0){%>
				<%	} newLine ++; %>
			<% 	}
				int ind = 1;
				for(int i = start; i <= 7; i++){
					if(newLine != 0){%>
					
					<td id="exist"><input id="date" type="hidden" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-0<%=ind %>">
					<input type="hidden" id="dietNo" value="<%=beforeSunList.get(i - 2).getDietNo() %>">
						<input type="hidden" id="type" value="오전">
						
						<span><% if (beforeSunList.get(i - 2).getSnack1() != null){ %>
							<%=beforeSunList.get(i - 2).getSnack1() %>
							<% } %></span><br>
						<% if (beforeSunList.get(i - 2).getSnack1() != null){ 
						if(!beforeSunList.get(i - 2).getSnack2().equals(" ")) {%>
							<span><%=beforeSunList.get(i - 2).getSnack2() %></span>
							<%}
						} %>
						</td>
				<%	} newLine ++; 
				ind++;
				} %>
				
			<% }else if(weekOfMonth == lastWeek){
				int ind = -1;
					for(int index = 1; index <= endDayOfWeek; index++) { 
						if(newLine != 0){%>
							<td id="exist"><input id="date" type="hidden" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %>">
							<input type="hidden" id="dietNo" value="<%=beforeSunList.get(index - 2).getDietNo() %>">
						<input type="hidden" id="type" value="오전">
						
						<span><% if (beforeSunList.get(index - 2).getSnack1() != null){ %>
							<%=beforeSunList.get(index - 2).getSnack1() %>
							<% } %></span><br>
						<% if (beforeSunList.get(index - 2).getSnack1() != null){ 
						if(!beforeSunList.get(index - 2).getSnack2().equals(" ")) {%>
							<span><%=beforeSunList.get(index - 2).getSnack2() %></span>
							<%}
						} %>
						</td>
					<%	} newLine ++; 
					ind++;%>
				<% 	}
						if(newLine != 7){%>
							
					<%	} newLine ++; 

				}else{ 
					int ind = 0;
					for(int i = 0; i < 6; i++) {%>
				
						<td id="exist">
						<input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %>">
						<input type="hidden" id="dietNo" value="<%=beforeSunList.get(i).getDietNo() %>">
						<input type="hidden" id="type" value="오전">
						
						<span><% if (beforeSunList.get(i).getSnack1() != null){ %>
							<%=beforeSunList.get(i).getSnack1() %>
							<% } %></span><br>
						<% if (beforeSunList.get(i).getSnack1() != null){ 
						if(!beforeSunList.get(i).getSnack2().equals(" ")) {%>
							<span><%=beforeSunList.get(i).getSnack2() %></span>
							<%}
						} %>
						</td>
					<%	ind++;
			 		}
					
				}%>
		</tr>
		<tr class="meal">
			<td id="null">점심</td>
			
			<% 
			newLine = 0;
			if(weekOfMonth == 1){
				 if(start - 2 > 0){ %>
				
				<% } 
				for(int index = 1; index < start; index++) { 
					if(newLine != 0){%>
				<%	} newLine ++; %>
			<% 	}
				int ind = 1;
				for(int i = start; i <= 7; i++){
					if(newLine != 0){%>
					
					<td id="exist"><input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-0<%=ind %>">
					<input type="hidden" id="dietNo" value="<%=lunchList.get(i - 2).getDietNo() %>">
						<input type="hidden" id="type" value="점심">
						
						<span><% if (lunchList.get(i - 2).getRice() != null){ %>
							<%=lunchList.get(i - 2).getRice() %>
							<% } %></span><br>
						<span><% if (lunchList.get(i - 2).getRice() != null){ %>
							<%=lunchList.get(i - 2).getSoup() %>
							<% } %></span><br>
						<span><% if (lunchList.get(i - 2).getRice() != null){ %>
							<%=lunchList.get(i - 2).getSide1() %>
								<% } %></span><br>
						<span><% if (lunchList.get(i - 2).getRice() != null){ %>
							<%=lunchList.get(i - 2).getSide2() %>
							<% } %></span><br>
						<span><% if (lunchList.get(i - 2).getRice() != null){ %>
							<%=lunchList.get(i - 2).getSide3() %>
							<% } %></span><br>
						</td>
				<%	} newLine ++; 
				ind++;
				} %>
				
			<% }else if(weekOfMonth == lastWeek){
				int ind = -1;
					for(int index = 1; index <= endDayOfWeek; index++) { 
						if(newLine != 0){%>
							<td id="exist"><input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %>">
							<input type="hidden" id="dietNo" value="<%=lunchList.get(index - 2).getDietNo() %>">
						<input type="hidden" id="type" value="점심">
						
						<span><% if (lunchList.get(index - 2).getRice() != null){ %>
							<%=lunchList.get(index - 2).getRice() %>
							<% } %></span><br>
						<span><% if (lunchList.get(index - 2).getRice() != null){ %>
							<%=lunchList.get(index - 2).getSoup() %>
							<% } %></span><br>
						<span><% if (lunchList.get(index - 2).getRice() != null){ %>
							<%=lunchList.get(index - 2).getSide1() %>
								<% } %></span><br>
						<span><% if (lunchList.get(index - 2).getRice() != null){ %>
							<%=lunchList.get(index - 2).getSide2() %>
							<% } %></span><br>
						<span><% if (lunchList.get(index - 2).getRice() != null){ %>
							<%=lunchList.get(index - 2).getSide3() %>
							<% } %></span><br>
						</td>
					<%	} newLine ++; 
					ind++;%>
				<% 	}
						if(newLine != 7){%>
							
					<%	} newLine ++; 

				}else{ 
					int ind = 0;
					for(int i = 0; i < 6; i++) {%>
				
						<td id="exist">
						<input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %>">
						<input type="hidden" id="dietNo" value="<%=lunchList.get(i).getDietNo() %>">
						<input type="hidden" id="type" value="점심">
						
						<span><% if (lunchList.get(i).getRice() != null){ %>
							<%=lunchList.get(i).getRice() %>
							<% } %></span><br>
						<span><% if (lunchList.get(i).getRice() != null){ %>
							<%=lunchList.get(i).getSoup() %>
							<% } %></span><br>
						<span><% if (lunchList.get(i).getRice() != null){ %>
							<%=lunchList.get(i).getSide1() %>
								<% } %></span><br>
						<span><% if (lunchList.get(i).getRice() != null){ %>
							<%=lunchList.get(i).getSide2() %>
							<% } %></span><br>
						<span><% if (lunchList.get(i).getRice() != null){ %>
							<%=lunchList.get(i).getSide3() %>
							<% } %></span><br>
						</td>
					<%	ind++;
			 		}
					
				}%>
		</tr>
		<tr class="snack">
			<td id="null">오후 간식</td>
			
			<% 
			newLine = 0;
			if(weekOfMonth == 1){
				 if(start - 2 > 0){ %>
				
				<% } 
				for(int index = 1; index < start; index++) { 
					if(newLine != 0){%>
				<%	} newLine ++; %>
			<% 	}
				int ind = 1;
				for(int i = start; i <= 7; i++){
					if(newLine != 0){%>
					
					<td id="exist"><input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-0<%=ind %>">
					<input type="hidden" id="dietNo" value="<%=afterSunList.get(i - 2).getDietNo() %>">
						<input type="hidden" id="type" value="오후">
						
						<span><% if (afterSunList.get(i - 2).getSnack1() != null){ %>
							<%=afterSunList.get(i - 2).getSnack1() %>
							<% } %></span><br>
						<% if (afterSunList.get(i - 2).getSnack1() != null){ 
						if(!afterSunList.get(i - 2).getSnack2().equals(" ")){%>
							<span><%=afterSunList.get(i - 2).getSnack2() %></span>
							<% }
						} %>
						</td>
				<%	} newLine ++; 
				ind++;
				} %>
				
			<% }else if(weekOfMonth == lastWeek){
				int ind = -1;
					for(int index = 1; index <= endDayOfWeek; index++) { 
						if(newLine != 0){%>
							<td id="exist"><input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %>">
							<input type="hidden" id="dietNo" value="<%=afterSunList.get(index - 2).getDietNo() %>">
						<input type="hidden" id="type" value="오후">
						
						<span><% if (afterSunList.get(index - 2).getSnack1() != null){ %>
							<%=afterSunList.get(index - 2).getSnack1() %>
							<% } %></span><br>
						<% if (afterSunList.get(index - 2).getSnack1() != null){ 
						if(!afterSunList.get(index - 2).getSnack2().equals(" ")){%>
							<span><%=afterSunList.get(index - 2).getSnack2() %></span>
							<% }
						} %>
						</td>
					<%	} newLine ++; 
					ind++;%>
				<% 	}
						if(newLine != 7){%>
							
					<%	} newLine ++; 

				}else{ 
					int ind = 0;
					for(int i = 0; i < 6; i++) {%>
				
						<td id="exist">
						<input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %>">
						<input type="hidden" id="dietNo" value="<%=afterSunList.get(i).getDietNo() %>">
						<input type="hidden" id="type" value="오후">
						
						<span><% if (afterSunList.get(i).getSnack1() != null){ %>
							<%=afterSunList.get(i).getSnack1() %>
							<% } %></span><br>
						<% if (afterSunList.get(i).getSnack1() != null){ 
						if(!afterSunList.get(i).getSnack2().equals(" ")){%>
							<span><%=afterSunList.get(i).getSnack2() %></span>
							<% }
						} %>
						</td>
					<%	ind++;
			 		}
					
				}%>
		</tr>
		<tr class="meal">
			<td id="null">저녁</td>
			
			<% 
			newLine = 0;
			if(weekOfMonth == 1){
				 if(start - 2 > 0){ %>
				
				<% } 
				for(int index = 1; index < start; index++) { 
					if(newLine != 0){%>
				<%	} newLine ++; %>
			<% 	}
				int ind = 1;
				for(int i = start; i <= 7; i++){
					if(newLine != 0){%>
					
					<td id="exist"><input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-0<%=ind %>">
					<input type="hidden" id="dietNo" value="<%=dinnerList.get(i - 2).getDietNo() %>">
						<input type="hidden" id="type" value="저녁">
						
						<span><% if (dinnerList.get(i - 2).getRice() != null){ %>
							<%=dinnerList.get(i - 2).getRice() %>
							<% } %></span><br>
						<span><% if (dinnerList.get(i - 2).getRice() != null){ %>
							<%=dinnerList.get(i - 2).getSoup() %>
							<% } %></span><br>
						<span><% if (dinnerList.get(i - 2).getRice() != null){ %>
							<%=dinnerList.get(i - 2).getSide1() %>
								<% } %></span><br>
						<span><% if (dinnerList.get(i - 2).getRice() != null){ %>
							<%=dinnerList.get(i - 2).getSide2() %>
							<% } %></span><br>
						<span><% if (dinnerList.get(i - 2).getRice() != null){ %>
							<%=dinnerList.get(i - 2).getSide3() %>
							<% } %></span><br>
						</td>
				<%	} newLine ++; 
				ind++;
				} %>
				
			<% }else if(weekOfMonth == lastWeek){
				int ind = -1;
					for(int index = 1; index <= endDayOfWeek; index++) { 
						if(newLine != 0){%>
							<td id="exist"><input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %>">
							<input type="hidden" id="dietNo" value="<%=dinnerList.get(index - 2).getDietNo() %>">
						<input type="hidden" id="type" value="저녁">
						
						<span><% if (dinnerList.get(index - 2).getRice() != null){ %>
							<%=dinnerList.get(index - 2).getRice() %>
							<% } %></span><br>
						<span><% if (dinnerList.get(index - 2).getRice() != null){ %>
							<%=dinnerList.get(index - 2).getSoup() %>
							<% } %></span><br>
						<span><% if (dinnerList.get(index - 2).getRice() != null){ %>
							<%=dinnerList.get(index - 2).getSide1() %>
								<% } %></span><br>
						<span><% if (dinnerList.get(index - 2).getRice() != null){ %>
							<%=dinnerList.get(index - 2).getSide2() %>
							<% } %></span><br>
						<span><% if (dinnerList.get(index - 2).getRice() != null){ %>
							<%=dinnerList.get(index - 2).getSide3() %>
							<% } %></span><br>
						</td>
					<%	} newLine ++; 
					ind++;%>
				<% 	}
						if(newLine != 7){%>
							
					<%	} newLine ++; 

				}else{ 
					int ind = 0;
					for(int i = 0; i < 6; i++) {%>
				
						<td id="exist">
						<input type="hidden" id="date" value="<%=mondayYear %>-<%if(Integer.toString(month + 1).length() == 1){%>0<%=month + 1%><%}else{%><%=month + 1%><% } %>-<%if(Integer.toString(mondayDateInt + ind).length() == 1){%>0<%=mondayDateInt + ind %><%}else {%><%=mondayDateInt + ind %><%} %>">
						<input type="hidden" id="dietNo" value="<%=dinnerList.get(i).getDietNo() %>">
						<input type="hidden" id="type" value="저녁">
						
						<span><% if (dinnerList.get(i).getRice() != null){ %>
							<%=dinnerList.get(i).getRice() %>
							<% } %></span><br>
						<span><% if (dinnerList.get(i).getRice() != null){ %>
							<%=dinnerList.get(i).getSoup() %>
							<% } %></span><br>
						<span><% if (dinnerList.get(i).getRice() != null){ %>
							<%=dinnerList.get(i).getSide1() %>
								<% } %></span><br>
						<span><% if (dinnerList.get(i).getRice() != null){ %>
							<%=dinnerList.get(i).getSide2() %>
							<% } %></span><br>
						<span><% if (dinnerList.get(i).getRice() != null){ %>
							<%=dinnerList.get(i).getSide3() %>
							<% } %></span><br>
						</td>
					<%	ind++;
			 		}
					
				}%>
		</tr>
	</table>
</div>
<script>
		$("#prev").click(function(){
			var month = Number($("#month").val());
			var weekOfMonth = Number($("#weekOfMonth").val());
			var lastWeek = Number($("#lastWeek").val());
			var year = Number($("#year").val());
			var date = Number($("#date").val());
			var prevLastDate = Number($("#prevLastDate").val());
			var prevlastWeek = Number($("#prevlastWeek").val());
			var endDay = Number($("#endDay").val());
			
			console.log(prevlastWeek);
			if(month == 0 && weekOfMonth == 1){
				year -= 1;
				month = 11;
				date = prevLastDate;
				weekOfMonth = prevlastWeek;
			}
			else if(weekOfMonth == 2){
				weekOfMonth -= 1;
				date = 1;
			}
			else if(weekOfMonth == 1){
				month -= 1;
				weekOfMonth = prevlastWeek;
				date = prevLastDate;
			}else {
				weekOfMonth -= 1;
				date -= 7;
				
			}
		location.href = "<%=request.getContextPath() %>/selectAllDietTable.diet?year=" + year + "&month=" + month + "&date=" + date+ "&weekOfMonth=" + weekOfMonth;
		}); 
		$("#next").click(function(){
			var month = Number($("#month").val());
			var weekOfMonth = Number($("#weekOfMonth").val());
			var lastWeek = Number($("#lastWeek").val());
			var year = Number($("#year").val());
			var date = Number($("#date").val());
			
			if(month == 11 && weekOfMonth == lastWeek){
				year += 1;
				month = 0;
				date = 1;
				weekOfMonth = 1;
			}
			else if(weekOfMonth == lastWeek || weekOfMonth == 5){
				month += 1;
				weekOfMonth = 1;
				date = 1;
			}else {
				weekOfMonth += 1;
				date += 7;
				
			}
			
			location.href = "<%=request.getContextPath() %>/selectAllDietTable.diet?year=" + year + "&month=" + month + "&date=" + date+ "&weekOfMonth=" + weekOfMonth;
	});
</script>