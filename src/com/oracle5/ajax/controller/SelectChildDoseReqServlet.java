package com.oracle5.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.DoseRequest;

@WebServlet("/selectChildDoseReq.do")
public class SelectChildDoseReqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		DoseRequest dr = new MemberService().selectChildDoseReq(dno);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(dr, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
