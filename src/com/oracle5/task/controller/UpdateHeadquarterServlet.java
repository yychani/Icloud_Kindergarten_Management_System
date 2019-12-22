package com.oracle5.task.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.task.model.service.TaskService;

@WebServlet("/updateHeadquarter.hq")
public class UpdateHeadquarterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateHeadquarterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] selectArr = (String[]) request.getParameterValues("selectArr[]");
		
		int result = new TaskService().updateHQ(selectArr);
		if(result > 4) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson("업데이트 완료", response.getWriter());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
