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

@WebServlet(name = "SelectAllScheduleServlet", urlPatterns = { "/selectAllSchedule.sch" })
public class SelectAllSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAllSchedule() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Schedule> list = new BoardService().selectAllSchedule();
		
		String page = "";
		if(list != null) {
			page = "views/president/schedule.jsp";
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
