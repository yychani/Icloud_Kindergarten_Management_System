package com.oracle5.board.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.CommonNote;

@WebServlet(name = "InsertPreNoteServlet", urlPatterns = { "/InsertPreNote.pre" })
public class InsertPreNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertPreNote() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dateStr = request.getParameter("date");
		Date date = Date.valueOf(dateStr);
		String dateCont = request.getParameter("dateCont");
		
		CommonNote cNote = new CommonNote();
		cNote.setNote(dateCont);
		cNote.setDate(date);
		
		int result = new BoardService().insertPreNote(cNote);
		
		if(result > 0) {
			response.getWriter().print(dateCont);
		}else {
			request.setAttribute("msg", "알림장 저장오류!!");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
