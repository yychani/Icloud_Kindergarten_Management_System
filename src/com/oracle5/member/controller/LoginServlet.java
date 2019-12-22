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

@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Member> checkList = new MemberService().selectNotAcceptParents();
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		Member requestMember = new Member();
		requestMember.setMemberId(userId); 
		requestMember.setMemberPwd(userPwd);
		Member loginMember = new MemberService().loginMember(requestMember);
		
		for(int i = 0; i < checkList.size(); i++) {
			if(loginMember != null && checkList.get(i).getMemberId().equals(userId)) {
				request.setAttribute("msg", "아직 승인되지 않은 계정입니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				break;
			} else if(i == checkList.size() - 1) {
				
				if(loginMember != null) {
					request.getSession().setAttribute("loginMember", loginMember);
					
					if(loginMember.getUType().equals("교사")) {
						if(loginMember.getMemberId().equals("admin")) {
							response.sendRedirect(request.getContextPath() + "/selectTodoList.todo");
							break;
						}else {
							response.sendRedirect("teacher");
							break;
						}
					}else if(loginMember.getUType().equals("학부모")) {
						response.sendRedirect(request.getContextPath() + "/selectChildCidServlet.me?pno=" + loginMember.getMemberNo());
						break;
					}
				}else {
					request.setAttribute("msg", "로그인에러!!");
					
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
					break;
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
