package com.oracle5.task.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.task.model.service.TaskService;
import com.oracle5.task.model.vo.TodoList;

@WebServlet("/selectTodoList.todo")
public class SelectTodoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectTodoListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<TodoList> todoList = new TaskService().selectTodoList();
		
		String page = "";
		if(todoList != null) {
			page = "views/president/preMain.jsp";
			request.setAttribute("todoList", todoList);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "TodoList 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
