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
 * Servlet implementation class SelectAllpreKNotice
 */
@WebServlet(name = "SelectAllPreKNotice", urlPatterns = { "/selectAllPreNotice.bo" })
public class SelectAllpreKNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAllpreKNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = new BoardService().selectAllpreNoticeList(currentPage,limit);
		
		Member loginUser = (Member) request.getSession().getAttribute("loginMember");
		
		System.out.println((loginUser).getMemberName());
		
		String page = "";
		if(list != null) {
			
				if((loginUser).getMemberId().equals("admin")) {
					page="views/president/preKNotice.jsp";
				}else if((loginUser).getUType().equals("교사")) {
					page="views/teacher/tcKBoard.jsp";
				}else {
				page="views/parents/parKBoard.jsp";
				}
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
	
			
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















