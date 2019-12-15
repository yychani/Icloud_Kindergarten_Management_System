package com.oracle5.ajax.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Attend;

@WebServlet("/insertChildAttend.do")
public class InsertChildAttendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] cidArr = request.getParameterValues("cidArr[]");
		String[] attArr = request.getParameterValues("attArr[]");
		String date = request.getParameter("date");
		int result = 0;
		
		result = new MemberService().insertChildAttend(date, cidArr, attArr);
		
		if(result == cidArr.length) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(result, response.getWriter());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
