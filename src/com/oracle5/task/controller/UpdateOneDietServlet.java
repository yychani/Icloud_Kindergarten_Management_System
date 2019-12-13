package com.oracle5.task.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateOneDiet.diet")
public class UpdateOneDietServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateOneDietServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rice = request.getParameter("rice");
		String soup = request.getParameter("soup");
		String side1 = request.getParameter("side1");
		String side2 = request.getParameter("side2");
		String side3 = request.getParameter("side3");
		String snack1 = request.getParameter("snack1");
		String snack2 = request.getParameter("snack2");
		
		System.out.println(rice + " " + soup + " " + side1 + " " + side2 + " " + side3 + " " + snack1 + " " + snack2);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
