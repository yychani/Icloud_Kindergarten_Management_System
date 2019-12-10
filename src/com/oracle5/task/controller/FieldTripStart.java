package com.oracle5.task.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.task.model.service.TaskService;
import com.oracle5.task.model.vo.FieldTripLearning;

@WebServlet("/fieldTripStart.ftl")
public class FieldTripStart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FieldTripStart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paymentStart = request.getParameter("paymentStart");
		String address = request.getParameter("address");
		String materials = request.getParameter("materials");
		int payment = Integer.parseInt(request.getParameter("payment"));
		Date ftlDate = Date.valueOf(paymentStart);
		FieldTripLearning ftl = new FieldTripLearning();
		ftl.setField(address);
		ftl.setFtlDate(ftlDate);
		ftl.setDate(paymentStart);
		ftl.setFtlPay(payment);
		ftl.setMaterials(materials);
		
		int result = new TaskService().fieldTripStart(ftl);
		
		response.setContentType("application/json");
		new Gson().toJson(ftl, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
