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
 * Servlet implementation class UpdatePreHBoardServlet
 */
@WebServlet("/updatePreHBoard.bo")
public class UpdatePreHBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePreHBoardServlet() {
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
		String filePath = request.getParameter("img");
		
		Board b = new Board();
		b.setTid(tid);
		b.setTtitle(title);
		b.setTcont(content);
		
		int result = new BoardService().updatePreHBoard(b);
		
		String page = "";
		if(result >0) {
			response.sendRedirect("/main/selectOnePreHBoard.bo?num="+b.getTid()+"&isUpdate=ture");
		}else {
			page="/views/common/errorPage.jsp";
			request.setAttribute("msg", "학부모 운영위원회 게시판 업데이트에 실패 하였습니다.");
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
