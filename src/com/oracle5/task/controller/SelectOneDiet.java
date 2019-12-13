package com.oracle5.task.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.task.model.service.TaskService;
import com.oracle5.task.model.vo.Meal;
import com.oracle5.task.model.vo.Snack;

@WebServlet("/selectOneDiet.diet")
public class SelectOneDiet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneDiet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		int dietNo = 0;
		if(request.getParameter("dietNo") != null) {
			dietNo = Integer.parseInt(request.getParameter("dietNo"));
		}
		String type = request.getParameter("type");
		Meal meal = null;
		Snack snack = null;
		System.out.println(type);
		if(type.equals("아침") || type.equals("점심") || type.equals("저녁")) {
			meal = new TaskService().selectOneMeal(dietNo);
			if(meal == null) {
				meal = new Meal();
			}
		}else if(type.equals("오전") || type.equals("오후")) {
			snack = new TaskService().selectOneSnack(dietNo);
			if(snack == null) {
				snack = new Snack();
			}
		}
		if(meal != null) {
			response.setContentType("application/json");
			new Gson().toJson(meal, response.getWriter());
		}else if(snack != null){
			response.setContentType("application/json");
			new Gson().toJson(snack, response.getWriter());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
