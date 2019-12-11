package com.oracle5.task.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.task.model.service.TaskService;

@WebServlet("/selectKinderGarten.kinfo")
public class SelectKinderGartenInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectKinderGartenInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentChildCount = new TaskService().currentChildCount();
		int currentTeacherCount = new TaskService().currentTeacherCount();
		Calendar cal = Calendar.getInstance();
		int currentYear = cal.get(Calendar.YEAR);
		
		int minusZeroYear = new TaskService().minusYear(currentYear);
		int minusOneYear = new TaskService().minusYear(currentYear-1);
		int minusTwoYear = new TaskService().minusYear(currentYear-2);
		int minusThreeYear = new TaskService().minusYear(currentYear-3);
		
		int fiveYearsOld = new TaskService().YearsOld(5);
		int fourYearsOld = new TaskService().YearsOld(4);
		int threeYearsOld = new TaskService().YearsOld(3);
		
		int[] fiveYearsOldGender = new TaskService().YearsOldGender(5);
		int[] fourYearsOldGender = new TaskService().YearsOldGender(4);
		int[] threeYearsOldGender = new TaskService().YearsOldGender(3);
		int[] kInfo = {currentChildCount, currentTeacherCount, minusZeroYear, minusOneYear, minusTwoYear, minusThreeYear, fiveYearsOld, fourYearsOld, threeYearsOld, currentYear};
		ArrayList<int[]> list = new ArrayList<>();
		list.add(fiveYearsOldGender);
		list.add(fourYearsOldGender);
		list.add(threeYearsOldGender);
		
		java.sql.Date presidentEntDate = new MemberService().presidentEntDate();
		
		String date = presidentEntDate.toString();
		
		String[] dateArr = date.split("-");
		request.setAttribute("kInfo", kInfo);
		request.setAttribute("list", list);
		request.setAttribute("year", dateArr[0]);
		request.setAttribute("lastDate", dateArr[1] + "-" + dateArr[2]);
		
		
		request.getRequestDispatcher("views/president/preKInfo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
