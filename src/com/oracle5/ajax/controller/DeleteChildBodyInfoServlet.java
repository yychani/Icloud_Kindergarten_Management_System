package com.oracle5.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.member.model.service.MemberService;

@WebServlet("/deleteBodyInfo.do")
public class DeleteChildBodyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bino = Integer.parseInt(request.getParameter("bino"));
		
		int count = new MemberService().deleteBodyInfo(bino);
		
		String result = "";
		if(count > 0) {
			result = "성공";
		} else {
			result = "실패";
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(result, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
