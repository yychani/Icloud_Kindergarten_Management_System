package com.oracle5.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.CommonNote;
import com.oracle5.board.model.vo.Schedule;
import com.oracle5.member.model.vo.Member;

@WebServlet(name = "SelectAllScheduleServlet", urlPatterns = { "/selectAllSchedule.sch" })
public class SelectAllSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAllSchedule() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Schedule> list = new BoardService().selectAllSchedule();
		
		Member loginUser = (Member)request.getSession().getAttribute("loginMember");
		String page = "";
		if(list != null) {
			if((loginUser).getMemberId().equals("admin")) {
				page = "views/president/schedule.jsp";
			}else if((loginUser).getUType().equals("교사")) {
				page = "views/teacher/tcSchedule.jsp";
			}else {
				page = "views/parents/newsCalendar.jsp";
			}
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "원 일정 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
