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
 * Servlet implementation class ParentPassChangeServlet
 */
@WebServlet("/passChange.me")
public class ParentPassChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParentPassChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String currentPass = request.getParameter("currentPass");
		String changePass= request.getParameter("changePass1");
		System.out.println("passChange.me(currentPass) : " + currentPass);
		System.out.println("passChange.me(changePass) : " + changePass);
		    
		Member requestMember = new Member();
		requestMember.setMemberId(userId); 
		requestMember.setMemberPwd(currentPass);
		
		//변경 전 비밀번호 확인
		Member loginMember = new MemberService().parentsPassCheck(requestMember);
		System.out.println("parentpasschange : " + loginMember);
		
		String page = "";
		
		//비밀번호 변경
		if(loginMember != null) {
			loginMember.setMemberId(userId);
			loginMember.setMemberPwd(changePass);
			int result = new MemberService().updateParentsPass(loginMember);
			if(result > 0) {
				request.getSession().setAttribute("loginMember", loginMember);
				response.sendRedirect("views/parents/myPage.jsp");
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "비밀번호 변경 실패!");
				request.getRequestDispatcher(page).forward(request, response);
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
