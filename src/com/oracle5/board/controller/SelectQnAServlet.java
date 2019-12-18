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

@WebServlet("/selectQnA.bo")
public class SelectQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectQnAServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tno = Integer.parseInt(request.getParameter("tno"));
		
		ArrayList<Board> qnaList = new BoardService().selectQnA(tno);
		
		System.out.println(qnaList);
		
		String page = "";
		if(qnaList != null) {
			if(tno == 1) {
				page = "views/president/preQnA.jsp";
			}else {
				page = "views/teacher/tcMypageGuessMain.jsp"; 
			}
			request.setAttribute("qnaList", qnaList);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "건의 문의 불러오기 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
