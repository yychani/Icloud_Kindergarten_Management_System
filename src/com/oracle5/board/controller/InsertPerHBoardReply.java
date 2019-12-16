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
import com.oracle5.board.model.vo.Board;
import com.oracle5.board.model.vo.Reply;

/**
 * Servlet implementation class InsertPerHBoardReply
 */
@WebServlet("/preHBoardInsertReply.bo")
public class InsertPerHBoardReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPerHBoardReply() {
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
		
		System.out.println("writer : "+ writer);
		System.out.println("content : "+ content);
		System.out.println("tid : " +tid);
		
		Reply r = new Reply();
		r.setTid(tid);
		r.setRname(writer);
		r.setRcont(content);
		
		ArrayList<Reply> replyList = new BoardService().insertReplyPreHBoard(r);
		for(int i=0; i<replyList.size(); i++) {
			System.out.println(replyList.get(i).getRname());
			System.out.println(replyList.get(i).getRcont());
			System.out.println(replyList.get(i).getRdate());
		}
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
