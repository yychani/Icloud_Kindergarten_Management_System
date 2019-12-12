<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int[] valueOfDate = (int[]) request.getAttribute("valueOfDate");
	String monday = (String)request.getAttribute("monday"); // 해당 주의 첫 날짜
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
	
	int newLine = 0;
	
	System.out.println(monday);
	

%>
<div>
	<table border=1 class="menu">
		<tr style="height: 60px; background: gray">
			<td><button>prev</button></td>
			<td colspan="5"><span><%=year %>년 <%=month + 1 %>월 <%=weekOfMonth %>주</span></td>
			<td><button>next</button></td>
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
			<% if(weekOfMonth == 1){
				for(int index = 1; index < start; index++) { 
					if(newLine != 0){%>
						<td >빈값</td>
				<%	} newLine ++; %>
			<% 	}
				for(int i = start; i < 7; i++){
					if(newLine != 0){%>
					<td >&nbsp;</td>
				<%	} newLine ++; 
				} %>
				
			<% }else { 
					for(int i = 0; i < 7; i++) {%>
				
						<td >&nbsp;</td>
				
			<% 		}
				}%>
		</tr>
		<tr class="snack">
			<td>오전 간식</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr class="meal">
			<td>점심</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr class="snack">
			<td>오후 간식</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr class="meal">
			<td>저녁</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>