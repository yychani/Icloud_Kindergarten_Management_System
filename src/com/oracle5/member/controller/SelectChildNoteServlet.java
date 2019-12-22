package com.oracle5.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.service.MemberService;
import com.oracle5.member.model.vo.Member;
import com.oracle5.member.model.vo.Note;

@WebServlet("/selectChildNote.me")
public class SelectChildNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = (String) request.getParameter("date");
		Date nDate = Date.valueOf(date);

		String met = (String) request.getParameter("met");
		
		if(met == null) {
			met = (String) request.getAttribute("met");
		}
		System.out.println("Select : " + met);
		int tno = ((Member) request.getSession().getAttribute("loginMember")).getMemberNo();
	
		ArrayList<Note> list = new MemberService().selectChildNote(nDate, tno);
		
		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("met", met);
			request.getRequestDispatcher("/views/teacher/tcNote.jsp?date="+date).forward(request, response);;
		} else {
			request.setAttribute("msg", "원아별 알림장 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
