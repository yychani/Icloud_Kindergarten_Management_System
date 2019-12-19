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

@WebServlet("/insertTodoList.todo")
public class InsertTodoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertTodoListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] todoCheck = (String[]) request.getParameterValues("todoCheck[]");
		String[] todayList = (String[]) request.getParameterValues("todayList[]");
		String[] tomorrowList = (String[]) request.getParameterValues("tomorrowList[]");
		
		ArrayList<TodoList> todoList = new ArrayList<>();
		
		for(int i = 0; i < todoCheck.length; i++) {
			TodoList todo = new TodoList();
			todo.setListCheck(todoCheck[i]);
			todo.setTodayList(todayList[i]);
			todo.setTomorrowList(tomorrowList[i]);
			
			todoList.add(todo);
		}
		int result = new TaskService().insertTodoList(todoList);
		
		if(result > todoList.size() - 1) {
			response.getWriter().print("TodoList 수정이 완료되었습니다.");
		}else {
			response.getWriter().print("TodoList 수정을 실패했습니다..");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
