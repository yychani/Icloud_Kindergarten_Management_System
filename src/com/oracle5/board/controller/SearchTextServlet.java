package com.oracle5.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.Board;
import com.oracle5.common.model.vo.PageInfo;

/**
 * Servlet implementation class SearchTextServlet
 */
@WebServlet("/searchText")
public class SearchTextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTextServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text1 = request.getParameter("text1");
		String selected = request.getParameter("selected");
		int bdid= Integer.parseInt(request.getParameter("bdid"));
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage=1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		limit = 10;
		
		int listCount = new BoardService().getListCountPreNotice();
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		startPage = (((int)((double)currentPage/limit+0.9))-1)*10 +1;
		
		endPage = startPage +10-1;
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		HashMap<String,Object> hmap = new HashMap<>();
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = new BoardService().searchTextServlet(text1,selected,bdid,currentPage,limit);
		
		hmap.put("pi", pi);
		hmap.put("list", list);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(hmap, response.getWriter());
		
		//System.out.println(text1+ selected + bdid);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
