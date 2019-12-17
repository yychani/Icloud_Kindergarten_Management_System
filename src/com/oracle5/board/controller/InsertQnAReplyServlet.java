package com.oracle5.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.Reply;

@WebServlet("/insertQnAReply.bo")
public class InsertQnAReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertQnAReplyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int tid = Integer.parseInt(request.getParameter("tid"));
		int tno = Integer.parseInt(request.getParameter("tno"));
		
		Reply r = new Reply();
		r.setTid(tid);
		r.setRname(writer);
		r.setRcont(content);
		
		int result = new BoardService().insertQnAReply(r);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectQnA.bo?tno=" + tno);
		}else {
			request.setAttribute("msg", "답변 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
