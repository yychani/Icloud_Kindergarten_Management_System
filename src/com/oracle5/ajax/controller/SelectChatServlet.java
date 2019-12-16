package com.oracle5.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.websocket.model.service.ChatService;
import com.oracle5.websocket.model.vo.Chat;

@WebServlet("/selectChat.chat")
public class SelectChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectChatServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sendUser = Integer.parseInt(request.getParameter("sendUser"));
		int reciever = Integer.parseInt(request.getParameter("reciever"));
		
		ArrayList<Chat> chatList = new ChatService().selectChat(sendUser, reciever);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(chatList, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
