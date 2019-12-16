package com.oracle5.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.websocket.model.service.ChatService;

@WebServlet("/updateView.chat")
public class UpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public UpdateViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int receiver = Integer.parseInt(request.getParameter("receiver"));
		int sendUser = Integer.parseInt(request.getParameter("sendUser"));
		
		int result = new ChatService().updateView(receiver, sendUser);
		if(result > 0) {
			response.getWriter().print("읽기 완료");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
