package com.oracle5.task.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.member.model.vo.Member;
import com.oracle5.task.model.service.TaskService;
import com.oracle5.task.model.vo.WorkDivision;

@WebServlet("/selectWorkList.task")
public class SelectWorkListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectWorkListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<WorkDivision> list = new TaskService().selectWorkList();
		ArrayList<WorkDivision> Ulist = new ArrayList<>();
		ArrayList<WorkDivision> Dlist = new ArrayList<>();
		Member loginUser = (Member) request.getSession().getAttribute("loginMember");
		for(WorkDivision work : list) {
			if(work.getType() == 1) {
				Dlist.add(work);
			}
			else {
				Ulist.add(work);
			}
		}
		
		String page = "";
		if(list != null) {
			if(!loginUser.getMemberId().equals("admin")) {
				page = "views/teacher/tcWorkDivision.jsp";
			}else{
				page = "views/president/preWorkD.jsp";
			}
			request.setAttribute("Dlist", Dlist);
			request.setAttribute("Ulist", Ulist);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "업무분장 리스트 불러오기 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
