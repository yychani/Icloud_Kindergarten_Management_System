package com.oracle5.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.common.model.vo.PageInfo;

@WebServlet("/selectChild.c")
public class SelectChildServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectChildServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int startPage;
		int endPage;
		int maxPage;
		int limit;
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new BoardService().getChildCount();
		
		maxPage = (int)((double) listCount / limit + 0.9); 

		startPage = (((int)((double) currentPage / limit + 0.9)) -1) * 10 + 1;

		endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String, Object>> hmapList = new BoardService().selectChild(currentPage, limit);
		
		String page = "";
		if(hmapList != null ) {
			page = "views/president/preKManagement.jsp";
			request.setAttribute("hmapList", hmapList);
			request.setAttribute("pi", pi);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "원아 목록조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
