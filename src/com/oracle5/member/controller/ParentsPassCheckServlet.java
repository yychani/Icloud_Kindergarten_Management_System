package com.oracle5.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;

/**
 * Servlet implementation class ParentsPassCheckServlet
 */
@WebServlet("/passcheck.me")
public class ParentsPassCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParentsPassCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPwd = request.getParameter("userPwd");
		String userId = request.getParameter("userId");
		
		System.out.println("passcheck.me /pass: " + userPwd);
		System.out.println("passcheck.me /userId: " + userId);
		
		Member requestMember = new Member();
		requestMember.setMemberId(userId); 
		requestMember.setMemberPwd(userPwd);
		  
		Member loginMember = new MemberService().parentsPassCheck(requestMember);
		
		if(loginMember != null) {
			request.getSession().setAttribute("loginMember", loginMember);
			
			if(loginMember.getUType().equals("학부모")){
				response.sendRedirect("views/parents/myPage.jsp");
			}
		} else {
			request.setAttribute("msg", "비밀번호 불일치");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
