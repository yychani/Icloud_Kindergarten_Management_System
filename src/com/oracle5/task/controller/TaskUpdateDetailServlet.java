package com.oracle5.task.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.task.model.service.TaskService;
import com.oracle5.task.model.vo.WorkDivision;

@WebServlet("/taskUpdateDetail.task")
public class TaskUpdateDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TaskUpdateDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = 0;
		int tno = 0;
		
		if(request.getParameter("pid") != null) {
			pid = Integer.parseInt(request.getParameter("pid"));
		}else if(request.getParameter("tno") != null) {
			tno = Integer.parseInt(request.getParameter("tno"));
		}
		
		WorkDivision work = new WorkDivision();
		work.setPid(pid);
		work.setTno(tno);
		
		WorkDivision resultWork = new TaskService().selectWork(work);
		String page = "";
		if(resultWork != null){
			page = "views/president/preUpdateWorkD.jsp";
			request.setAttribute("work", resultWork);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "업무 수정화면 오류");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
