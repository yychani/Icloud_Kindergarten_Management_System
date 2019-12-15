package com.oracle5.board.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle5.board.model.service.BoardService;

@WebServlet("/selectTcNote")
public class SelectTcNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dateStr = request.getParameter("date");
		Date date = Date.valueOf(dateStr);
		int tno = Integer.parseInt(request.getParameter("tno"));
		
		String dateCont = new BoardService().selectTcNote(date, tno);
		
		response.getWriter().print(dateCont);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
