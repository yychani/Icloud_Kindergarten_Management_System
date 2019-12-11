package com.oracle5.task.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		int fiveYearsOld = new TaskService().fiveYearsOld();
		int fourYearsOld = new TaskService().fourYearsOld();
		int threeYearsOld = new TaskService().threeYearsOld();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
