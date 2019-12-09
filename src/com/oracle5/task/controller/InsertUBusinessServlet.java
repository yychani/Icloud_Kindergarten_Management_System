package com.oracle5.task.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.task.model.service.TaskService;
import com.oracle5.task.model.vo.WorkDivision;

@WebServlet("/insertUBusiness.task")
public class InsertUBusinessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertUBusinessServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int chargeN = Integer.parseInt(request.getParameter("chargeN"));
		String taskText = request.getParameter("taskText");
		String cleaningText = request.getParameter("cleaningText");
		
		WorkDivision work = new WorkDivision();
		work.setTno(chargeN);
		work.setContent(taskText);
		work.setArea(cleaningText);
		
		int result = new TaskService().insertUBusiness(work);
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectWorkList.task");
		}else {
			request.setAttribute("msg", "업무분담 작성 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
