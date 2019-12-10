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
 * Servlet implementation class UpdateBoardServlet
 */
@WebServlet("/updateBanBoard.bo")
public class UpdateBanBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBanBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tId = Integer.parseInt(request.getParameter("tId"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		/*System.out.println("tId : "+ tId);
		System.out.println("title : " + title);
		System.out.println("content : "+ content);*/
		
		Board b = new Board();
		b.setTid(tId);
		b.setTtitle(title);
		b.setTcont(content);
		
		int result = new BoardService().updateBanBoard(b);
		
		String page="";
		if(result >0) {
			response.sendRedirect("/main/selectOneBoard.bo?num="+b.getTid());
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
