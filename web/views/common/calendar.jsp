<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = ""; %>
<%
	Calendar cal = Calendar.getInstance();

	String strYear = request.getParameter("year");

	String strMonth = request.getParameter("month");

	int year = cal.get(Calendar.YEAR);
	int todayYear = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int todayMonth = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);

	if (strYear != null)

	{

		year = Integer.parseInt(strYear);

		month = Integer.parseInt(strMonth);

	} else {

	}

	//년도/월 셋팅

	cal.set(year, month, 1);

	int startday = cal.getMinimum(java.util.Calendar.DATE);

	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);

	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);

	int newLine = 0;

	//오늘 날짜 저장.

	Calendar todayCal = Calendar.getInstance();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");

	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));

%>


<style>
	body {
		scrollbar-face-color: #F6F6F6;
		scrollbar-highlight-color: #bbbbbb;
		scrollbar-3dlight-color: #FFFFFF;
		scrollbar-shadow-color: #bbbbbb;
		scrollbar-darkshadow-color: #FFFFFF;
		scrollbar-track-color: #FFFFFF;
		scrollbar-arrow-color: #bbbbbb;
		margin-left: "0px";
		margin-right: "0px";
		margin-top: "0px";
		margin-bottom: "0px";
	}

	td {
		font-family: 'Noto Sans KR', sans-serif;
		color: #595959;
	}

	th {
		font-family: 'Noto Sans KR', sans-serif;
		color: #000000;
	}

	select {
		font-family: 'Noto Sans KR', sans-serif;
		color: #595959;
	}

	.divDotText {
		overflow: hidden;
		text-overflow: ellipsis;
	}

	A:link {
		font-family: 'Noto Sans KR', sans-serif;
		color: #000000;
		text-decoration: none;
	}

	A:visited {
		font-family: 'Noto Sans KR', sans-serif;
		color: #000000;
		text-decoration: none;
	}

	A:active {
		font-family: 'Noto Sans KR', sans-serif;
		color: red;
		text-decoration: none;
	}

	A:hover {
		font-family: 'Noto Sans KR', sans-serif;
		color: red;
		text-decoration: none;
	}

	#calendarFrm {
		margin-top: 30px;
	}

	#calHead {
		margin: 0 !important;
	}
</style>

<form name="calendarFrm" id="calendarFrm" action="" method="post">

	<div align="center" id="content" style="width: 712px; margin:auto">
		<!--날짜 네비게이션  -->

		<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO"
			style="border: 1px solid rgba(161, 161, 161, 0.192); margin: 0; margin-top: 5px; background: rgba(216, 216, 216, 0.13);"
			id="calHead">
			-
			<tr>

				<td height="60">

					<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: 0;">
						<tr>
							<td align="right" style="width: 70px;"></td>
							<td align="center"><a href="<%=path %>?year=<%=year - 1%>&amp;month=<%=month%>"
									target="_self"> <b>&lt;&lt;</b> <!-- 이전해 -->
								</a> <%
 	if (month > 0) {
 %> <a href="<%=path %>?year=<%=year%>&amp;month=<%=month - 1%>" target="_self"> <b>&lt;</b> <!-- 이전달 -->

								</a> <%
 	} else {
 %> <b>&lt;</b> <%
 	}
 %> &nbsp;&nbsp; <span style="font-weight: bolder;"><%=year%>년 <%=month + 1%>월</span> &nbsp;&nbsp; <%
 	if (month < 11) {
 %> <a href="<%=path %>?year=<%=year%>&amp;month=<%=month + 1%>" target="_self">
									<!-- 다음달 --> <b>&gt;</b>
								</a> <%
 	} else {
 %> <b>&gt;</b> <%
 	}
 %> <a href="<%=path %>?year=<%=year + 1%>&amp;month=<%=month%>" target="_self">
									<!-- 다음해 --> <b>&gt;&gt;</b>
								</a></td>
							<td align="right" style="width: 1px;"><input type="button"
									style="width: 50px; height: 30px; margin-right: 5px;"
									onclick="location.href='<%=path %>?year=<%=todayYear%>&amp;month=<%=todayMonth%>'"
									value="오늘" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br>
		<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF" style="margin-top: 0;">
			<thead>
				<tr style="background: rgba(255, 236, 151, 0.548); height: 30px;">
					<td width='60px'>
						<div align="center">
							<font color="red">일</font>
						</div>
					</td>
					<td width='60px'>
						<div align="center">월</div>
					</td>
					<td width='60px'>
						<div align="center">화</div>
					</td>
					<td width='60px'>
						<div align="center">수</div>
					</td>
					<td width='60px'>
						<div align="center">목</div>
					</td>
					<td width='60px'>
						<div align="center">금</div>
					</td>
					<td width='60px'>
						<div align="center">
							<font color="#529dbc">토</font>
						</div>
					</td>
				</tr>
				<tr>
					<%
						//처음 빈공란 표시

						for (int index = 1; index < start; index++) {
							out.println("<td >&nbsp;</td>");
							newLine++;
						}

						for (int index = 1; index <= endDay; index++) {
							String color = "";
							if (newLine == 0) {
								color = "RED";
							} else if (newLine == 6) {
								color = "#529dbc";
							} else {
								color = "BLACK";
							}
							;
							String sUseDate = Integer.toString(year);
							sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
									: Integer.toString(month + 1);
							sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
									: Integer.toString(index);
							int iUseDate = Integer.parseInt(sUseDate);

							sUseDate = Integer.toString(year) + "년 ";
							sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
									: Integer.toString(month + 1);
							sUseDate += "월 ";
							sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
									: Integer.toString(index);
							sUseDate += "일 ";

							String backColor = "#FFFFFF";
							if (iUseDate == intToday) {
								backColor = "#c9c9c9";
							}
							out.println("<td valign='top' align='center' class='date' style='border-radius: 70px;'width='60px' height='60px' bgcolor='" + backColor + "' nowrap>");
					%>
					<font color='<%=color%>'> <%=index%>
					</font>
					<%
						out.println("<br>");
							out.println("<input type='hidden' class='dailyDate' value='" + sUseDate + "'>");
							out.println("<br>");

							//기능 제거 
							out.println("</td>");
							newLine++;
							if (newLine == 7) {
								out.println("</tr>");
								if (index <= endDay) {
									out.println("<tr>");
								}
								newLine = 0;
							}
						}

						//마지막 공란 LOOP
						while (newLine > 0 && newLine < 7) {
							out.println("<td>&nbsp;</td>");
							newLine++;
						}
					%>
				</tr>
				</tbody>
		</table>
	</div>
</form>