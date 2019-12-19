package com.oracle5.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.websocket.model.service.FeedService;
import com.oracle5.websocket.model.vo.FeedVo;

@WebServlet("/selectChildFeed.feed")
public class SelectChildFeedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectChildFeedServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		ArrayList<FeedVo> feedList = new FeedService().selectChildFeed(cid);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(feedList, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
