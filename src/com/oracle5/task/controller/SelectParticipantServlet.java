package com.oracle5.task.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.task.model.service.TaskService;
import com.oracle5.task.model.vo.Participant;

@WebServlet("/selectParticipant.ftl")
public class SelectParticipantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectParticipantServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Participant> participantList = new TaskService().selectParticipant();
		ArrayList<Participant> prevPartList = new TaskService().selectPrevPartList();
		String page = "";
		if(participantList != null) {
			page = "views/president/preFTL.jsp";
			request.setAttribute("participantList", participantList);
			request.setAttribute("prevPartList", prevPartList);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "현장체험학습 신청 이력 조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
