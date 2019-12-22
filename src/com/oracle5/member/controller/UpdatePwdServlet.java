package com.oracle5.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;

@WebServlet("/updatePwd.me")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("userPwd");
		String rno = request.getParameter("rno");
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		int result = new MemberService().updateMemberPwd(mno, password, rno);
		
		if(result > 0) {
			Member m = ((Member) request.getSession().getAttribute("loginMember"));
			m.setMemberRno(m.getMemberRno().substring(0, m.getMemberRno().length() - 1));
			request.getSession().setAttribute("loginMember", m);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson("t", response.getWriter());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
