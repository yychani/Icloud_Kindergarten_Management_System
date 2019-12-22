package com.oracle5.task.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Children;
import com.oracle5.member.model.vo.MemberAndTeacher;

@WebServlet("/headQuarters.hq")
public class HeadQuartersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HeadQuartersServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MemberAndTeacher> teacherlist = new MemberService().selectTeacher();
		
		ArrayList<Children> sunFlowerList = new MemberService().selectChildrenBan(1);
		ArrayList<Children> roseList = new MemberService().selectChildrenBan(2);
		ArrayList<Children> TulipList = new MemberService().selectChildrenBan(3);
		
		request.setAttribute("teacherlist", teacherlist);
		request.setAttribute("sunFlowerList", sunFlowerList);
		request.setAttribute("roseList", roseList);
		request.setAttribute("TulipList", TulipList);
		
		request.getRequestDispatcher("views/president/headQuarters.jsp").forward(request, response);;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
