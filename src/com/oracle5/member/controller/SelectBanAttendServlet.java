package com.oracle5.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Attend;

@WebServlet("/selectBanAttend.me")
public class SelectBanAttendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tno = Integer.parseInt(request.getParameter("tno"));
		
		ArrayList<Attend> list = new MemberService().selectBanAttend(tno);
		
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/teacher/tcChildAttend.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "원아 출석 현황 불러오기 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
