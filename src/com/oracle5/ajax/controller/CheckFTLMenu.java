package com.oracle5.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.task.model.service.TaskService;

@WebServlet(name = "CheckMenuAble", urlPatterns = { "/checkMenuAble.menu" })
public class CheckFTLMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckFTLMenu() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isAble = new TaskService().checkMenuable();
		
		if(isAble == true) {
			response.getWriter().print("true");
		}else {
			response.getWriter().print("false");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
