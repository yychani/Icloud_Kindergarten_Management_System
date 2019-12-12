package com.oracle5.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.Board;
import com.oracle5.common.model.vo.PageInfo;

/**
 * Servlet implementation class SelectAllBanNoticeListServlet
 */
@WebServlet("/selectAllBanList")
public class SelectAllBanNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllBanNoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage ; 
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage= 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		limit =10;
		
		int listCount = new BoardService().getListCountBan();
		
		maxPage = (int)((double)listCount/limit+0.9);
		System.out.println(maxPage);
		
		startPage = (((int)((double)currentPage/limit+0.9))-1)*10 +1;
		
		endPage = startPage + 10-1;
		System.out.println(endPage);
		
		if(maxPage<endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = new BoardService().selectAllBanNoticeList(currentPage,limit);
		
		
		//System.out.println("list : "+list);
		String page="";
		if(list != null) {
			page="views/teacher/tcClassNotice.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			request.setAttribute("msg", "반 공지사항 조회 실패");
			page="views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
