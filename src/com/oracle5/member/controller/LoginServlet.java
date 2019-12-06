package com.oracle5.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;

@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		Member requestMember = new Member();
		requestMember.setMemberId(userId); 
		requestMember.setMemberPwd(userPwd);
		
		Member loginMember = new MemberService().loginMember(requestMember);
		
		if(loginMember != null) {
			request.getSession().setAttribute("loginMember", loginMember);
			
			if(loginMember.getUType().equals("교사")) {
				if(loginMember.getMemberId().equals("admin")) {
					response.sendRedirect("views/president/preMain.jsp");
				}else {
					response.sendRedirect("views/teacher/tcMain.jsp");
				}
			}else if(loginMember.getUType().equals("학부모")) {
				response.sendRedirect("views/parents/parMain.jsp");
			}
		}else {
			request.setAttribute("msg", "로그인에러!!");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
