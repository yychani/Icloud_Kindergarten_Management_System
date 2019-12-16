package com.oracle5.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.websocket.model.service.chatService;
import com.oracle5.websocket.model.vo.Chat;

@WebServlet("/saveChat.chat")
public class SaveChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveChatServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reciever = Integer.parseInt(request.getParameter("reciever"));
		int sendUser = Integer.parseInt(request.getParameter("sendUser"));
		String message = request.getParameter("message");
		
		System.out.println(reciever + " " + sendUser + " " + message);
		
		Chat chat = new chatService().saveChat(reciever, sendUser, message);
		
		response.setContentType("application/json");
		new Gson().toJson(chat, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
