package com.oracle5.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;

@WebServlet("/signUpCancel.me")
public class SignUpCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignUpCancelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println(userId);
		
		int result = new MemberService().deleteParents(userId);
		
		if(result > 0) {
			response.sendRedirect("views/signUp/login.jsp");
		}else {
			request.setAttribute("msg", "회원 가입 취소 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
