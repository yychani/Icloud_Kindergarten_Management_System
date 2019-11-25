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

@WebServlet("/insertTeacher.me")
public class TeacherInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TeacherInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("userPwd");
		String name = request.getParameter("name");
		String className = request.getParameter("className");

		Member requestMember = new Member();
		Teacher requestTeacher = new Teacher();
		
		requestMember.setMemberId(userId);
		requestMember.setMemberPwd(password);
		requestMember.setMemberName(name);
		requestTeacher.setClassName(className);
		
		int result = new MemberService().insertTeacher(requestMember, requestTeacher);
		
		if(result > 0) {
			response.sendRedirect("views/common/successPage.jsp?successCode=5");
		}else {
			request.setAttribute("msg", "선생님 계정 추가 에러!!");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
