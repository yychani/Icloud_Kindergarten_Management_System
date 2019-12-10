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

@WebServlet("/selectBanChildren.me")
public class SelectBanChildrenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginMember");
		
		ArrayList<Children> list = new MemberService().selectBanChilren(m.getMemberNo());
		
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/teacher/tcChildMgmt.jsp").forward(request, response);;
		} else {
			request.setAttribute("msg", "원아리스트 요청 실패");
			request.getRequestDispatcher("/views/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
