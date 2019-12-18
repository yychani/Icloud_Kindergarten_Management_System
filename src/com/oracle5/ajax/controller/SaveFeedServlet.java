package com.oracle5.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.websocket.Feed;
import com.oracle5.websocket.model.service.ChatService;
import com.oracle5.websocket.model.service.FeedService;
import com.oracle5.websocket.model.vo.Chat;

@WebServlet("/saveFeed.feed")
public class SaveFeedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveFeedServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("reciever"));
		int sendUser = Integer.parseInt(request.getParameter("sendUser"));
		String message = request.getParameter("message");
		
//		System.out.println(reciever + " " + sendUser + " " + message);
		
		int result = new FeedService().saveFeed(cid, message); 
		
		if(result > 0) {
			response.setContentType("application/json");
			new Gson().toJson(result, response.getWriter());
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
