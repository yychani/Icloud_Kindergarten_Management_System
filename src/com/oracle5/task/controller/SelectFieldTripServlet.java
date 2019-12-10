package com.oracle5.task.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.task.model.service.TaskService;
import com.oracle5.task.model.vo.FieldTripLearning;

@WebServlet("/selectFieldTrip.ftl")
public class SelectFieldTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectFieldTripServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isPayment = new TaskService().checkMenuable();
		FieldTripLearning ftl = new FieldTripLearning();
		if(isPayment == true) {
			
			ftl = new TaskService().selectFieldTrip();
			ftl.setDate(ftl.getFtlDate().toString());
		}
		if(ftl != null) {
			response.setContentType("application/json");
			new Gson().toJson(ftl, response.getWriter());
		}else {
			request.setAttribute("msg", "현장체험학습 조회 실패");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
