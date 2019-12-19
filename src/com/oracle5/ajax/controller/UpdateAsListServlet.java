package com.oracle5.ajax.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.member.model.service.MemberService;

@WebServlet("/updateAsList.do")
public class UpdateAsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] cid = request.getParameterValues("cid[]");

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int date = cal.getMinimum(Calendar.DAY_OF_MONTH);
		int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		Date endDate = null;
		if(month == 11) {
			cal.set(year + 1, month - 11, date);
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH);
			date = cal.getMinimum(Calendar.DAY_OF_MONTH);
			lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			endDate = Date.valueOf(year + "-" + (month + 1)  + "-" + lastday);
		} else {
			cal.set(year, month + 1, date);
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH);
			date = cal.getMinimum(Calendar.DAY_OF_MONTH);
			lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			endDate = Date.valueOf(year + "-" + (month + 1)  + "-" + lastday);
		}
		
		
		int	result = new MemberService().updateAsList(cid, endDate);
		System.out.println(result);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(result, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
