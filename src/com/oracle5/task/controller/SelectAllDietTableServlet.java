package com.oracle5.task.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.vo.Member;
import com.oracle5.task.model.service.TaskService;
import com.oracle5.task.model.vo.Meal;
import com.oracle5.task.model.vo.Snack;

@WebServlet("/selectAllDietTable.diet")
public class SelectAllDietTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAllDietTableServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		if(request.getParameter("year") != null) {
			year = Integer.parseInt(request.getParameter("year"));
		}
		int month = cal.get(Calendar.MONTH);
		if(request.getParameter("month") != null) {
			month = Integer.parseInt(request.getParameter("month"));
		}
		int weekOfMonth = cal.get(Calendar.WEEK_OF_MONTH);
		if(request.getParameter("weekOfMonth") != null) {
			weekOfMonth = Integer.parseInt(request.getParameter("weekOfMonth"));
		}
		int date = cal.get(Calendar.DATE);
		if(request.getParameter("date") != null) {
			date = Integer.parseInt(request.getParameter("date"));
		}
		Calendar cal2 = Calendar.getInstance();
		cal2.set(year, month - 1, date);
		int prevLastDate = cal2.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		cal2.set(year, month - 1, prevLastDate);
		cal.set(year, month, date);
	
		int startday = cal.getMinimum(java.util.Calendar.DATE);
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		int start = cal.get(java.util.Calendar.DAY_OF_WEEK); // 시작요일
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		cal.set(Calendar.YEAR, year);

 		cal.set(Calendar.MONTH, month);

 		cal.set(Calendar.WEEK_OF_MONTH, weekOfMonth);

 		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);

 		String monday = formatter.format(cal.getTime());
 		
 		String[] mondayArr = monday.split("-");
 		
 		String mondayYear = mondayArr[0];
 		String mondayMonth = mondayArr[1];
 		String mondayDate = mondayArr[2];
 		
 		cal.set(year, month, endDay);
 		
 		int lastWeek = cal.get(Calendar.WEEK_OF_MONTH);
 		int prevlastWeek = cal2.get(Calendar.WEEK_OF_MONTH);
 		cal.set(year, month, endDay);
 		
 		int endDayOfWeek =  cal.get(Calendar.DAY_OF_WEEK);
 		
		int[] valueOfDate = {year, month, weekOfMonth, date, startday, endDay, start, lastWeek, endDayOfWeek, prevLastDate, prevlastWeek};
		
		
		ArrayList<Meal> morningList = new TaskService().mealList(year, month + 1, 1/*타입*/, "아침", weekOfMonth);
		ArrayList<Meal> lunchList = new TaskService().mealList(year, month + 1, 1/*타입*/, "점심", weekOfMonth);
		ArrayList<Meal> dinnerList = new TaskService().mealList(year, month + 1, 1/*타입*/, "저녁", weekOfMonth);
		ArrayList<Snack> beforeSunList = new TaskService().snackList(year, month + 1, 2/*타입*/, "오전", weekOfMonth);
		ArrayList<Snack> afterSunList = new TaskService().snackList(year, month + 1, 2/*타입*/, "오후", weekOfMonth);
		
		System.out.println(morningList);
		HashMap<String, Object> dietMap = new HashMap<>();
		dietMap.put("morningList", morningList);
		dietMap.put("lunchList", lunchList);
		dietMap.put("dinnerList", dinnerList);
		dietMap.put("beforeSunList", beforeSunList);
		dietMap.put("afterSunList", afterSunList);
		
		Member loginUser = (Member)request.getSession().getAttribute("loginMember");
		String page = "";
			if((loginUser).getMemberId().equals("admin")) {
				page = "views/president/preDietTable.jsp";
			}else if((loginUser).getUType().equals("교사")) {
				page = "views/teacher/tcMenu.jsp";
			}else {
				page = "views/parents/newsCalendar.jsp";
			}
		request.setAttribute("dietMap", dietMap);
		request.setAttribute("mondayYear", mondayYear);
		request.setAttribute("mondayMonth", mondayMonth);
		request.setAttribute("mondayDate", mondayDate);
		request.setAttribute("valueOfDate", valueOfDate);
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
