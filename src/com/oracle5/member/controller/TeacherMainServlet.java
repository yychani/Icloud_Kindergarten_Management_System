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
import com.oracle5.member.model.vo.Teacher;

@WebServlet("/teacher")
public class TeacherMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("loginMember");
		
		String banName = new MemberService().selectBanName(m.getMemberNo());
		
		Teacher t = new MemberService().selectOneTeacher(m.getMemberNo());
		
		ArrayList<Children> list = new MemberService().selectBanChilren(m.getMemberNo());
		
		if(list != null) {
			request.setAttribute("bn", banName);
			request.setAttribute("list", list);
			request.setAttribute("t", t);
			request.getRequestDispatcher("/views/teacher/tcMain.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
