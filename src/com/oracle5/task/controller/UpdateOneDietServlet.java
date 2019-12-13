package com.oracle5.task.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.task.model.service.TaskService;
import com.oracle5.task.model.vo.Meal;
import com.oracle5.task.model.vo.Snack;

@WebServlet("/updateOneDiet.diet")
public class UpdateOneDietServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateOneDietServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int date = Integer.parseInt(request.getParameter("date"));
		int weekOfMonth = Integer.parseInt(request.getParameter("weekOfMonth"));
		
		String rice = request.getParameter("rice");
		String soup = request.getParameter("soup");
		String side1 = request.getParameter("side1");
		String side2 = request.getParameter("side2");
		String side3 = request.getParameter("side3");
		String snack1 = request.getParameter("snack1");
		String snack2 = request.getParameter("snack2");
		int dietNo = Integer.parseInt(request.getParameter("dietNoDetail"));
		String typeName = request.getParameter("typeName");
		String dateOne = request.getParameter("dateOne");
		
		Snack snack = new Snack();
		Meal meal = new Meal();
		
		snack.setDietNo(dietNo);
		snack.setSnack1(snack1);
		snack.setSnack2(snack2);
		snack.setTypeName(typeName);
		snack.setDate(dateOne);
		snack.setWeekOfMonth(weekOfMonth);
		
		meal.setDietNo(dietNo);
		meal.setRice(rice);
		meal.setSoup(soup);
		meal.setSide1(side1);
		meal.setSide2(side2);
		meal.setSide3(side3);
		meal.setTypeName(typeName);
		meal.setDate(dateOne);
		meal.setWeekOfMonth(weekOfMonth);
		HashMap<String, Object> hmap = new HashMap<>();
		
		hmap.put("Meal", meal);
		hmap.put("Snack", snack);
		
		
		//System.out.println(dietNo + " " + rice + " " + soup + " " + side1 + " " + side2 + " " + side3 + " " + snack1 + " " + snack2);
		
		int result = new TaskService().insertDiet(hmap);
		
		if(result > 0) {
			String page = request.getContextPath() + "/selectAllDietTable.diet?year=" + year + "&month=" + month + "&date=" + date+ "&weekOfMonth=" + weekOfMonth; 
			response.sendRedirect(page);
		}else {
			request.setAttribute("msg", "식단표 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
