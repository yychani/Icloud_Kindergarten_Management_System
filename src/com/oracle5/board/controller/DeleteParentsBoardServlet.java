package com.oracle5.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;

/**
 * Servlet implementation class DeleteParentsBoardServlet
 */
@WebServlet("/deleteP.pbo")
public class DeleteParentsBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteParentsBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		int result = new BoardService().deleteParentBoard(num);
		
		String page = "";
		
		if(result >0) {
			response.sendRedirect("/main/selectAll.pbo");
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "반공지사항 삭제 실패");
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
