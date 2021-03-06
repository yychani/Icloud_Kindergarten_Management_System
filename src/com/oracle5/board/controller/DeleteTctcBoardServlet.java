package com.oracle5.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;

/**
 * Servlet implementation class DeleteTctcBoardServlet
 */
@WebServlet("/deleteTctc.bo")
public class DeleteTctcBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTctcBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("tid"));
		
		int result = new BoardService().deleteTctcBoard(num);
		
		String page ="";
		if(result >0) {
			response.sendRedirect("/main/selectAllTctc.bo");
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "선생님 게시판 삭제 실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
