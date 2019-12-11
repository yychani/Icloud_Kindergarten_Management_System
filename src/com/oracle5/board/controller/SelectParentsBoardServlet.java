package com.oracle5.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.Board;

/**
 * Servlet implementation class SelectParentsBoardServlet
 */
@WebServlet("/selectParent.pbo")
public class SelectParentsBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectParentsBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num =Integer.parseInt(request.getParameter("num"));
		
		Board b = new BoardService().selectOneParentsBoard(num);
		
		String page ="";
		
		if(b != null) {
			page = "views/parents/boardParentsBoardupdate.jsp";
			request.setAttribute("b",b);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시 수정 상세 실패");
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
