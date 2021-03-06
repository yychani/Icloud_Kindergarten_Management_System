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
import com.oracle5.member.model.vo.Member;

/**
 * Servlet implementation class SearchPreHBoardSelvelt
 */
@WebServlet("/searchPreHNotice.bo")
public class SearchPreHBoardSelvelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPreHBoardSelvelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text1 = request.getParameter("text1");
		String selected = request.getParameter("select");
		int bdid = Integer.parseInt(request.getParameter("bdid"));
		int user = Integer.parseInt(request.getParameter("user"));
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		System.out.println("selected"+selected);
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
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage,startPage, endPage);
		
		ArrayList<Board> list = new BoardService().searchTextServlet(text1, selected, bdid, currentPage, limit,user);
		
		Member loginUser = (Member) request.getSession().getAttribute("loginMember");
		String page="";
		if((loginUser).getMemberId().equals("admin")) {
			 page="views/president/preHBoardSearchPage.jsp";
		}else if((loginUser).getUType().equals("교사")){
			page="views/teacher/tcHBoardSearchPage.jsp";
		}else {
			page="views/parents/boardCommitteeSearchPage.jsp";
		}
		
			
			
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		
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
