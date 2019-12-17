package com.oracle5.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.ReturnAgree;

@WebServlet("/selectBanRtnList.me")
public class SelectBanRtnListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginMember");
		
		ArrayList<ReturnAgree> list = new MemberService().selectBanRtnList(m.getMemberNo());
		
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/teacher/tcRtnList.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "귀가동의서 리스트 조회 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
