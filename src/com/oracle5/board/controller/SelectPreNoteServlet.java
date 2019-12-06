package com.oracle5.board.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;

@WebServlet("/selectPreNote.pre")
public class SelectPreNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectPreNoteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dateStr = request.getParameter("date");
		Date date = Date.valueOf(dateStr);
		String dateCont = new BoardService().selectPreNote(date);
		
		response.getWriter().print(dateCont);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
