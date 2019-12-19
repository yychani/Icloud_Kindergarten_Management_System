package com.oracle5.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oracle5.board.model.service.BoardService;
import com.oracle5.board.model.vo.Reply;

/**
 * Servlet implementation class InsertPreHBoardReReply
 */
@WebServlet("/preHBoardInsertReReply.bo")
public class InsertPreHBoardReReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPreHBoardReReply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		int tid = Integer.parseInt(request.getParameter("tid"));
		int refrid = Integer.parseInt(request.getParameter("refrid"));
		
		System.out.println(writer);
		System.out.println(content);
		System.out.println(tid);
		System.out.println(refrid);
		
		Reply r = new Reply();
		r.setRname(writer);
		r.setRcont(content);
		r.setTid(tid);
		r.setRefrid(refrid);
		
		ArrayList<Reply> replyList = new BoardService().inserPreHtrereply(r);
		
		System.out.println(replyList);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(replyList, response.getWriter());
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
