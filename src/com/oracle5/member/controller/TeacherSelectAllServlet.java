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
import com.oracle5.member.model.vo.Teacher;

@WebServlet("/selectAllTeacher")
public class TeacherSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TeacherSelectAllServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> mlist = new MemberService().selectAllMember();
		ArrayList<Teacher> tlist = new MemberService().selectAllTeacher();
		
		String page = "";
		if(mlist != null && tlist != null) {
			page = "views/president/preTManagement.jsp";
			request.setAttribute("mlist", mlist);
			request.setAttribute("tlist", tlist);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "선생 정보 전체 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
