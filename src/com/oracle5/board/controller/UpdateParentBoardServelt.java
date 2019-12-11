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
 * Servlet implementation class UpdateParentBoardServelt
 */
@WebServlet("/updateServlet.pbo")
public class UpdateParentBoardServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateParentBoardServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int tid = Integer.parseInt(request.getParameter("tid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		Board b = new Board();
		b.setTid(tid);
		b.setTtitle(title);
		b.setTcont(content);
		
		int result = new BoardService().updateParentBoard(b);
		
		String page="";
		if(result >0) {
			response.sendRedirect("/main/selectOne.pbo?num=" + b.getTid() + "&isUpdate=true");
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "반 공지사항 업데이트 실패");
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
