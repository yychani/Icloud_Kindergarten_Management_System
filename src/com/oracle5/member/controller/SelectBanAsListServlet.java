package com.oracle5.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Children;
import com.oracle5.member.model.vo.Member;

@WebServlet("/selectBanAsList.me")
public class SelectBanAsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginMember");
		
		int tno = m.getMemberNo();
		
		ArrayList<Children> oklist = new MemberService().selectBanOkAsList(tno);
		
		ArrayList<Children> nolist = new MemberService().selectBanNoAsList(tno);
		
		request.setAttribute("oklist", oklist);
		request.setAttribute("nolist", nolist);
		request.getRequestDispatcher("/views/teacher/tcAsList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
