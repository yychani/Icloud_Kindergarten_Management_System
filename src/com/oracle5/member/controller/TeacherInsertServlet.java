package com.oracle5.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Ban;
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
		int banNo = Integer.parseInt(request.getParameter("className"));
		
		ArrayList<Ban> list = new MemberService().selectBan();
		String ban = "";
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getBanNo() == banNo) {
				ban = list.get(i).getBanName();
			}
		}
		Ban b = new Ban();
		b.setBanNo(banNo);
		b.setBanName(ban);
		
		Member requestMember = new Member();
		Teacher requestTeacher = new Teacher();
		
		requestMember.setMemberId(userId);
		requestMember.setMemberPwd(password);
		requestMember.setMemberName(name);
		requestTeacher.setClassName(ban);
		
		HashMap<String, Object> hmap = new HashMap<>();
		hmap.put("Member", requestMember);
		hmap.put("Teacher", requestTeacher);
		hmap.put("Ban", b);
		int result = new MemberService().insertTeacher(hmap);
		
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
