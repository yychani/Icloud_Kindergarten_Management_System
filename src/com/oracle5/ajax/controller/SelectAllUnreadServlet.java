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

@WebServlet("/selectAllUnread.chat")
public class SelectAllUnreadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAllUnreadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sendUser = Integer.parseInt(request.getParameter("sendUser"));
		
		ArrayList<Chat> chatList = new ChatService().selectAllUnread(sendUser);
		
		System.out.println(chatList);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if(chatList != null) {
			new Gson().toJson(chatList, response.getWriter());
		}else {
			new Gson().toJson(null, response.getWriter());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
