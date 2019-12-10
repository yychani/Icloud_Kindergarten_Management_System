package com.oracle5.ajax.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.task.model.service.TaskService;

@WebServlet("/checkDDuplicate.do")
public class CheckDDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckDDuplicateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int charge = Integer.parseInt(request.getParameter("chargeN"));
		
		boolean isExist = new TaskService().checkDDuplicate(charge);
		
		if(isExist == true) {
			response.getWriter().print("이미 업무가 배정되어있는 직책입니다.");
		}else {
			response.getWriter().print("");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
