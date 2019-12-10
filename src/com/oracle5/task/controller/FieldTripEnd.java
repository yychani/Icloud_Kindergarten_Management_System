package com.oracle5.task.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.task.model.service.TaskService;

@WebServlet("/fieldTripEnd.ftl")
public class FieldTripEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FieldTripEnd() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int result = new TaskService().fieldTripEnd();
		
		if(result > 0) {
			response.getWriter().print("납부가 종료되었습니다.");
		}else {
			response.getWriter().print("납부 종료 실패");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
