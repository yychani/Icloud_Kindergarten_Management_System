package com.oracle5.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.member.model.service.MemberService;

@WebServlet("/parentAccept.me")
public class ParentAcceptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] mno = request.getParameterValues("mno[]");

		int update = new MemberService().updateParentApproval(mno);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		if(mno.length == update) {
			new Gson().toJson("성공", response.getWriter());
		} else {
			new Gson().toJson("실패", response.getWriter());
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
