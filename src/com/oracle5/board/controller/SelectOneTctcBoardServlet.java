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
import com.oracle5.common.model.vo.Attachment;

/**
 * Servlet implementation class SelectOneTctcBoardServlet
 */
@WebServlet("/selectOneTctc.bo")
public class SelectOneTctcBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneTctcBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("num : "+ num);
		String isUpdate = "false";
		if(request.getParameter("isUpdate") != null) {
			isUpdate = request.getParameter("isUpdate");
		}
		Board b= new BoardService().selectOneTctcBoard(num, isUpdate);
		ArrayList<Attachment> list = new BoardService().selectOneTctcBoardImg(num);
		for(int i=0; i<list.size(); i++) {
		System.out.println(list.get(i).getOriginName());
		}
		String page ="";
		if(b!= null) {
			page="views/teacher/tcTcBoardDetail.jsp";
			request.setAttribute("b", b);
			request.setAttribute("list", list);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "선생님게시판 자세히 보기 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
