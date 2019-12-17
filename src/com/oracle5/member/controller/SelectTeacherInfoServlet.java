package com.oracle5.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.Teacher;

@WebServlet("/selectTeacherInfo.me")
public class SelectTeacherInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginMember");
		
		Teacher t = new MemberService().selectOneTeacher(m.getMemberNo());
		
		if(t != null) {
			request.setAttribute("t", t);
			request.getRequestDispatcher("/views/teacher/tcMyInfo.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "교사 정보 조회 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
